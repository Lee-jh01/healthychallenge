<%@include file="../common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
	// 마우스 관련
/* 	function clickEffect(e){  
		 var d=document.createElement("div"); 
		  d.className="clickEffect";
		  d.style.top=e.clientY+"px";d.style.left=e.clientX+"px"; 
		  document.body.appendChild(d);  
		  d.addEventListener('animationend',function(){
			 d.parentElement.removeChild(d);
			 }.bind(this)); }
		document.addEventListener('click',clickEffect);
 */
	
		// 초기화
	   $(function () {  
	      $('[data-toggle="popover"]').popover();   
	      var html = '';
	      var pageindex = 0;
	      var nowhtml = '';
	      getStar();
	      
	      //tab 관련
	      $('ul.tabs li').click(function(){
	          var tab_id = $(this).attr('data-tab');
	   
	          $('ul.tabs li').removeClass('current');
	          $('.tab-content').removeClass('current');
	   
	          $(this).addClass('current');
	          $("#"+tab_id).addClass('current');
	      })
		
	      
	      //table -> json
	      function tableToJson(table){
	    	  var data = [];
	    	  
	    	  var headers = [];
			  for(var i=0; i<table.rows[0].cells.length; i++){
				  headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace();
			  }	    	  
			  
			  for(var j=0; j<tableRow.cells.length; j++){
				  rowData[headers[j]] = tableRow.cells[j].innerHTML;
			  }
	      }
	      //즐겨찾기 등록
	      $(document).on("click",'#myFoodTo', function(){  
	    	  //alert('왔다')
	    	  
	    	  var row = [];
	    	  $("#nowMealTable tr").each(function(){
	    		  var tr5 = $(this);
	    		  var td5 = tr5.children();
	    		  
	    		  row.push({
	    			  "food_name" : td5.eq(0).text(),
	    			  "how" : td5.eq(1).text(),
	    			  "serving_wt" : td5.eq(2).text(),
	    			  "calorie" : td5.eq(3).text(),
	    			  "carbohydrate" : td5.eq(4).text(),
	    			  "protein" : td5.eq(5).text(),
	    			  "fat" : td5.eq(6).text(),
	    			  "Na" : td5.eq(7).text()
	    		  });
	    	  });
	    	  console.log(row)
	    	  var model = {
    			  row : row,
    			  "email" : '${sessionScope.loginfo.email}'
	    	  }
	    	  
	    	 console.log(model)
	    	  $.ajax({
	    		  url : '${contextPath}/pushMyFood.ml',
	    		  data : JSON.stringify(model),
	    		  type : 'POST',
	    		  contentType: 'application/json; charset=UTF-8',
	    		  async : false,
	    		  success : function(data){
	    			  console.log(data);
	    			  alert('성공!')
	    			  getStar();
	    		  },error : function(err){
					  console.log("error발생"+err);
				  }
	    	  })  
	      })
	      
	      //식사 등록
	      $(document).on("click",'#mealMemoryTo',function(){
	    	  alert('히히')
	      })
	    
	      //나만의 식품 등록
	      $(document).on("click", "#myfoodAdd", function(){
	    	  $('#myfoodModal').modal();
	      })	      
	      		
		// 체크된 즐겨찾기 항목 삭제
		$(document).on("click","#deleteStar",function(){
			var tdArr = new Array();
			
			var checkbox = $('input[name=starcheck]:checked');
			
			// 체크된 체크박스 값을 가져 온다.
			checkbox.each(function(i){
				
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				var no = td.eq(1).text();
				tdArr.push(no);
				console.log(tdArr);
			})
			
			$.ajax({
				type : "post",
				url : '${contextPath}/deleteStar.ml',
				data: {"arr":tdArr},
				success : function(data){
					alert('삭제 완료')
				},error : function(err){
					console.log("error발생"+err);
				}
			})
			getStar();
		})
	       
	      
	      
	      //now 삭제 버튼
         	 $(document).on("click",".nowbutton",function(){ 
             
             var str = ""
             var tdArr = new Array();    // 배열 선언
             var nowbutton = $(this);
             
             // checkBtn.parent() : checkBtn의 부모는 <td>이다.
             // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
             var tr = nowbutton.parent().parent();
             var td = tr.children();
             
             console.log("클릭한 Row의 모든 데이터 : "+tr.text());
             
             tr.remove();
       	  }); 
	      
	      //now + 버튼
	      	$(document).on("click",".nowplus",function(){
	      		var plusbutton = $(this);
	      		var tr = plusbutton.parent().parent();
	      		var td = tr.children();
	      		td.find('span').text((Number(td.find('span').text())+0.5))
	      	});
	      //now - 버튼
	      	$(document).on("click",".nowminus",function(){
	      		var minusbutton = $(this);
	      		var tr = minusbutton.parent().parent();
	      		var td = tr.children();
	      		if((Number(td.find('span').text())) > 0){
	      			td.find('span').text((Number(td.find('span').text())-0.5))
	      		}
	      	});
	      
	      
	      // 검색 tr 클릭시
	      $(document).on("click","#result_table tr",function(){
	    	  var str = "";
     			 var tdArr = new Array();
     			 
     			 // 현재 클릭된 Row(<tr>)
     			 var tr = $(this);
      			 var td = tr.children();
     			 
     			 // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다
     			 console.log("클릭한 Row의 모든 데이터 : "+tr.text());
     			 
     			 // 반복문을 이용해서 배열에 값을 담아 사용할 수도 있다.
     			 td.each(function(i){
     				 tdArr.push(td.eq(i).text());
     			 })
     			 console.log("배열에 담긴 값 : "+ tdArr);
     			 //console.log(JSON.stringify(tdArr))
     			 
     			
     			 nowhtml += '<tr>';
     		    nowhtml +='<td>'+tdArr[0]+'</td>';
     		    nowhtml +='<td><span class="how" style="color:blue;">1</span></td>'
     		    nowhtml +='<td>'+tdArr[1]+'</td>';
     		    nowhtml +='<td>'+tdArr[2]+'</td>';
     		    nowhtml +='<td>'+tdArr[3]+'</td>';
     		    nowhtml +='<td>'+tdArr[4]+'</td>';
     		    nowhtml +='<td>'+tdArr[5]+'</td>';
     		    nowhtml +='<td>'+tdArr[6]+'</td>';
     			
     			nowhtml += '<td><input type="button" class="nowplus btn btn-outline-success" value="+" /></td>' 
     			nowhtml += '<td><input type="button" class="nowminus btn btn-outline-danger" value="-" /></td>' 
     			nowhtml += '<td><input type="button" class="nowbutton btn btn btn-outline-dark" value="삭제" /></td>' 
     			nowhtml += '</tr>';
     			 
            	  $("#nowMealTable").empty();
                  $("#nowMealTable").append(nowhtml); 

		})	
		
		 // 즐겨찾기 tr 클릭시!
	      $(document).on("click","#starTable tr",function(){
	    	 var str2 = "";
   			 var tdArr2 = new Array();
   			 
   			 // 현재 클릭된 Row(<tr>)
   			 var tr2 = $(this);
    	    var td2 = tr2.children();
   			 
   			 // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다
   			 console.log("클릭한 Row의 모든 데이터 : "+tr2.text());
   			 
   			 // 반복문을 이용해서 배열에 값을 담아 사용할 수도 있다.
   			 td2.each(function(i){
   				 tdArr2.push(td2.eq(i).text());
   			 })
   			 console.log("배열에 담긴 값 : "+ tdArr2);
   			 //console.log(JSON.stringify(tdArr2))
   			 
   			
   			 nowhtml += '<tr>';
   		    nowhtml +='<td>'+tdArr2[2]+'</td>';
   		    nowhtml +='<td><span class="how" style="color:blue;">1</span></td>'
   		    nowhtml +='<td>'+tdArr2[3]+'</td>';
   		    nowhtml +='<td>'+tdArr2[4]+'</td>';
   		    nowhtml +='<td>'+tdArr2[5]+'</td>';
   		    nowhtml +='<td>'+tdArr2[6]+'</td>';
   		    nowhtml +='<td>'+tdArr2[7]+'</td>';
   		    nowhtml +='<td>'+tdArr2[8]+'</td>';
   			
   			nowhtml += '<td><input type="button" class="nowplus btn btn-outline-success" value="+" /></td>' 
   			nowhtml += '<td><input type="button" class="nowminus btn btn-outline-danger" value="-" /></td>' 
   			nowhtml += '<td><input type="button" class="nowbutton btn btn btn-outline-dark" value="삭제" /></td>' 
   			nowhtml += '</tr>';
   			 
          	  $("#nowMealTable").empty();
                $("#nowMealTable").append(nowhtml); 

		})	
	      

	      

	   }) //document-ready 끝
	
		function nextPage(){
			pageindex ++;
			ajax_result(pageindex);
			//alert('아아아')
		}
		
	  	function foodSearch(){
		 	//alert($('#keyword').val())
    	  	html = '';
		  	pageindex = 1;
		 	ajax_result(pageindex);
		 
		}
	  	
		function ajax_result(pagenum){
			//alert(pageindex);
	         $.ajax({
	              method: "GET",
	              url: "https://cors-anywhere.herokuapp.com/http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=5fWRbym0%2F05%2FcoXljBLcKZaGa3%2ByZtakSHLgMGaRj8YlbtdmVU94ObW5mvEVdM3kRcL5TmqGAAJrywPzRSXp9w%3D%3D&type=json",                              
	              data: { desc_kor: $("#keyword").val(), pageNo: pagenum },
	              success: (function(msg) {
	            	  //console.log(msg)
	            	  //console.log(msg.body.items)
	            	  //console.log(msg.body.totalCount)
	            	  //console.log(msg.body.numOfRows)
	            	  if(msg.body.items == null){
	            		  alert('검색 결과가 없습니다')
	            	  }else{
		            	  var length = msg.body.items.length;
		            	  var item = msg.body.items;
		            	  for (var i =0; i<length; i++){
		            		   html += '<tr>';
		                       html += '<td>'+item[i].DESC_KOR+'</td>';
		                       html += '<td>'+item[i].SERVING_WT+'</td>';
		                       html += '<td>'+item[i].NUTR_CONT1 +'</td>';
		                       html += '<td>'+item[i].NUTR_CONT2 +'</td>';
		                       html += '<td>'+item[i].NUTR_CONT3 +'</td>';
		                       html += '<td>'+item[i].NUTR_CONT4 +'</td>';
		                       html += '<td>'+item[i].NUTR_CONT6 +'</td>';
		                       html += '</tr>'
		            	  } 
		            	  $("#dynamicTbody").empty();
		                  $("#dynamicTbody").append(html); 
		         
	            	 	 }<!--else 끝-->
              		})
           		})
		}//ajax_result 끝
           		
		
		function getStar(){
		//alert('${sessionScope.loginfo.email}')
		$("#starTable").empty();
		   $.ajax({
	              type: "post",
	              url : '${contextPath}/getStar.ml' ,
	              data: {'email': '${sessionScope.loginfo.email}' },
	              dataType : 'json',
	              success: function(data){
	            	 	//console.log(JSON.stringify(data)) 
	            	 	console.log(data.list)
	            	 	$.each(data.list, function(index, items){
	            	 			console.log(items.food_name)
	            	 			   var shtml = '';
	            	 			   shtml += '<tr>';
	            	 			   shtml += '<td><input type="checkbox" name="starcheck" onclick="event.cancelBubble=true;"></td>';
			                       shtml += '<td style="display:none;">'+items.mf_seq+'</td>';
			                       shtml += '<td>'+items.food_name+'</td>';
			                       shtml += '<td>'+items.serving_wt+'</td>';
			                       shtml += '<td>'+items.calorie +'</td>';
			                       shtml += '<td>'+items.carbohydrate+'</td>';
			                       shtml += '<td>'+items.protein+'</td>';
			                       shtml += '<td>'+items.fat+'</td>';
			                       shtml += '<td>'+items.na+'</td>';
			                       shtml += '</tr>'
			                       
			                       $("#starTable").append(shtml); 

	            	 		})
	            	 	},error: function(err){
	            		 console.log("error발생"+err);
	             	 } 
	              })
			}
		
		function myfoodform_ajax(){
			var queryString = $('form[name=myfood_form]').serialize();
			console.log(queryString)
			$.ajax({
				async: false,
				type : 'post',
				url : '${contextPath}/addStar.ml',
				data : queryString,
				error : function(err){
					console.log("error발생"+err);
					alert('등록 실패')
					$('#myfoodModal').modal("hide")
				},
				success : function(data){
					alert('등록 되었습니다');
					$('#myfoodModal').modal("hide")
					getStar();
				}
			})
		}
		
		
		
		
		
		
	</script>
	<style type="text/css">
/*  		#table-wrapper{
			height: 500px;
			overflow : auto;
		}  */
		#tabmenu{
			position:relative;
			text-align: center;
		} 
		ul.tabs{
			margin: 0px;
		    padding: 0px;
		    list-style: none;
		}
		ul.tabs li{
		    background: none;
		    color: #222;
		    display: inline-block;
		    height: 50px;
		    width: 200px; 
		    border-radius: 100px;
		    text-align: center;
		    cursor: pointer;
		    font-size : 2em;
		}
		ul.tabs li.current{
		    background: #f8f8f0;
		    color: #e7ab3c;
		}
		.tab-content{
			border-radius: 10px;
		    margin-top: 10px;
		    display: none;
		    background: #f8f8f0;
		    padding: 15px;
		    height: 100%;
		}
		.tab-content.current{
		    display: inherit;
		}
		
		
		
		/*마우스 클릭 효과*/ 
		/*div.clickEffect{ 
			position:fixed; 
			box-sizing:border-box;
			border-style:solid;
			border-color:#828282;
			border-radius:50%;
			animation:clickEffect 0.8s ease-out; z-index:5; 
		} 
		
		@keyframes clickEffect{ 
			0%{ 
				opacity:1; 
				width:0.5em; 
				height:0.5em; 
				margin:-0.25em; 
				border-width:0.3rem; 
			} 
			
			100%{ 
				opacity:0.1; 
				width:15em; 
				height:15em;
				margin:-7.5em; 
				border-width:0.01rem; 
			}
		} */
			 

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
    <!-- Breadcrumb Section Begin -->
	<br>
	<br>
	
	
        <div class="container">
                <div style="min-height:1000px;">
                    <div class="col-lg-12">
                    
                    <div>
	                    <!-- 탭 메뉴 -->
	                    <ul class="tabs" id="tabmenu">
					        <li class="tab-link current" data-tab="tab-1">식품 검색</li>
					        <li class="tab-link" data-tab="tab-2">즐겨찾기</li>
					    </ul>
 					</div>	
					 <!-- 탭메뉴 1 -->
					    <div id="tab-1" class="tab-content current">             
			               <h4 class="mb-4">식품 키워드를 입력해주세요</h4>
			                        <div class="row">
			                        	<div class="col-lg-6">
			                        		<input type="text" class="form-control" name="keyword" id="keyword" placeholder = "식품 키워드를 입력해주세요">
			                        	</div>
			                        	<div class="col=lg-3">
			                        		<input class="btn btn-warning form-control" type="button" name="search" id="search" value="검색" onclick="foodSearch();">
			                        	</div>
			                        </div>
			                        <br>
			                        <div id="table-wrapper">
			                        	<table class="table table-bordered table-hover" id="result_table">
			                        		<thead align="center" class="mt-0 table-warning">
			                        			<tr>
			                        				<th>음식명</th>
			                        				<th>1회 제공량(g)</th>
			                        				<th>열량(kcal)</th>
			                        				<th>탄수화물(g)</th>
			                        				<th>단백질(g)</th>
			                        				<th>지방(g)</th>
			                        				<th>나트륨(mg)</th>
			                        			</tr>
			                        		</thead>
			                        		<tbody id="dynamicTbody" class="table" style="min-height:500px;" align="center" data-toggle="popover" data-trigger="hover" data-content="클릭하면 데이터가 추가됩니다">
			                        			
			                        		</tbody>
			                        	</table>
			                        	<div align="center">
			                        		<a href="#" onclick="nextPage();"><img alt="화살표" src="${contextPath}/picture/arrow.png" style="width:5%;" data-toggle="popover" data-trigger="hover" data-content="검색 결과 +"></a>
						              	</div>
                        			 </div>   
                       		</div>
                       		<!-- 탭메뉴2 -->
						    <div id="tab-2" class="tab-content">
						    	<h4>나의 즐겨찾기</h4>
						    	<div align="right" class="mb-2">
						    		<input type="button" class="btn btn-light" value="나만의 식품 등록" id="myfoodAdd">
						    	</div>
						    	<table class="table table-hover">
						    		<thead align="center">
						    			<tr>
						    				<th>선택</th>
						    				<th>음식명</th>
	                        				<th>1회 제공량(g)</th>
	                        				<th>열량(kcal)</th>
	                        				<th>탄수화물(g)</th>
	                        				<th>단백질(g)</th>
	                        				<th>지방(g)</th>
	                        				<th>나트륨(mg)</th>
						    			</tr>
						    		</thead >
						    		<tbody id="starTable" align="center" data-toggle="popover" data-trigger="hover" data-content="클릭하면 데이터가 추가됩니다">
						    		</tbody>
						    	</table>
						    	<div align="left">
						    		<input type="button" id="deleteStar" class="btn btn-light" value="선택 삭제" ">
						    	</div>
						    </div>
						<br>
						<br>
                		<!-- 탭 아닌 부분 -->
                		<div>
                			<div class="border shadow-sm p-4 mb-4 bg-white">
                				<h4>식품 목록</h4>
                					<table class="table table-default table-striped">
                						<thead align="center">
                							<tr>
	                							<td>식품명</td>
	                							<td width="10%">몇인분</td>
	                							<td>1회 제공량(g)</td>
	                							<td>열량(kcal)</td>
	                							<td>탄수화물(g)</td>
	                							<td>단백질(g)</td>
	                							<td>지방(g)</td>
	                							<td>나트륨(mg)</td>
	                							<td>추가</td>
	                							<td>감소</td>
	                							<td>삭제</td>
                							</tr>	
                						</thead>
										<tbody id="nowMealTable" align="center">
											
										</tbody>                						
                					</table>
                					<div id="nowresult" class="text-right" style="font-size:2em;"></div>
                					<div class="row">
	                					<button class="btn btn-primary form-control offset-2 col-lg-3" id="mealMemoryTo">식사 등록</button>
	                					<button class="btn btn-danger form-control offset-2 col-lg-3" id="myFoodTo">즐겨찾기 등록</button>
                					</div>
                			</div>
                		</div>
                    </div>
                </div>
        </div>
  <br>
  <br>
  
   <!-- 나만의 식품 등록 -->
  <div class="modal fade" id="myfoodModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">나만의 식품 등록</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	
        	<form id="myfood_form" name="myfood_form" method="post">
        		<table>
        			<tr align="left">
        				<td width="5%"></td>
        				<td width="40%">식품명 :</td>
        				<td><input type="text" name="food_name" placeholder="고구마,마른것"></td>
        			</tr>
        			<tr align="left">
        				<td width="5%"></td>
        				<td width="40%">1회 제공량(g) :</td>
        				<td> <input type="text" name="serving_wt" placeholder="100"></td>
        			</tr>
        			<tr align="left">
        				<td width="5%"></td>
        				<td width="40%">열량(kcal) :</td>
        				<td> <input type="text" name="calorie" placeholder="221.00"></td>
        			</tr>
        			<tr align="left">
        				<td width="5%"></td>
        				<td width="40%">탄수화물(g) :</td>
        				<td><input type="text" name="carbohydrate" placeholder="75.70"></td>
        			</tr>
        			<tr align="left">
        				<td width="5%"></td>
        				<td width="40%">단백질 (g) :</td>
        				<td><input type="text" name="protein" placeholder="2.30"></td>
        			</tr>
        			<tr align="left">
        				<td width="5%"></td>
        				<td width="40%">지방 (g) :</td>
        				<td><input type="text" name="fat" placeholder="0.10"></td>
        			</tr>
        			<tr align="left">
        				<td width="5%"></td>
        				<td width="40%">나트륨 (mg) :</td>
        				<td><input type="text" name="Na" placeholder="0.00"></td>
        			</tr>
        		</table>
        		<input type="hidden" name="email" value="${loginfo.email}">
        		<hr>
        		<input type="button" onclick="myfoodform_ajax();" class="btn btn-danger" style="width:100%;" value="등록">
        	</form>
        </div>
      </div>
    </div>
  </div>
  
  
<%@ include file="../common/footer.jsp" %>
</body>
</html>