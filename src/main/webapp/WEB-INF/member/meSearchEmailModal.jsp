<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		// 이메일 & 스토어 값 저장하기 위한 변수
		var emailV = "";
		// 이메일 값 받고 출력하는 ajax
		function emailSearch(){
			$.ajax({
				type:"POST",
				url:"${contextPath}/emailSearch.me?name="+$('#inputName').val()+"&birth="+$('#inputBirth').val(),
				success:function(data){
					if(data == 0){
						$('#email_value').text("회원 정보를 확인해주세요!");
					} else {
						$('#email_value').text(data);
						// 이메일 값 별도로 저장
						emailV = data;
					}
				}
			})
		}
</script>
</head>
<body>
<div class="container mt-3">
  <!-- The Modal -->
  <div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">이메일 찾기</h4>
          <br>
          <div class="font-weight-bold">
	    	<p class="align-bottom" style="width:600px;">인증된 이메일만 가능</p>
	       </div>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="form-group">
	   		<label class="font-weight-bold" for="name">이름</label>
	   			<div>
	   				<input type="text" class="form-control" name="inputName" id="inputName">
	   			</div>
	   		</div>
	   		<div class="form-group">
	   			<label class="font-weight-bold" for="birth">생년월일</label>
	   			<div>
	   				<input type="text" class="form-control" name="inputBirth" id="inputBirth">
	   			</div>
	   		</div>
	   		<div class="form-group">
	   			<button class="font-weight-bold form-control btn btn-warning"
	   				id="searchEmailBtn" onclick="javascript:emailSearch();">가입한 이메일 찾기</button>
	   		</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer" class="align-left">
        	<div>
        		<h4>찾으신 이메일은?</h4>
        		<br>
        		<h2 id="email_value" class="font-weight-bold text-warning"></h2>
        		<br>
        		<button type="button" class="btn btn-success text-white" id="pwSearch_btn" onclick = "javascript:pwSearchShow();">
        			<i class="fa fa-envelope"></i>비밀번호 찾기
        		</button>
        	</div>
        </div>
        
      </div>
    </div>
  </div>
</div> 

<script type="text/javascript">
	function pwSearchShow(){
		$("#myModal").modal("hide");
		$("#myModal2").modal();
		document.getElementById('pwdemail').value = emailV;
	}
</script>
</body>
</html>