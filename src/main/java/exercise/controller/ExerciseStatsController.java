package exercise.controller;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.ExerciseMemory;
import common.controller.SuperClass;
import dao.ExerciseDao;

@Controller
@RequestMapping(value="exStats", method=RequestMethod.GET)
public class ExerciseStatsController extends SuperClass {
	private final String command = "/exStats.ex";
	private ModelAndView mav = null;
	private final String redirect = "redirect:/exStats.ex";
	
	@Autowired
	@Qualifier("edao")
	private ExerciseDao edao;
	
	public ExerciseStatsController() {
		super("exStats", "exStats");
		this.mav = new ModelAndView();
	}
	
	
	@PostMapping(command)
	public ModelAndView doPost() {
		return this.mav;
	}
	

	
	
	public ModelAndView json_get(){
			
		ModelAndView modelAndView=new ModelAndView();
		
		
		ArrayList<ExerciseMemory> list = new ArrayList<ExerciseMemory>();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("/exStats.ex");;
		
		System.out.println(" 리스트 사이즈  : " + list.size());
		
		String str ="[";
		str +="['상품명' , '가격'] ,";
		int num =0;
		for(ExerciseMemory lists : list){
			
			str +="['";
			str  += lists.getRegdate();
			str +="' , ";
			str += lists.getTotal_calorie();
			str +=" ]";
			
			num ++;
			if(num<list.size()){
				str +=",";
			}		
		}
		str += "]";
		modelAndView.addObject("str", str);
		return modelAndView;
				
	}
	
}	
	
	
	
	