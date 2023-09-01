package com.controller;

//import org.apache.log4j.Logger;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dao.booking.DaoBooking;
import com.model.BookingHistory;
import com.model.Doctor;
import com.model.Patient;
import com.service.doctor.ServiceDoctor;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class ControllerDoctor {

	@Autowired
	private ServiceDoctor service;

	@Autowired
	private DaoBooking bookingDao;
//	private Logger logger = Logger.getLogger(ControllerDoctor.class);

	@GetMapping("/doctor-homepage")
	public String doctorHomepage() {
		return "doctor/homepage";
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
			return "redirect:/doctor-index/{id}"; // if Login successfull then redirect to booking page
		} else {
			model.addAttribute("msg", "Login Failed!");
			return "doctor/login";
		}
	}

	// doctor Home Page
	@RequestMapping("/doctor-index/{id}")
	public String home2(@PathVariable int id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("name", this.service.get(id).getName());
		model.addAttribute("pending", this.service.getPendingBooking(id).size());
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
	public String doctorSignupForm(@RequestParam("image") CommonsMultipartFile file,
			@RequestParam("pdf") CommonsMultipartFile pdf, @Valid @ModelAttribute("doc") Doctor doc,
			BindingResult result, HttpSession s, Model model) {
		if (result.hasErrors()) {
			String[] speciality = { "Audiologist", "Cardiologist", "Dentist", "ENT specialist", "Gynaecologist",
					"Orthopaedic surgeon", "Paediatrician", "Psychiatrists", "Cardiothoracic surgeon" };
			model.addAttribute("item", speciality);
			return "doctor/signup";
		}

		byte[] pdfdata = pdf.getBytes();
		String pdfpath = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
				+ File.separator + "pdf" + File.separator + ((doc.getEmail()) + (".pdf"));

		System.out.println(pdfpath);

		try {
			FileOutputStream fospdf = new FileOutputStream(pdfpath);
			fospdf.write(pdfdata);
			fospdf.close();
			model.addAttribute("pdfmsg", "Pdf uploaded succesfully....");

		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("pdfmsg", "Error occure while pdf uploading !!!!!");
			return "admin/add_doctor";
		}

		byte[] data = file.getBytes();
		String path = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources" + File.separator
				+ "image" + File.separator + ((doc.getEmail()) + (".jpg"));
		System.out.println(path);
		try {
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			model.addAttribute("msgg", "upload succesfully....");

		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("msgg", "Error occure while photo uploading  !!!!!");
		}

		boolean check = this.service.signUp(doc);
		if (check) {
			model.addAttribute("msg", "Signup Successful");
			return "doctor/login";
		} else {
			model.addAttribute("msg", "Signup Failed! Email already in use");
			return "doctor/signup";
		}
	}

	@GetMapping("/{id}/profile")
	public String profile(@PathVariable int id, Model model) {
		Doctor doc = this.service.get(id);
		model.addAttribute("id", id);
		model.addAttribute("doc", doc);
		return "doctor/profile";
	}

	@GetMapping("/{id}/status")
	public String status(@PathVariable int id, Model model) {
		Doctor doc = this.service.get(id);
		System.out.println(Arrays.toString(doc.getAvailabilityDate()));
		model.addAttribute("busydate", doc.getAvailabilityDate());
		return "doctor/status";
	}

	@PostMapping("/{id}/setstatus")
	public String setStatus(@PathVariable int id, Model model, HttpServletRequest req) {
		Doctor doc = this.service.get(id);
		String[] list = doc.getAvailabilityDate();
		String date = req.getParameter("adate");
		if (list != null) {
			String[] arr = new String[list.length + 1];
			for (int i = 0; i < list.length; i++) {
				if (date.equals(list[i])) {
					model.addAttribute("msg", "Selected date already exists");
					model.addAttribute("busydate", doc.getAvailabilityDate());
					return "doctor/status";
				}
			}
			for(int i = 0; i < list.length; i++) {
				arr[i] = list[i];
			}
			arr[list.length] = date;
			doc.setAvailabilityDate(arr);
		}else {
			String[] arr = {date};
			doc.setAvailabilityDate(arr);
		}
		this.service.updateDoctor(doc);
		model.addAttribute("msg", "Status set successfully");
		model.addAttribute("busydate", doc.getAvailabilityDate());
		System.out.println(Arrays.toString(doc.getAvailabilityDate()));
		return "doctor/status";
	}

	@GetMapping("/{id}/setstatus/{date}")
	public String deleteDate(@PathVariable int id, @PathVariable String date, Model model) {
		Doctor doc = this.service.get(id);
		String[] list = doc.getAvailabilityDate();
		if (list.length == 1) {
			list = null;
			doc.setAvailabilityDate(list);
			this.service.updateDoctor(doc);
			return "redirect:/{id}/status";
		}
		String[] result = new String[list.length - 1];
		for (int i = 0, j = 0; i < list.length; i++) {
			if (!date.equals(list[i])) {
				result[j++] = list[i];
			}
		}
		doc.setAvailabilityDate(result);
		this.service.updateDoctor(doc);
		return "redirect:/{id}/status";
	}

	@GetMapping("/{id}/search")
	public String searchPage(@PathVariable int id, Model model, HttpServletRequest req) {
		Doctor doc = this.service.get(id);
		model.addAttribute("id", id);
		model.addAttribute("doc", doc);
		System.out.println(Arrays.toString(doc.getAvailabilityDate()));
		return "doctor/search";
	}

	@PostMapping("/{id}/search")
	public String search(@PathVariable int id, Model model, HttpServletRequest req) {
		String name = req.getParameter("search");
		Doctor doc = this.service.get(id);
		List<Patient> list = doc.getPatient();
		List<Patient> pat = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getBooking() != null
					&& list.get(i).getPatientName().toLowerCase().contains(name.toLowerCase())
					&& list.get(i).getBooking().getBookingStatus().equals("Approved")) {

				pat.add(list.get(i));
			}
		}
		model.addAttribute("id", id);
		model.addAttribute("doc", doc);
		model.addAttribute("list", pat);
		return "doctor/search";
	}

	@GetMapping("/{id}/doctor-logout")
	public String logout(@PathVariable int id) {
		Doctor doc = this.service.get(id);
		doc.setStatus(false);
		this.service.updateDoctor(doc);
		return "redirect:/doctor-login";
	}
	
	@GetMapping("/{id}/profile1")
	public String profile1(@PathVariable int id, Model model) {
		Doctor doc = this.service.get(id);
		model.addAttribute("id", id);
		model.addAttribute("doc", doc);
		return "doctor/profile2";
	}
	
	
	@GetMapping("/{id}/appointment-history")
	public String appointmentHistory(@PathVariable int id, Model model) {
		List<BookingHistory> list = this.bookingDao.historyBoookingDoc(id);
		Doctor doc = this.service.get(id);
		if (list == null) {
			model.addAttribute("msg", "No Booking History");
		} else if (!list.isEmpty()) {
			model.addAttribute("list", list);
		}
		model.addAttribute("doc", doc);
		return "doctor/history";
	}
}
