package com.dao.doctor;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.Booking;
import com.model.Doctor;
import com.model.Patient;

@Repository
@Transactional
public class DaoDoctorImp implements DaoDoctor{

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public boolean signUp(Doctor doctor) {
		String sql = "from Doctor where email='"+doctor.getEmail()+"'";
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Doctor> doc = (List<Doctor>) this.hibernateTemplate.find(sql);
		if(!doc.isEmpty()) {
			return false;
		}
		else{
				this.hibernateTemplate.save(doctor);
				return true;
		}
	}

	
	@Override
	public boolean login(String email, String password) {
		String sql = "from Doctor where email='"+email+"'";
		@SuppressWarnings({"deprecation", "unchecked" })
		List<Doctor> d = (List<Doctor>) this.hibernateTemplate.find(sql);
		if(d.size() == 1 && d.get(0).getPassword().equals(password))
		{
				d.get(0).setStatus(true);
				this.updateDoctor(d.get(0));
				return true;	
		}
		return false;
	}

	@Override
	public void accept(int id, int pid) {
		Patient pat = this.hibernateTemplate.get(Patient.class, pid);
		pat.getBooking().setBookingStatus("Approved");
		this.hibernateTemplate.update(pat);
	}

	@Override
	public void reject(int id, int pid) {
		Patient pat = this.hibernateTemplate.get(Patient.class, pid);
		if(pat != null) {
			pat.getBooking().setBookingStatus("Rejected");
			this.hibernateTemplate.update(pat);
		}
	}

	@Override
	public int getDoctorId(String email) {
		String sql = "from Doctor where email='"+email+"'";
		@SuppressWarnings({"deprecation" })
		Doctor doc = (Doctor)this.hibernateTemplate.find(sql).get(0);
		return doc.getId();
	}


	@Override
	public Doctor get(int id) {
		return this.hibernateTemplate.get(Doctor.class, id);
	}


	@Override
	public boolean addPatient(Patient patient) {
			this.hibernateTemplate.save(patient);
			return true;
	}


	@Override
	public List<Doctor> getAllDoctor() {
		return (List<Doctor>)this.hibernateTemplate.loadAll(Doctor.class);
	}


	@Override
	public List<String> getAllNameSpec() {
		List<Doctor> doc = this.getAllDoctor();
		List<String> list = new ArrayList<>(); 
		for(Doctor d: doc)
		{
			String temp = "Dr. "+d.getName()+"("+d.getSpeciality()+")";
			list.add(temp);
		}
		return list;
	}


	@Override
	public int[] getAllDoctorId() {
		List<Doctor> doc = getAllDoctor();
		int[] docId = new int[doc.size()];
		for(int i =0; i < doc.size(); i++)
		{
			docId[i] = doc.get(i).getId();
		}
		return docId;
	}


	@Override
	public List<Booking> getConfirmBooking(int id) {
		String sql = "from Patient where docId="+id;
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Patient> patient = (List<Patient>)this.hibernateTemplate.find(sql);
		List<Booking> b = new ArrayList<>();
		for(Patient p: patient)
		{
			if(p.getBooking() != null && p.getBooking().getBookingStatus().equals("Approved"))
				b.add(p.getBooking());
		}
		return b;
	}


	@Override
	public List<Booking> getPendingBooking(int id) {
		String sql = "from Patient where docId="+id;
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Patient> patient = (List<Patient>)this.hibernateTemplate.find(sql);
		List<Booking> b = new ArrayList<>();
		for(Patient p: patient)
		{
			if(p.getBooking() != null && p.getBooking().getBookingStatus().equals("Pending"))
				b.add(p.getBooking());
		}
		return b;
	}


	@Override
	public Patient getPatient(int pid) {
		return this.hibernateTemplate.get(Patient.class, pid);
	}


	@Override
	public void updatePatient(Patient patient) {
		this.hibernateTemplate.update(patient);
	}


	@Override
	public void updateDoctor(Doctor doc) {
		this.hibernateTemplate.update(doc);
	}
	
	@Override
	public void logoutDoctor(Doctor doc)
	{
		doc.setStatus(false);
		this.updateDoctor(doc);
	}


	@Override
	public List<Patient> getAllPatient() {
		return this.hibernateTemplate.loadAll(Patient.class);
	}
}
