<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% 
    request.setCharacterEncoding("UTF-8"); //한글깨짐 방지 문자셋 설정
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

<%
	String contextPath = request.getContextPath() ;
	//String mappingName = "/Shopping"; //서블릿에 정의되어 있슴
	
	//폼 태그에서 사용할 변수
	//YesForm = contextPath + mappingName ;
	
	//폼이 아닌 곳에서 사용할 변수
	//NoForm = contextPath + mappingName + "?command=" ;
%>

<%	
	// 파일 업로드 관련
	String myurl = request.getRequestURL().toString() ;
	String uri = request.getRequestURI() ;
	int idx = myurl.indexOf( uri ) ;	
	//웹서버에 올릴 이미지의 저장 경로 
	String uploadPath = "/upload" ;//개발자가 임의 지정 가능
	String uploadedFolder 
		= myurl.substring(0, idx) + request.getContextPath() + uploadPath ;	
	String realPath = application.getRealPath( uploadPath ) ;
%>
<% 
	/* out.print( "YesForm : " + YesForm + "<br>") ;
	out.print( "NoForm : " + NoForm + "<br>") ;
	out.print( "myurl : " + myurl + "<br>") ;
	out.print( "uploadedFolder : " + uploadedFolder + "<br>") ;
	out.print( "realPath : " + realPath + "<br>") ; */ 
%>

<%!
	String MakeCommand(String ... args){
		if( args.length == 0 ){
			return YesForm  ;
		}else if( args.length == 1 ){
			return YesForm + "?command=" + args[0]   ;	
		}else{
			String imsi = args[1] ;
			return YesForm + "?command=" + args[0] + "&" + imsi  ;
		}
	}
%>

<c:set var="contextPath" value="<%=request.getContextPath()%>" scope="application"/> 


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="challenge">
    <meta name="keywords" content="healthy, challenge, meal, exercise">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>작심 챌린지</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/c74c7ac0ae.js" crossorigin="anonymous"></script>
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
    
    
</head>

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

 <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
             
               
            </div>
        </div>
    <div class="container">
            <div class="inner-header">
               <div class="col-lg-4 col-md-6 w-50 mx-auto">
                        <div class="logo">
                            <a href="./main.co">
                                <img src="bootstrap/img/logo.png" alt="" width="230px" height="70px" align="middle">
                            </a> 
                        </div>
                    </div>
                   
                </div>
            </div>
            
          <div class="ht-right" align="right">
                    <li><c:if test="${empty sessionScope.loginfo}">
							<a href="<%=contextPath%>/meLogin.me"><span
								class="glyphicon glyphicon-log-in"> 로그인 </span> </a>
						</c:if> <c:if test="${not empty sessionScope.loginfo}">
							<a href="<%=contextPath%>/logout.me"><span
								class="glyphicon glyphicon-log-in"> 로그 아웃 </span> </a>
						</c:if></li>
                </div>
       
        <div class="nav-item">
            <div class="container">
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="./main.co">메인</a></li>
          
                        
                        <li><a href="#">마이 페이지</a></li>
                        <li><a href="#">오늘의 기록</a></li>
                        <li><a href="#">&emsp;식단&emsp;</a>
                        	<ul class="dropdown">
                        	<li><a href="#">기록</a></li>
                            <li><a href="#">통계</a></li>
                        	</ul>
                        </li>
                        <li><a href="#">&emsp;운동&emsp;</a>
                        	<ul class="dropdown">
                        	<li><a href="#">기록</a></li>
                            <li><a href="#">통계</a></li>
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