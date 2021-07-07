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
		function searchPassword(){
			$.ajax({
				type:"GET",
				url:"${contextPath}/passwordSearch.me?email="+$('#pwdemail').val()+"&birth="+$('#pwdbirth').val(),
				success:function(data){
					if(data == 0){
						$('#pwd_value').text("회원 정보를 확인해주세요!");
					} else {
						$('#pwd_value').text("임시비밀번호를 이메일로 발송했습니다.");
					}
				}
			})
		}
	</script>
</head>
<body>
  <!-- The Modal -->
  <div class="modal fade" id="myModal2" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style="width:600px;">
          <h4 class="modal-title">비밀번호 찾기</h4>
          <div class="font-weight-bold">
	    	<p class="align-bottom">인증된 이메일만 가능</p>
	       </div>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	 <div class="form-group">
   			<label class="font-weight-bold" for="email">이메일</label>
   			<div>
   				<input type="text" class="form-control" name="pwdemail" id="pwdemail">
   			</div>
    		</div>
    		<div class="form-group">
    			<label class="font-weight-bold" for="birth">생년월일</label>
    			<div>
    				<input type="text" class="form-control" name="pwdbirth" id="pwdbirth">
    			</div>
    		</div>
    		<div class="form-group">
    			<input type="button" class="font-weight-bold form-control btn btn-warning" 
    			value="비밀번호 찾기" onclick="javascript:searchPassword();">
	    	</div>
	    	
	    	<h2 id="pwd_value" class="font-weight-bold text-warning"></h2>
        </div>
        
      </div>
    </div>
  </div>
 
</body>
</html>