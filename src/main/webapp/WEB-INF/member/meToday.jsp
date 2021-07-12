<%@page import="dao.MemberDao" %>
<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
		textarea {
		    resize: none;
		}
		
		/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
		.ui-datepicker-trigger{cursor: pointer;}
		/*datepicer input 롤오버 시 손가락 모양 표시*/
		.hasDatepicker{cursor: pointer;}
	</style>

    <title>식단기록</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
     
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawMaterial);

    function drawMaterial() {
    	console.log('${fcal}')
    	console.log('${ecal}')
    	
    	var fcal = Number ('${fcal}')
    	var ecal = Number ('${ecal}')
          var data = google.visualization.arrayToDataTable([
            ['', '섭취 칼로리', '소모 칼로리'],
            ['칼로리(kcal)', fcal, ecal],
            
          ]);

          var materialOptions = {
            chart: {
              title: '하루 섭취, 소비 칼로리를 한눈에 확인하세요 :)'
            },
            hAxis: {
              title: 'Total Population',
              minValue: 0,
            },
            vAxis: {
              title: 'City'
            },
            bars: 'horizontal',
            height :160,
            width :'100%',


          };
          var materialChart = new google.charts.Bar(document.getElementById('chart_div'));
          materialChart.draw(data, materialOptions);
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
                        <a href="${contextPath}/main.co"><i class="fa fa-home"></i> 메인</a>         
                        <a href="${contextPath}/meToday.me"> 오늘의 기록</a>
                        
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
                      
                    </div>
                </div>
                
                
                <div class="col-lg-9 order-1 order-lg-2">
                
                 <div class="row">
					   			&nbsp;&nbsp;&nbsp;&nbsp;
						   		<h2 id="dateValue" class="mb-0"></h2>
						   		&nbsp;&nbsp;&nbsp;&nbsp;
						   		<input type="hidden" name="regdate" id="datepicker">
					   		</div>
                <br>
                <br>
                <br>
      <div id="chart_div" style="width: 900px; height: 550px; "></div>
  
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
	            ,buttonText: "날짜선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
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
	        	location.href='${contextPath}/meToday.me?regdate='+$('#datepicker').val();
	        })  
	    });
	    
	    
	    function addData(time){
	    		//alert(time)
	    	   	location.href='${contextPath}/meToday.me.ex?time='+time+'&regdate='+$('#datepicker').val()+'&email='+'${loginfo.email}';
	    }
	</script>
</body>
</html>