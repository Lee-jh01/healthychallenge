<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<fmt:parseDate value="${newmember.birth}" var="parseDateValue" pattern = "yyyy-MM-dd" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#myTable td{
		 	height: 4;
		}
	</style>
	<script type="text/javascript">
		function changeModal(){
			$("#myModal").modal()
		}
		function executeModal(){
			var queryString = $('form[name=modalForm]').serialize();
			console.log(queryString)
			$.ajax({
				async : false,
				url : '${contextPath}/updateModal.me',
				data : queryString,
				type : 'post',
				error : function(err){
					console.log("error발생"+err);
					alert('변경 실패')
					$('#myModal').modal("hide")
				}
				,success : function(data){
					console.log(JSON.stringify(data))
					location.href = '${contextPath}/mypage.me'
				}
			})
		}
		
		function deleteMember(){
			if(confirm('정말 삭제하시겠습니까?')){
			  $.ajax({
				 url : '${contextPath}/deleteMember.me',
				 data : {'email' : '${newmember.email}'},
				 type : 'post',
				 success : function(data){
					location.href = '${contextPath}/meLogin.me' 
				 }
			 })
			}else{
				
			}
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
                        <a href="${contextPath }/main.co"><i class="fa fa-home"></i> 메인</a>
                        <span>마이페이지</span>
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
    	<div class="card-body p-4">
			<div class="shadow p-4 mb-4 bg-white" align="center">
			 <h2 >회원 정보</h2>
			 <br>
			 <img class="ml-4 mr-4 img-fluid float-left rounded-circle" src="${contextPath}/picture/${newmember.photo}" alt="Chania" width="250" height="150"> 
			 <div align="left" class="ml-10">
			 <p><span class="font-weight-bolder">이메일 : </span>&nbsp;${newmember.email}</p>
			 <p><span class="font-weight-bolder">이름 : </span>&nbsp;${newmember.name}  &nbsp;&nbsp;&nbsp;</p>
			 <p><span class="font-weight-bolder">생년월일 </span>: &nbsp;<fmt:formatDate value="${parseDateValue}" pattern="yyyy년MM월dd일" /></p>
			 <p><span class="font-weight-bolder">닉네임 : </span>&nbsp;${newmember.nickname}</p>
			 <p><span class="font-weight-bolder">성별 :</span>&nbsp; 
			 	<c:if test="${newmember.gender == 1}">
			 		남자
			 	</c:if>
			 	<c:if test="${newmember.gender == 2}">
			 		여자
			 	</c:if>
			  </p>
			</div>
			<div align = "right">
				<input type="button" class="btn btn-outline-secondary" value="수정" onclick="location.href='${contextPath}/update.me?'">
				<input type="button" class="btn btn-dark" value="탈퇴" onclick="javascript:deleteMember();">
			</div>
			</div>
			<br>
			<div class="shadow p-4 mb-4 bg-white" align="center">
			<h2>나의 현재 상태 </h2>
			<p>초기값은 대한민국 
				<c:if test="${newmember.gender == 1}">
			 		남성
			 	</c:if>
			 	<c:if test="${newmember.gender == 2}">
			 		여성
			 	</c:if>
			의 평균 키, 몸무게로 자동 등록 되어있습니다 :) <br> 정확한 소비 칼로리 계산을 위해 자신의 키와 몸무게를 등록해주세요~</p>
			<h4>키 : ${newmember.height} cm &nbsp;&nbsp; 몸무게 : ${newmember.weight} kg</h4>
			<br>
				<input type="button" class="btn btn-outline-warning" value="변경하기" onclick="changeModal();">
			</div>
			
		</div>
	</div>
    </div>
    <br>
    <br>
    
	  <!-- 키, 몸무게 변경 -->
	  <div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">키/몸무게 변경</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	        	<form class="form-inline" name="modalForm">
		          <input type="text" name = "height" class="form-control" placeholder="키(cm)">
		          &nbsp;&nbsp;
		          <input type="text" name = "weight" class="form-control" placeholder="몸무게(kg)">
		       </form>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-outline-warning" onclick="executeModal();">등록</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
    
	<%@ include file="../common/footer.jsp" %>
</body>
</html>