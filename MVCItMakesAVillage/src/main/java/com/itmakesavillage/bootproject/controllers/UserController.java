package com.itmakesavillage.bootproject.controllers;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itmakesavillage.bootproject.data.ProjectDAO;
import com.itmakesavillage.bootproject.data.ProjectVolunteerDAO;
import com.itmakesavillage.bootproject.data.UserDAO;
import com.itmakesavillage.bootproject.data.VolunteerDAO;
import com.itmakesavillage.jpaproject.entities.Project;
import com.itmakesavillage.jpaproject.entities.ProjectVolunteer;
import com.itmakesavillage.jpaproject.entities.User;
import com.itmakesavillage.jpaproject.entities.Volunteer;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private VolunteerDAO volunteerDAO;
	@Autowired
	private ProjectVolunteerDAO pvDAO;

	@RequestMapping(path = "removeVolunteer.do", method = RequestMethod.POST)
	public String removeVolunteer(Integer userId, Project project) {
		User user = userDAO.findUser(userId);
		user.getVolunteer().removeProject(project);
		user = userDAO.updateUser(user.getId(), user);
		return "redirect:viewProject.do";
	}

	@RequestMapping(path = "addVolunteer", method = RequestMethod.POST)
	public String addVolunteer(Integer userId, Project project) {
		User user = userDAO.findUser(userId);
		user.getVolunteer().addProject(project);
		user = userDAO.updateUser(user.getId(), user);
		return "redirect:viewProject.do";
	}

	@RequestMapping(path = "submitHours", method = RequestMethod.POST)
	public String submitHours(Integer userId, int hours, Project project) {
		ProjectVolunteer pv = pvDAO.findPV(project.getId(), userId);
		pv.setHoursActual(hours);
		pv = pvDAO.updatePV(pv);
		return "redirect:viewProject";
	}

	@RequestMapping(path = "createProfile.do", method = RequestMethod.POST)
	public String createProfile(Volunteer volunteer, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			volunteer.setUserid(user.getId());
			volunteer.setUser(user);
			volunteer = volunteerDAO.createVolunteer(volunteer);
		}
		return "profile";
	}

	@RequestMapping(path = "createAcount.do", method = RequestMethod.GET)
	public String goToCreateAccount() {

		return "createAccount";
	}
	
	@RequestMapping(path = "createProfile.do", method = RequestMethod.GET)
	public String goToCreateProfile() {
		
		return "createProfile";
	}

	@RequestMapping(path = "editProfile.do", method = RequestMethod.GET)
	public String goToEditProfile(HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "index";
		}
		return "editProfile";
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String createAccount( HttpSession session, User user) {
		user =	userDAO.createUser(user);
		session.setAttribute("user", user);
		return "redirect:createProfile.do";
	}
	
	@RequestMapping(path = "adminFindUser.do", method = RequestMethod.GET)
	public String adminFindUser(HttpSession session, Model model, String keyword) {
		Set<Volunteer> volunteerList = volunteerDAO.searchVolunteer(keyword);
		Set<User> userList = userDAO.searchUser(keyword);
		for (Volunteer volunteer : volunteerList) {
			userList.add(volunteer.getUser());
		}
		boolean notFound = false;
		if(userList.isEmpty()) {
			notFound = true;
			model.addAttribute("notFound", notFound);
			return "admin";
		}
		session.setAttribute("userList", userList);
		return "admin";
	}
	
	
	@RequestMapping(path = "editProfile.do", method = RequestMethod.POST)
	public String editProfile(Volunteer volunteer) {
		volunteerDAO.updateVolunteer(volunteer.getUserid(), volunteer);
		return "redirect:account.do";
	}


//	editProfile
//	editProfile.do/(volunteer)/POST/profile.jsp
}
