package com.dao.booking;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.model.Booking;
import com.model.BookingHistory;
import com.model.Checkup;
import com.model.Patient;
import com.model.Prescription;

@Component
@Transactional
public class DaoBooking {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	public boolean deleteBoooking(Booking book, int docId)
	{
		Patient patient = book.getPatient();
		this.hibernateTemplate.delete(patient.getPrescription());
		this.hibernateTemplate.delete(patient.getCheckup());
		BookingHistory bookingHistory = new BookingHistory();
		bookingHistory.setDoctorId(docId);
		bookingHistory.setPatientId(book.getPatient().getPatientId());
		if(book.getBookingStatus().equals("Approved")) {
			bookingHistory.setBookingStatus("Approved, Discharged on "+LocalDate.now().toString());
		}else if(book.getBookingStatus().equals("Pending"))
		{
			bookingHistory.setBookingStatus("Pending, Patient Deleted on "+LocalDate.now().toString());
		}else if(book.getBookingStatus().equals("Rejected")) {
			bookingHistory.setBookingStatus("Doctor Rejected on "+LocalDate.now().toString());
		}
		
		bookingHistory.setAppTime(book.getAppTime());
		bookingHistory.setAppDate(book.getAppDate());
		this.hibernateTemplate.delete(book);
		this.hibernateTemplate.save(bookingHistory);
		return true;
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<BookingHistory> historyBoooking(int id)
	{
		String sql = "from BookingHistory where patientid="+id;
		return (List<BookingHistory>)this.hibernateTemplate.find(sql);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<BookingHistory> historyBoookingDoc(int id)
	{
		String sql = "from BookingHistory where doctorid="+id;
		return (List<BookingHistory>)this.hibernateTemplate.find(sql);
	}
}
