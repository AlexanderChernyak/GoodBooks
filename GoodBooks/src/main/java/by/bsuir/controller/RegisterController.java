package by.bsuir.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.bsuir.entity.User;
import by.bsuir.entity.UserRole;
import by.bsuir.service.Factory;
import by.bsuir.service.Validator;

@Controller
@RequestMapping(value = { "/" }, method = RequestMethod.GET)
public class RegisterController {

	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public ModelAndView register() {

		ModelAndView modelAndView = new ModelAndView("registration");

		return modelAndView;

	}

	@RequestMapping(value = { "/registration" }, method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView registration(@RequestParam("name") String name,
			@RequestParam("surname") String surname,
			@RequestParam("middlename") String middlename,
			@RequestParam("birthday") String birthday,
			@RequestParam("username") String username,
			@RequestParam("password") String password)  {

		ModelAndView modelAndView = new ModelAndView("registration");
		
		if(!Validator.isNumberInString(name)||!Validator.isNumberInString(surname)||!Validator.isNumberInString(middlename)){
			modelAndView.addObject("error", "В инициалах не должно содержаться посторонних символов!");
			return modelAndView;
		}

		User user;
		try {
			user = (new User(name, surname, middlename, new SimpleDateFormat(
					"yyyy-MM-dd").parse(birthday), username,
					new BCryptPasswordEncoder().encode(password), true));
		} catch (ParseException e) {
			modelAndView.addObject("error", "Не верный формат даты!");
			return modelAndView;
		}

		try {
			Factory.getInstance().getUserDAO().add(user);
		} catch (SQLException e ) {
			modelAndView.addObject("error", "Не удалось добавить пользователя,скорее всего данный логин существет!");
			return modelAndView;
		}

		try {
			Factory.getInstance().getUserRoleDAO()
					.add(new UserRole(user, "ROLE_USER"));
		} catch (SQLException e) {			
			modelAndView.addObject("error", "Не удалось добавить пользователя.!");
			return modelAndView;
		}
		modelAndView.addObject("success", "Регистрация прошла успешно!");
		return modelAndView;

	}

}
