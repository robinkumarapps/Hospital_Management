package com.service.doctor;

import java.util.List;

import com.model.Booking;
import com.model.Doctor;
import com.model.Patient;

public interface ServiceDoctor {
	
	boolean signUp(Doctor doctor);

	boolean login(String email, String password);
	
	int getDoctorId(String email);
	
	Doctor get(int id);
	
	List<Doctor> getAllDoctor();
	
	List<String> getAllNameSpec();
	
	List<Booking> getConfirmBooking(int id);

	List<Booking> getPendingBooking(int id);
	
	int[] getAllDoctorId();
	
	void accept(int id, int pid);

	void reject(int id, int pid);
	
	Patient getPatient(int pid);
	
	void addPatient(Patient patient);
	
	void updatePatient(Patient patient);
	
	void updateDoctor(Doctor doc);
	
	void logoutDoctor(Doctor doc);
	
	List<Patient> getAllPatient();
}
