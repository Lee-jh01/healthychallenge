package dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import bean.Board;
import bean.CoComment;
import utility.FlowParameters;

@Component("bcdao")
public class BoardCommentDao {
	private final String namespace = "MapperBoardComment." ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public BoardCommentDao() {}
	

	public List<CoComment> readComment(int co_seq){
		return abcd.selectList(namespace + "readComment", co_seq);
	}


	public int insertComment(CoComment bean) {
		System.out.println("insertComment DAO");
		System.out.println(bean);
		
		return abcd.insert(namespace + "insertComment", bean);
	}


	public int selectTotalCount(int co_seq) {
		return abcd.selectOne(namespace + "selectTotalCount", co_seq);
	}

	
	public List<Board> SelectDataList(int offset, int limit, String category, String keyword){
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("category", category) ;
		
		if ( keyword == null || keyword.equals("null") || keyword.equals("")) {
			keyword = "all";
			map.put("keyword", keyword);
		}else {
			map.put("keyword", "%" + keyword + "%") ;	
		}
		
		return this.abcd.selectList(namespace + "SelectDataList", map, rowBounds);
	}
	
	

	public List<CoComment> selectDataList(int offset, int limit, int co_seq) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return abcd.selectList(namespace+ "selectDataList", co_seq, rowBounds);
	}


	public int deleteComment(String b_cnum) {
		return this.abcd.delete(namespace + "deleteComment", b_cnum);
	}


	public CoComment selectByPK(int b_cnum) {
		return this.abcd.selectOne(namespace + "selectByPK" , b_cnum);
	}


	public int updateComment(String b_cnum, String content) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("b_cnum", b_cnum);
		map.put("content", content);
		
		return this.abcd.update(namespace + "updateComment",map);
	}

}
