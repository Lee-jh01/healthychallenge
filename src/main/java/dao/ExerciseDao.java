package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("edao")
public class ExerciseDao {
	private final String namespace = "MapperExercise" ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public ExerciseDao() {}
	
}
