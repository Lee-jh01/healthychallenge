package exercise.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.Exercise;
import bean.ExerciseJoin;
import bean.ExerciseMemory;
import bean.ExerciseRelation;
import bean.Member;
import dao.ExerciseDao;

@Controller
public class ExerciseRecordController{

	@Autowired
	@Qualifier("edao")
	private ExerciseDao edao;
	
	@ModelAttribute("exr")
	public ExerciseRelation exr() {
		return new ExerciseRelation();
	}

	@GetMapping("/exRecord.ex")
	public ModelAndView doGet(
			@RequestParam(value="regdate", required=false) String regdate,
			HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Member loginfo = (Member)session.getAttribute("loginfo");
		String email = loginfo.getEmail();
		
		if ( regdate == null || regdate.equals("null") || regdate.equals("") ) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy/MM/dd");
			Date currentTime = new Date ();
			regdate = simpleDateFormat.format ( currentTime );
		}
		if (regdate.length() > 12) {
	        regdate = regdate.substring(0,10);
	        regdate = regdate.replace("-","/");
		}
		
		ExerciseMemory ex = edao.selectTimeData(email,regdate);
		if(ex == null) {
			ExerciseMemory exm = new ExerciseMemory();
			exm.setEmail(email);
			exm.setRegdate(regdate);
			int cnt = edao.insertExMemory(exm);
			System.out.println("insert ?????? : "+cnt);
			
			System.out.println(exm);
			mav.addObject("em_seq",exm.getEm_seq());
		}else {
			mav.addObject("em_seq",ex.getEm_seq());
		}
		mav.addObject("regdate",regdate);
		List<Exercise> elist = edao.selectExList();
		mav.addObject("elist",elist);
		
		mav.setViewName("exRecord");
		
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="/exrAdd.ex", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addExercise(
			@ModelAttribute("exr") ExerciseRelation exr
			,@RequestParam("calorie") String calorie){
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(exr);
		calorie = calorie.substring(0, calorie.length()-4);
		Double total_calorie = Double.parseDouble(calorie);
		System.out.println("total_calorie : "+total_calorie);
		
		//exercise_relation ????????? ????????????
			int cnt = edao.insertRelation(exr);
			System.out.println("insert ?????? : "+cnt);
		//exercise_memory ????????? toatl_calorie +??????	
			cnt = edao.plusCalorie(exr.getEm_seq(),total_calorie);
			System.out.println("plusUpdate ??????" + cnt);
		return mav;
	}
	
	@RequestMapping(value="/exJoinList.ex", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView exJoinList(
			@RequestParam("em_seq") int em_seq){
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<ExerciseJoin> jlist = edao.exJoinList(em_seq);
		System.out.println(jlist);
		mav.addObject("jlist", jlist);
		return mav;
	}
	
	@RequestMapping(value="/erDelete.ex", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView erDelete(
			@RequestParam("em_seq") int em_seq,
			@RequestParam("ex_seq") int ex_seq,
			@RequestParam("calorie") double calorie){
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println("em_seq :"+em_seq);
		System.out.println("em_seq :"+ex_seq);
		System.out.println("calorie :"+calorie);
		// er ??????????????? ??????
		int cnt = edao.deleteEr(em_seq, ex_seq);
		System.out.println("delete ?????? :"+cnt);
		// exercise_memory ????????? total_calorie -??????
		cnt = edao.minusCalorie(em_seq, calorie);
		System.out.println("update ?????? :"+cnt);

		return mav;
	}
	
	
	
	
	
		
}