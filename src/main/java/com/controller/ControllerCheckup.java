package com.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.Patient;
import com.service.doctor.ServiceDoctor;

@Controller
public class ControllerCheckup {

	@Autowired
	private ServiceDoctor service;

	@GetMapping("/booking/{id}/{pid}/checkup")
	public String checkup(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model) {
		Patient patient = this.service.getPatient(pid);
		model.addAttribute("id", id);
		model.addAttribute("pid", pid);
		model.addAttribute("pname", patient.getPatientName());
		model.addAttribute("name", service.get(id).getName());
		model.addAttribute("disease", patient.getCheckup().getDisease());
		model.addAttribute("report", patient.getCheckup().getReport());
		if(patient.getCheckup().getCheckupDate() != null)
			model.addAttribute("pdate", patient.getCheckup().getCheckupDate()+" "+patient.getCheckup().getCheckuptime());
		
		return "doctor/checkup";
	}

	@PostMapping("/booking/{id}/{pid}/checkup")
	public String addCheckup(@PathVariable("id") int id, @PathVariable("pid") int pid, Model model,
			HttpServletRequest request, RedirectAttributes rd) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
		Patient patient = this.service.getPatient(pid);
		String disease = request.getParameter("disease");
		String report =  request.getParameter("report");
		patient.getCheckup().setDisease(disease);
		patient.getCheckup().setReport(report);
		patient.getCheckup().setCheckupDate(LocalDate.now().toString());
		patient.getCheckup().setCheckuptime(dtf.format(LocalTime.now()));
		this.service.updatePatient(patient);
		rd.addAttribute("msg","Saved!");
		return "redirect:/booking/{id}/{pid}/checkup";
	}
}
