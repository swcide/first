<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.practice.first.member.model.vo.Member"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.comment-content{
overflow: visible !important	;}
.comment-reply-link{
cursor: pointer;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<section id="page-title">

			<div class="container clearfix">
				<h1>Board</h1>
			</div>
	</section>

		<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">

					<div class="single-post mb-0">


						<div class="row gutter-40 col-mb-80">
							<!-- Post Content
							============================================= -->
							<div class="postcontent col-lg-10">
							

								<!-- Single Post
								============================================= -->
								<div class="entry clearfix">
					
								

									<!-- Entry Title
									============================================= -->
									<div class="entry-title">
										<h2>${ b.bTitle }</h2> 
							
									</div><!-- .entry-title end -->
						
									<!-- Entry Meta
									============================================= -->
									<c:url var="bupview" value="bUpdateView.do">
										<c:param name="bId" value="${ b.bId }"/>
									</c:url>
									<c:url var="bdelete" value="bdelete.do">
										<c:param name="bId" value="${ b.bId }"/>
									</c:url>
									<input type="hidden" id="bId" value="${b.bId }">
									<div class="entry-meta">
										<ul class=" float-right">
										<c:if test="${ loginUser.id eq b.bWriter }">
											<li><a href="javascript:void(0)" onclick="update()"><i class="icon-legal"></i> 수정</a></li>
											<li><a  href="javascript:void(0)" onclick="bdelete()"><i class="icon-line-trash-2"></i> 삭제</a></li>
										</c:if>
										</ul>
										<ul>
											<li><i class="icon-calendar3"></i> ${b.bCreateDate }</li>
											<li><a href="#"><i class="icon-user"></i> ${ b.bWriter }</a></li>
										
										</ul>
									</div><!-- .entry-meta end -->
									<script>
									function update() {
										var test = confirm("수정하시겠습니까?")	
										var bId = $("#bId").val()
										if(test==true){
											location.href="bUpdateView.do?bId="+bId;
										}
									}
									function bdelete() {
										var test = confirm("삭제하시겠습니까?")	
										var bId = $("#bId").val()
										if(test==true){
											location.href="bdelete.do?bId="+bId;
										}
									}
									
									</script>
									

									<!-- Entry Content
									============================================= -->
									<div class="entry-content mt-0">

										<p>${ b.bContent }</p>
										<!-- Post Single - Content End -->

										<!-- Tag Cloud
										============================================= -->
										<div class="clear"></div>

										<!-- Post Single - Share
										============================================= -->
										<c:if test="${ !empty b.originalFileName }">
										
											<a href="${pageContext.request.contextPath}/resources/buploadFiles/${b.renameFileName}" download="${ b.originalFileName }">${b.originalFileName }</a>
										</c:if> 									</div>
								
								</div><!-- .entry end -->
								<!-- Post Navigation
								============================================= -->
							
								<div class="row justify-content-between col-mb-30 post-navigation">
									<c:url var="prev" value="bprev.do">
										<c:param name="bId" value="${ b.bId }"/>
									</c:url>
								
									<c:if test="${b.bId ==1}">
									<div class="col-12 col-md-auto text-center">
										<button type="button" class="button button-leaf button-rounded button-reveal button-small " disabled="disabled">prev</button>
									</div>
									</c:if>
									<c:if test="${b.bId >1 }">
									<div class="col-12 col-md-auto text-center">
										<a href="${prev }" class="button button-leaf button-rounded button-reveal button-small button-border "><i class="icon-line-arrow-left"></i><span>prev</span></a>
									</div>
									</c:if>
									<c:url var="blist" value="bList.do">
										<c:param name="currentPage" value="${ currentPage }"/>
									</c:url>
									<div class="col-12 col-md-auto text-center">
										<a  class="button button-border button-rounded button-blue" href="${ blist }">to list</a>
									</div>
									<c:if test="${max == null }">
									<div class="col-12 col-md-auto text-center">
									<button type="button" class="button button-leaf button-rounded button-reveal button-small " disabled="disabled">next</button>
									</div>
									
									
									</c:if>
										<c:url var="next" value="bnext.do">
										<c:param name="bId" value="${ b.bId }"/>
									</c:url>
									<c:if test="${max.bId > b.bId }">
									<div class="col-12 col-md-auto text-center">
										<a href="${next }" class="button button-leaf button-rounded button-reveal button-small button-border "><span>next</span><i class="icon-line-arrow-right"></i></a>
									</div>
									</c:if>
								</div><!-- .post-navigation end -->
							





								<!-- Comments
								============================================= -->
								<div id="comments" class="clearfix">
						

									<h3 id="comments-title"></h3>

									<!-- Comments List
									============================================= -->
									<ol class="commentlist clearfix">

										<li class="comment even thread-even depth-1" id="li-comment-1">

											<div id="comment-1" class="comment-wrap clearfix">

												<div class="comment-meta">

													<div class="comment-author vcard">

														<span class="comment-avatar clearfix">
														<img alt='Image' src='https://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60' class='avatar avatar-60 photo avatar-default' height='60' width='60' /></span>

													</div>

												</div>

												<div class="comment-content clearfix">

													<div class="comment-author">John Doe<span><a href="#" title="Permalink to this comment">April 24, 2012 at 10:46 am</a></span></div>

													<p>첫번째 댓글입니다</p>

													<a class='comment-reply-link' href='#'><i class="icon-reply"></i></a>

												</div>

												<div class="clear"></div>

											</div>


											<ul class='children'>

												<li class="comment byuser comment-author-_smcl_admin odd alt depth-2" id="li-comment-3">

													<div id="comment-3" class="comment-wrap clearfix">

														<div class="comment-meta">

															<div class="comment-author vcard">

																<span class="comment-avatar clearfix">
																<img alt='Image' src='https://1.gravatar.com/avatar/30110f1f3a4238c619bcceb10f4c4484?s=40&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D40&amp;r=G' class='avatar avatar-40 photo' height='40' width='40' /></span>

															</div>

														</div>

														<div class="comment-content clearfix">

															<div class="comment-author"><a href='#' rel='external nofollow' class='url'>SemiColon</a><span><a href="#" title="Permalink to this comment">April 25, 2012 at 1:03 am</a></span></div>
															
																<p>첫번째 댓글의 첫번째 댓글입니다</p>	
															<a class='comment-reply-link' href='#'><i class="icon-reply"></i></a>

														</div>

														<div class="clear"></div>

													</div>

												</li>

											</ul>

										</li>
									</ol><!-- .commentlist end -->

									<div class="clear"></div>

									<!-- Comment Form
									============================================= -->
									<div id="respond">
										<h3>Leave a <span>Comment</span></h3>
											<div class="w-100"></div>
											<div class="col-12 form-group">
												<label for="comment">Comment</label>
												<textarea id="rContent"name="rContent" cols="58" rows="7" tabindex="4" class="sm-form-control"></textarea>
											</div>
											<div class="col-12 form-group">
												<button name="submit" type="submit" id="rSubmit" tabindex="5" value="Submit" class="button button-3d m-0">Submit Comment</button>
											</div>
									</div><!-- #respond end -->
								</div><!-- #comments end -->
							</div><!-- .postcontent end -->

							<!-- Sidebar
							============================================= -->
							
						<c:import url="../common/sidebar.jsp"/>
						<!-- sidebar end -->
						</div>

					</div>

				</div>
			</div>
		</section><!-- #content end -->
	
		



	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$(function(){
			getReplyList();
			
// 			setInterval(function(){
// 				getReplyList(); // 타 회원이 댓글들을 작성했을수도 있으니 지속적으로 댓글 불러오기
// 			},3000);
			
			
			// 댓글 등록 ajax
			$("#rSubmit").on("click",function(){
				
				 if($("#rContent").val().trim() == ""){
	                 alert("내용을 입력하세요");
	                 $("#rContent").focus();
	                 return false;
	             }
				
				var rContent = $("#rContent").val();
				var refBid = ${ b.bId };
				var rWriter = "<%= ((Member)session.getAttribute("loginUser")).getId() %>";
				
				$.ajax({
					url:"addReply.do",
					data:{
						rContent:rContent,
						refBid:refBid,
						rWriter:rWriter
					},
					type:"post",
					
					success:function(data){
						if(data == "success"){
							getReplyList(); // 등록 성공 시 다시 댓글 리스트를 호출
							
							$("#rContent").val(""); // 댓글 등록이 성공을 하면 작성한 글은 초기화 시켜준다.
						}
					},error:function(request,status,errorData){
						console.log(request.status + " : " + errorData);
					}
				});
			});
		});	
	
		
		function getReplyList(){
			var bId = ${ b.bId};
			
			$.ajax({
				url:"rList.do",
				data:{bId:bId},
				dataType:"json",
				success:function(data){
					//console.log(data);
					$li = $('#comments ol li');
					$ol = $('#comments ol');
// 					$li.html("");
					var id = "<%= ((Member)session.getAttribute("loginUser")).getId() %>";
					
					var $dupReply;
				
					
					var $rWriter;
					var $refRid ;
					var $rName;
					var $rContent;
					var $rCreateDate;
					var $rIdCheck;  //참조 댓글의 rid
					var $rId;
					var $reply;
					var $rePlace;
					
					
					
					$("#comments-title").html("<span>"+data.length+"</span>"+" Comments"); // 댓글(5)

					
					if(data.length > 0){ // 댓글이 있을 경우
						for(var i in data){
							$rIdCheck = $('<input type="hidden" value="'+data[i].rId+'">').val() //참조 댓글의 rid
							$rWriter =data[i].rWriter;
							$rContent=$('<input type"hidden"  value="'+data[i].rContent+'">').val();
							$rCreateDate=$('<input type"hidden"  value="'+data[i].rCreateDate+'">').val();
							
							console.log($rIdCheck)
							

							$reply = 
								'	<li class="comment even thread-even depth-1" id="rId_'+$rIdCheck+'">'+
								'		<div class="comment-wrap clearfix">'+
								'			<div class="comment-meta">'+
								'				<div class="comment-author vcard">'+
								'		    		<input type="hidden" value="'+$rId+'">'+		
								'			    	<input type="hidden" value="'+data[i].refRid+'">'+		
								'			   		<span class="comment-avatar clearfix">'+
								'			    		<img alt="Image" src="https://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60" class="avatar avatar-60 photo avatar-default" height="60" width="60" />'+
								'					</span>'+
								'				</div>'+
								'			</div>'+
								'			<div class="comment-content clearfix">'+
								'				<div class="comment-author">'+$rWriter+
								'					<span><a href="#" title="Permalink to this comment">'+$rCreateDate+'</a></span>'+
								'				</div>'+
								'				<p >'+$rContent+'</p>'+ 
								'				<div class="type">'+

								'				</div>'+
								'			</div>'+

								'			<div class="clear"></div>'+
								'		</div>' 
								'	<li>';
								
							$ol.append($reply);
						}
					
					// 작성자는 설정버튼이 보이고 작성자가 아닌 사람은 댓글달기 버튼이 보인다.
						if($rWriter==id){	
							$dupReply = 
							'		<a class="comment-reply-link"  data-toggle="dropdown"><i class="icon-ellipsis-v"></i></a>'+
							'			<div class="dropdown-menu" style="">'+
							'				<a class="dropdown-item" href="#">수정</a>'+
							'				<a class="dropdown-item" href="#">삭제</a>'+
							'		</div>'		;	
						 $('.type').append($dupReply);
						 
						}else{
							$dupReply = 								
									'<a class="comment-reply-link" href="#"><i class="icon-reply"></i></a>';
								
							 $('.type').append($dupReply);
							
						}
					}else{ // 댓글이 없을 경우
						$tr = $("<tr>");
						$rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}
				},error:function(request,status,errorData){
					console.log(request.status + " : " + errorData);
				}
			});
		}
			
			
		

	
		
	</script>
</body>
</html>