package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Board;

@Component("bdao")
public class BoardDao {
	private final String namespace = "MapperBoard.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public BoardDao() {
		
	}
	
	public int SelectTotalCount(String mode, String keyword) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%") ;
		
		return this.abcd.selectOne(namespace + "SelectTotalCount", map);
		
	}
	
	public List<Board> SelectDataList(int offset, int limit, String mode, String keyword){
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("mode", mode) ;
		map.put("keyword", "%" + keyword + "%") ;	
		return this.abcd.selectList(namespace + "SelectDataList", map, rowBounds);
	}

	public int InsertData(Board bean) {
		// 넘겨진 Bean 데이터를 이용하여 추가합니다.
		System.out.println(this.getClass() + " InsertData 메소드");
		System.out.println(bean.toString());
		return this.abcd.insert(namespace + "InsertData", bean);
	}

	public Board SelectDataByPk(int no) {
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
	
	public int Scrap(String user_no, String prod_no) {
		return this.abcd.insert(namespace + "Scrap", prod_no);
	}
	

	public int UpdateData(Board bean) {
		// 해당 게시물을 수정합니다.   
				System.out.println(bean.toString());
				return this.abcd.update(namespace + "UpdateData", bean);
			}	

}
