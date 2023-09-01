package com.dao.admin;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.model.Emergency;



@Repository
public class EmergencyDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Transactional
	public void saveEmergency(Emergency emergency) {
		this.hibernateTemplate.save(emergency);
		
	}
	public Emergency getAllEmergency(int id) {
		return this.hibernateTemplate.get(Emergency.class, id);
		
	}
	

}
