package exercise.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import common.controller.SuperClass;
import dao.ExerciseDao;

@Controller
public class ExerciseRecordController extends SuperClass {
	private final String command = "/exRecord.ex";
	private ModelAndView mav = null;
	private final String redirect = "redirect:/exRecord.ex";
	
	@Autowired
	@Qualifier("edao")
	private ExerciseDao edao;
	
	public ExerciseRecordController() {
		super("exRecord", "exRecord");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost() {
		return this.mav;
	}
}
