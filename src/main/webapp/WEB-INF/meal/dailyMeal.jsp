<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		textarea {
		    resize: none;
		}
		
		/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
		.ui-datepicker-trigger{cursor: pointer;}
		/*datepicer input 롤오버 시 손가락 모양 표시*/
		.hasDatepicker{cursor: pointer;}
	</style>
</head>
<body>
 <!-- Breadcrumb Section Begin -->
   <div class="breacrumb-section">
       <div class="container">
           <div class="row">
               <div class="col-lg-12">
                   <div class="breadcrumb-text product-more">
                       <a href="${contextPath }/main.co"><i class="fa fa-home"></i> 메인</a>
                       <a href="#"> 식단</a>
                       <span>기록</span>
                   </div>
               </div>
           </div>
       </div>
   </div>
   
  <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
                    <div class="blog-sidebar">
                      
                        <div class="blog-catagory">
                            <h4>식단</h4>
                            <ul>
                                <li><a href="<%=contextPath%>/daily.ml">기록</a></li>
                            <li><a href="<%=contextPath%>/exStats.ex">통계</a></li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-9 order-1 order-lg-2">
                    
                      <div class="container">
					   		<div class="row">
					   			&nbsp;&nbsp;&nbsp;&nbsp;
						   		<h2 id="dateValue" class="mb-0"></h2>
						   		&nbsp;&nbsp;&nbsp;&nbsp;
						   		<input type="hidden" name="regdate" id="datepicker">
					   		</div>
					   		<hr>
					   		<br>
					   		<div>
						   		<br>
					   			<div class="d-flex flex-wrap justify-content-around" align="center">
						   			<div class="shadow p-4 mb-4 bg-white" style="width:40%;height:300px;">
						   				<h3 align="center">아침</h3>
						   				<c:if test="${empty breakfast}">
						   					<div class="mb-3 rounded border" style="width:100%;height:55%;background:#F8F8F8;"><span style="font-size:4.5em;">0</span><span class="text-center" style="font-size:2em;">Kcal</span></div>
						   					<button style="width:100%;height:25%;" class="btn btn-outline-info" onclick="addData('아침');">등록</button>
						   				</c:if>
						   				<c:if test="${not empty breakfast}">
						   					<div class="mb-3 rounded border" style="width:100%;height:55%;background:#F8F8F8;"><span style="font-size:4.5em;">${breakfast.total_calorie }</span><span class="text-center" style="font-size:2em;">Kcal</span></div>
						   					<button style="width:100%;height:25%;" class="btn btn-info" onclick="location.href='${contextPath}/dailyUpdateData.ml?meal_seq=${breakfast.meal_seq}'">수정</button>
						   				</c:if>
						   			</div>
						   			<div class="shadow p-4 mb-4 bg-white" style="width:40%;height:300px;">
						   				<h3 align="center">점심</h3>
						   				<c:if test="${empty lunch}">
						   					<div class="mb-3 rounded border" style="width:100%;height:55%;background:#F8F8F8;"><span style="font-size:4.5em;">0</span><span class="text-center" style="font-size:2em;">Kcal</span></div>
						   					<button style="width:100%;height:25%;" class="btn btn-outline-info" onclick="addData('점심');">등록</button>
						   				</c:if>
						   				<c:if test="${not empty lunch}">
						   					<div class="mb-3 rounded border" style="width:100%;height:55%;background:#F8F8F8;"><span style="font-size:4.5em;">${lunch.total_calorie }</span><span class="text-center" style="font-size:2em;">Kcal</span></div>
						   					<button style="width:100%;height:25%;" class="btn btn-info" onclick="location.href='${contextPath}/dailyUpdateData.ml?meal_seq=${lunch.meal_seq}'">수정</button>
						   				</c:if>
						   			</div>
						   			<div class="shadow p-4 mb-4 bg-white" style="width:40%;height:300px;">
						   				<h3 align="center">저녁</h3>
						   				<c:if test="${empty dinner}">
						   					<div class="mb-3 rounded border" style="width:100%;height:55%;background:#F8F8F8;"><span style="font-size:4.5em;">0</span><span class="text-center" style="font-size:2em;">Kcal</span></div>
						   					<button style="width:100%;height:25%;" class="btn btn-outline-info" onclick="addData('저녁');">등록</button>
						   				</c:if>
						   				<c:if test="${not empty dinner}">
						   					<div class="mb-3 rounded border" style="width:100%;height:55%;background:#F8F8F8;"><span style="font-size:4.5em;">${dinner.total_calorie }</span><span class="text-center" style="font-size:2em;">Kcal</span></div>
						   					<button style="width:100%;height:25%;" class="btn btn-info" onclick="location.href='${contextPath}/dailyUpdateData.ml?meal_seq=${dinner.meal_seq}'">수정</button>
						   				</c:if>
						   			</div>
						   			<div class="shadow p-4 mb-4 bg-white" style="width:40%;height:300px;">
						   				<h3 align="center">간식</h3>
						   				<c:if test="${empty refreshments}">
						   					<div class="mb-3 rounded border" style="width:100%;height:55%;background:#F8F8F8;"><span style="font-size:4.5em;">0</span><span class="text-center" style="font-size:2em;">Kcal</span></div>
						   					<button style="width:100%;height:25%;" class="btn btn-outline-info" onclick="addData('간식');">등록</button>
						   				</c:if>
						   				<c:if test="${not empty refreshments}">
						   					<div class="mb-3 rounded border" style="width:100%;height:55%;background:#F8F8F8;"><span style="font-size:4.5em;">${refreshments.total_calorie }</span><span class="text-center" style="font-size:2em;">Kcal</span></div>
						   					<button style="width:100%;height:25%;" class="btn btn-info" onclick="location.href='${contextPath}/dailyUpdateData.ml?meal_seq=${refreshments.meal_seq}'">수정</button>
						   				</c:if>
						   			</div>
						   		</div>
						   		<hr>
						   		<br>
						   		<div class="row">
							   		<div class="offset-5 col-3"><h2 class="mb-4" align="right">총 칼로리 : </h2></div>
							   		<div class="col-2" align="right"><h1 class="mb-6">${breakfast.total_calorie + lunch.total_calorie + dinner.total_calorie + refreshments.total_calorie}</h1></div>
							   		<div class="col-2" align="left"><h3 class="mb-0">Kcal</h3></div>
						   		</div>
						   		<hr>
					   		</div>
					   </div>

                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
    

   <%@ include file="../common/footer.jsp" %>
   	
    <script>
	    $(function() {
	        //input을 datepicker로 선언
	        $("#datepicker").datepicker({
	            dateFormat: 'yy/mm/dd' //Input Display Format 변경
	            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	            ,changeYear: true //콤보박스에서 년 선택 가능
	            ,changeMonth: true //콤보박스에서 월 선택 가능                
	            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	            ,buttonImage: "${contextPath}/bootstrap/img/calendar.png" //버튼 이미지 경로
	            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	            ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	        });                    
	        
	        //초기값을 오늘 날짜로 설정
	        //$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)    
	        $('#datepicker').val('${regdate}');    
	        $('#dateValue').text($('#datepicker').val());
	        
	        $(document).on("change",'#datepicker', function(){
	        	$('#dateValue').text($('#datepicker').val());
	        	location.href='${contextPath}/daily.ml?regdate='+$('#datepicker').val();
	        })  
	    });
	    
	    
	    function addData(time){
	    		//alert(time)
	    	   	location.href='${contextPath}/dailyAddData.ml?time='+time+'&regdate='+$('#datepicker').val()+'&email='+'${loginfo.email}';
	    }
	</script>
</body>
