<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="${contextPath }/main.co"><i class="fa fa-home"></i> 메인</a>
                         <a href="${contextPath}/mypage.me">마이 페이지</a>
                        <span>회원정보 수정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">  
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="register-form">  
                        <h2>회원정보 수정</h2>
                        <form action="${contextPath}/update.me" method="post" enctype="multipart/form-data" autocomplete='off'>
                            <div class="group-input"> 
                                <label for="email">이메일 *</label>
                                <input type="text" name="email" id="email" value="${member.email}" readonly>
                                <div class="check_font" id="email_check"></div>
                            </div>
                            <div class="group-input">
                                <label for="password">비밀번호 *</label>
                                <input type="password" name="password" id="password">
                                <div class="check_font" id="password_check"></div>
                            </div>
                            <div class="group-input">
                                <label for="passcheck">비밀번호 확인 *</label>
                                <input type="password" name="passcheck" id="passcheck">
                                <div class="check_font" id="passcheck_check"></div>
                            </div>
                            <div class="group-input">
                                <label for="name">이름 *</label>
                                <input type="text" name="name" id="name" value="${member.name}">
                                <div class="check_font" id="name_check"></div>
                            </div>
                            <div class="group-input">
                                <label for="birth">생년월일 *</label>
                                <input type="date" name="birth" id="birth" value="${member.birth }">
                                <div class="check_font" id="birth_check"></div>
                            </div>
                            <div class="group-input">
                                <label for="gender">성별 *</label>
                                	<div class="radio">
		                                <div class="d-inline-flex">
										   <div class="p-2 mr-3">
									       	 <input type="radio" name="gender" id="gender" value="1">남자
										  </div> 
										   <div class="p-2">
										      <input type="radio" name="gender" id="gender" value="2">여자
										  </div> 
									   </div>
								   </div>
								  <div class="check_font" id="gender_check"></div>
							</div>
							
                            <div class="group-input">
                                <label for="nickname">닉네임 *</label>
                                <input type="text" name="nickname" id="nickname" value="${member.nickname }">
                                <div class="check_font" id="nickname_check"></div>
                            </div>
                            <div class="group-input">
                                <label for="abcd">프로필 사진 </label>
                                <input class="form-control" type="file" name="abcd" id="abcd">
                                <input type="hidden" name="photo" value="${member.photo}">
                                <p style="color:blue">현재 사진 파일 : ${member.photo}</p>
                            </div>
                            
                            <button type="submit" id ="insert_submit" class="site-btn register-btn" disabled="disabled">회원정보 수정</button>
                        </form>
                        <div class="switch-login">
                            <a href="${contextPath }/meLogin.me" class="or-login">로그인 바로 가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
	<%@ include file="../common/footer.jsp" %>
	<script>
	 jQuery.noConflict();
	 
	 $(function () {

		 // 이메일 정규식 W
		 var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 // 비밀번호 정규식 - 숫자와 문자 포함 형태의 6~12 자리 이내의 암호식
		 var pwJ = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		 // 이름 정규식 - 한글로 이뤄진 문자만으로 2-6자리 이름을 적어야 한다
		 var nameJ = /^[가-힣]{2,6}$/;
		 
	 	// 이름에 특수문자 들어가지 않도록 설정
	 	
	 	$(document).on("blur", '#name', function(){
				if (nameJ.test($(this).val())) {
					$("#name_check").text('');
					$("#insert_submit").attr("disabled",false);
				} else {
					$('#name_check').text('이름을 확인해주세요');
					$('#name_check').css('color', 'red');
					$('#insert_submit').attr("disabled",true);
				}
			});
	 	
	 	// 닉네임 유효성 검사
	 	$(document).on("blur", '#nickname', function(){
				if (nameJ.test($(this).val())) {
					$("#nickname_check").text('');
					$('#insert_submit').attr("disabled",false);
				} else {
					$('#nickname_check').text('닉네임을 확인해주세요 특수문자 X');
					$('#nickname_check').css('color', 'red');
					$('#insert_submit').attr("disabled",true);
				}
			});
		  
		 // 비밀번호 유효성 검사
		 // 1-1 정규식 체크
		  $(document).on("blur",'#password', function(){
			 if(pwJ.test($('#password').val())){
				console.log('true');
				$('#password_check').text("");
				$("#insert_submit").attr("disabled",false);
			 } else{
				 console.log('false');
				 $('#password_check').text('최소 8자리에 하나 이상의 문자와 하나의 숫자를 포함해야 합니다.');
				 $('#password_check').css('color','red');
				 $('#insert_submit').attr("disabled",true);
			 }
		 });
		 
		 // 1-2 패스워드 일치 확인
		 $(document).on("blur",'#passcheck', function(){
			if($('#password').val() != $(this).val()){
				$('#passcheck_check').text('비밀번호가 일치하지 않습니다');
				$('#passcheck_check').css('color','red');
	
				$("#insert_submit").attr("disabled",true);
			}else{
				$('#passcheck_check').text('');
				$('#insert_submit').attr("disabled",false);
			}
		 });
		 
		 // 생년월일 확인
		 $(document).on("blur",'#birth', function(){
			if($('#birth').val() == ""){
				$('#birth_check').text('생년월일을 선택하세요');
				$('#birth_check').css('color','red');
				$("#insert_submit").attr("disabled",true);
			}else{
				$('#birth_check').text('');
				$('#insert_submit').attr("disabled",false);
			}
		 });
		 // 성별 확인
		 $(document).on("blur",'#gender', function(){
			if($(':radio[name="gender"]:checked').length >=1){
				$('#gender_check').text('');
				$('#insert_submit').attr("disabled",false);
			}else{
				$('#gender_check').text('성별을 선택하세요');
				$('#gender_check').css('color','red');
				$("#insert_submit").attr("disabled",true);
			}
		 })
		 
		  $('input:radio[name=gender]:input[value=' + '${member.gender}' + ']').attr("checked", true);
		 
	 })// 세팅 끝
	 
	 

	</script>
	
</body>
</html>