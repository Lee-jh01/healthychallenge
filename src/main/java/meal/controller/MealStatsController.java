package meal.controller;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import dao.MealDao;

@Controller
public class MealStatsController extends SuperClass {
	private final String command = "/mealStats.ml";
	private ModelAndView mav = null;
	private final String redirect = "redirect:/mealStats.ml";
	
	@Autowired
	@Qualifier("fdao")
	private MealDao fdao;
	
	public MealStatsController() {
		super("mealStats", "mealStats");
		this.mav = new ModelAndView();
	}
	
	
	@PostMapping(command)
	public ModelAndView doPost() {
		return this.mav;
	}
	
	@GetMapping(command)
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
		
		int year = Integer.parseInt(regdate.substring(0,4));
		int month = Integer.parseInt(regdate.substring(5,7));
		int day = Integer.parseInt(regdate.substring(8,10));
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
	
		Calendar cal = Calendar.getInstance(); 
		cal.set(year, month-1, day); 
		cal.add(Calendar.MONTH, -1); // 한달 전

	
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy/MM/dd"); 
		String beforeDate = dateFormatter.format(cal.getTime()); 
		System.out.println("beforeDate : "+beforeDate);
		System.out.println("regdate : "+regdate);
			
		
		List<Map<String, Object>> list = this.fdao.selectDate(email, regdate, beforeDate);
		
		System.out.println(" 리스트 사이즈  : " + list.size());
		System.out.println(" 리스트   : " + list);
		System.out.println(" 리스트 1번   : " + list.get(0).get("SUMDAY"));
		System.out.println(" 리스트 1번   : " + list.get(0).get("SUM"));
		
		String str2 ="[";
		str2 +="['날짜' , '칼로리'] ,";
		int num =0;
		for(Map<String, Object>  map : list){
			
			str2 +="['";
			str2  += (String)map.get("SUMDAY");
			str2 +="' , ";
			str2 += map.get("SUM");
			str2 +=" ]";
			
			num ++;
			if(num<list.size()){
				str2 +=",";
			}		
		}
		str2 += "]";
		this.mav.addObject("str2", str2);
		System.out.println("나오는지 확인:" +str2);
		return this.mav;

	}
	
	
}
