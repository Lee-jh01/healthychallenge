<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
	
		 $(function() {
		 alert('회원가입이 완료되었습니다. 메일 인증후 로그인 해주세요:)') 
			location.href='${contextPath}/meLogin.me'
	    });
	 
	</script>
</head>
<body>

</body>
</html>