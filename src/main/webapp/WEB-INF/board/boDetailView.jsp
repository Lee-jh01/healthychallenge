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
			<div id = "comment_write">
				<form id="comment_form" action="" method="post" role="form" class="form-horizontal" >
					<div class="form-group">
						<label for="email" class="form-control-label">작성자</label>
						<div>
							<input type="hidden" name="co_seq" value="${bean.co_seq}" />
							<input type="text" name="nickname" id="nickname" class="form-control" disabled="disabled" value="${sessionScope.loginfo.nickname}">	
							<input type="hidden" name="email" id="email" value="${sessionScope.loginfo.email}">							
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="form-control-label">덧글 내용</label>
						<div class="row">
							<div class = "col-10">
								<textarea name="content" rows="6" id="content" class="form-control"></textarea>
							</div>	
							<div class = "col-2">
								<button type="submit" style="width:100%; height:100%;" class="btn btn-info">
									댓글 등록
								</button> 
							</div> 
						</div>
					</div>       		
				</form>
			</div>
			<div>
				<ul id="comment_list">
				</ul>
			</div>	
				
			<div class="col-sm-12">			
				<table id="commentListTable" border="1">
				</table>		
 			<!-- 	<ul id="comment_list">
					여기에 동적 생성 요소가 들어가게 됩니다.
				</ul>  -->
				<div id="comment_write">
					<form id="comment_form" action="" method="post" role="form" class="form-horizontal" >
						<div class="form-group">
							<label for="email" class="form-control-label">작성자</label>
							<div class="col-xs-4 col-lg-4">
								<input type="hidden" name="co_seq" value="${bean.co_seq}" />
								<input type="text" name="nickname" id="nickname" class="form-control" disabled="disabled" value="${sessionScope.loginfo.nickname}">	
								<input type="hidden" name="email" id="email" value="${sessionScope.loginfo.email}">							
							</div>
						</div>
						<div class="form-group">
							<label for="content" class="form-control-label">덧글 내용</label>
							<div class="col-xs-9 col-lg-9">
								<textarea name="content" rows="3" cols="50" id="content" class="form-control"></textarea> 
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-3 col-xs-2 col-lg-2">
								<button type="submit" class="btn btn-info">
									저장하기
								</button> 
							</div>
						</div>	        		
					</form>
				</div>
			</div>
			</div>
			
<%@ include file="../common/footer.jsp" %>
	<script>
		function deletenum(num){
			alert(num);
		}
		
		function updatenum(num){
			alert(num);
		}
		
		function getList(){
			$("#comment_list").empty() ;
			$.ajax({ /* 유효성 검사를 통과 했을 때 Ajax 함수 호출 */
		        url: '${contextPath}/readComment.bo',
		        data : 
		        {'co_seq' : ${bean.co_seq}},
		        type : 'post',   
				dataType : 'json',
		        success: function(data){
		        	//console.log(JSON.stringify(data));
		        	$('#count').text(data.commentcount)  
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
		         						text : '작성자',
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
	         					}))
         					))).appendTo($('#comment_list'));
		         		}
		         	});
		         
			},
			error:function(err){
				console.log("error발생"+err);
			}

			});
		}
		
		
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
			getList();
		})
	</script>
</body>
</html>