package com.hellokoding.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hellokoding.account.model.Booking;
import com.hellokoding.account.model.User;
import com.hellokoding.account.repository.BookingRepository;

public class BookingServiceImpl implements BookingService{
	
	@Autowired
    private BookingRepository bookingRepository;

	@Override
	public List<Booking> getBooking() {
		// TODO Auto-generated method stub
		return bookingRepository.findAll();
	}

	@Override
	public void save(Booking submitconfirmation) {
		// TODO Auto-generated method stub
	 bookingRepository.save(submitconfirmation);
	}

}
