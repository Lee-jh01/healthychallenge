<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% 
    request.setCharacterEncoding("UTF-8"); //한글깨짐 방지 문자셋 설정
%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" scope="application"/> 
<%
	String contextPath = request.getContextPath();
%>

<!-- whologin 변수는 로그인 상태를 저장하고 있는 변수입니다. -->
<c:set var="whologin" value="0" />
<c:if test="${empty sessionScope.loginfo}">
	<!-- 로그인 하지 않은 경우 -->
	<c:set var="whologin" value="0" />
</c:if>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.email == 'admin'}">\
		<!-- 관리자로 로그인한 경우 -->
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.email != 'admin'}">
		<!-- 일반 사용자로 로그인한 경우 -->
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>

<!-- 부트 스트랩 -->
<% int twelve = 12 ; %>
<c:set var="twelve" value="12" />
<%!
	String YesForm = null ;
	String NoForm = null ;
%>
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 3;
	int formright = twelve - formleft;
	int mysearch = 2;
	//int label = 3 ; //양식의 왼쪽에 보여지는 라벨의 너비 
	//int content = twelve - label ; //우측의 내용 입력(input, select, textarea)의 너비
%>


<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
    <meta name="description" content="Healthy">
    <meta name="keywords" content="Healthy, Challenge, Meal, Community">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>daily helath</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css">

    <!-- favicon 오류 해결 -->
    <link rel="shortcut icon" href="#">
    
 	<!-- bootstrap 추가 라이브러리 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	
	
    <!-- JQUERY CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#Progress_Loading').hide(); // 첫 시작시 로딩바를 숨겨준다.
    		
    	 	$(document).ajaxStart(function(){
        		$('#Progress_Loading').show(); // ajax 실행시 로딩바를 보여준다.
	        })
	        $(document).ajaxStop(function(){
	       		$('#Progress_Loading').hide(); //ajax 종료시 로딩바를 숨겨준다.
	       	}) 
    	})
    	
    </script>
    <style type = "text/css"> <!-- 로딩바스타일 -->
		#Progress_Loading
		{		
			 text-align: center;
			 z-index : 1;
			 position: absolute;
			 left: 50%;
			 top: 50%;
			 background: #ffffff;
		}
		li
		{
			list-style: none;
		}
	</style>
</head>

<body>
   <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Ajax Page Loadingbar --> 
     <div id = "Progress_Loading"><!-- 로딩바 -->
		<img src="${contextPath}/picture/loadingbar.gif"/>
	</div> 
	

   <!-- Header Section Begin -->
  <header class="header-section">
		<div class="header-top">
            <div class="container">
	             <div class="ht-right" align="right">
	                    <li>
		                   	 <c:if test="${empty sessionScope.loginfo}">
		                    	 <a href="<%=contextPath%>/meLogin.me" style="color:#3a4ca8;"><span>
		                        <i class="fa fa-user"></i> &nbsp;로그인 </span> </a>
			                  </c:if> 
			                  <c:if test="${not empty sessionScope.loginfo}" >
			                     <a href="<%=contextPath%>/logout.me" style="color:#3a4ca8;"><span> &nbsp;로그 아웃 </span> </a>
			                  </c:if>
	                  	</li>
	          	</div>
            </div>
        </div>

   			 <div class="container">
	            <div class="inner-header">
               		<div class="col-lg-4 col-md-10 w-50 mx-auto">
                        <div class="logo mb-7 mp-7">
                            <a href="./main.co">
                                <img src="bootstrap/img/logo.png" alt="로고" width="230px" height="70px" align="middle">
                            </a> 
                        </div>
                    </div>
                </div>
	          </div>
            
         
       
        <div class="nav-item">
            <div class="container">
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="./main.co">메인</a></li>
          
                        <li><a href="${contextPath }/mypage.me">마이 페이지</a></li>
                        <li><a href="${contextPath}/meToday.me">오늘의 기록</a></li>

                        <li><a href="#">&emsp;식단&emsp;</a>
                           <ul class="dropdown">
                           <li><a href="${contextPath}/daily.ml">기록</a></li>
                            <li><a href="${contextPath}/mealStats.ml">통계</a></li>
                           </ul>
                        </li>
                        <li><a href="#">&emsp;운동&emsp;</a>
                           <ul class="dropdown">


                           <li><a href="<%=contextPath%>/exRecord.ex">기록</a></li>
                            <li><a href="<%=contextPath%>/exStats.ex">통계</a></li>
                           </ul>
                        </li>
                        
                        <li><a href="<%=contextPath%>/boList.bo">커뮤니티</a></li>
                        <li><a href="<%=contextPath%>/qnaList.qa">Q & A </a></li>
                        
                     </ul>
                  </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
</body>
</html>