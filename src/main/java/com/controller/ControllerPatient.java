package com.controller;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.booking.DaoBooking;
import com.dao.patient.PatientDao;
import com.model.Booking;
import com.model.BookingHistory;
import com.model.Checkup;
import com.model.Doctor;
import com.model.Patient;
import com.model.Prescription;
import com.service.doctor.ServiceDoctor;

@Controller
public class ControllerPatient {

	@Autowired
	private ServiceDoctor service;

	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DaoBooking bookingDao;

	Patient patient = null;

	@GetMapping("/patient-homepage")
	public String adminHomepage(Model model) {
		model.addAttribute("patient", this.patient);
		return "patient/patient-appointment";
	}

	// Add Patient Page
	@GetMapping("/addpatient")
	public String addPatient(@ModelAttribute("patient") Patient patient, Model model) {
		model.addAttribute("patient", patient);
		return "patient";
	}

	// Add Patient form
	@PostMapping("/add-patient-form")
	public String addPatientMethod(@ModelAttribute("patient") Patient patient, @RequestParam int doctorId,
			@RequestParam String aDate, Model model) {

		Doctor doc = this.service.get(doctorId);
		if (doc == null) {
			model.addAttribute("msg", "Doctor Id Invalid");
			return "patient";
		}
		if (doc.getAvailabilityDate() != null) {
			for (int i = 0; i < doc.getAvailabilityDate().length; i++) {
				if (aDate.equals(doc.getAvailabilityDate()[i].toString())) {
					model.addAttribute("msg", "Doctor is not available on the current date");
					return "patient";
				}
			}
		}

		Booking booking = new Booking();
		Prescription p = new Prescription();
		Checkup c = new Checkup();
		booking.setAppDate(aDate);
		booking.setAppTime(LocalTime.now().toString());
		booking.setBookingStatus("Pending");
		booking.setPatient(patient);
		p.setPatient(patient);
		c.setPatient(patient);
		patient.setBooking(booking);
		patient.setCheckup(c);
		patient.setPrescription(p);
		patient.setDoctor(this.service.get(doctorId));
		this.service.addPatient(patient);
		model.addAttribute("msg", "Booking successfull");
		return "patient";
	}

	@GetMapping("/patient-login")
	public String patientLogin() {
		return "patient/login";
	}

	@PostMapping("/patient-login-form")
	public String patientSignInHome1(@RequestParam String email, @RequestParam String password, Model model) {
		boolean check = this.patientDao.login(email, password);
		if (check) {
			this.patient = this.patientDao.getPatient(email);
			model.addAttribute("patient", this.patient);
			return "patient/patient-appointment";
		}
		model.addAttribute("msg", "Login Failed");
		return "patient/login";
	}

	@RequestMapping(path = "/{id}/patient-logout", method = RequestMethod.GET)
	public String logOut(@PathVariable int id) {
		Patient pat = this.service.getPatient(id);
		pat.setStatus(false);
		this.service.updatePatient(pat);
		return "redirect:/patient-login";
	}

	@GetMapping("/patient-signup")
	public String patientSignup(@ModelAttribute("patient") Patient patient, Model model) {
		return "patient/signup";
	}

	@PostMapping("/patient-signup-form")
	public String patientSignupForm(@ModelAttribute("patient") Patient patient,HttpServletRequest req, Model model) {
		String main = req.getParameter("main");
		boolean check = this.patientDao.signUp(patient);
		if (!check) {
			if(main != null && main.equalsIgnoreCase("1")) {
				model.addAttribute("msg", "Email/Mobile already registered");
				return "admin/add_patient";
			}
			model.addAttribute("msg", "Email/Mobile already registered");
			return "patient/signup";
		}
		if(main != null && main.equalsIgnoreCase("1")) {
			return "redirect:/admin-patient";
		}
		model.addAttribute("msg", "Signup successfull");
		return "patient/login";
	}

	@GetMapping("/{id}/viewAppointment")
	public String viewAppointment(@PathVariable int id, Model model) {
		Booking b = this.patientDao.getPatient(id).getBooking();
		if (b != null) {
			model.addAttribute("books", b);
			model.addAttribute("spec", this.patientDao.getPatient(id).getDoctor().getId());
		}
		model.addAttribute("patient", this.patient);
		return "patient/viewAppointment";
	}

	@GetMapping("/{id}/bookAppointment")
	public String bookAppointment(@ModelAttribute("booking") Booking booking, @PathVariable int id, Model model) {
		List<Doctor> doc = this.service.getAllDoctor();
		model.addAttribute("doc", doc);
		model.addAttribute("patient", this.patient);
		return "patient/bookAppointment";
	}

	@PostMapping("/{id}/bookAppointment-form")
	public String bookAppointmentForm(@Valid @ModelAttribute("booking") Booking booking, @PathVariable int id,
			Model model, HttpServletRequest req) {

		int dId = Integer.parseInt(req.getParameter("doctor"));
		Doctor doc = this.service.get(dId);
		String apDate = req.getParameter("apDate");
		if (doc.getAvailabilityDate() != null) {
			for (int i = 0; i < doc.getAvailabilityDate().length; i++) {
				if (apDate.equals(doc.getAvailabilityDate()[i])) {
					List<Doctor> doct = this.service.getAllDoctor();
					model.addAttribute("doc", doct);
					model.addAttribute("msg", "Doctor is not available on the selected date");
					model.addAttribute("patient", this.patient);
					return "patient/bookAppointment";
				}
			}
		}
		
		booking.setAppDate(apDate);
		int pay = this.service.get(dId).getAppointmentFee();
		this.patient = this.patientDao.getPatient(id);
		if (this.patient.getBooking() != null) {
			List<Doctor> doct = this.service.getAllDoctor();
			model.addAttribute("doc", doct);
			model.addAttribute("msg", "Booking exist delete the existing booking");
			model.addAttribute("patient", this.patient);
			return "patient/bookAppointment";
		}
		this.patient.setDoctor(this.service.get(dId));
		booking.setBookingStatus("Pending");
		booking.setPatient(this.patient);
		this.patient.setBooking(booking);
		model.addAttribute("pay", pay);
		model.addAttribute("patient", this.patient);
		return "patient/payment";
	}

	@PostMapping("/{id}/payment")
	public String payment(@PathVariable int id, Model model, HttpServletRequest req) {
		Checkup checkup = new Checkup();
		Prescription prescription = new Prescription();
		checkup.setPatient(this.patient);
		prescription.setPatient(this.patient);
		patient.setCheckup(checkup);
		patient.setPrescription(prescription);
		this.service.updatePatient(this.patient);
		model.addAttribute("msg", "Booking successfull");
		model.addAttribute("patient", this.patient);
		return "patient/patient-appointment";
	}

	@GetMapping("/{id}/delete")
	public String bookingDelete(@PathVariable int id, Model model, HttpServletRequest req) {
		if(this.patientDao.getPatient(id).getBooking().getBookingStatus().equalsIgnoreCase("Pending")) {
			this.bookingDao.deleteBoooking(this.patientDao.getPatient(id).getBooking(),
					this.patientDao.getPatient(id).getDoctor().getId());
			model.addAttribute("msg", "Booking Deleted Successfully");
		}else {
			Booking b = this.patientDao.getPatient(id).getBooking();
			model.addAttribute("books", b);
			model.addAttribute("spec", this.patientDao.getPatient(id).getDoctor().getSpeciality());
			model.addAttribute("msg", "Booking Approved You cannot delete");
		}
		model.addAttribute("patient", this.patient);
		return "patient/viewAppointment";
	}

	@GetMapping("/{id}/prescription")
	public String getPrescription(@PathVariable int id, Model model, HttpServletRequest req) {
		if (this.patientDao.getPatient(id).getPrescription() != null) {
			String[] desc = this.patientDao.getPatient(id).getPrescription().getDescription();
			String[] dose = this.patientDao.getPatient(id).getPrescription().getDose();
			String[] med = this.patientDao.getPatient(id).getPrescription().getMedicine();
			String[] timing = this.patientDao.getPatient(id).getPrescription().getTiming();
			model.addAttribute("desc", desc);
			model.addAttribute("med", med);
			model.addAttribute("timing", timing);
			model.addAttribute("dose", dose);
		} else {
			model.addAttribute("msg", "Nothing to show");
		}

		model.addAttribute("patient", this.patientDao.getPatient(id));
		return "patient/prescription";
	}

	@GetMapping("/{id}/checkup")
	public String getCheckup(@PathVariable int id, Model model, HttpServletRequest req) {
		if (this.patientDao.getPatient(id).getCheckup() == null) {
			model.addAttribute("msg", "Nothing to show");
			model.addAttribute("patient", this.patientDao.getPatient(id));
			return "patient/checkup";
		}
		model.addAttribute("patient", this.patientDao.getPatient(id));
		return "patient/checkup";
	}

	@GetMapping("/{id}/booking-history")
	public String getHistoryBookings(@PathVariable int id, Model model) {
		List<BookingHistory> list = this.bookingDao.historyBoooking(id);
		if (list == null) {
			model.addAttribute("msg", "No Booking History");
		} else if (!list.isEmpty()) {
			model.addAttribute("list", list);
		}
		model.addAttribute("patient", this.patientDao.getPatient(id));
		return "patient/appointmentHistory";
	}
	
	
	@GetMapping("/{id}/searchp")
	public String searchPage(@PathVariable int id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("patient", this.patientDao.getPatient(id));
		return "patient/search";
	}
	
	@PostMapping("/{id}/searchp")
	public String search(@PathVariable int id, Model model, HttpServletRequest req) {
		String name = req.getParameter("search");
		List<Doctor> list = this.service.getAllDoctor();
		List<Doctor> doc = new ArrayList<>();
		if(list != null) {
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getName().toLowerCase().contains(name.toLowerCase())) {
					doc.add(list.get(i));
				}
			}
		}
		model.addAttribute("id", id);
		model.addAttribute("patient", this.patientDao.getPatient(id));
		model.addAttribute("list", doc);
		return "patient/search";
	}
	
	@GetMapping("/{id}/profilep")
	public String profile1(@PathVariable int id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("patient", this.patientDao.getPatient(id));
		return "patient/profile2";
	}
}
