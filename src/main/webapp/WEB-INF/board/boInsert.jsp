<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 스프링 관련 설정 코드 --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap Sample</title>
</head>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<h4>게시물 등록</h4>
			</div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=request.getContextPath()%>" />
				<form:form modelAttribute="board" class="form-horizontal" role="form" action="${apppath}/boInsert.bo" method="post">
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="email">작성자</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" name="fakeemail" id="fakeemail"
								placeholder="작성자" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})" disabled="disabled" />
							<input type="hidden" name="email" id="email"
								value="${sessionScope.loginfo.id}" />								
							<form:errors cssClass="err" path="email" /> 
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="subject">글
							제목</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="subject" type="text" class="form-control" name="subject"
								id="subject" placeholder="글 제목" value="${subject}"/> 
							<form:errors cssClass="err" path="subject" /> 
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="content">글
							내용</label>
						<div class="col-sm-<%=formright%>">
							<form:textarea path="content" name="content" id="content" rows="5" cols="" 
								placeholder="글 내용" class="form-control" />
							<form:errors cssClass="err" path="content" /> 
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="regdate">작성
							일자</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="regdate"  type="datetime" class="form-control" name="regdate"
								id="regdate" placeholder="작성 일자" value="${bean.regdate}" /> 
								<form:errors cssClass="err" path="regdate" /> 
						</div>
					</div>
					<div class="form-group">
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button class="btn btn-default" type="submit">글쓰기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default" type="reset">취소</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
<%@ include file="../common/footer.jsp" %>
</body>
</html>