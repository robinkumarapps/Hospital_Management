//package com.model;
//
//import java.sql.Blob;
//
//import javax.persistence.Entity;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.OneToOne;
//
//@Entity
//public class Files {
//
//	private Blob image;
//
//	private Blob pdf;
//
//	@Id
//	@OneToOne
//	@JoinColumn(name = "docId")
//	private Doctor doctor;
//
//	public Blob getImage() {
//		return image;
//	}
//
//	public void setImage(Blob image) {
//		this.image = image;
//	}
//
//	public Blob getPdf() {
//		return pdf;
//	}
//
//	public void setPdf(Blob pdf) {
//		this.pdf = pdf;
//	}
//
//	public Doctor getDoctor() {
//		return doctor;
//	}
//
//	public void setDoctor(Doctor doctor) {
//		this.doctor = doctor;
//	}
//
//	@Override
//	public String toString() {
//		return "Files [image=" + image + ", pdf=" + pdf + ", doctor=" + doctor + "]";
//	}
//
//}
