package com.dao.doctor;

import java.util.List;

import com.model.Booking;
import com.model.Doctor;
import com.model.Patient;

public interface DaoDoctor {
	boolean signUp(Doctor doctor);

	boolean login(String email, String password);

	Doctor get(int id);
	
	int getDoctorId(String email);

	void accept(int id, int pid);

	void reject(int id, int pid);
	
	List<Booking> getConfirmBooking(int id);

	List<Booking> getPendingBooking(int id);

	boolean addPatient(Patient patient);
	
	List<Doctor> getAllDoctor();
	
	int[] getAllDoctorId();
	
	List<String> getAllNameSpec();
	
	Patient getPatient(int pid);
	
	void updatePatient(Patient patient);
	
	///////////////////////////////////
	void updateDoctor(Doctor doc);
	
	void logoutDoctor(Doctor doc);
	
	List<Patient> getAllPatient();
}
