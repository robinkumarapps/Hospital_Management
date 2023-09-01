package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Emergency {
	@Id
	@GeneratedValue
	@Column(length = 9)
	private int formId;

	/* @NotEmpty */
	private String FirstName;

    
	private String LastName;
	
	private String Address;
	
	private String mobileNumber;
	
	private String primaryMobileNumber;

     private String state;

     private String emergencyEmail;
	public Emergency() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
	public Emergency(int formId, String firstName, String lastName, String address, String mobileNumber,
			String primaryMobileNumber, String state, String emergencyEmail) {
		super();
		this.formId = formId;
		FirstName = firstName;
		LastName = lastName;
		Address = address;
		this.mobileNumber = mobileNumber;
		this.primaryMobileNumber = primaryMobileNumber;
		this.state = state;
		this.emergencyEmail = emergencyEmail;
	}



	public int getFormId() {
		return formId;
	}

	public void setFormId(int formId) {
		this.formId = formId;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getPrimaryMobileNumber() {
		return primaryMobileNumber;
	}

	public void setPrimaryMobileNumber(String primaryMobileNumber) {
		this.primaryMobileNumber = primaryMobileNumber;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getEmergencyEmail() {
		return emergencyEmail;
	}

	public void setEmergencyEmail(String emergencyEmail) {
		this.emergencyEmail = emergencyEmail;
	}

	@Override
	public String toString() {
		return "Emergency [FirstName=" + FirstName + ", LastName=" + LastName + ", Address=" + Address
				+ ", mobileNumber=" + mobileNumber + ", primaryMobileNumber=" + primaryMobileNumber + ", state=" + state
				+ ", emergencyEmail=" + emergencyEmail + "]";
	}
	
}
