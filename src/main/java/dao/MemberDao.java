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
		// TODO Auto-generated constructor stub
	}
	
	public Member SelectData(String email, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", password);
		System.out.println("DAO!!");
		return this.abcd.selectOne(namespace + "SelectData", map);
	}
	
	public Member SelectDataByPk(String email) {
		// 아이디 정보를 이용하여 회원을 찾아 줍니다.
		return this.abcd.selectOne(namespace + "SelectDataByPk", email);
	}
}
