package by.bsuir.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.bsuir.entity.Suggest;
import by.bsuir.service.Factory;

@Controller
@RequestMapping(value = { "/" }, method = RequestMethod.GET)
public class SuggestController {

	@RequestMapping(value = { "/suggest" }, method = RequestMethod.POST)
	public ModelAndView register(@RequestParam("who") String who,
			@RequestParam("book") String book) {

		ModelAndView modelAndView = new ModelAndView("info");
		try {
			Factory.getInstance().getSuggestDAO().add(new Suggest(who, book));
		} catch (SQLException e) {
			modelAndView.addObject("error",
					"Предложение книги не зарегистрировано.");
			return modelAndView;
		}
		modelAndView.addObject("success", "Предложение успешно внесено.");
		return modelAndView;
	}

	@RequestMapping(value = { "/suggest/show" }, method = RequestMethod.POST)
	public ModelAndView show() throws SQLException {

		ModelAndView modelAndView = new ModelAndView("suggest");

		modelAndView.addObject("suggests", Factory.getInstance().getSuggestDAO().getAll());

		return modelAndView;
	}
	
	@RequestMapping(value = { "/suggest/delete" }, method = RequestMethod.POST)
	public ModelAndView delete(@RequestParam("suggest") String suggest) throws SQLException{

		ModelAndView modelAndView = new ModelAndView("suggest");
		try {
			Factory.getInstance().getSuggestDAO().delete(Factory.getInstance().getSuggestDAO().getById(new Integer(suggest)));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			modelAndView.addObject("error", "Не удалось удалить предложение.");
			modelAndView.addObject("suggests", Factory.getInstance().getSuggestDAO().getAll());
			return modelAndView;
		}
		modelAndView.addObject("success", "Предложение удалено.");
		modelAndView.addObject("suggests", Factory.getInstance().getSuggestDAO().getAll());
		return modelAndView;
	}

}
