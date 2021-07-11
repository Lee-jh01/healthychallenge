<%@page import="dao.ExerciseDao" %>
<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">


    <title>운동기록</title>

    <style type="text/css">
		textarea {
		    resize: none;
		}
		
		/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
		.ui-datepicker-trigger{cursor: pointer;}
		/*datepicer input 롤오버 시 손가락 모양 표시*/
		.hasDatepicker{cursor: pointer;}
		
		
		#exResultTable {
		  border-collapse: separate;
		  border-spacing: 0px 10px;
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
                        <span>운동 기록</span>
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
                    	<div class="container">
					   		<div class="row">
					   			&nbsp;&nbsp;&nbsp;&nbsp;
						   		<h2 id="dateValue" class="mb-0"></h2>
						   		&nbsp;&nbsp;&nbsp;&nbsp;
						   		<input type="hidden" name="regdate" id="datepicker">
					   		</div>
					   		<hr>
					   		 <h2>운동 찾기</h2>
							  <p>찾으시는 운동을 입력한 후 선택해주세요 :)</p>  
							  <input class="form-control" id="myInput" type="text" placeholder="Search..">
							  <br>
					   		<div id="tableLayer" style="overflow-x:hidden; overflow-y:scroll; height:300px;">
						   		<table class="table table-borderd">
						   			<tbody id = "exTable">
						   				<c:forEach var="ex" items="${elist}">
											<tr>
												<td style="display:none">${ex.ex_seq}</td>
												<td>${ex.ename}</td>
												<td style="display:none">${ex.METs}</td>
												<td><input type="button" class="btn btn-outline-dark exBtn" value="선택"></td>
											</tr>
						   				</c:forEach>
						   			</tbody>
						   		</table>
					   		</div>
					   		<br>
					   		<hr>
					   		<table class="table table-bordered" style="border:3px solid black;" id = "registerTable">
					   			
					   		</table>
					   		<hr>
					   		<h2>오늘의 운동</h2>
							<p> X 를 누르면 목록에서 삭제 됩니다. :)</p>  
					   		<div class="shadow-lg p-4 mb-4 bg-white lign-middle">
					   				<table class="table table-default" id="exResultTable">
					   					<tbody id="joinList">
						   					
					   					</tbody>
										<tr>
											<td colspan="2"></td>
											<td colspan="2" align="right"><h2 id="calResult"></h2></td>
										</tr>
					   				</table>
					   		</div>
                	</div>
            	</div>
        </div>
    </section>
    <!-- Blog Section End -->

	<script type="text/javascript">
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
        	location.href='${contextPath}/exRecord.ex?regdate='+$('#datepicker').val();
        })  
      
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#exTable tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        
        $(document).on("keyup",'#minInput', function(){
        	var mets = Number($("#InputMETs").text())
        	var weight = Number('${loginfo.weight}')
        	var min = Number($("#minInput").val())
        	var calcalorie = 3.5 * mets * weight * 0.005 * min
        	$('#kcalResult').text(calcalorie+'kcal')
        })
        
        // exBtn 클릭시
      	$(document).on("click",".exBtn",function(){
      		var exbutton = $(this);
      		var tr = exbutton.parent().parent();
      		//console.log(tr);
      		var td = tr.children();
      		//console.log(td)
      
      		rehtml = '';
      		rehtml += '<tr align="center">';
      		rehtml += '<td style="display:none;" id="exSInput">'+td.eq(0).text()+'</td>';
      		rehtml += '<td width="300px;">'+td.eq(1).text()+'</td>';
      		rehtml += '<td id="InputMETs" style="display:none;">'+td.eq(2).text()+'</td>';
      		rehtml += '<td width="150px;"><input class="form-control" type="text" name="time" id="minInput" placeholder="시간(분) 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,\'\');" /></td>';
      		rehtml += '<td width="250px;"><h3 id="kcalResult">0kcal</h3></td>'
      		rehtml += '<td width="40px;"><input type="button" class="btn btn-warning" id="addbutton" value="추가"> </td>';
      		rehtml += '</tr>'
      			
        	$("#registerTable").empty();
            $("#registerTable").append(rehtml);  
      	});
        
        // addBtn 클릭시
        $(document).on("click","#addbutton",function(){
        	$.ajax({
        		url : '${contextPath}/exrAdd.ex',
        		data : {'em_seq':'${em_seq}', 'ex_seq' : $('#exSInput').text(), 'how' : $('#minInput').val(), 'calorie' : $('#kcalResult').text()},
        		type : 'post',
        		success : function(data){
        			console.log(data);
        		},error : function(err){
        			console.log("error 발생"+err);
        		}
        	})
			location.href='${contextPath}/exRecord.ex?regdate='+$('#datepicker').val()
        });
        
        // erDelete 클릭시
        $(document).on("click", '#erDelete', function(){
        	var erdeletebtn = $(this);
        	var ctr = erdeletebtn.parent().parent();
        	var ctd = ctr.children();
        	$.ajax({
        		url : '${contextPath}/erDelete.ex',
        		data : {'ex_seq' : ctd.eq(3).text(), 'em_seq' : ctd.eq(4).text(), 'calorie' : ctd.eq(2).text()},
        		type : 'post',
        		dataType : 'json',
        		success : function(data){
        			console.log(JSON.stringify(data));
        		},error : function(err){
        			console.log('error 발생'+err)
        		}
        	})
        	 location.href='${contextPath}/exRecord.ex?regdate='+$('#datepicker').val()
        })
        getList();
    });
        
	 function getList(){
		 $.ajax({
			 url : '${contextPath}/exJoinList.ex',
			 data : {'em_seq' : '${em_seq}'},
			 type : 'post',
			 dataType : 'json',
			 success : function(data){
				console.log(JSON.stringify(data));
				console.log(data.jlist)
				var jhtml = '';
			 	if(data.jlist.length!=0){
			 		$('#calResult').text(data.jlist[0].total_calorie + 'Kcal')
					 $.each(data.jlist, function(index, items){
						 jhtml +='<tr>';
						 jhtml +='<td width="50%">'+items.ename+'</td>';
						 jhtml +='<td width="20%">'+items.how+'</td>';
						 jhtml +='<td width="20%">'+(Number(items.mets) * 3.5 * Number('${loginfo.weight}') * 0.005 * Number(items.how))+'</td>';
						 jhtml +='<td style="display:none">'+items.ex_seq+'</td>'
						 jhtml +='<td style="display:none">'+items.em_seq+'</td>'
						 jhtml +='<td width="10%"><input type="button" class="btn btn-danger" id="erDelete" value="X"></td>';
						 jhtml +='</tr>';
					 }) 
					 $("#joinList").empty();
					 $('#joinList').append(jhtml);
			 	}else{
				 	$('#calResult').text('0 Kcal')
			 	}
			 },error : function(err){
				 console.log("error 발생"+err);
			 }
		 })	
	 }
	</script>

<%@ include file="../common/footer.jsp" %> 
</body>
</html>