package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.CoComment;

@Component("bcdao")
public class BoardCommentDao {
	private final String namespace = "MapperBoardComment." ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public BoardCommentDao() {}
	
	
	
}
