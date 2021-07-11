package meal.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.Meal;
import bean.MealMemory;
import bean.Member;
import dao.MealDao;

@Controller
public class DailyMealController {
	
	@Autowired
	@Qualifier("fdao")
	private MealDao fdao;

	@ModelAttribute("meal")
	public Meal meal() {
		System.out.println("@ModelAttribute(\"meal\")");
		return new Meal();
	}
	
	@GetMapping("/daily.ml")
	public ModelAndView doGet(
			@RequestParam(value = "regdate", required=false) String regdate,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("전 : " + regdate);
		if ( regdate == null || regdate.equals("null") || regdate.equals("") ) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy/MM/dd");
			Date currentTime = new Date ();
			regdate = simpleDateFormat.format ( currentTime );
		}
		if (regdate.length() > 12) {
	        regdate = regdate.substring(0,10);
	        regdate = regdate.replace("-","/");
		}
		System.out.println("후 : "+regdate);
		
		HttpSession session = request.getSession();
		Member loginfo = (Member)session.getAttribute("loginfo");
		String email = loginfo.getEmail();
		
		Meal breakfast = fdao.selectTimeData(email, "아침", regdate);
		Meal lunch = fdao.selectTimeData(email, "점심", regdate);
		Meal dinner = fdao.selectTimeData(email, "저녁", regdate);
		Meal refreshments = fdao.selectTimeData(email, "간식", regdate);
		
		mav.addObject("breakfast", breakfast);
		mav.addObject("lunch", lunch);
		mav.addObject("dinner", dinner);
		mav.addObject("refreshments", refreshments);
		mav.addObject("regdate", regdate);
		
		mav.setViewName("dailyMeal");
		return mav;
	}
	
	@GetMapping("/dailyAddData.ml")
	public ModelAndView dailyAddData(
			@ModelAttribute("meal") Meal meal) {
		System.out.println(meal);
		ModelAndView mav = new ModelAndView();
		
		Meal bean = fdao.selectTimeData(meal.getEmail(), meal.getTime(), meal.getRegdate());
		if(bean == null) {
			int cnt = fdao.insertTimeData(meal);
			System.out.println("성공 여부"+cnt);
			
			System.out.println("meal_seq : "+meal.getMeal_seq());
			mav.addObject("meal_seq", meal.getMeal_seq());
		}else {
			// 새로 고침시 데이터가 추가 되는 것을 방지.
			mav.addObject("meal_seq", bean.getMeal_seq());
		}
		mav.setViewName("mealWrite");
		return mav;
	}
	
	@GetMapping("/dailyUpdateData.ml")
	public ModelAndView dailyUpdateData(
			@RequestParam("meal_seq") int meal_seq) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("meal_seq",meal_seq);
		mav.setViewName("mealWrite");
		
		return mav;
	}
	
	@RequestMapping(value="/mealMemoryList.ml", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView MemoryList(
			@RequestParam("meal_seq") int meal_seq){
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<MealMemory> mlist = fdao.selectMealMemoryList(meal_seq);
		
		if(mlist != null) {
			mav.addObject("mlist", mlist);

		}
		
		return mav;
	}
	
	
	@RequestMapping(value = "/updateMyMeal.ml", method = RequestMethod.POST)
	@ResponseBody
	public String jsonTest(
			@RequestBody String table,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		System.out.println(table.toString());
		System.out.println(table);
		
		JSONParser parser = new JSONParser();
		System.out.println(parser);
		
		JSONObject jsonObject = (JSONObject)parser.parse(table);
		JSONArray jsonArray = (JSONArray)jsonObject.get("row");
//		System.out.println(jsonArray);
		
		int meal_seq = Integer.parseInt((String)jsonObject.get("meal_seq"));
//		System.out.println(meal_seq);
		int cnt = 0;
		cnt = fdao.deleteMealMemory(meal_seq);
		System.out.println("결과 :"+cnt);
		
		for(int i=0; i<jsonArray.size(); i++) {
			JSONObject jo = (JSONObject)jsonArray.get(i);
			System.out.println(jo);
			
			MealMemory bean = new MealMemory();
			bean.setMeal_seq(meal_seq);
			bean.setFood_name((String)jo.get("food_name"));
			bean.setHow(Double.parseDouble((String)jo.get("how")));
			bean.setServing_wt(Integer.parseInt((String)jo.get("serving_wt")));
			bean.setCalorie(Double.parseDouble((String)jo.get("calorie")));
			bean.setCarbohydrate(Double.parseDouble((String)jo.get("carbohydrate")));
			bean.setProtein(Double.parseDouble((String)jo.get("protein")));
			bean.setFat(Double.parseDouble( (((String)jo.get("fat")).equals("N/A") || ((String)jo.get("fat")).equals("TRACE"))? "0" : (String)jo.get("fat") ));
			bean.setNa(Double.parseDouble((String)jo.get("Na")));
		
			cnt = fdao.insertMealMemory(bean);

			System.out.println("insert 결과 : "+cnt);
		}
		
		System.out.println("================================insert 완료");
		cnt = fdao.updateTotalCalorie(meal_seq);
		System.out.println("update 결과 : "+cnt);
		System.out.println("================================update 완료");
		
		//날짜 가져오기 (그 날짜 페이지로 이동)
		Meal meal = fdao.selectMealByPK(meal_seq);
		
		return meal.getRegdate();
	}
	
	
}
