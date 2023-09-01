package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Checkup {

	@Id
	@GeneratedValue
	@Column(length = 10)
	private int checkupId;

	private String checkupDate;

	private String checkuptime;

	private String disease;

	private String report;

	@OneToOne
	@JoinColumn(name = "patientId")
	private Patient patient;

	public int getCheckupId() {
		return checkupId;
	}

	public void setCheckupId(int checkupId) {
		this.checkupId = checkupId;
	}

	public String getCheckupDate() {
		return checkupDate;
	}

	public void setCheckupDate(String checkupDate) {
		this.checkupDate = checkupDate;
	}

	public String getCheckuptime() {
		return checkuptime;
	}

	public void setCheckuptime(String checkuptime) {
		this.checkuptime = checkuptime;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	@Override
	public String toString() {
		return "Checkup [checkupId=" + checkupId + ", checkupDate=" + checkupDate + ", checkuptime=" + checkuptime
				+ ", disease=" + disease + ", report=" + report + ", patient=" + patient + "]";
	}

}