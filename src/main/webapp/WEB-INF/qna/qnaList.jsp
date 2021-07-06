<%@page import="dao.QnaDao"%>
<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BootStrap Sample</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style type="text/css">

ul.pagination.pagination-sm {
    list-style: none;
}


</style>
<script type="text/javascript">
		
	function search(se){
		document.searchForm.mode.value = se;
		document.searchForm.submit();
	}	
		
</script>
</head>
<body>
     <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="${contextPath}/main.co"><i class="fa fa-home"></i> 메인</a>
                        <span>Q & A 게시판</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->
    
	<br>
	<br>
	<div class="container">
		<!-- 검색 section -->
		<form action="${contextPath}/qnaList.qa" method="post" name="searchForm">
			<div class="d-flex">
				<div class="p-2 mr-auto">
					
				</div>
				<input type="hidden" name="mode" id ="mode" value="" >
				<div class="p-2"><input class="form-control" type="text" id="keyword" name="keyword" placeholder="제목 / 내용 / 작성자"></div>
				<div class="p-2"><button type="submit" class="btn btn-warning"><i class="fas fa-search pt-2"></i></button></div>
			</div>
		</form>	
		<!-- 목록 section -->	
		
<%-- 	
		현재 일자 계산 / 후에 JSTL 날짜 연산시 사용하기	
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern = "yyyy-MM-dd" var="today"/> --%>
				
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="10%">글번호</th>
					<th width="50%">제목</th>
					<th width="15%" >작성자</th>
					<th width="15%">작성 일자</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr onclick='location.href="${contextPath}/qnaDetailview.qa?qna_seq=${bean.qna_seq}&${requestScope.parameters}"'>
						<td>${bean.qna_seq}</td>							
						<td>
							<c:forEach var="cnt" begin="1" end="${bean.depth}">
								<span class="badge re">re</span>
							</c:forEach>
							<a href="<%=contextPath%>/qnaDetailview.qa?qna_seq=${bean.qna_seq}&${requestScope.parameters}">
								${bean.title}
							</a>
						</td>
						
						
						<td>${bean.email}</td>							
						<td>
							<fmt:parseDate value="${bean.regdate}" pattern="yyyy-MM-dd" var="regdate" />
							<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" var="reg"/>
							${reg}
						</td>
						<td>${bean.readhit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<footer>${requestScope.pagingHtml}</footer>
			<button class="btn btn-warning float-lg-right" type="button" onclick="location.href='${contextPath}/qnaInsert.qa'">글 쓰기</button>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<script type="text/javascript">
		$('#mode').val('${requestScope.mode}')
		/* 이전에 넣었던 값 그대로 보존 */
		$('#keyword').val('${requestScope.keyword}');
	</script>
<%@ include file="../common/footer.jsp" %> 
</body>
</html>