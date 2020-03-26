package com.hellokoding.account.service;

import java.util.List;

import com.hellokoding.account.model.Booking;
import com.hellokoding.account.model.User;

public interface BookingService {

	List<Booking> getBooking();

	void save(Booking submitconfirmation);



}
