package com.hellokoding.account.web;




import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//import org.hibernate.annotations.common.reflection.java.generics.TypeEnvironmentFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hellokoding.account.model.Driver;
import com.hellokoding.account.service.DriverService;



@Controller
@RequestMapping("/driver")
public class DriverController {
	
	 @Autowired
	    private DriverService driverService;
	
	 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listDrivers(
    		@ModelAttribute("fare") String fare,
    		@ModelAttribute("language") String language,
    		@ModelAttribute("name") String name,
    		@ModelAttribute("date") String date,
    		@ModelAttribute("name") String radioValues,
    		@ModelAttribute("destination") String destination,
    		@ModelAttribute("source") String source,
    		@ModelAttribute("drivers") String drivers,
    		Model theModel) {
		 
		 
        List < Driver > theDrivers = driverService.getDrivers();
       
        
      
       

		fare = fare.replaceAll("\\s", "");
        int intfare = Integer.parseInt(fare);
        ArrayList<String> farelist = new ArrayList<>();
        ArrayList<String> driverslist = new ArrayList<>();
      
        Driver newlist;
        for(int i =0; i<=theDrivers.size()-1; i++){
        
     
  			Driver list = theDrivers.get(i);

  		 System.out.println(list);
  		 
  		 int rate = list.getRate();

  		 
  		 System.out.println(rate);
  		 
  		 int farecalc = intfare * rate;
  		 String rate1;
  		rate1 = Integer.toString(rate);
  		 
  		 System.out.println(farecalc);
  		 
  		 fare = Integer.toString(farecalc);
  		 
  		 System.out.println(fare);

  		farelist.add(fare);
  		System.out.println(farelist);
  		
  		
  		
  		//((Driver) theDrivers).getName();
  		//String str = theDrivers).getName();
  		
 		
  		}
        
        

       // System.out.println(driverslist1);
        theModel.addAttribute("fare", farelist); 	
        theModel.addAttribute("drivers", theDrivers);
        theModel.addAttribute("destination", destination);
        theModel.addAttribute("source", source);
        theModel.addAttribute("radioValues", radioValues);
        
        theModel.addAttribute("date", date);
        return "list-drivers";
}
	
	
	
	
	@RequestMapping(value = "/bookingdetails", method = RequestMethod.GET)
    public String bookingdetails(@ModelAttribute("fare") String fare,
    		@ModelAttribute("language") String language,
    		@ModelAttribute("name") String name,
    		@ModelAttribute("date") String date,
    		@ModelAttribute("radioValues") String radioValues,
    		@ModelAttribute("radioValues") String radioValues1,
    		@ModelAttribute("destination") String destination,
    		@ModelAttribute("source") String source,
    		@ModelAttribute("drivers") String drivers,
    		RedirectAttributes ra,
    		Model theModel) {
		 
		
		 theModel.addAttribute("fare", fare); 	
	        theModel.addAttribute("drivers", drivers);
	        theModel.addAttribute("radioValues", radioValues);
	        theModel.addAttribute("destination", destination);
	        theModel.addAttribute("radioValues1", radioValues1);
	        theModel.addAttribute("source", source);
	        theModel.addAttribute("date", date);

		
		
		ra.addAttribute("fare", fare);
		ra.addAttribute("drivers", drivers);
		ra.addAttribute("destination", destination);
		ra.addAttribute("source", source);
		ra.addAttribute("date", date);
		ra.addAttribute("radioValues", radioValues);
		ra.addAttribute("radioValues1", radioValues1);
		return "redirect:/new";
	}
	
	
	
	
	

}
 
