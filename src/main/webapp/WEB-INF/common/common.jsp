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


<%	
	// 파일 업로드 관련
	String myurl = request.getRequestURL().toString() ;
	String uri = request.getRequestURI() ;
	int idx = myurl.indexOf( uri ) ;	
	//웹서버에 올릴 이미지의 저장 경로 
	String uploadPath = "/WEB-INF/photo" ;//개발자가 임의 지정 가능
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



<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
    <meta name="description" content="Healthy">
    <meta name="keywords" content="Healthy, Challenge, Meal, Community">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>작심 챌린지</title>

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
    <!-- JQUERY CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
    
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
                <!-- <div class="ht-left">
                    <div class="mail-service">
                        <i class=" fa fa-envelope"></i>
                        hello.colorlib@gmail.com
                    </div>
                    <div class="phone-service">
                        <i class=" fa fa-phone"></i>
                        +65 11.188.888
                    </div>
                </div>  -->
                <div class="ht-right">
                	<div>
                    	<c:if test="${empty sessionScope.loginfo}">
							<a href="${contextPath }/meLogin.me">
								<span style="color:gray;">로그인 </span> 
							</a>
						</c:if> <c:if test="${not empty sessionScope.loginfo}">
							<a href="${contextPath }/logout.me">
								<span style="color:gray;"> 로그아웃 </span> 
							</a>
						</c:if>
					</div>
						
                <!--<div class="lan-selector">
                        <select class="language_drop" name="countries" id="countries" style="width:300px;">
                            <option value='yt' data-image="bootstrap/img/flag-1.jpg" data-imagecss="flag yt"
                                data-title="English">English</option>
                            <option value='yu' data-image="bootstrap/img/flag-2.jpg" data-imagecss="flag yu"
                                data-title="Bangladesh">German </option>
                        </select>
                    </div>
                    <div class="top-social">
                        <a href="#"><i class="ti-facebook"></i></a>
                        <a href="#"><i class="ti-twitter-alt"></i></a>
                        <a href="#"><i class="ti-linkedin"></i></a>
                        <a href="#"><i class="ti-pinterest"></i></a>
                    </div> -->
                </div>
            </div>
        </div> 
        <div class="container">
            <div class="inner-header">
                <div class="row">
                   <!--  <div class="col-lg-2 col-md-2 w-20 mx-auto"> -->
                   <div class="col-lg-2 col-md-2">
	                 <div class="logo">
	                     <a href="./main.co">
	                         <img src="bootstrap/img/logo.png" alt="로고">
	                     </a> 
	                 </div>
	             	</div>
                     <div class="col-lg-6 col-md-6">  
                    <!-- <div class="col-lg-7 col-md-7"> -->
                    </div>
                   <div class="col-lg-3 text-right col-md-3">
                    <!-- <div class="col-lg-4 text-right col-md-4"> -->
                        <ul class="nav-right">
                            <li class="heart-icon"><a href="#">
                                    <i class="icon_heart_alt"></i>
                                    <span>1</span>
                                </a>
                            </li>
                            <li class="cart-icon"><a href="#">
                                    <i class="icon_bag_alt"></i>
                                    <span>3</span>
                                </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="si-pic"><img src="bootstrap/img/select-product-1.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="si-pic"><img src="bootstrap/img/select-product-2.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>total:</span>
                                        <h5>$120.00</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="#" class="primary-btn view-card">VIEW CARD</a>
                                        <a href="#" class="primary-btn checkout-btn">CHECK OUT</a>
                                    </div>
                                </div>
                            </li>
                            <li class="cart-price">$150.00</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>All departments</span>
                        <ul class="depart-hover">
                            <li class="active"><a href="#">Women’s Clothing</a></li>
                            <li><a href="#">Men’s Clothing</a></li>
                            <li><a href="#">Underwear</a></li>
                            <li><a href="#">Kid's Clothing</a></li>
                            <li><a href="#">Brand Fashion</a></li>
                            <li><a href="#">Accessories/Shoes</a></li>
                            <li><a href="#">Luxury Brands</a></li>
                            <li><a href="#">Brand Outdoor Apparel</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="./main.co">메인</a></li>
                        <li><a>일일 기록</a>
                            <ul class="dropdown">
                                <li><a href="#">Men's</a></li>
                                <li><a href="#">식단 일일기록</a></li>
                                <li><a href="#">운동 일일기록</a></li>
                                <li><a href="#">Kid's</a></li>
                                <li><a href="#">Kid's</a></li>
                            </ul>
                        </li>
                        <li><a href="#">나의 챌린지</a></li>
                        <li><a href="./blog.html">챌린지 참여</a>
                        	<ul class="dropdown">
                                <li><a href="#">대기중</a></li>
                                <li><a href="#">진행중</a></li>
                                <li><a href="#">종료</a></li>
                            </ul>
                        </li>
                        <li><a href="<%=contextPath%>/boList.bo">커뮤니티</a></li>
                        
                        <li><a href="#">Q & A</a>
                            <ul class="dropdown">
                                <li><a href="./blog-details.html">Blog Details</a></li>
                                <li><a href="./shopping-cart.html">Shopping Cart</a></li>
                                <li><a href="./check-out.html">Checkout</a></li>
                                <li><a href="./faq.html">Faq</a></li>
                                <li><a href="./register.html">Register</a></li>
                                <li><a href="./login.html">Login</a></li>
                            </ul>
                        </li>
                 	 </ul>
               	 </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
        
</body>
</html>