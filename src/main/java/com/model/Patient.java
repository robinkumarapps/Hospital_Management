package com.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
public class Patient {

	@Id
	@GeneratedValue
	@Column(length = 9)
	private int patientId;

	@Size(min = 1, max = 30)
	@Column(length = 30)
	@NotEmpty(message = "Required Field!")
	private String patientName;

	@Column
	private char gender;

	@Size(min = 1, max = 12)
	@Column(length = 12, unique=true)
	@NotEmpty(message = "Required Field!")
	private String contactNumber;

	@ManyToOne
	@JoinColumn(name = "docId")
	private Doctor doctor;

	@Column(length = 30, unique = true)
	@NotEmpty(message = "Required Field!")
	@Email(message = "Email must be in format")
	private String email;

	@OneToOne(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
	private Booking booking;

	@OneToOne(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
	private Prescription prescription;

	@OneToOne(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
	private Checkup checkup;

	private boolean archive;

	private String password;

	private boolean status;

	public Patient() {
		this.archive = false;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	public Prescription getPrescription() {
		return prescription;
	}

	public void setPrescription(Prescription prescription) {
		this.prescription = prescription;
	}

	public Checkup getCheckup() {
		return checkup;
	}

	public void setCheckup(Checkup checkup) {
		this.checkup = checkup;
	}

	public boolean isArchive() {
		return archive;
	}

	public void setArchive(boolean archive) {
		this.archive = archive;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Patient [patientId=" + patientId + ", patientName=" + patientName + ", gender=" + gender
				+ ", contactNumber=" + contactNumber + ", doctor=" + doctor + ", email=" + email + ", booking="
				+ booking + ", prescription=" + prescription + ", checkup=" + checkup + ", archive=" + archive
				+ ", password=" + password + ", status=" + status + "]";
	}

}
