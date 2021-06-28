package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("qdao")
public class QnaDao {
	private final String namespace = "MapperQna" ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public QnaDao() {}
}
