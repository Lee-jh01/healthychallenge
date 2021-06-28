package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("fdao")
public class MealDao {
	private final String namespace = "MapperMeal" ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public MealDao() {}
	
}
