<%@ include file="/WEB-INF/member/meSearchEmailModal.jsp" %>
<%@ include file="/WEB-INF/member/meSearchPasswordModal.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<style type="text/css">
		.err{
			color:red;
			font-weight:bold;
		}
	</style>
	<script type="text/javascript">
	 function setCookie(cookieName, value, exdays){
	        var exdate = new Date();
	        exdate.setDate(exdate.getDate() + exdays);
	        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	        document.cookie = cookieName + "=" + cookieValue;
	    }
	     
	    function deleteCookie(cookieName){
	        var expireDate = new Date();
	        expireDate.setDate(expireDate.getDate() - 1); //어제날짜를 쿠키 소멸날짜로 설정
	        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	    }
	     
	    function getCookie(cookieName) {
	        cookieName = cookieName + '=';
	        var cookieData = document.cookie;
	        var start = cookieData.indexOf(cookieName);
	        var cookieValue = '';
	        if(start != -1){
	            start += cookieName.length;
	            var end = cookieData.indexOf(';', start);
	            if(end == -1)end = cookieData.length;
	            cookieValue = cookieData.substring(start, end);
	        }
	        return unescape(cookieValue);
	    }
	    
  
    	$(document).ready(function() {
            //email 쿠키 저장
            var email = getCookie("email");
            $("input[name='email']").val(email); 
             
            if($("input[name='email']").val() != ""){ 
                $("#saveEmail").attr("checked", true); 
                $("#savePwd").removeAttr("disabled");
            }
             
            $("#saveEmail").change(function(){ 
                if($("#saveEmail").is(":checked")){                     
                       //id 저장 클릭시 pwd 저장 체크박스 활성화
                       $("#savePwd").removeAttr("disabled");
                       $("#savePwd").removeClass('no_act');
                    var email = $("input[name='email']").val();
                    setCookie("email", email, 7);
                }else{ 
                    deleteCookie("email");
                    $("#savePwd").attr("checked", false); 
                    deleteCookie("password");
                    $("#savePwd").attr("disabled", true);
                    $("#savePwd").addClass('no_act');
                }
            });
             
          
            $("input[name='email']").keyup(function(){ 
                if($("#saveEmail").is(":checked")){ 
                    var email = $("input[name='email']").val();
                    setCookie("email", email, 7);
                }
            });
	        
	        //password 쿠키 저장 
	        var password = getCookie("password");
	        $("input[name='password']").val(password); 
	         
	        if($("input[name='password']").val() != ""){ 
	            $("#savePwd").attr("checked", true);
	            $("#savePwd").removeClass('no_act');
	        }
	         
	        $("#savePwd").change(function(){ 
	            if($("#savePwd").is(":checked")){ 
	                var password = $("input[name='password']").val();
	                setCookie("password", password, 7);
	            }else{ 
	                deleteCookie("password");
	            }
	        });
	         
	      
	        $("input[name='password']").keyup(function(){ 
	            if($("#savePwd").is(":checked")){ 
	                var password = $("input[name='password']").val();
	                setCookie("password", password, 7);
	            }
	        });

	    });
    	
	</script>
	<style type="text/css">
		.modal{
			overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            text-align: center;
		}
		@media screen and (min-width: 800px) { 
        .modal:before {
           display: inline-block;
           vertical-align: middle;
           content: " ";
           height: 100%;
        }
		.modal-dialog {
	        display: inline-block;
	        text-align: left;
	        vertical-align: middle;
		}
		.close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modal-footer{
        	display: inline-block;
	        text-align: center;
	        vertical-align: middle;
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
                        <span>로그인</span>
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
                <div class="col-lg-6 offset-lg-3">
                <!-- error -->
				<c:if test="${not empty requestScope.errmsg}">
					<div class="alert alert-danger alert-dismissable">
			    		<a href="#" id="myalert" class="close" data-dismiss="alert" aria-label="close">X</a>
			    		<strong>${requestScope.errmsg}</strong>
					</div>
				</c:if>
				<c:if test="${not empty requestScope.errstatus}">
					<div class="alert alert-danger alert-dismissable">
			    		<a href="#" id="myalert" class="close" data-dismiss="alert" aria-label="close">X</a>
			    		<strong>${requestScope.errstatus}</strong>
					</div>
				</c:if>
				<!-- error -->
                    <div class="login-form">
                        <h2>로그인</h2>
                        <form action="${contextPath }/meLogin.me" method="post">
                            <div class="group-input">
                                <label for="email">이메일을 입력해주세요 *</label>
                                <input type="text" name="email" id="email" value="">
                                <span class="err">${erremail}</span>
                            </div>
                            <div class="group-input">
                                <label for="password">비밀번호를 입력해주세요 *</label>
                                <input type="password" name="password" id="passward" onkeydown="if(event.keyCode==13) javascript:chkEnter();">
                                <span class="err">${errpwd}</span>
                            </div>
                            <div align="right">
	                            <label for="saveEmail"> 
	                            <input type="checkbox" id="saveEmail">
	                            	이메일 저장
	                            </label>
	                            &nbsp;&nbsp;
	                            <label for="savePwd"> 
	                            <input type="checkbox" disabled id="savePwd" class="no_act">
	                           		비밀번호 저장
	                            </label>
                         	</div>
                            <button type="submit" class="site-btn login-btn">로그인</button>
                        </form>
                        <div class="switch-login">
                            <a href="${contextPath }/insert.me" class="or-login">회원가입</a>
                            &nbsp;&nbsp;
                            <%-- <a href="${contextPath}/searchEmail.me" class="or-login">이메일/</a> --%>
                            <a class="or-login" style="cursor:pointer;" id="myBtn" onclick="javascript:emailModal();">이메일/</a>
                           <%--  <a href="${contextPath}/searchPassword.me" class="or-login">비밀번호 찾기</a> --%>
                            <a class="or-login" style="cursor:pointer;" id="myBtn2" onclick="javascript:passwardModal();">비밀번호 찾기</a> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    	function emailModal(){
    		$("#myBtn").click(function(){
        		$("#myModal").modal();
        	})
    	}
    	function passwardModal(){
    		$("#myBtn2").click(function(){
    			$("#myModal2").modal();
    		})
    	}
    </script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>