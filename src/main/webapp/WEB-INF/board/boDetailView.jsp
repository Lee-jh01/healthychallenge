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
		
		func
		tion addNewItem(b_cnum, email, content, regdate) {
			/* 댓글 1개를 추가해 주는 함수 */
			var litag = $("<li>"); // 새로운 글이 추가될 li태그 객체
			litag.addClass("comment_item");
			
			var ptag = $("<p>");// 작성자 정보가 지정될 <p>태그
			ptag.addClass("email");
			
			var spantag = $("<span>");// 작성자 정보의 이름
			spantag.addClass("email");
			spantag.html(email + "님");
			
			var spandate = $("<span>");// 작성 일시
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + regdate + " ");
			
			var inputtag = $("<input>");// 삭제하기 버튼
			inputtag.attr({"class" : "btn btn-default btn-xs", "type" : "button", "value" : "삭제하기", "pmkey" : b_cnum});
			inputtag.addClass("delete_btn");
	
			var content_p = $("<p>");// 내용
			content_p.html( content );
	
			// 조립하기
			ptag.append(spantag).append(spandate).append(inputtag);
			litag.append(ptag).append(content_p);
			
			$("#comment_list").append(litag);			
		}
		
		function getListComment(){ /* 댓글 목록을 읽어 온다. */
			$("#comment_list").empty() ;
			$.ajax({ /* 유효성 검사를 통과 했을 때 Ajax 함수 호출 */
	            url: '<%=MakeCommand("comList")%>',
	            data : 'co_seq=' + '${bean.co_seq}', 
	    		type : "get",             
	            dataType: "json",
	            success: function (obj, textStatus) {
		           	/* var obj = JSON.parse(data); */
		           	 
					$.each(obj, function (idx) {
		           		 var b_cnum = obj[idx].b_cnum ;	 
		           		 var email = obj[idx].email ;
		           		 var content = obj[idx].content ;	 
		           		 var regdate = obj[idx].regdate ;
		           		 addNewItem(b_cnum, email, content, regdate);
		           	});
	            }
	        });
		}
		
		/** 삭제 버튼 클릭시에 항목 삭제하도록 "미리" 지정 */
		$(document).on("click", ".delete_btn", function() {
			if (confirm("정말 선택하신 항목을 삭제하시겠습니까?")) {
				
				$.ajax({ /* 유효성 검사를 통과 했을 때 Ajax 함수 호출 */
		            url: '<%=MakeCommand("comDelete")%>',
		            data : 'b_cnum=' + $(this).attr('pmkey') + '&co_seq=' + '${bean.co_seq}',  
		    		type : "post",             
		            dataType: "text",
		            success: function (data, textStatus) { /* 댓글 삭제 */	            	
		            	getListComment() ; /* 목록 갱신 */		           
		            }
		        });			
			}
		});	
		
		$(document).ready(function() {
			getListComment() ; /* 시작하자 마자 읽어 오기 */		 
			 
			/** 덧글 내용 저장 이벤트 */
			$("#comment_form").submit(function(){
				// 작성자 이름에 대한 입력여부 검사
				if (!$("#email").val()) {
					alert("이름을 입력하세요.");
					$("#email").focus();
					return false;
				}
	
				// 내용에 대한 입력여부 검사
				if (!$("#content").val()) {
					alert("내용을 입력하세요.");
					$("#content").focus();
					return false;
				}		
				
				var url = '<%=MakeCommand("comInsert")%>' ;
				var parameter = $('#comment_form').serialize() ;
				$.post(url, parameter, function( data ) {
					/* alert( '댓글이 작성되었읍니다.' ) ; */
					getListComment(0) ; /* 목록 갱신 */
					$("#email").val('') ;
					$("#content").val('') ;
					
				}).fail(function() {
					alert("덧글 작성에 실패했습니다. 잠시 후에 다시 시도해 주세요.");
				});
				return false ;
			});
			
		});	
	</script>
</head>
<%
	int leftside = 4; //판넬의 좌측
	int rightside = twelve - leftside; //판넬의 우측
%>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<h1 class="panel-title" align="left">게시물 상세 보기</h1>
			</div>
			<div class="panel-body">
				<div class="col-sm-<%=leftside%> col-sm-<%=leftside%>">
				</div>
				<div class="col-sm-<%=rightside%> col-sm-<%=rightside%>">
					<table class="table table-hover table-condensed">
						<tr>
							<td width="25%" align="center">글 번호</td>
							<td width="75%" align="left">${bean.co_seq}</td>
						</tr>						
						<tr>
							<td width="25%" align="center">작성자</td>
							<td width="75%" align="left">${bean.email}</td>
						</tr>
						<tr>
							<td width="25%" align="center">제목</td>
							<td width="75%" align="left">${bean.subject}</td>
						</tr>
						<tr>
							<td width="25%" align="center">글 내용</td>
							<td width="75%" align="left">${bean.content}
							</td>
						</tr> 
						<tr>
							<td width="25%" align="center">조회수</td>
							<td width="75%" align="left">${bean.readhit}</td>
						</tr>
						<tr>
							<td width="25%" align="center">작성 일자</td>
							<td width="75%" align="left">${bean.regdate}</td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="col-sm-offset-5 col-sm-4">
					<button class="btn btn-primary" onclick="gotoBack();">
						돌아 가기</button>
				</div>
				
				<!-- 스크랩 -->
				
				<iframe name="no_refresh_frame" style="display: none;"></iframe>
				<form name="zimform" action="<%=contextPath%>/healthy" method="post"
					target="no_refresh_frame">
					<input type="hidden" name="co_seq" value="${bean.co_seq}"> <input
						type="hidden" name="email" value="${sessionScope.loginfo.email}">
					<input type="hidden" name="command" value="prZim">
					<div class="heart">
						<button type="submit" class="btn btn-default "
							onclick="alert('찜했습니다!');">
							<img alt="찜" src="img/heart.png" width="40" height="40"
								align="right">
						</button>
						&nbsp;&nbsp;&nbsp;
					</div>
				</form>
				
				
				
				
				<td>
							<c:if test="${sessionScope.loginfo.email == bean.email}">
								<a href="<%=contextPath%>/update.bo?no=${bean.co_seq}&${requestScope.parameters}">
									수정
								</a>
							</c:if>
							<c:if test="${sessionScope.loginfo.email != bean.email}">
								수정
							</c:if>
						</td>
							
						<td>
							<c:if test="${sessionScope.loginfo.email == bean.email}">
								<a href="<%=contextPath%>/delete.bo?no=${bean.co_seq}&${requestScope.parameters}">
									삭제
								</a>
							</c:if>
							<c:if test="${sessionScope.loginfo.email != bean.email}">
								삭제
							</c:if>
						</td>
				
				
				
				
				
			</div>
			<!-- 댓글 영역 -->
			<div class="col-sm-12">					
				<ul id="comment_list">
					<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
				</ul>
				<div id="comment_write">
					<form id="comment_form" action="loginProc.jsp" method="post" role="form" class="form-horizontal" >
						<div class="form-group">
							<label for="email" class="col-xs-3 col-lg-3 control-label">작성자</label>
							<div class="col-xs-4 col-lg-4">
								<input type="hidden" name="co_seq" value="${bean.co_seq}" />
								<input type="text" name="fakeemail" id="fakeemail" class="form-control" disabled="disabled" value="${sessionScope.loginfo.email}">								
							</div><input type="hidden" name="email" id="email" value="${sessionScope.loginfo.email}">
						</div>
						<div class="form-group">
							<label for="content" class="col-xs-3 col-lg-3 control-label">덧글 내용</label>
							<div class="col-xs-9 col-lg-9">
								<textarea name="content" rows="3" cols="50" id="content" ></textarea> 
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
	</div>
	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
	</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>