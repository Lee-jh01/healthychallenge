package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("ccdao")
public class ChallengeCommentDao {
	private final String namespace = "MapperChallengeComment" ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public ChallengeCommentDao() {}
}
