package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("bcdao")
public class BoardCommentDao {
	private final String namespace = "MapperBoardComment" ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public BoardCommentDao() {}
}
