package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("cdao")
public class ChallengeDao {
	private final String namespace = "MapperChallenge" ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public ChallengeDao() {}
	
}
