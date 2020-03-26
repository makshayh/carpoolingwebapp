package com.hellokoding.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hellokoding.account.model.Driver;
import com.hellokoding.account.repository.DriverRepository;


public class DriverServiceImpl implements DriverService {
	
	@Autowired
    private DriverRepository driverRepository;
	


	@Override
	public List<Driver> getDrivers() {
		// TODO Auto-generated method stub
		return driverRepository.findAll();
	}



	


	

}
