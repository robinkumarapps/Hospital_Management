package com.service.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.doctor.DaoDoctor;
import com.model.Booking;
import com.model.Doctor;
import com.model.Patient;

@Service
public class ServiceDoctorImp implements ServiceDoctor{

	@Autowired
	private DaoDoctor daoDoctor;
	
	@Override
	public boolean signUp(Doctor doctor) {
		return this.daoDoctor.signUp(doctor);
	}

	@Override
	public boolean login(String email, String password) {
		return this.daoDoctor.login(email, password);
	}

	@Override
	public int getDoctorId(String email) {
		return daoDoctor.getDoctorId(email);
	} 
	
	@Override
	public Doctor get(int id) {
		return this.daoDoctor.get(id);
	}

	@Override
	public List<Doctor> getAllDoctor() {
		return this.daoDoctor.getAllDoctor();
	}

	@Override
	public List<String> getAllNameSpec() {
		return this.daoDoctor.getAllNameSpec();
	}

	@Override
	public int[] getAllDoctorId() {
		return this.daoDoctor.getAllDoctorId();
	}

	@Override
	public List<Booking> getConfirmBooking(int id) {
		return this.daoDoctor.getConfirmBooking(id);
	}

	@Override
	public List<Booking> getPendingBooking(int id) {
		return this.daoDoctor.getPendingBooking(id);
	}

	@Override
	public void accept(int id, int pid) {
		this.daoDoctor.accept(id, pid);
	}

	@Override
	public void reject(int id, int pid) {
		this.daoDoctor.reject(id, pid);
	}

	@Override
	public Patient getPatient(int pid) {
		return this.daoDoctor.getPatient(pid);
	}

	@Override
	public void updatePatient(Patient patient) {
		this.daoDoctor.updatePatient(patient);
	}

	@Override
	public void addPatient(Patient patient) {
		this.daoDoctor.addPatient(patient);
	}

	@Override
	public void updateDoctor(Doctor doc) {
		this.daoDoctor.updateDoctor(doc);
	}

	@Override
	public void logoutDoctor(Doctor doc) {
		this.daoDoctor.logoutDoctor(doc);
	}
	
	@Override
	public List<Patient> getAllPatient() {
		return this.daoDoctor.getAllPatient();
	}
	
}
