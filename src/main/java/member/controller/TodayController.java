package member.controller;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Meal;
import bean.Member;
import common.controller.SuperClass;
import dao.ExerciseDao;
import dao.MealDao;
import dao.MemberDao;

@Controller
public class TodayController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@Autowired
	@Qualifier("fdao")
	private MealDao fdao;
	
	
	@Autowired
	@Qualifier("edao")
	private ExerciseDao edao;
	

	
	@GetMapping("/meToday.me")
	public ModelAndView doGet(@RequestParam(value="regdate", required=false) String regdate,
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
		System.out.println("regdate :" +regdate);
		System.out.println("email : " +email);
		
	
		
		double fcal = fdao.selectCalorie(email, regdate);
		System.out.println("fcal : "+fcal);
		double ecal = edao.selectCalorie(email, regdate);
		System.out.println("ecal : "+ecal);
		
		mav.addObject("fcal", fcal);
		mav.addObject("ecal", ecal);
		
		mav.setViewName("meToday");
			return mav;
			
		
	}
	
}
