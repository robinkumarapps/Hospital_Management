package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.booking.DaoBooking;
import com.model.Booking;
import com.model.Patient;
import com.service.doctor.ServiceDoctor;

@Controller
public class ControllerBooking {

	@Autowired
	private ServiceDoctor service;

	@Autowired
	private DaoBooking bookingDao;
	
	// Get confirm booking from database
	@GetMapping("/booking/{id}")
	public String getAllBooking(@PathVariable("id") int id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("name", service.get(id).getName());
		model.addAttribute("list", this.service.getConfirmBooking(id));
		return "doctor/allbooking";
	}

	// Get pending booking from database
	@GetMapping("/{id}/pending-booking")
	public String pendingBookings(@PathVariable("id") int id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("name", service.get(id).getName());
		model.addAttribute("list", this.service.getPendingBooking(id));
//		model.addAttribute("pending", this.service.getPendingBooking(id).size());
		return "doctor/pendingbooking";
	}

	// For accepting the booking
	@PostMapping(path = "/{id}/pending-booking/{pid}")
	public String confirmBooking(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model,
			RedirectAttributes rd) {
		this.service.accept(id, pid);
//		model.addAttribute("id", id);
//		model.addAttribute("name", service.get(id).getName());
		rd.addAttribute("msg", "Appointement Accepted!");
		return "redirect:/{id}/pending-booking";

	}

	// For rejecting the booking
	@GetMapping("/{id}/pending-booking/{pid}")
		public String rejectBooking(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model,
				RedirectAttributes rd) {
			Booking book = this.service.getPatient(pid).getBooking();
			book.setBookingStatus("Rejected");
			this.bookingDao.deleteBoooking(book, id);
//			model.addAttribute("id", id);
//			model.addAttribute("name", service.get(id).getName());
//			model.addAttribute("msg", "Appointement Rejected!");
			rd.addAttribute("msg", "Appointement Rejected!");
			return "redirect:/{id}/pending-booking";
	}
	
	@GetMapping("booking/{id}/delete/{pid}")
	public String discharge(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model,
			RedirectAttributes rd) {
		Patient patient = this.service.getPatient(pid);
		Booking book = patient.getBooking();
		if(patient.getCheckup() != null && patient.getCheckup().getDisease() != null) {
			if(book.getBookingStatus().equalsIgnoreCase("Approved")) {
				this.bookingDao.deleteBoooking(book, id);
				model.addAttribute("msg", "Patient Successfully Discharged");
			}
		}else {
			model.addAttribute("msg", "Add CheckReport First to discharge the patient");
		}
		model.addAttribute("id", id);
		model.addAttribute("name", service.get(id).getName());
		model.addAttribute("list", this.service.getConfirmBooking(id));
		return "doctor/allbooking";
}
}
