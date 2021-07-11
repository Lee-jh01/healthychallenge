package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Exercise;
import bean.ExerciseMemory;

@Component("edao")
public class ExerciseDao {
	private final String namespace = "MapperExercise." ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public ExerciseDao() {}

	public List<ExerciseMemory> SelectDate(String email, String regdate, String beforeDate){
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("regdate", regdate);
		map.put("beforeDate", beforeDate);
		return this.abcd.selectList(namespace + "SelectDate", map);
	}

	public ExerciseMemory selectTimeData(String email, String regdate) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("regdate", regdate);
		return this.abcd.selectOne(namespace + "selectTimeData",map);
	}

	public int insertExMemory(ExerciseMemory exm) {
		return this.abcd.insert(namespace+"insertExMemory",exm);
	}

	public List<Exercise> selectExList() {
		return this.abcd.selectList(namespace+"selectExList");
	}

	public double selectCalorie(String email, String regdate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("regdate", regdate);
		return this.abcd.selectOne(namespace + "selectCalorie", map);
	}
	
}
