package by.bsuir.controller;

import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.bsuir.entity.User;
import by.bsuir.service.Factory;

@Controller

public class MainController {

	@RequestMapping(value = { "/" }, method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView defaultPage() throws SQLException {

		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		
		return model;

	}


	@RequestMapping(value = "/login", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Неверный логин или пароль");
		}
		
		if (logout != null) {
			model.addObject("msg", "Авторизация прошла успешно.");
		}
		model.setViewName("login");

		return model;

	}



}