/*package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.Doctor;
import com.model.Patient;
import com.service.doctor.ServiceDoctor;

//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.Date;

import javax.validation.Valid;

@Controller
public class ControllerDoctor {

	@Autowired
	private ServiceDoctor service;

	// Home Route
	@RequestMapping("/")
	public String home() {

		return "index";
	}

	// Login Page
	@GetMapping("/doctor-login")
	public String doctorLogin(Model model) {
		return "doctor/login";
	}

	// Login Action
	@PostMapping("/doctor-login-form")
	public String doctoLoginForm(@RequestParam String email, @RequestParam String password, Model model) {
		boolean check = this.service.login(email, password);
		if (check) {
			int id = this.service.getDoctorId(email);
			model.addAttribute("id", id);
			model.addAttribute("name", this.service.get(id).getName());
			return "redirect:/doctor-index/{id}"; // if Login successfull then redirect to booking page
		} else {
			model.addAttribute("msg", "Login Failed");
			return "doctor/login";
		}
	}
//	@GetMapping("/addpatient")
//	public String addPatient(@ModelAttribute("patient") Patient patient, Model model)
//	{
//		model.addAttribute("patient", patient);
//		return "patient";
//	}
//
//	@PostMapping("/add-patient-form")
//	public String addPatinetMethod(@ModelAttribute("patient") Patient patient,
//			@RequestParam int doctorId,@RequestParam String aDate, Model model)
//	{
//		patient.setDoctor(this.service.get(doctorId));
//		patient.getBooking().setBookingStatus(false);
//		patient.getBooking().setDate(aDate);
//		patient.getBooking().setTime("12:00:00");
//		this.service.addPatient(patient);
//		return "redirect:/addpatient";
//	}

	
	//doctor Home Page
	@RequestMapping("/doctor-index/{id}")
	public String home2(@PathVariable int id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("name", this.service.get(id).getName());
		return "doctor/index";
	}

	// Doctor Signup Page
	@GetMapping("/doctor-signup")
	public String doctorSignup(@ModelAttribute("doc") Doctor doc, Model model) {
		String[] speciality = { "Audiologist", "Cardiologist", "Dentist", "ENT specialist", "Gynaecologist",
				"Orthopaedic surgeon", "Paediatrician", "Psychiatrists", "Cardiothoracic surgeon" };
		model.addAttribute("item", speciality);
		return "doctor/signup";
	}

	// Doctor Signup form
	@PostMapping("/doctor-signup-form")
	public String doctorSignupForm(@Valid @ModelAttribute("doc") Doctor doc, BindingResult result, Model model) {
		if (result.hasErrors()) {
			String[] speciality = { "Audiologist", "Cardiologist", "Dentist", "ENT specialist", "Gynaecologist",
					"Orthopaedic surgeon", "Paediatrician", "Psychiatrists", "Cardiothoracic surgeon" };
			model.addAttribute("item", speciality);
			return "doctor/signup";
		}

		boolean check = this.service.signUp(doc);
		if (check) {
			model.addAttribute("msg", "Signup Successful");
			return "doctor/login";
		} else {
			model.addAttribute("msg", "Signup Failed! Email already in use");
			return "redirect:/doctor-signup";
		}
	}

//	 booking page from static array
//	@GetMapping("/booking/{id}")
//	public String getAllBooking(@PathVariable("id") int id, Model model) {
//		model.addAttribute("id", id);
//		model.addAttribute("name", service.get(id).getName());
//		model.addAttribute("list", DB.getAllApp(id));
//		return "doctor/allbooking";
//	}

//	// booking withDB
//	@GetMapping("/booking/{id}")
//	public String getAllBooking(@PathVariable("id") int id, Model model) {
//		model.addAttribute("id", id);
//		model.addAttribute("name", service.get(id).getName());
//		model.addAttribute("list", this.service.getConfirmBooking(id));
//		System.out.println(this.service.getConfirmBooking(id));
//		return "doctor/allbooking";
//	}

	// pending booking page to display pending booking
//	@GetMapping("/{id}/pending-booking")
//	public String pendingBookings(@PathVariable("id") int id, Model model) {
//		model.addAttribute("id", id);
//		model.addAttribute("name", service.get(id).getName());
//		model.addAttribute("list", DB.getAllPen(id));
//		return "doctor/pendingbooking";
//	}

	// pending booking with db
	
	 * @GetMapping("/{id}/pending-booking") public String
	 * pendingBookings(@PathVariable("id") int id, Model model) {
	 * model.addAttribute("id", id); model.addAttribute("name",
	 * service.get(id).getName()); model.addAttribute("list",
	 * this.service.getPendingBooking(id)); return "doctor/pendingbooking"; }
	 

	
	 * // for accepting the booking
	 * 
	 * @PostMapping(path = "/{id}/pending-booking/{pid}") public String
	 * confirmBooking(@PathVariable("id") int id, @PathVariable("pid") int pid,
	 * Model model) { this.service.accept(id, pid); model.addAttribute("id", id);
	 * model.addAttribute("name", service.get(id).getName());
	 * model.addAttribute("msg", "Appointement Accepted!"); return
	 * "redirect:/{id}/pending-booking";
	 * 
	 * }
	 * 
	 * // for rejecting the booking with db
	 * 
	 * @GetMapping("/{id}/pending-booking/{pid}") public String
	 * rejectBooking(@PathVariable("id") int id, @PathVariable("pid") int pid, Model
	 * model) { this.service.reject(id, pid); model.addAttribute("id", id);
	 * model.addAttribute("name", service.get(id).getName());
	 * model.addAttribute("msg", "Appointement Rejected!"); return
	 * "redirect:/{id}/pending-booking";
	 
//	}

	// reject booking
//	@GetMapping("/{id}/pending-booking/{pid}")
//	public String rejectBooking(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model) {
//		DB.reject(pid, id);
//		model.addAttribute("id", id);
//		model.addAttribute("name", service.get(id).getName());
//		model.addAttribute("msg", "Appointement Rejected!");
//		return "redirect:/{id}/pending-booking";
//
//	}

//	@GetMapping("/booking/{id}/{pid}/prescription")
//	public String prescription(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model) {
//		Patient patient = this.service.getPatient(pid);
//		model.addAttribute("id", id);
//		model.addAttribute("pid", pid);
//		model.addAttribute("pname", patient.getPatientName());
//		model.addAttribute("pres", patient.getPrescription());
//		model.addAttribute("prec", patient.getPrecaution());
//		model.addAttribute("name", service.get(id).getName());
//		return "doctor/prescription";
//	}
//
//	@PostMapping("/booking/{id}/{pid}/addprescription")
//	public String addPrescription(@PathVariable("id") int id, @PathVariable("pid") int pid,
//			@RequestParam String prescription, @RequestParam String precaution, Model model) {
//		Patient patient = this.service.getPatient(pid);
//		patient.setPrecaution(precaution);
//		patient.setPrescription(prescription);
//		this.service.updatePatient(patient);
//		/*
//		 * model.addAttribute("id", id); model.addAttribute("pid", pid);
//		 * model.addAttribute("pname" , patient.getPatientName());
//		 * model.addAttribute("name", patient.getDoctor().getName());
//		 * model.addAttribute("msg", "Details Saved!");
//		 
//
////		if(check)
////		{
////			System.out.println();
////			session.setAttribute("msg", "1");
////			model.addAttribute("msg", id);
////		}
////		else {
////			model.addAttribute("msg", "-1");
////		}
//		return "redirect:/booking/{id}/{pid}/prescription";
//	}
}
*/