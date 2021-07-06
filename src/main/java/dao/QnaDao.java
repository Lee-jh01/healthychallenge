package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Board;
import bean.Qna;

@Component("qdao")
public class QnaDao {
	private final String namespace = "MapperQna." ;	
	@Autowired
	SqlSessionTemplate abcd;
	
	public QnaDao() {}
	
	public int SelectTotalCount(String category,String keyword) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("category", category);
		
		if ( keyword == null || keyword.equals("null") || keyword.equals("")) {
			keyword = "all";
			map.put("keyword", keyword);
		}else {
			map.put("keyword", "%" + keyword + "%") ;	
		}
		
		return this.abcd.selectOne(namespace + "SelectTotalCount", map);
		
	}
	
	public List<Qna> SelectDataList(int offset, int limit, String category,String keyword){
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, String> map = new HashMap<String, String>() ;
		
		if ( keyword == null || keyword.equals("null") || keyword.equals("")) {
			keyword = "all";
			map.put("keyword", keyword);
		}else {
			map.put("keyword", "%" + keyword + "%") ;	
		}
		
		return this.abcd.selectList(namespace + "SelectDataList", map, rowBounds);
	}

	public int InsertData(Qna bean) {
		// 넘겨진 Bean 데이터를 이용하여 추가합니다.
		System.out.println(this.getClass() + " InsertData 메소드");
		System.out.println(bean.toString());
		return this.abcd.insert(namespace + "InsertData", bean);
	}

	public Qna SelectDataByPk(int no) {
		// 해당 게시물 번호의 bean객체 구하기 
		return this.abcd.selectOne(namespace+ "SelectDataByPk", no);
	}


	public int UpdateReadhit(int no) {
		// 조회수 +1 
		return this.abcd.insert(namespace+ "UpdateReadhit", no);
		
	}

	public int DeleteData(int no) {
		return this.abcd.delete(namespace + "DeleteData", no);
	}
	

	public int UpdateData(Qna bean) {
		// 해당 게시물을 수정합니다.   
				System.out.println(bean.toString());
				return this.abcd.update(namespace + "UpdateData", bean);
			}

	public int ReplyData(Qna bean) {
//		-- 다음 문장으로 업데이트를 수행한다.
//		-- update sample set orderno = orderno + 1 where groupno = 부모의groupno and orderno > 부모의orderno ; 
		int groupno = bean.getGroupno() ;
		int orderno = bean.getOrderno() ;
		
		int cnt = -99999 ;
		
		Map<String, Integer> map = new HashMap<String, Integer>() ;
		map.put("groupno", groupno) ;
		map.put("orderno", orderno) ;
		cnt = this.abcd.update(namespace + "ReplyDataUpdate", map);
		
//		-- 다음의 값으로 인서트한다.
//		-- num : 시퀀스.nextval, groupno : 부모의groupno사용, orderno은 1증가, depth는 1증가 시켜서 인서트한다.
		bean.setOrderno(bean.getOrderno() + 1 );
		bean.setDepth(bean.getDepth() + 1);		

		return this.abcd.insert(namespace + "ReplyDataInsert", bean);
	}
	
	
	
	
}
