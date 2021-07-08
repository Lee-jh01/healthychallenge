package meal.controller;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MealDao;

@Controller
public class RecordController {
	


	@Autowired
	@Qualifier("fdao")
	private MealDao fdao;

	
	@GetMapping("/test.ml")
	public void test(
			HttpServletRequest request) {
		request.getParameterValues("string"); //일반적인 동기형태
		System.out.println("여기로 들어왔어요");
		String[] aStr = request.getParameterValues("string[]");
		for(String el : aStr) {
			System.out.println(el);
		}
		System.out.println("================================");
		String[] bStr = request.getParameterValues("string2[]");
		for(String el : bStr) {
			System.out.println(el);
		}
	}
	
	@GetMapping("/test2.ml")
	public void test2(
			HttpServletRequest request) {
		System.out.println(request);
		String data = request.getParameter("json");
		JSONParser json = new JSONParser();
		System.out.println(json);
		try {
			JSONObject jsonobj = (JSONObject)json.parse(data);
			System.out.println(jsonobj);
//			System.out.println(jsonobj.get("name"));
//			System.out.println(jsonobj.get("serving_wt"));
//			System.out.println(jsonobj.get("calorie"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
}
	
	

