package com.hellokoding.account.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hellokoding.account.model.Booking;
import com.hellokoding.account.model.Driver;
import com.hellokoding.account.model.User;
import com.hellokoding.account.service.BookingService;

//import com.hellokoding.account.model.User;
//import com.hellokoding.account.service.BookingService;


@Controller
/*@RequestMapping("/driver")*/
public class BookingController {

	
	@Autowired
	private BookingService bookingService;
	

    @RequestMapping(value = "/route", method = RequestMethod.GET)
    public String route(Model model) {
        return "route";
    }
	
    @RequestMapping(value = "/confirmation", method = RequestMethod.GET)
    public String confirmation	(Model model) {
        return "confirmation";
    }
	
	
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
    public String bookingdetails(@ModelAttribute("fare") String fare,
    		@ModelAttribute("language") String language,
    		@ModelAttribute("name") String name,
    		@ModelAttribute("radioValues") String radioValues,
    		@ModelAttribute("date") String date,
    		@ModelAttribute("destination") String destination,
    		@ModelAttribute("source") String source,
    		@ModelAttribute("drivers") String drivers,
    		@ModelAttribute("drivers") String pickuptime,
    		RedirectAttributes ra,
    		Model theModel) {
		 
		
		 theModel.addAttribute("fare", fare); 	
	        theModel.addAttribute("drivers", drivers);
	        theModel.addAttribute("destination", destination);
	        theModel.addAttribute("source", source);
	        theModel.addAttribute("pickuptime", pickuptime);
	        theModel.addAttribute("date", date);
	        theModel.addAttribute("radioValues", radioValues);
		
		ra.addAttribute("fare", fare);
		ra.addAttribute("drivers", drivers);
		ra.addAttribute("destination", destination);
		ra.addAttribute("pickuptime", pickuptime);
		ra.addAttribute("source", source);
		ra.addAttribute("date", date);
		ra.addAttribute("radioValues", radioValues);
	

		
		 
		System.out.println(ra);
		return "bookingdetails";
		
		
	}
	
	
	
	
	
	
	@RequestMapping(value = "/booking", method = RequestMethod.POST)
    public String booking(@ModelAttribute("booking") Booking booking, BindingResult bindingResult, Model model,
    		
    		RedirectAttributes ra
    		
    		) {
 

		ra.addAttribute("fare", booking.getFare());
		ra.addAttribute("destination",booking.getDestination());
		ra.addAttribute("source", booking.getSource());


		//String fare = booking.getFare();
		String source = booking.getSource();
		String destination = booking.getDestination();
		//String fare = mapping1FormObject.getFare())
		//redirectAttributes.addFlashAttribute("booking", mapping1FormObject);
		System.out.println(source);
		System.out.println(destination);
		System.out.println(ra);
		
		
		
		//bookingService.save(userForm);

       // securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/driver/list";
    }
	
/*	
	@RequestMapping(value = "/showbooking", method = RequestMethod.POST)
    public String showbooking(@ModelAttribute("showbooking") Booking booking) {
		bookingService.saveCustomer(theCustomer);
        return "redirect:/customer/list";
    }
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
