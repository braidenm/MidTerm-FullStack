package com.itmakesavillage.bootproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itmakesavillage.bootproject.data.ProjectDAO;
import com.itmakesavillage.jpaproject.entities.Category;
import com.itmakesavillage.jpaproject.entities.User;

@Controller
public class NavController {
	
	@Autowired
	ProjectDAO pDAO;
	
	@RequestMapping(path = "home.do", method = RequestMethod.GET)
	public String goHome(HttpSession session) {
		
		List<Category> catList = pDAO.getAllCategories();
		session.setAttribute("catList", catList);
		
		return "index";
	}

	@RequestMapping(path = "account.do", method = RequestMethod.GET)
	public String account(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "index";
		}
		return "profile";
	}

	@RequestMapping(path = "admin.do", method = RequestMethod.GET)
	public String adminPage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (!user.getRole().equals("admin")) {
			return "index";
		}
		return "admin";
	}

}
