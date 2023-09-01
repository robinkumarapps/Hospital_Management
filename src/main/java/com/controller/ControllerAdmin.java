package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.Doctor;
import com.model.Emergency;
import com.model.Patient;
import com.service.doctor.ServiceDoctor;
import com.service.emergency.ServiceEmergency;
import com.model.Admin;
import com.model.BookingHistory;
import com.dao.admin.AdminDao;
import com.dao.booking.DaoBooking;
import com.dao.patient.PatientDao;

@Controller
public class ControllerAdmin {

	Admin admin = null;

	@Autowired
	private AdminDao adminDao;

	@Autowired
	private ServiceDoctor serviceDoctor;
	
	@Autowired
	private ServiceEmergency serviceEmergency;
	
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DaoBooking bookingDao;
	
	// front login page controller
	@RequestMapping("/login")
	public String loginControler() {
		return "admin/login";
	}

	@GetMapping("/admin-homepage")
	public String adminHomepage()
	{
		return "admin/homepage";
	}
	
	// login validation and login form controller
	@RequestMapping(value = "/admin_valid", method = RequestMethod.POST)
	public String validForm(@RequestParam("user_email") String username, HttpServletRequest request, Model model) {
		String password = request.getParameter("user_password");
		this.admin = this.adminDao.adminLogin(username, password);
		if (this.admin != null) {
			return "redirect:/admin";
		}
		model.addAttribute("msg", "Login Failed!");
		return "admin/login";
	}

	// Admin front page controller
	@RequestMapping("/admin")
	public String adminpage(Model m) {
		List<Doctor> doc = this.serviceDoctor.getAllDoctor();
		m.addAttribute("admin", this.admin);
		m.addAttribute("doctor", doc);
		return "admin/admin_page";
	}

	// signup front page controller
	@RequestMapping("/signup")
	public String signup(Model model) {
		return "admin/signupAdmin";
	}

	// signup form validator and controller
	@RequestMapping(value = "/signup_valid", method = RequestMethod.POST)
	public String validateSignupForm(@Valid @ModelAttribute Admin activate, Model m) {
		boolean check = this.adminDao.activateAdmin(activate);
		if (check) {
			m.addAttribute("msg", "Admin Activated Successfully");
			return "admin/login";
		}

		m.addAttribute("msg", "Invalid Details Unable to activate");
		return "admin/signupAdmin";
	}

	// Admin home page
	@RequestMapping("/admin-home")
	public String doctorHome(Model m) {
		List<Doctor> doc = this.serviceDoctor.getAllDoctor();
		m.addAttribute("admin", this.admin);
		m.addAttribute("doctor", doc);
		Object a = m.getAttribute("msg");
		m.addAttribute("msg", a);
		return "admin/home";

	}
	
	@RequestMapping("/allpatient")
	public String allPatients(Model m) {
		List<Patient> pat = this.serviceDoctor.getAllPatient();
		m.addAttribute("admin", this.admin);
		m.addAttribute("patient", pat);
		return "admin/patient";

	}

	// Add doctor form
	@RequestMapping("/add_dotcor")
	public String addDoctor(Model m) {
		String[] speciality = { "Audiologist", "Cardiologist", "Dentist", "ENT specialist", "Gynaecologist",
				"Orthopaedic surgeon", "Paediatrician", "Psychiatrists", "Cardiothoracic surgeon" };
		m.addAttribute("item", speciality);
		m.addAttribute("admin", this.admin);
		return "admin/add_dotcor";
	}

	// Add doctor form controller
	@RequestMapping(value = "/handle-doc", method = RequestMethod.POST)
	public String handleForm(@RequestParam("image") CommonsMultipartFile file,
			@RequestParam("pdf") CommonsMultipartFile pdf, @Valid @ModelAttribute Doctor doct,
			BindingResult bindingresult, HttpServletRequest request, HttpSession s, Model m) {
		m.addAttribute("admin", this.admin);
		doct.setVerified(true);
		byte[] pdfdata = pdf.getBytes();
		String pdfpath = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
				+ File.separator + "pdf" + File.separator + ((doct.getEmail()) + (".pdf"));

		System.out.println(pdfpath);

		try {
			FileOutputStream fospdf = new FileOutputStream(pdfpath);
			fospdf.write(pdfdata);
			fospdf.close();
			m.addAttribute("pdfmsg", "Pdf uploaded succesfully....");

		} catch (IOException e) {
			e.printStackTrace();
			m.addAttribute("pdfmsg", "Error occure while pdf uploading !!!!!");
			return "admin/add_doctor";
		}

		byte[] data = file.getBytes();
		String path = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources" + File.separator
				+ "image" + File.separator + ((doct.getEmail()) + (".jpg"));
		System.out.println(path);
		try {
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			m.addAttribute("msgg", "upload succesfully....");

		} catch (IOException e) {
			e.printStackTrace();
			m.addAttribute("msgg", "Error occure while photo uploading  !!!!!");
		}

		if (bindingresult.hasErrors()) {

			System.out.println(bindingresult);

			return "admin/add_dotcor";

		}
		else {
			System.out.println(doct);
			boolean check = this.serviceDoctor.signUp(doct);
			if(check)
			{
				m.addAttribute("msg", "Email id must be unique");
			}
			else {
				m.addAttribute("msg", "Doctor Added Successfully");
			}
			return "redirect:/admin-home";
		}

	}

	// delete handler delete present doctor
	@RequestMapping("/delete/{doctorid}")
	public String deleteProduct(@PathVariable("doctorid") int id,Model model) {
		this.adminDao.deleteDoctor(id);
		return "redirect:/admin-home";

	}

	// Update Doctor page handler..
	@RequestMapping("/update/{doctid}")
	public String updateProduct(@PathVariable("doctid") int id, Model m) {
		m.addAttribute("admin", this.admin);
		Doctor dr = this.adminDao.getDoctorById(id);
		System.out.println(dr.getId());
		m.addAttribute("doctor", dr);

		return "admin/update_doct";
	}

	// Update doctor form controler
	@RequestMapping(value = "/update-doctor", method = RequestMethod.POST)
	public String updateForm(@RequestParam("image") CommonsMultipartFile file,
			@RequestParam("pdf") CommonsMultipartFile pdf, @Valid @ModelAttribute Doctor doct,
			BindingResult bindingresult, HttpSession s, Model m) {
		System.out.println(file.getSize() + "photot size***");
		System.out.println(pdf.getSize() + "pdf size****");
		m.addAttribute("admin", this.admin);
		if ((pdf.getSize()) > 0) {

			System.out.println("pdf running  > 0 ******* running");

			byte[] pdfdata = pdf.getBytes();
			String pdfpath = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
					+ File.separator + "pdf" + File.separator + ((doct.getEmail()) + (".pdf"));

			System.out.println(pdfpath);

			try {
				FileOutputStream fospdf = new FileOutputStream(pdfpath);
				fospdf.write(pdfdata);
				fospdf.close();

			} catch (IOException e) {
				e.printStackTrace();

			}
		}
		if (file.getSize() > 0) {

			System.out.println("file runnong > 0  running****");

			byte[] datap = file.getBytes();
			String pathp = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
					+ File.separator + "image" + File.separator + ((doct.getEmail()) + (".jpg"));
			System.out.println(pathp);
			try {
				FileOutputStream fos = new FileOutputStream(pathp);

				fos.write(datap);
				fos.close();

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (bindingresult.hasErrors()) {

			System.out.println(bindingresult);

			return "redirect:/add_dotcor";

		}

		System.out.println(doct);
		this.serviceDoctor.updateDoctor(doct);
		m.addAttribute("msg", "Doctor added successfully");
		return "redirect:/admin-home";

	}

	// invalid email and id page handler
	@RequestMapping("/invalid")
	public String invalid(Model m) {
		m.addAttribute("admin", this.admin);
		return "admin/invalid_id";
	}

	// Photo and pdf page controler...
	@RequestMapping("/uploadform")
	public String showUploadForm(Model m) {
		m.addAttribute("admin", this.admin);
		return "admin/fileUpload";

	}

	
	  @GetMapping("/homeSubmit") 
	  public String contactAdmin(@ModelAttribute("contact") Emergency emergency,Model model,BindingResult br) {
	  
	  
		  if(br.hasErrors()) {
				System.out.println(br);
				return "admin/contact";
			}
		  this.serviceEmergency.saveEmergency(emergency);
			
			return "index";
	  }
	 
	@GetMapping("/home")
	public String contactEmergency() {
		return "index";
	}
	
	@GetMapping("/contactAdmin")
	public String contactEmergencys(@ModelAttribute("contact") Emergency emergency,Model model) {
		
		return "admin/contact";
	}
	
	@GetMapping("/admin-patient")
	public String allPatient(Model model) {
		List<Patient> list = this.serviceDoctor.getAllPatient();
		model.addAttribute("patient", list);
		return "admin/patientManage";
	}
	
	@GetMapping("/delete-patient/{id}")
	public String deletePatient(@PathVariable("id") int id, RedirectAttributes rd) {
		Patient patient = this.serviceDoctor.getPatient(id);
		this.patientDao.deletePatient(patient);
		rd.addAttribute("msg","Patient Deleted Successfully");
		return "redirect:/admin-patient";
	}
	
	@GetMapping("/update-patient/{id}")
	public String updatePatient(@PathVariable("id") int id, Model model){
		Patient patient = this.serviceDoctor.getPatient(id);
		model.addAttribute("patient", patient);
		return "admin/update_patient";
	}
	
	@PostMapping("/update-patient/{id}")
	public String updatePatient2(@PathVariable("id") int id, HttpServletRequest req, Model model){
		String name = req.getParameter("patientName");
		String number = req.getParameter("contactNumber");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		Patient patient = this.serviceDoctor.getPatient(id);
		patient.setPatientName(name);
		patient.setContactNumber(number);
		patient.setGender(gender.charAt(0));
		patient.setEmail(email);
		patient.setPassword(password);
		this.serviceDoctor.updatePatient(patient);
		model.addAttribute("msg","Details Successfully Updated for patientId"+patient.getPatientId());
		return "redirect:/admin-patient";
	}
	
	@RequestMapping("/add_patient")
	public String addPatient(@ModelAttribute("patient") Patient patient, Model m) {
		m.addAttribute("admin", this.admin);
		return "admin/add_patient";
	}
	
	
	@GetMapping("/{id}/{dId}/booking-history-admin")
	public String getHistoryBookings(@PathVariable int id,@PathVariable int dId, Model model) {
		List<BookingHistory> list = this.bookingDao.historyBoooking(id);
		if (list == null) {
			model.addAttribute("msg", "No Booking History");
		} else if (!list.isEmpty()) {
			model.addAttribute("list", list);
		}
		model.addAttribute("docId", dId);
		model.addAttribute("patient", this.patientDao.getPatient(id));
		return "patient/appointmentHistory2";
	}
	
	@GetMapping("/{id}/booking-history-patient")
	public String getHistoryBookingPatient(@PathVariable int id, Model model) {
		List<BookingHistory> list = this.bookingDao.historyBoookingDoc(id);
		Doctor doc = this.serviceDoctor.get(id);
		if (list == null) {
			model.addAttribute("msg", "No Booking History");
		} else if (!list.isEmpty()) {
			model.addAttribute("list", list);
		}
		model.addAttribute("doc", doc);
		return "doctor/history2";
	}
}
