package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mdao")
public class MemberDao {
	private final String namespace = "MapperMember" ;	
	@Autowired
	SqlSessionTemplate abcd;
}
