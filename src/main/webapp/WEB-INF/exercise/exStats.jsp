<%@page import="dao.ExerciseDao" %>
<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">


    <title>운동기록</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
     
    google.charts.load('current', {'packages':['corechart'] }  );
    //google.charts.load('current', {'packages':['bar']}); 
    
    google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable(
        	${str}	
        );

        var options = {
          title: '상품가격 비율'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
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
                        <span>운동 통계</span>
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
                            <h4>카테고리</h4>
                            <ul>
                                <li><a href="<%=contextPath%>/exRecord.ex">기록</a></li>
                            <li><a href="<%=contextPath%>/exStats.ex">통계</a></li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-9 order-1 order-lg-2">
                
                
    <div id="piechart" style="width: 900px; height: 500px;"></div>
   
  <div style="background-color: white;">
  	
  </div>
                
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->



<%@ include file="../common/footer.jsp" %> 
</body>
</html>