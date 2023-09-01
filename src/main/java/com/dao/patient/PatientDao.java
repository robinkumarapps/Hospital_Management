package com.dao.patient;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.model.Patient;

@Component
@Transactional
public class PatientDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public boolean signUp(Patient patient) {
		String sql = "from Patient where email='"+patient.getEmail()+"' or contactNumber='"+patient.getContactNumber()+"'";
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Patient> list = (List<Patient>) this.hibernateTemplate.find(sql);
		if(!list.isEmpty()) {
			return false;
		}
		else{
				this.hibernateTemplate.save(patient);
				return true;
		}
	}

	
	public boolean login(String email, String password) {
		String sql = "from Patient where email='"+email+"'";
		@SuppressWarnings({"deprecation", "unchecked" })
		List<Patient> d = (List<Patient>) this.hibernateTemplate.find(sql);
		if(d.size() == 1 && d.get(0).getPassword().equals(password))
		{
				d.get(0).setStatus(true);
				this.hibernateTemplate.update(d.get(0));
				return true;	
		}
		return false;
	}
	
	public Patient getPatient(String email) {
		String sql = "from Patient where email='"+email+"'";
		@SuppressWarnings({"deprecation", "unchecked" })
		List<Patient> d = (List<Patient>) this.hibernateTemplate.find(sql);
		return d.get(0);
	}
	
	public Patient getPatient(int id) {
		return this.hibernateTemplate.get(Patient.class, id);
	}
	
	public boolean deleteBooking(Patient patient) {
		this.hibernateTemplate.delete(patient.getBooking());
		this.hibernateTemplate.delete(patient.getPrescription());
		this.hibernateTemplate.delete(patient.getCheckup());
		return true;
	}
	
	public void deletePatient(Patient patient){
			this.hibernateTemplate.delete(patient);
	}
	
}
