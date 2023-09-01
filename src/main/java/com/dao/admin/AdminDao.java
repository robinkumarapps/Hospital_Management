package com.dao.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.model.Admin;
import com.model.Doctor;

@Component
@Transactional
public class AdminDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	// Activate admin profile
	public boolean activateAdmin(Admin admin) {
		String sql = "from Admin where adminEmail='" + admin.getAdminEmail() + "'";
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Admin> list = (List<Admin>) this.hibernateTemplate.find(sql);
		if (!list.isEmpty() && list.get(0).getAdminEmail().equals(admin.getAdminEmail())) {
			return false;
		}
		this.hibernateTemplate.save(admin);
		return true;
	}

	// get all login Signup detail
	public Admin adminLogin(String email, String password) {
		String sql = "from Admin where adminEmail='" + email + "'";
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Admin> list = (List<Admin>) this.hibernateTemplate.find(sql);
		
		if(!list.isEmpty() && list.get(0).getAdminPass() != null && list.get(0).getAdminPass().equals(password))
		{
			return list.get(0);
		}
		return null;
	}
	
	//delete doctor
	public boolean deleteDoctor(int id) {
		this.hibernateTemplate.delete(getDoctorById(id));
		return true;
	}
	
	//get doctor by id
	public Doctor getDoctorById(int id)
	{
		return this.hibernateTemplate.get(Doctor.class, id);
	}
	
	public int getId()
	{
		int id = 0;
		String sql = "select max(id) from doctor";
		@SuppressWarnings({ "deprecation", "unchecked" })
		List<Object> s = (List<Object>)this.hibernateTemplate.find(sql);
		if(s.isEmpty())
		{
			return 0;
		}
		id = (int)s.get(0)+1;
		return id;
	}
}
