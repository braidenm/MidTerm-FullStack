package com.itmakesavillage.bootproject.controllers;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itmakesavillage.bootproject.data.ProjectDAO;
import com.itmakesavillage.bootproject.data.ProjectVolunteerDAO;
import com.itmakesavillage.bootproject.data.VolunteerDAO;
import com.itmakesavillage.jpaproject.entities.Project;
import com.itmakesavillage.jpaproject.entities.ProjectVolunteer;
import com.itmakesavillage.jpaproject.entities.User;
import com.itmakesavillage.jpaproject.entities.Volunteer;

@Controller
public class ProjectController {
	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private VolunteerDAO volunteerDAO;
	@Autowired
	private ProjectVolunteerDAO pvDAO;
	
	@RequestMapping(path = "searchKW.do", method = RequestMethod.GET)
	public String searchKW(String keyword, Model model) {
		Set<Project> projectList = projectDAO.searchProject(keyword);
		model.addAttribute("projectList", projectList);
		
		return "index";
	}
	@RequestMapping(path = "searchCat.do", method = RequestMethod.GET)
	public String searchCat(String keyword, Model model) {
		Set<Project> projectList = projectDAO.searchProject(keyword);
		model.addAttribute("projectList", projectList);
		
		return "index";
	}
	
	@RequestMapping(path = "viewProject.do", method = RequestMethod.GET)
	public String goToViewProject(Integer projectId, Model model) {
		Project project = projectDAO.findProject(projectId);
		
		model.addAttribute("project", project);
		
		
		return "viewProject";
	}
	
	@RequestMapping(path = "createProject.do", method = RequestMethod.GET)
	public String goToCreateProject(HttpSession session) {
		
		if(session.getAttribute("user") == null) {
			return "login";
		}
		return "createProject";
	}
	
	@RequestMapping(path = "createProject.do", method = RequestMethod.POST)
	public String createProject(HttpSession session, Project project, RedirectAttributes redir) {
		
		if(session.getAttribute("user") == null) {
			return "login";
		}
		project = projectDAO.createProject(project);
		
		redir.addAttribute("projectId", project.getId());
		
		
		return "redirect:viewProject.do";
		
	}
	
	@RequestMapping(path = "joinProject.do", method = RequestMethod.POST)
	public String joinProject(HttpSession session, Project project, Integer hours, RedirectAttributes redir) {
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			return "login";
		}
		
		Volunteer volunteer = volunteerDAO.findVolunteer(user.getId());
		volunteer.addProject(project);
		volunteer = volunteerDAO.updateVolunteer(volunteer.getUserid(), volunteer);
		
		ProjectVolunteer pv = pvDAO.findPV(project.getId(), user.getId());
		pv.setHoursPledged(hours);
		pv = pvDAO.updatePV(pv);
		
		redir.addAttribute("projectId", project.getId());
		
		return "redirect:viewProject.do";
		
	}
	
	@RequestMapping(path = "editProject.do", method = RequestMethod.GET)
	public String goToEditProject(Integer projectId, HttpSession session, Model model) {
		
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			return "login";
		}
		
		Project project = projectDAO.findProject(projectId);
		model.addAttribute("project", project);
		
		return "editProject";
	}
	
	@RequestMapping(path = "editProject.do", method = RequestMethod.POST)
	public String editProject(HttpSession session, RedirectAttributes redir, Project project) {
		
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			return "login";
		}
		
		project = projectDAO.updateProject(project.getId(), project);
		
		redir.addAttribute("projectId", project.getId());
		return "redirect:viewProject.do";
	}
	
	@RequestMapping(path = "adminFindProject.do", method = RequestMethod.GET)
	public String adminFindProject(String keyword, HttpSession session, Model model) {
		
		Set<Project> projectList = projectDAO.searchProject(keyword);
		
		model.addAttribute("projectList", projectList);
		
		return "admin";
	}
	
	
	
	
}

