<%@page import="dao.BoardDao"%>
<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap Sample</title>
<style type="text/css">
.xxx {
	margin-left: 0px;
}

.re {
	font-size: 11px;
}
ul.pagination.pagination-sm {
    list-style: none;
}


</style>
<script type="text/javascript">
		function writeForm(){
				location.href='<%=contextPath%>/boInsert.bo';
		}
		function search(){
			if( $('#mode').val() == 'all' ){
				alert('검색 목록을 선택해주세요') ;
				//$('#mode').focus();
			}else{
				alert('하하') ;
				var keyword = $('#keyword').val() ;
				location.href='<%=contextPath%>/boInsertList.bo' + '&mode=' + mode + '&keyword=' + keyword ;
				
			}
			//alert( $('#mode').val() );
		}
		
		
		
		function searchAll(){
			//$('#mode').val('-');
			//$('#keyword').val('');
			location.href='<%=contextPath%>/boList.bo';
		}
		
</script>
</head>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<form class="form-inline" role="form">
					<h2>게시물 목록</h2>
				</form>
			</div>
			<table class="table table-striped table-hover">
				<thead>
				<tr>
					<td colspan="10" align="center">
						<form class="form-inline" role="form" name="myform" action="<%=contextPath%>/boList.bo" method="get">
							<div class="form-group">
								<select class="form-control" name="mode" id="mode">
									<option value="all" selected="selected">-- 선택하세요---------
									<option value="email" >작성자
									<option value="subject" >제목								
									<option value="content" >글내용
								</select>
							</div>
							<div class="form-group">
								<input type=
								"text" class="form-control btn-xs" name="keyword"
									id="keyword" placeholder="검색 키워드">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default btn-warning" type="submit" onclick="search(); return false;">검색</button>
							<button class="btn btn-default btn-warning" type="button" onclick="searchAll();">전체 검색</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<button class="btn btn-default btn-warning" type="button"
							
								onclick="writeForm(); return false;">글 쓰기</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<p class="form-control-static">${requestScope.pagingStatus}</p>
						</form>
					</td>
				</tr>
					<tr>
						<th>글번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성 일자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td>${bean.co_seq}</td>
							<td>${bean.category}</td>	
							<td>						
							<a href="<%=contextPath%>/boDetailview.bo?co_seq=${bean.co_seq}&${requestScope.parameters}">
								${bean.subject}
							</a>
							</td>
							<td>${bean.email}</td>							
							<td>${bean.regdate}</td>
							<td>${bean.readhit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="center">
			<footer>${requestScope.pagingHtml}</footer>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<script type="text/javascript">
		/* 방금 전 선택한 콤보 박스를 그대로 보여 주기 */
		$('#mode option').each(function(index) {
			if ($(this).val() == '${requestScope.mode}') {
				$(this).attr('selected', 'selected');
			}
		});
		/* 이전에 넣었던 값 그대로 보존 */
		$('#keyword').val('${requestScope.keyword}');
	</script>
<%@ include file="../common/footer.jsp" %> 
</body>
</html>