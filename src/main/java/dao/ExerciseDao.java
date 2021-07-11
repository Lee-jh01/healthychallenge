package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Exercise;
import bean.ExerciseJoin;
import bean.ExerciseMemory;
import bean.ExerciseRelation;

@Component("edao")
public class ExerciseDao {
	private final String namespace = "MapperExercise." ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public ExerciseDao() {}

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

	public int insertRelation(ExerciseRelation exr) {
		
		return this.abcd.insert(namespace+"insertRelation",exr);
	}

	public int plusCalorie(int em_seq, Double total_calorie) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("em_seq", em_seq);
		map.put("total_calorie", total_calorie);
		System.out.println("DAO "+total_calorie);
		return this.abcd.update(namespace+"plusCalorie",map);
	}

	public List<ExerciseJoin> exJoinList(int em_seq) {
		
		return this.abcd.selectList(namespace+"exJoinList",em_seq);
	}

	public int deleteEr(int em_seq, int ex_seq) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("em_seq", em_seq);
		map.put("ex_seq", ex_seq);
		return this.abcd.delete(namespace+"deleteEr",map);
	}

	public int minusCalorie(int em_seq, double calorie) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("em_seq", em_seq);
		map.put("calorie", calorie);
		return this.abcd.update(namespace+"minusCalorie",map);
	}

}
