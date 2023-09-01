package com.model;

import java.util.Arrays;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Prescription {

	@Id
	@GeneratedValue
	@Column(length = 10)
	private int prescriptionId;

	@OneToOne
	@JoinColumn(name = "patientId")
	private Patient patient;

	private String prescDate;

	private String prescTime;

	private String[] description = new String[1];

	private String[] medicine = new String[1];

	private String[] dose = new String[1];

	private String[] timing = new String[1];

	public Prescription() {
		super();
		this.initializeAr();
	}

	public void initializeAr() {
		String[] temp = { "" };
		this.description = temp;
		this.medicine = temp;
		this.dose = temp;
		this.timing = temp;
	}

	public int getPrescriptionId() {
		return prescriptionId;
	}

	public void setPrescriptionId(int prescriptionId) {
		this.prescriptionId = prescriptionId;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public String getPrescDate() {
		return prescDate;
	}

	public void setPrescDate(String prescDate) {
		this.prescDate = prescDate;
	}

	public String getPrescTime() {
		return prescTime;
	}

	public void setPrescTime(String prescTime) {
		this.prescTime = prescTime;
	}

	public String[] getDescription() {
		return description;
	}

	public void setDescription(String[] description) {
		this.description = description;
	}

	public String[] getMedicine() {
		return medicine;
	}

	public void setMedicine(String[] medicine) {
		this.medicine = medicine;
	}

	public String[] getDose() {
		return dose;
	}

	public void setDose(String[] dose) {
		this.dose = dose;
	}

	public String[] getTiming() {
		return timing;
	}

	public void setTiming(String[] timing) {
		this.timing = timing;
	}

	@Override
	public String toString() {
		return "Prescription [prescriptionId=" + prescriptionId + ", patient=" + patient + ", prescDate=" + prescDate
				+ ", prescTime=" + prescTime + ", description=" + Arrays.toString(description) + ", medicine="
				+ Arrays.toString(medicine) + ", dose=" + Arrays.toString(dose) + ", timing=" + Arrays.toString(timing)
				+ "]";
	}
}
