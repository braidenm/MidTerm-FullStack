package com.itmakesavillage.bootproject.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	private VolunteerDAO volunteerDAO;
	@Autowired
	private ProjectVolunteerDAO pvDAO;

	@RequestMapping(path = "removeVolunteer.do", method = RequestMethod.POST)
	public String removeVolunteer(Integer userId, Project project, HttpSession session) {
		User user = userDAO.findUser(userId);
		user.getVolunteer().removeProject(project);
		user = userDAO.updateUser(user.getId(), user);
		session.setAttribute("user", user);
		return "redirect:viewProject.do";
	}

	@RequestMapping(path = "addVolunteer", method = RequestMethod.POST)
	public String addVolunteer(Integer userId, Project project, HttpSession session) {
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

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String createAccount( HttpSession session, User user) {
		user.setActive(true);
		user =	userDAO.createUser(user);
		session.setAttribute("user", user);
		System.out.println(user);
		return "redirect:createProfile.do";
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.GET)
	public String goToCreateAccount() {

		return "createAccount";
	}
	@RequestMapping(path = "editAccount.do", method = RequestMethod.POST)
	public String editAccount(HttpSession session, User user) {
		System.out.println(user);
		
		user = userDAO.updateUser(user.getId(), user);
		session.setAttribute("user", user);
		
		return "redirect:account.do";
	}
	@RequestMapping(path = "createProfile.do", method = RequestMethod.POST)
	public String createProfile(Volunteer volunteer, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			volunteer.setUser(user);
			volunteer = volunteerDAO.createVolunteer(volunteer);
			user = userDAO.findUser(volunteer.getUserid());
			session.setAttribute("user", user);
		}
		return "redirect:account.do";
	}
	
	@RequestMapping(path = "createProfile.do", method = RequestMethod.GET)
	public String goToCreateProfile() {
		
		return "createProfile";
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
	
	@RequestMapping(path = "adminEditProfile.do", method = RequestMethod.GET)
	public String adminEditProfile(HttpSession session, Model model, int id) {
		User admin = (User) session.getAttribute("user");
		if (!admin.getRole().equals("admin")) {
			return "index";
		}
		User user = userDAO.findUser(id);
		model.addAttribute(user);
		return "adminEditProfile";
	}
	
	@RequestMapping(path = "adminEditProfile.do", method = RequestMethod.POST)
	public String adminEditProfile(@RequestParam(name="dob") String[] dob, HttpSession session, Model model, User user, Volunteer volunteer) {
		System.out.println(user);
		volunteer.setDob(dob[0]);
		Volunteer vol = volunteerDAO.updateVolunteer(volunteer.getUserid(), volunteer);
		user.setVolunteer(vol);
		userDAO.updateUser(user.getId(), user);
		model.addAttribute("user", user);
		return "adminEditProfile";
	}
	
	
	@RequestMapping(path = "editProfile.do", method = RequestMethod.POST)
	public String editProfile(@RequestParam(name="date") String[] dob, Volunteer volunteer, HttpSession session) {
		System.out.println(dob[0]);
		User user = (User)session.getAttribute("user");
		System.out.println(volunteer);
		volunteer.setDob(dob[0]);
		volunteer = volunteerDAO.updateVolunteer(volunteer.getUserid(), volunteer);
		user = userDAO.findUser(user.getId());
		session.setAttribute("user", user);
		System.out.println(user);
		return "redirect:account.do";
	}
	
	@RequestMapping(path = "editProfile.do", method = RequestMethod.GET)
	public String goToEditProfile(HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "index";
		}
		return "editProfile";
	}
	
	@RequestMapping(path = "reactivate.do", method = RequestMethod.POST)
	public String reactivateAccount(Integer id, HttpSession session) {
		User user = userDAO.findUser(id);
		user.setActive(true);
		user = userDAO.updateUser(id, user);
		session.setAttribute("user", user);
		return"redirect:account.do";
	}
	@RequestMapping(path = "deactivate.do", method = RequestMethod.POST)
	public String deactivateAccount(Integer id, HttpSession session) {
		User user = userDAO.findUser(id);
		user.setActive(false);
		user = userDAO.updateUser(id, user);
		user=null;
		session.setAttribute("user", user);
		return"redirect:home.do";
	}
	


//	editProfile
//	editProfile.do/(volunteer)/POST/profile.jsp
}
