<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BootStrap Sample</title>
	<script type="text/javascript">
		function gotoBack(){
			location.href='<%=contextPath%>/boList.bo?${requestScope.parameters}';
			//alert('${requestScope.parameter}') ;
		}
	</script>
	<style>
		/* 댓글들을 위한 스타일 지정 */
		* {
			padding: 0;
			margin: 0;
			color: #333;
		}
		ul { list-style: none; }
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
                        <a href="${contextPath}/boList.bo">커뮤니티 게시판</a>
                        <span>상세보기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->
    <br>
    <br>
 	<div class="container">
 		<div class="card">
 			<div class="card-header" style="background-color:white;">
 				<div class="d-flex justify-content-start">
 					<h2>${bean.subject }</h2>
 				</div>
 				<div class="d-flex justify-content-end">
 					<span class="font-weigt-lightr">&nbsp;${bean.regdate}&nbsp;&nbsp;</span>
 					<span class="font-weigt-lightr"><i class="fas fa-user"></i>&nbsp;${bean.email}&nbsp;&nbsp;</span>
 					<span class="font-weigt-lightr"><i class="fas fa-eye"></i>&nbsp;${bean.readhit}</span>
 				</div>
 			</div>
 		 	<div class="card-body">
 				<table class="table table-default">
		 			<tr>
		 				<td>${bean.content }</td>
		 			</tr>
 				</table> 
 			</div> 
 		</div>

				<hr>
					<div class="d-flex">
						<div class="p-2 mr-auto">
							<button class="btn btn-warning" onclick="gotoBack();">목록보기</button>
						</div>
						<div class="p-2">
							<!-- 스크랩 -->
							<iframe name="no_refresh_frame" style="display: none;"></iframe>
							<form name="zimform" action="" method="post"
								target="no_refresh_frame">
								<input type="hidden" name="co_seq" value="${bean.co_seq}">
								<input type="hidden" name="email" value="${sessionScope.loginfo.email}">
								<div class="heart">
									<button type="submit" class="btn btn-default "
										onclick="alert('찜했습니다!');">
										<img alt="찜" src="bootstrap/img/heart.png" width="20" height="20"
											align="right">
									</button>
									&nbsp;&nbsp;&nbsp;
								</div>
							</form>
						</div>
						<div class="p-2">
							<c:if test="${sessionScope.loginfo.email == bean.email}">
								<a href="<%=contextPath%>/update.bo?no=${bean.co_seq}&${requestScope.parameters}">
									수정
								</a>
							</c:if>
							<c:if test="${sessionScope.loginfo.email != bean.email}">
								수정
							</c:if>
						</div>
						<div class="p-2">
							<c:if test="${sessionScope.loginfo.email == bean.email}">
								<a href="<%=contextPath%>/delete.bo?no=${bean.co_seq}&${requestScope.parameters}">
									삭제
								</a>
							</c:if>
							&nbsp;&nbsp;
							<c:if test="${sessionScope.loginfo.email != bean.email}">
								삭제
							</c:if>
						</div>
					</div>
				<hr>
				<!-- 댓글 영역 -->
				<h4>댓글 ( <span id ="count">0</span> )</h4>
				<br>
				<div class="card">
					<div class="card-body">
						<div id = "comment_write">
							<form id="comment_form" name="comment_form" method="post" class="form-horizontal" >
								<div class="row">
									<div class = "col-5">
										<label for = "email" class = "form-control-label align-middle">작성자 :&nbsp;&nbsp;
										 	<span class="font-weight-bolder">${sessionScope.loginfo.nickname}</span></label>
									</div>
									<div>
										<input type="hidden" name="co_seq" value="${bean.co_seq}" />
										<input type="hidden" name="email" id="email" value="${sessionScope.loginfo.email}">		
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class = "col-10">
											<textarea name="content" rows="6" id="content" class="form-control" placeholder="댓글 내용"></textarea>
										</div>	
										<div class = "col-2">
											<input type = "button" value="댓글 등록" onclick="to_ajax_form();" style="width:100%; height:100%;" class="btn btn-danger">
										</div> 
									</div>
								</div>       		
							</form>
						</div>
					</div>
				</div>
				<br>
				<br>
<!-- 				<div style="overflow-y:scroll; height:500px;"> -->
				<div>
					<div id="paging_status"></div>
					<ul id="comment_list">
					</ul>
					<div id = "comment_footer">
					</div>
					<input type="hidden" id="pagenum">
				</div>	
			</div>
			<br>
			<br>
			
			 <!-- 댓글 수정하기 Modal -->
			  <div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
			    <div class="modal-dialog modal-dialog-centered">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">댓글 수정하기</h4>
			          <button type="button" class="close" data-dismiss="modal">×</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			          <input type="hidden" id='updateno'>
			          <textarea class="form-control" id="updatetext"></textarea>
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-danger" onclick="updateComment();">댓글 수정</button>
			        </div>
			        
			      </div>
			    </div>
			  </div>
<%@ include file="../common/footer.jsp" %>
	<script>
		function to_ajax_form(){
			var queryString = $('form[name=comment_form]').serialize();
			$.ajax({
				async : false,
				type : 'post',
				url :  '${contextPath }/insertComment.bo',
				data : queryString,
				error : function(err){
					console.log("error발생"+err);
				},
				success : function(data){
					alert('댓글이 등록 되었습니다');
					getList(0);
					$('#content').val('');
				}
			});
		}
		
		function deletenum(num){
			$.ajax({
				url : '${contextPath}/selectComment.bo',
				data : {'b_cnum' : num},
				dataType : 'json',
				type : 'post',
				success : function(data){
				//	console.log(JSON.stringify(data));
				//	console.log(data.bean.content)
				
					if('${sessionScope.loginfo.email}'!= data.bean.email){
						alert('삭제 권한이 없습니다')
					}else{
						if(confirm("정말 삭제하시겠습니까?")){
							$.ajax({
								url :'${contextPath}/deleteComment.bo',
								data : {'b_cnum' : num},
								type : 'get',
								success : function(data){
									alert('댓글이 삭제 되었습니다.')
								}
							})
							getList($('#pagenum').val())		
						}else{
							
						}
					}
				},error:function(err){
					console.log("error발생"+err);
				}
			})

			
		}
		
		function updatenum(num){
			$.ajax({
				url : '${contextPath}/selectComment.bo',
				data : {'b_cnum' : num},
				dataType : 'json',
				type : 'post',
				success : function(data){
				//	console.log(JSON.stringify(data));
				//	console.log(data.bean.content)
					$('#updateno').val(data.bean.b_cnum)
					$('#updatetext').val(data.bean.content);
				
					if('${sessionScope.loginfo.email}'!= data.bean.email){
						alert('수정 권한이 없습니다')
					}else{
						$("#myModal").modal();
					}
				},error:function(err){
					console.log("error발생"+err);
				}
			})
		
		}
		
		function updateComment(){
			$.ajax({
				url : '${contextPath}/updateComment.bo',
				data : {'b_cnum' : $('#updateno').val(),
					'content' : $('#updatetext').val()},
				type : 'post',
				success : function(data){
					alert('댓글이 수정되었습니다')
				}, error : function(err){
					console.log("error발생"+err);
				}
			})
			$("#myModal").modal("hide");
			$('#updatetext').val('');
			$('#updateno').val('');
			getList($('#pagenum').val())	
		}
		
		
		function getList(num){
			$("#comment_list").empty() ;
			$.ajax({ /* 유효성 검사를 통과 했을 때 Ajax 함수 호출 */
		        url: '${contextPath}/readComment.bo',
		        data : 
		        {'co_seq' : ${bean.co_seq},
		        	'pageNumber' : num},
		        type : 'post',   
				dataType : 'json',
		        success: function(data){
		        	//console.log(JSON.stringify(data));
		        	//console.log(data.pagingHtml)
		        	//console.log(data.pagingStatus)
		        	$('#count').text(data.commentcount)
		        	$('#paging_status').html("");
		        	$('<p>').append('<b>'+data.pagingStatus+'</b>').appendTo($('#paging_status'))
		         	$.each(data.list, function(index, items){
			        	if('${bean.email}' == items.email){
				        		$('<li>').append($('<div>',{
				        			class : 'mt-2, mb-2',
	         					}).append($('<div>',{
	         					class : 'media border p-3'
		         				}).append($('<img/>',{
		         					src : '${contextPath}/picture/'+data.mlist[index].photo,
				         			alt : '사진',
				         			class : 'mr-3 mt-3 rounded-circle',
				         			style : 'width:60px'
		         				})).append($('<div>',{
		         					class : 'media-body'
		         					}).append($('<h4>',{
		         						text : data.mlist[index].nickname
		         					}).append($('<span>',{
		         						class : 'badge badge-pill badge-warning text-white font-weight-bolder',
		         						text : '글쓴이',
		         						style : 'font-size: 0.7em'
		         					})).append($('<small>',{
		         						text : items.regdate,
				         				style : 'font-size:0.5em'
		         					}))).append($('<p>',{
		         						text : items.content
		         					})).append($('<div>',{
		         						class : 'text-right'
		         					}).append($('<button>',{
		         						class : 'btn btn-default',
		         						text : '수정',
		         						onclick : 'javascript:updatenum('+ items.b_cnum + ')'
		         					})).append($('<button>',{
		         						class : 'btn btn-default',
		         						text : '삭제',
		         						onclick : 'javascript:deletenum('+ items.b_cnum + ')'
		         					})))
	         					))).appendTo($('#comment_list'));
			        	
			        	}else{
		         			$('<li>').append($('<div>',{
		         				class : 'mt-2, mb-2'
         					}).append($('<div>',{
         					class : 'media border p-3'
	         				}).append($('<img/>',{
	         					src : '${contextPath}/picture/'+data.mlist[index].photo,
			         			alt : '사진',
			         			class : 'mr-3 mt-3 rounded-circle',
			         			style : 'width:60px'
	         				})).append($('<div>',{
	         					class : 'media-body'
	         					}).append($('<h4>',{
	         						text : data.mlist[index].nickname
	         					}).append($('<small>',{
	         						text : items.regdate,
			         				style : 'font-size:0.5em'
	         					}))).append($('<p>',{
	         						text : items.content
	         					})).append($('<div>',{
	         						class : 'text-right'
	         					}).append($('<button>',{
	         						class : 'btn btn-default',
	         						text : '수정',
	         						onclick : 'javascript:updatenum('+ items.b_cnum + ')'
	         					})).append($('<button>',{
	         						class : 'btn btn-default',
	         						text : '삭제',
	         						onclick : 'javascript:deletenum('+ items.b_cnum + ')'
	         					})))
         					))).appendTo($('#comment_list'));
		         		}
		         	});
		         
		        
		        		
		        	$('#comment_footer').html(""); //태그 초기화
		        	$('<footer>').append(data.pagingHtml).appendTo($('#comment_footer')) //태그 추가
		        	$('#pagenum').val(num);
		        	
			},
			error:function(err){
				console.log("error발생"+err);
			}

			});
		}
		
		
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
			getList(1);
		})
	</script>
</body>
</html>