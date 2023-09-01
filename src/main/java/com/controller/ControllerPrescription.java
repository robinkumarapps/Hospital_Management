package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import com.model.Patient;
import com.service.doctor.ServiceDoctor;

@Controller
public class ControllerPrescription {

	@Autowired
	private ServiceDoctor service;
	
	@GetMapping("/booking/{id}/{pid}/prescription")
	public String prescription(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model) {
		if(this.service.getPatient(pid).getCheckup().getDisease() == null || this.service.getPatient(pid).getCheckup().getDisease().isEmpty()) {
			model.addAttribute("id", id);
			model.addAttribute("name", service.get(id).getName());
			model.addAttribute("list", this.service.getConfirmBooking(id));
			model.addAttribute("msg", "Please add Checkup Report first to Submit the Prescription");
			return "doctor/allbooking";
		}
		Patient patient = this.service.getPatient(pid);
		model.addAttribute("id", id);
		model.addAttribute("pid", pid);
		model.addAttribute("pname", patient.getPatientName());
		model.addAttribute("desc", patient.getPrescription().getDescription());
		model.addAttribute("med", patient.getPrescription().getMedicine());
		if(patient.getPrescription().getPrescDate() != null)
			model.addAttribute("pdate", patient.getPrescription().getPrescDate()+" "+patient.getPrescription().getPrescTime());
		model.addAttribute("dose", patient.getPrescription().getDose());
		model.addAttribute("timing", patient.getPrescription().getTiming());
		model.addAttribute("name", service.get(id).getName());
		model.addAttribute("gender", patient.getGender());
		model.addAttribute("disease", patient.getCheckup().getDisease());
		return "doctor/prescription";
	}

	@PostMapping("/booking/{id}/{pid}/addprescription")
	public String addPrescription(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model,
			HttpServletRequest request) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
		String[] desc = request.getParameterValues("desc");
		String[] med = request.getParameterValues("med");
		String[] dose = request.getParameterValues("dose");
		String[] timing = request.getParameterValues("timing");
		Patient patient = this.service.getPatient(pid);
		patient.getPrescription().setDescription(desc);
		patient.getPrescription().setDose(dose);
		patient.getPrescription().setMedicine(med);
		patient.getPrescription().setTiming(timing);
		patient.getPrescription().setPrescDate(LocalDate.now().toString());
		patient.getPrescription().setPrescTime(dtf.format(LocalTime.now()));
		this.service.updatePatient(patient);
		request.setAttribute("msg","Saved!");
		return "redirect:/booking/{id}/{pid}/prescription";
	}
}
