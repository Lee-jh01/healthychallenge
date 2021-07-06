package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Board;
import bean.CoComment;

@Component("bcdao")
public class BoardCommentDao {
	private final String namespace = "MapperBoardComment." ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public BoardCommentDao() {}
	
	public List<CoComment> readComment(int co_seq){
		return abcd.selectList(namespace + "readComment", co_seq);
	}
	
}
