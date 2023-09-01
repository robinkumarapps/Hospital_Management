package com.service.emergency;

import com.model.Doctor;
import com.model.Emergency;

public interface ServiceEmergency {
	void saveEmergency(Emergency emergency);
	Emergency getAllEmergecny(int id);
}
