package com.model;

import java.util.Arrays;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import org.hibernate.validator.constraints.Range;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Entity
public class Doctor {

	@Id
	@GeneratedValue
	@Column(length = 10)
	private int id;

	@Column(length = 40)
	@NotEmpty(message = "Required Field!")
	private String name;

	@Column(length = 40, unique = true)
	@NotEmpty(message = "Required Field!")
	@Email(message = "Email must be in format")
	private String email;

	@Column(length = 2)
	@Range(min = 1, max = 40, message = "Enter between 1 to 40")
	private byte experience;

	@Column(length = 40)
	@NotEmpty(message = "License can't be empty")
	private String licenseNo;

	@Column(length = 40)
	@Range(min = 1, max = 100000, message = "Enter between 1 to 10000")
	private int appointmentFee;

	@Column(length = 40)
	@NotEmpty(message = "Speciality can't be empty")
	private String speciality;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "doctor", cascade = CascadeType.ALL)
	private List<Patient> patient;

	@Column(length = 30)
	@NotEmpty(message = "Password can't be empty")
	private String password;

	private String[] availabilityDate;

	private boolean status;

	private boolean verified;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public byte getExperience() {
		return experience;
	}

	public void setExperience(byte experience) {
		this.experience = experience;
	}

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	public int getAppointmentFee() {
		return appointmentFee;
	}

	public void setAppointmentFee(int appointmentFee) {
		this.appointmentFee = appointmentFee;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public List<Patient> getPatient() {
		return patient;
	}

	public void setPatient(List<Patient> patient) {
		this.patient = patient;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String[] getAvailabilityDate() {
		return availabilityDate;
	}

	public void setAvailabilityDate(String[] availabilityDate) {
		this.availabilityDate = availabilityDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isVerified() {
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
	}

	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", email=" + email + ", experience=" + experience
				+ ", licenseNo=" + licenseNo + ", appointmentFee=" + appointmentFee + ", speciality=" + speciality
				+ ", patient=" + patient + ", password=" + password + ", availabilityDate="
				+ Arrays.toString(availabilityDate) + ", status=" + status + ", verified=" + verified + "]";
	}

}
