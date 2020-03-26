package com.hellokoding.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hellokoding.account.model.Booking;
import com.hellokoding.account.model.Driver;


public interface BookingRepository extends JpaRepository<Booking, Long> {

	

}
