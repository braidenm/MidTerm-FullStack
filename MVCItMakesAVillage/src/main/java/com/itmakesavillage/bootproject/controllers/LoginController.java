package com.itmakesavillage.bootproject.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itmakesavillage.bootproject.data.UserDAO;
import com.itmakesavillage.jpaproject.entities.User;

@Controller
public class LoginController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path="login.do", method=RequestMethod.GET)
	public String goToLoginPage(HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user != null) {
			return "redirect:index.do";
		}
		return "login";		
	}
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public String userLogin(User user, HttpSession session, Model model) {
		System.out.println(user);
		user = userDAO.getUserByUserNameAndPassword(user.getUserName(), user.getPassword());
		boolean loginFail = false;
		boolean activeFail = false;
		
		if(user == null) {
			loginFail = true;
			model.addAttribute("loginFail", loginFail);
			return "login";
		}
		if(!user.isActive()) {
			activeFail=true;
			model.addAttribute("activeFail", activeFail);
			model.addAttribute("userId", user.getId());
			session.setAttribute("user", null);
			return "login";
		
		}
			session.setAttribute("user", user);
		
		return "redirect:home.do";
	}
	
	@RequestMapping(path="logout.do", method=RequestMethod.GET)
	public String userLogout(HttpSession session) {
		session.removeAttribute("user");
		return "index";
		
		
	}
	
	
	
	
//	goHome
//	home.do/()/GET/index.jsp
//
//	login
//	login.do/()/GET/Login.jsp
//
//	login
//	login.do(username-String password-String)/POST/Index.jsp
//
//	logout
//	logout.do/(user)/POST/index.jsp
	
	
	
	

}
