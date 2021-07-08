package meal.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MealDao;

@Controller
public class DailyMealController {
	
	@Autowired
	@Qualifier("fdao")
	private MealDao fdao;

	
	@GetMapping("/daily.ml")
	public ModelAndView doGet() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dailyMeal");
		return mav;
	}
	
	
}
