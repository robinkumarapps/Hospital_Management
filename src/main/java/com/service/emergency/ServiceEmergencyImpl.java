package com.service.emergency;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.dao.admin.EmergencyDao;
import com.model.Doctor;
import com.model.Emergency;

@Service
@Transactional

public class ServiceEmergencyImpl implements ServiceEmergency{

	@Autowired
	private EmergencyDao emergencydao;
	@Override
	
	public void saveEmergency(Emergency emergency) {
		this.emergencydao.saveEmergency(emergency);
		
		
	}

	@Override
	public Emergency getAllEmergecny(int id) {
		return this.emergencydao.getAllEmergency(id);
		
		
	}
	
	

}
