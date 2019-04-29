package com.neha.flightreservation.controllers;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neha.flightreservation.entities.User;
import com.neha.flightreservation.repos.UserRepository;

@Controller
public class UserController {
	@Autowired
	UserRepository userRepository;
	
	private static final Logger LOGGER  = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@RequestMapping("/showReg")
	public String showRegistrationPage() {
		LOGGER.info("Inside showRegistrationPage() ");
		return "login/registerUser";
	}
	
	@RequestMapping("/showLogin")
	public String showLoginPage() {
		LOGGER.info("Inside showLogin() ");
		return "login/login";
	}
	
	@RequestMapping(value= "/registerUser",method= RequestMethod.POST )
	public String register(@ModelAttribute("user") User user) {
		LOGGER.info("Inside register() "+ user);
		user.setPassword(encoder.encode(user.getPassword()));
		userRepository.save(user);
		return "login/login";
			
	}
	@RequestMapping(value="/login",method= RequestMethod.POST )
	public String login(@RequestParam("email")String email,@RequestParam("password")String password, ModelMap modelMap) {
		LOGGER.info("Inside login and email is:  "+ email);		
		User user = userRepository.findByEmail(email);
		if(user.getPassword().equals(password))
			return "findFlights";
		else
			modelMap.addAttribute("msg","Invalid user name or password. Please try again!");
		
		return "login/login";
	}
	
}
