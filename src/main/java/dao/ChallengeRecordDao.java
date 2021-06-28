package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("crdao")
public class ChallengeRecordDao {
	private final String namespace = "MapperChallengeRecord" ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public ChallengeRecordDao() {}
}
