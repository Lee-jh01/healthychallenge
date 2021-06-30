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
		/*에디터 크기 지정*/
		.ck.ck-editor{
			max-width : 1200px;
		}
		.ck-editor__editable {
	  		min-height: 500px;
	  		max-height: 500px;
		}
		
	</style>
	<script type="text/javascript">
		window.addEventListener('load', function () {
			$('#category').val('${bean.category}');
		})
		
		
/* 		validation check 잠시 보류
 
 		function check(){
			var alertt = document.getElementById("validation");
			var subjectval = document.getElementById('subject').value;
			var contentval = document.getElementById('review_editor').value;
		} */
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
                        <a href="${contextPath}/boList.bo">커뮤니티 게시판</a>
                        <span>글 수정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

	<br>
	<br>
	<div class="container">
			<form action="${contextPath}/update.bo" method="post" class="form-horizontal" name="myForm">
				<input type="hidden" name="pageNumber" value="${param.pageNumber}">
				<input type="hidden" name="pageSize" value="${param.pageSize}">
				<input type="hidden" name="mode" value="${param.mode}">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<input type="hidden" name="co_seq" id="co_seq" value="${bean.co_seq}">
				<fmt:parseDate value="${bean.regdate}" pattern="yyyy-MM-dd" var="regdate" />
				<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" var="reg"/>
				<input type="hidden" name="regdate" id="regdate" value="${reg }">
				
				<!-- 경고 메시지 테스트중 -->
				<div id = "validation">
				  <div class="alert alert-danger alert-dismissible fade show">
				    <button type="button" class="close" data-dismiss="alert">&times;</button>
				    <strong>알림</strong><span class="err">fff</span>
				  </div>
				</div>
				<!--  -->
				  
				<div class="row">
                   	<div class="col-1">
              	  		<!-- <label class="form-control-label" for="category">카테고리</label> -->
              	  		<span class="align-middle">카테고리</span>
                	</div>
               	   	<div class="col-3">
                       <select id="category" name="category" class="form-control">
                          <option value="-" selected="selected">선택하세요
                          <option value="운동">운동
                          <option value="식단">식단
                          <option value="정보공유">정보공유
                       </select>
                     
                   	</div>
                  	<div class="col-1">
						<!-- <label class="form-control-label" for="email">작성자</label> -->
						<span class="mx-auto text-center">작성자</span>
					</div>
					<div class="col-3">
						<input type="text" class="form-control" name="fakeemail" id="fakeemail"
							placeholder="작성자" value="${sessionScope.loginfo.nickname}(${sessionScope.loginfo.email})" disabled="disabled" />
						<input type="hidden" name="email" id="email"
							value="${sessionScope.loginfo.email}" />								
					</div>
				</div>
				<br>
				<div class="form-group">
					<div>
						<input type="text" class="form-control" name="subject"
							id="subject" placeholder="글 제목" value="${bean.subject}"/> 
				<%-- 		<form:errors cssClass="err" path="subject" />  --%>
					</div>
				</div>
				
				<div class="editor_wrap">
					<textarea name="content" id="review_editor" placeholder="내용을 입력해 주세요." rows="150" cols="50"> ${bean.content}</textarea>
				</div>

				<br>
				<div class="form-group">
					<div align="center">
						<button class="btn btn-warning" type="button" onclick="javascript:check();">수정하기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-wanring" type="reset">취소</button>
					</div>
				</div>
			</form>
		</div>
		
		
		<!-- CKEditor -->
		<script type="text/javascript">
			var myEditor;
			ClassicEditor
				.create( document.querySelector( '#review_editor' ), {
					ckfinder: {
				        uploadUrl: '${pageContext.request.contextPath }/upload.bo' // 내가 지정한 업로드 url (post로 요청감)
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
		</script>

	<%@ include file="../common/footer.jsp" %> --%>
</body>
</html>