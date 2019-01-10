package com.itmakesavillage.bootproject.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itmakesavillage.bootproject.data.ProjectDAO;
import com.itmakesavillage.bootproject.data.UserDAO;
import com.itmakesavillage.bootproject.data.VolunteerDAO;
import com.itmakesavillage.jpaproject.entities.User;

@Controller
public class NavController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private VolunteerDAO volunteerDAO;
	
	
	@RequestMapping(path="home.do", method=RequestMethod.GET)
	public String goHome() {
		return "index";
	}
	
	@RequestMapping(path="account.do", method=RequestMethod.GET)
	public String account(HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "index";
		}
		return "profile";
	}
	
	

}
