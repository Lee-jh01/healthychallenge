package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.CoComment;
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
}
