package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Member;

@Component("mdao")
public class MemberDao {
	private final String namespace = "MapperMember." ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public MemberDao() {
	}
	
	public Member SelectData(String email, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", password);
		return this.abcd.selectOne(namespace + "SelectData", map);
	}
	
	public int emailCheck(String email) {
		return this.abcd.selectOne(namespace + "emailCheck",email);
	}
	
	public Member SelectDataByPk(String email) {
		// 아이디 정보를 이용하여 회원을 찾아 줍니다.
		return this.abcd.selectOne(namespace + "SelectDataByPk", email);
	}

	public void insertData(Member member) {
		this.abcd.insert(namespace + "insertData", member);
	}

	public int GetKey(String email, String key) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("key", key);
		return this.abcd.update(namespace + "GetKey", map);
	}
	
	public int AlterStatus(String email, String key) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("key", key);
		return this.abcd.update(namespace + "AlterStatus", map);
	}

	public String StatusCheck(String email) {
		return this.abcd.selectOne(namespace + "StatusCheck", email);
	}

	public String searchEmail(String name, String birth) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("birth", birth);
		return this.abcd.selectOne(namespace+"searchEmail",map);
	}
	
	// 회원 임시 비밀번호 변경 메서드
	public int searchPassword(String email, String birth, String key) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("birth", birth);
		map.put("key", key);
		return this.abcd.update(namespace+"searchPassword",map);
	}

	public int updateStatus(double height, double weight, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("height", height);
		map.put("weight", weight);
		map.put("email", email);
		return this.abcd.update(namespace+"updateStatus",map);
	}

	public int updateMember(Member member) {
		return this.abcd.update(namespace+"updateMember",member);
	}

	public int deleteMember(String email) {
		return this.abcd.delete(namespace+"deleteMember",email);
	}

	public Member passwordCheck(String email, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email",email);
		map.put("password", password);
		return this.abcd.selectOne(namespace+"passwordCheck",map);
	}

}