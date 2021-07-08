package meal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.MyFood;
import dao.MealDao;


@Controller
public class MyFoodController {

	@Autowired
	@Qualifier("fdao")
	private MealDao fdao;
	
	@ModelAttribute("myfood")
	public MyFood myfood() {
		System.out.println("@ModelAttribute(\"myfood\")");
		return new MyFood();
	}
	
	
	
	@RequestMapping(value="/getStar.ml",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView doGet(
			@RequestParam("email") String email) {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println("email : "+email);
		List<MyFood> list = fdao.selectDataStarList(email);
		System.out.println(list);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/deleteStar.ml",method=RequestMethod.POST)
	@ResponseBody
	public void deleteStar(
			HttpServletRequest request) {
		request.getParameterValues("arr"); //일반적인 동기형태
		System.out.println("여기로 들어왔어요");
		String[] aStr = request.getParameterValues("arr[]");
		int cnt = 0;
		for(String el : aStr) {
			cnt = fdao.deleteStarData(el);
			System.out.println(cnt);
		}
		
	}
	
	@RequestMapping(value = "/addStar.ml", method = RequestMethod.POST)
	@ResponseBody
	public void addStar( 
			@ModelAttribute("myfood") MyFood myfood) {
		System.out.println(myfood);
		int cnt = fdao.addStarData(myfood);
		System.out.println(cnt);
	}
	
	@RequestMapping(value = "/pushMyFood.ml", method = RequestMethod.POST)
	@ResponseBody
	public void jsonTest(
			@RequestBody String table,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
//		System.out.println(table.toString());
//		System.out.println(table.get("row"));
		System.out.println(table);
		
		JSONParser parser = new JSONParser();
		//System.out.println(parser);
		
//		Object object = (JSONObject)parser.parse(table);
//		System.out.println(object);
//		if (object instanceof JSONArray) {
//			JSONArray jsonArray = (JSONArray)object;
//			// jsonArray 클래스를 이용한 처리
//			System.out.println("array");
//		}else if (object instanceof JSONObject) {
//			JSONObject jsonObject = (JSONObject)object;
//			System.out.println("object");
//			// jsonObject 클래스를 이용한 처리
//		}else {
//			// 다른 타입
//		}
		
		JSONObject jsonObject = (JSONObject)parser.parse(table);
		System.out.println(jsonObject.get("row"));
		JSONArray jsonArray = (JSONArray)jsonObject.get("row");
		System.out.println(jsonArray);
		
		String email = (String)jsonObject.get("email");
		int cnt = 0;
		for(int i=0; i<jsonArray.size(); i++) {
			JSONObject jo = (JSONObject)jsonArray.get(i);
			System.out.println(jo);
			
			MyFood bean = new MyFood();
			bean.setEmail(email);
			bean.setFood_name((String)jo.get("food_name"));
			bean.setServing_wt(Integer.parseInt((String)jo.get("serving_wt")));
			bean.setCalorie(Double.parseDouble((String)jo.get("calorie")));
			bean.setCarbohydrate(Double.parseDouble((String)jo.get("carbohydrate")));
			bean.setProtein(Double.parseDouble((String)jo.get("protein")));
			bean.setFat(Double.parseDouble( (((String)jo.get("fat")).equals("N/A") || ((String)jo.get("fat")).equals("TRACE"))? "0" : (String)jo.get("fat") ));
			bean.setNa(Double.parseDouble((String)jo.get("Na")));
			
			cnt = fdao.insertMyFood(bean);
			System.out.println("DAO 결과 : "+cnt);
		}
	}
	
	
	
}
