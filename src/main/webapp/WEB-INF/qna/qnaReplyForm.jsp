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
	<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
	<script src =" https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js" ></script >
	<style type="text/css">
		.ck.ck-editor{
			max-width : 1200px;
		}
		.ck-editor__editable {
	  		min-height: 500px;
	  		max-height: 500px;
		}
		
	</style>
</head>
<body>
	 <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="${contextPath}/main.co"><i class="fa fa-home"></i> 메인</a>
                        <a href="${contextPath}/qnaList.qa">Q & A 게시판</a>
                        <span>Q & A 답글 작성</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

	<br>
	<br>
	<div class="container">
				
				
				<form:form modelAttribute="qna" action="${contextPath}/reply.qa" method="post" class="form-horizontal">
				<div class="row">
                  	<div class="col-1">
						<!-- <label class="form-control-label" for="email">작성자</label> -->
						<span class="mx-auto text-center">작성자</span>
					</div>
					<input type="hidden" name="pageNumber"
						value="<%=request.getParameter("pageNumber")%>">
					<input type="hidden" name="pageSize"
						value="<%=request.getParameter("pageSize")%>"> 
					<input type="hidden" name="groupno"
						value="<%=request.getParameter("groupno")%>"> 
					<input type="hidden" name="orderno"
						value="<%=request.getParameter("orderno")%>">
					<input type="hidden" name="depth"
						value="<%=request.getParameter("depth")%>">
					
					<div class="col-3">
						<input type="text" class="form-control" name="fakeemail" id="fakeemail"
							placeholder="작성자" value="${sessionScope.loginfo.nickname}" disabled="disabled" />
						<input type="hidden" name="email" id="email"
							value="${sessionScope.loginfo.email}" />	
					</div>
				</div>
				<br>
				<div class="form-group">
					<div>
						<form:input path="title" type="text" class="form-control" name="title"
							id="title" placeholder="글 제목" value="${title}"/> 
							<form:errors cssClass="err" path="title" />
					</div>
				</div>
				
				<div class="editor_wrap">
					<form:textarea path="content" nme="content" id="review_editor" placeholder="내용을 입력해 주세요."></form:textarea>
				</div>
				<form:errors cssClass="err" path="content" />	
				<br>
				<div class="form-group">
					<div align="center">
						<button class="btn btn-warning" type="submit">글쓰기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-wanring" type="reset">취소</button>
					</div>
				</div>
			</form:form>
				
				
		</div>

	<!-- CKEditor -->
	<script type="text/javascript">
		var myEditor;
		ClassicEditor
			.create( document.querySelector( '#review_editor' ), {
				ckfinder: {
			        uploadUrl: '${pageContext.request.contextPath }/upload.qa' // 내가 지정한 업로드 url (post로 요청감)
				},
				alignment: {
		            options: [ 'left', 'center', 'right' ]
		        }
			} )
			.then( editor => {
		        console.log( 'Editor was initialized', editor );
		        myEditor = editor;
		    } )
			.catch( error => {
			    console.error( error );
			} );
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>