<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
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
				<h4>답글 달기</h4>
			</div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=request.getContextPath()%>" />
				<form:form modelAttribute="qna" class="form-horizontal" role="form"
					action="${apppath}/reply.qa" method="post">
					<input type="text" name="pageNumber"
						value="<%=request.getParameter("pageNumber")%>">
						<input type="text" name="pageSize"
						value="<%=request.getParameter("pageSize")%>"> <input
						type="text" name="groupno"
						value="<%=request.getParameter("groupno")%>"> <input
						type="text" name="orderno"
						value="<%=request.getParameter("orderno")%>">
						<input type="text" name="depth"
						value="<%=request.getParameter("depth")%>">
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="email">작성자</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" name="fakeemail"
								id="fakeemail" placeholder="작성자"
								value="${sessionScope.loginfo.email}"
								disabled="disabled"> <input type="hidden" name="email"
								id="email" value="${sessionScope.loginfo.email}">
								<form:errors cssClass="err" path="email" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="title">글
							제목</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="title" type="text" class="form-control" name="title"
								id="title" placeholder="글 제목"  value=""/>
								<form:errors cssClass="err" path="title" />
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
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button class="btn btn-default" type="submit">답글 달기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default" type="reset">취소</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>