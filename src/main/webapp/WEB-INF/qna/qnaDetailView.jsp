<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BootStrap Sample</title>
	<script type="text/javascript">
		function gotoBack(){
			location.href='<%=contextPath%>/qnaList.qa?${requestScope.parameters}';
			//alert('${requestScope.parameter}') ;
		}

	</script>
</head>
<%
	int leftside = 4; //판넬의 좌측
	int rightside = twelve - leftside; //판넬의 우측
%>
<body>
  <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="${contextPath}/main.co"><i class="fa fa-home"></i> 메인</a>
                        <a href="${contextPath}/qnaList.qa">커뮤니티 게시판</a>
                        <span>상세보기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->
    <br>
    <br>
 	<div class="container">
 		<div class="card">
 			<div class="card-header" style="background-color:white;">
 				<div class="d-flex justify-content-start">
 					<h2>${bean.title}</h2>
 				</div>
 				<div class="d-flex justify-content-end">
 					<span class="font-weigt-lightr">&nbsp;${bean.regdate}&nbsp;&nbsp;</span>
 					<span class="font-weigt-lightr"><i class="fas fa-user"></i>&nbsp;${bean.email}&nbsp;&nbsp;</span>
 					<span class="font-weigt-lightr"><i class="fas fa-eye"></i>&nbsp;${bean.readhit}</span>
 				</div>
 			</div>
 		 	<div class="card-body">
 				<table class="table table-default">
		 			<tr>
		 				<td>${bean.content}</td>
		 			</tr>
 				</table> 
 			</div> 
 		</div>
 	
<%-- 	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<h1 class="panel-title" align="left">게시물 상세 보기</h1>
			</div>
			<div class="panel-body">
				<div class="col-sm-<%=leftside%> col-sm-<%=leftside%>">
				</div>
				<div class="col-sm-<%=rightside%> col-sm-<%=rightside%>">
					<table class="table table-hover table-condensed">
						<tr>
							<td width="25%" align="center">글 번호</td>
							<td width="75%" align="left">${bean.co_seq}</td>
						</tr>						
						<tr>
							<td width="25%" align="center">작성자</td>
							<td width="75%" align="left">${bean.email}</td>
						</tr>
						<tr>
							<td width="25%" align="center">제목</td>
							<td width="75%" align="left">${bean.title}</td>
						</tr>
						<tr>
							<td width="25%" align="center">글 내용</td>
							<td width="75%" align="left">${bean.content}
							</td>
						</tr> 
						<tr>
							<td width="25%" align="center">조회수</td>
							<td width="75%" align="left">${bean.readhit}</td>
						</tr>
						<tr>
							<td width="25%" align="center">작성 일자</td>
							<td width="75%" align="left">${bean.regdate}</td>
						</tr>
					</table>
				</div> --%>
				

				<hr>
					<div class="d-flex">
						<div class="p-2 mr-auto">
							<button class="btn btn-warning" onclick="gotoBack();">목록보기</button>
						</div>
						<div class="p-2">

			

							<c:if test="${sessionScope.loginfo.email == bean.email}">
								<a href="<%=contextPath%>/update.qa?no=${bean.qna_seq}&${requestScope.parameters}">
									수정
								</a>
							</c:if>
							<c:if test="${sessionScope.loginfo.email != bean.email}">
								수정
							</c:if>
						</div>
						<div class="p-2">
							<c:if test="${sessionScope.loginfo.email == bean.email}">
								<a href="<%=contextPath%>/delete.qa?no=${bean.qna_seq}&${requestScope.parameters}">
									삭제
								</a>
							</c:if>
							&nbsp;&nbsp;
							<c:if test="${sessionScope.loginfo.email != bean.email}">
								삭제
							</c:if>
							
							<td>
							<c:if test="${bean.depth <3 }">
								<a href="<%=contextPath%>/reply.qa?qna_seq=${bean.qna_seq}&${requestScope.parameters}&groupno=${bean.groupno}&orderno=${bean.orderno}&depth=${bean.depth}">
									답글 
								</a>
							</c:if>
							<c:if test="${bean.depth >= 3 }">
								답글
							</c:if>
						</td>
						</div>
					</div>
				<hr>
		</div>

				
	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
	</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>