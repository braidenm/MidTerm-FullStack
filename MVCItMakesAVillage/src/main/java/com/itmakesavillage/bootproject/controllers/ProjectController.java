package com.itmakesavillage.bootproject.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itmakesavillage.bootproject.data.ProjectDAO;
import com.itmakesavillage.bootproject.data.UserDAO;
import com.itmakesavillage.bootproject.data.VolunteerDAO;
import com.itmakesavillage.jpaproject.entities.Project;

@Controller
public class ProjectController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private VolunteerDAO volunteerDAO;
	
	
	
	
	
}

