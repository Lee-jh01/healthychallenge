package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Meal;
import bean.MyFood;

@Component("fdao")
public class MealDao {
	private final String namespace = "MapperMeal." ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public MealDao() {}
	
	

	public List<MyFood> selectDataStarList(String email) {
		
		return this.abcd.selectList(namespace+"selectDataStarList",email);
	}

	public int deleteStarData(String el) {
		int num = Integer.parseInt(el);
		return this.abcd.delete(namespace+"deleteStarData",num);
		
	}

	public int addStarData(MyFood myfood) {
		System.out.println("DAO-bean" + myfood);
		return this.abcd.insert(namespace + "addStarData", myfood);
	}

	public int insertMyFood(MyFood bean) {
		return this.abcd.insert(namespace+"insertMyFood",bean);
	}

	public List<Map<String, Object>> selectDate(String email, String regdate, String beforeDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("regdate", regdate);
		map.put("beforeDate", beforeDate);
		
		return this.abcd.selectList(namespace + "SelectDate", map);
	}



	public double selectCalorie(String email, String regdate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("regdate", regdate);
		return this.abcd.selectOne(namespace+"selectCalorie", map);
	}

}
