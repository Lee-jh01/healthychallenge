package common.utility;

public class CommentPaging {
	// 페이징 처리 관련 변수들
	private int totalCount = 0; // 총 레코드 건수
	private int totalPage = 0; // 전체 페이지 수
	
	private int pageNumber = 0; // 보여줄 페이지 넘버(표현 가능한 페이지는 1부터 totalPage까지 이다.)
	private int pageSize = 5; // 한 페이지에 보여줄 건수
	private int beginRow = 0; // 현재 페이지의 시작 행
	private int endRow = 0; // 현재 페이지의 끝 행
	
	private int pageCount = 5; // 보여줄 페이지 링크 수
	private int beginPage = 0; // 페이징 처리 시작 페이지 번호
	private int endPage = 0; //페이징 처리 끝 페이지 번호
	
	private String url = "";
	private String pagingHtml = ""; // 하단의 숫자 페이지 링크
	private String pagingStatus = ""; // 상단 우측의 현재 페이지 위치 표시
	
	// MyBatis의 페이징 처리를 위해 신규 생성 되었습니다.
	private int offset = 0;
	private int limit = 0;
	
	// pagination Size 변수
	private String paginationSize = "pagination-sm";
	
	public CommentPaging(
			String _pageNumber,
			String _pageSize,
			int totalCount) {

		if(_pageSize == null || _pageSize.equals("null") || _pageNumber.equals("")) {
			_pageSize = "5";
		}
		this.pageSize = Integer.parseInt(_pageSize);
		
		this.totalCount = totalCount;

		this.totalPage = (int)Math.ceil((double)totalCount / pageSize);
		this.beginRow = (pageNumber - 1) * pageSize + 1;
		this.endRow = this.pageNumber * this.pageSize;
		

		if ( _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")) {
			_pageNumber = "1" ; 
		}
		
		if(_pageNumber == "0" || _pageNumber.equals("0")) {
			_pageNumber = totalCount % pageSize == 0 ? (totalCount / pageSize)+"" : (totalCount / pageSize )+1 +"";
		}
		this.pageNumber = Integer.parseInt(_pageNumber);

		this.beginPage = ( this.pageNumber - 1)/this.pageCount * this.pageCount + 1;
		this.endPage = this.beginPage + this.pageCount - 1;
		if( this.totalPage < this.endPage) {this.endPage = this.totalPage;}
		
		this.pagingHtml = this.getPagingHtml();
		
		this.pagingStatus = "총 " + totalCount + "건[" + this.pageNumber + "/" + this.totalPage + "]";
		
		this.offset = ( pageNumber -1 )* pageSize;
		this.limit = pageSize ;
	}
	
		public String getPagingHtml() {
			String result = "";
			
			result += "<ul class = 'justify-content-center pagination'>";
			if( pageNumber <= pageCount) { 
				
			} else {
				result += "<li class=\"page-item\"><a class=\"page-link\" onclick='getList(1)'>맨처음</a></li>&nbsp;&nbsp;";
					
					result += "<li class=\"page-item\"><a class=\"page-link\" onclick='getList("+(beginPage-1)+")'>이전</a></li>&nbsp;&nbsp;";
				}		
				//페이지 시작 번호 부터 ~ 끝 번호 까지 표시
				
				for (int i = beginPage ; i <= endPage ; i++) {
					if(i == pageNumber){ //현재 페이지이면 링크는 없고, 빨간색으로 표시
						result += "<li class='active page-item'><a class='page-link'><font color='red'><b>" + i + "</b></font></a></li>&nbsp;";
					}else{
						result += "<li class='page-item'><a class='page-link' onclick='getList("+i+")'>" + i + "</a></li>&nbsp;";	
					}			
				}
				
				//마지막에는 [다음]과 [맨끝]이 없다
				if ( endPage >= (totalPage % pageCount == 0 ? (totalPage / pageCount)*pageCount : (totalPage / pageCount )*pageCount+1 )){
					//result += "다음&nbsp;&nbsp;";
					//result += "맨 끝&nbsp;&nbsp;";	
				} else {			
					result += "<li class=\"page-item\"><a class=\"page-link\" onclick='getList("+(endPage+1)+")'>다음</a></li>&nbsp;&nbsp;";
					
					result += "<li class=\"page-item\"><a class=\"page-link\" onclick='getList("+totalPage+")'>맨끝</a></li>";
				}
				result += "</ul>"; 
				return result ;
			}	
		
		public int getPageNumber() {	return pageNumber;}
		public int getPageSize() {	return pageSize;}	
		public String getPagingStatus() {	return pagingStatus;}	
		public int getBeginRow() {	return beginRow;}
		public int getEndRow() {	return endRow;}

		public int getOffset() {
			return offset;
		}

		public void setOffset(int offset) {
			this.offset = offset;
		}

		public int getLimit() {
			return limit;
		}

		public void setLimit(int limit) {
			this.limit = limit;
		}

		@Override
		public String toString() {
			return "CommentPaging [totalCount=" + totalCount + ", totalPage=" + totalPage + ", pageNumber=" + pageNumber
					+ ", pageSize=" + pageSize + ", beginRow=" + beginRow + ", endRow=" + endRow + ", pageCount="
					+ pageCount + ", beginPage=" + beginPage + ", endPage=" + endPage + ", url=" + url + ", pagingHtml="
					+ pagingHtml + ", pagingStatus=" + pagingStatus + ", offset=" + offset + ", limit=" + limit
					+ ", paginationSize=" + paginationSize + "]";
		}
		
		
}

	
