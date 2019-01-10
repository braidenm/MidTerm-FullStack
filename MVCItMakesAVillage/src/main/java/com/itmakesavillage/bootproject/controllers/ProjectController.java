package com.itmakesavillage.bootproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.itmakesavillage.bootproject.data.ProjectDAO;
import com.itmakesavillage.bootproject.data.UserDAO;
import com.itmakesavillage.bootproject.data.VolunteerDAO;

@Controller
public class ProjectController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private VolunteerDAO volunteerDAO;
}
