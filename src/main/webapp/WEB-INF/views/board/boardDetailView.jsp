<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.practice.first.member.model.vo.Member"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	Member m = (Member)session.getAttribute("loginUser");
	String id= null;
	
	if(m != null){
 		id =m.getId(); 
	}
%>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

	.comment-content{
		overflow: visible !important;
	}
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

										
									</ol><!-- .commentlist end -->

									<div class="clear"></div>

									<!-- Comment Form
									============================================= -->
									<c:if test="${!empty sessionScope  }">
									<div id="respond">
										<h3>Leave a <span>Comment</span></h3>
											<div class="w-100"></div>
											<div class="col-12 form-group">
												<label for="comment">Comment</label>
												<textarea id="rContent"name="rContent" cols="58" rows="7" tabindex="4" class="sm-form-control"></textarea>
											</div>
											<div class="col-12 form-group">
												<button name="submit" onclick="addReply();" id="rSubmit" tabindex="5" value="Submit" class="button button-3d m-0">Submit Comment</button>
											</div>
									</div><!-- #respond end -->
									</c:if>
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
			
			
		
		});	
		
		// 댓글 등록 ajax
		function addReply(){
			
			 if($("#rContent").val().trim() == ""){
                alert("내용을 입력하세요");
                $("#rContent").focus();
                return false;
            }
			var $ol = $('#comments ol');
			var rContent = $("#rContent").val();
			var refBid = ${ b.bId };
			
			
			var rWriter = "<%= id %>";
			
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
						$ol.html("");
						getReplyList(); // 등록 성공 시 다시 댓글 리스트를 호출
						
						$("#rContent").val(""); // 댓글 등록이 성공을 하면 작성한 글은 초기화 시켜준다.
					}
				},error:function(request,status,errorData){
					console.log(request.status + " : " + errorData);
				}
			});
		};
	
		
		function getReplyList(){
			var bId = ${ b.bId};
			
			$.ajax({
				url:"rList.do",
				data:{bId:bId},
				dataType:"json",
				success:function(data){
					$li = $('#comments ol li');
					$ol = $('#comments ol');
					var id = '<%=id%>';
					var $dupReply;
					
					
					
					var $rWriter;
					var $refRid ;
					var $rContent;
					var $rCreateDate;
					var $rIdCheck;  //참조 댓글의 rid
					var $rId;
					var $reply;
					
					var $moreDiv;
					var $more;
					
					
					$("#comments-title").html("<span>"+data.length+"</span>"+" Comments"); // 댓글 갯수 표기

					if(data.length > 0){ // 댓글이 있을 경우
						for(var i in data){
							
							$rId = data[i].rId;
							$rWriter =data[i].rWriter;
							$rContent =data[i].rContent;
							$rCreateDate=data[i].rCreateDate;
							$refRid=data[i].refRid;
							
							if($refRid==0){
							$reply = 
								'	<li class="comment even thread-even depth-1" id="rId_'+$rId+'">'+
								'		<div id="div_'+$rId+'"class="comment-wrap clearfix">'+
								'			<div class="comment-meta">'+
								'				<div class="comment-author vcard">'+
								'			    	<input type="hidden" value="'+$refRid+'">'+		
								'			   		<span class="comment-avatar clearfix">'+
								'			    		<img alt="Image" src="https://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60" class="avatar avatar-60 photo avatar-default" height="60" width="60" />'+
								'					</span>'+
								'				</div>'+
								'			</div>'+
								'			<div class="comment-content clearfix">'+
								'				<div class="comment-author">'+$rWriter+
								'					<span>'+$rCreateDate+'</span>'+
								'				</div>'+
								'				<p id="p_'+$rId+'">'+$rContent+'</p>'+ 
								'				<div id="upView_'+$rId+'"></div>'+				
								'				<div class="type_'+$rId+'">'+
								'		    		<input type="hidden" value="'+$rId+'">'+	
								'				</div>'+
								'			</div>'+
								'			<div class="clear"></div>'+
								'			<div id="more_'+$rId+'"></div>'+
								'		</div>' +
								'	<li>';
							
								
							$ol.append($reply);
							}
						
							for(var j in data){
								var refRid = data[j].refRid;
								var rId = data[j].rId
									var a2 = 
										' <a class="float-right " href="javascript:void(0);" onclick="moreList('+refRid+',this)";>더보기</a>';
									$('#more_'+refRid).html(a2);
						
							}	
						

							// 작성자는 설정버튼이 보이고 작성자가 아닌 사람은 댓글달기 버튼이 보인다.
							if(id!=null){
								if($rWriter==id){	
									$dupReply = 
										'<a class="comment-reply-link"  data-toggle="dropdown"><i class="icon-ellipsis-v"></i></a>'+
										'			<div class="dropdown-menu" style="">'+
										'				<a class="dropdown-item"  href="javascript:void(0);" onclick="rUpdateView('+$rId+');">수정</a>'+
										'				<a class="dropdown-item"  href="javascript:void(0);" onclick="rDelete('+$rId+');">삭제</a>'+
										'		</div>';
									 $('.type_'+$rId).append($dupReply);
									 
									 
										
								}else{
									$dupReply = 								
										'<a class="comment-reply-link" href="javascript:void(0);" onclick="addReplyView(this);"><i class="icon-reply"></i></a>';
									 $('.type_'+$rId).append($dupReply);
								
								}
							}
							
						}
					}
				},error:function(request,status,errorData){
					console.log(request.status + " : " + errorData);
				}
			});
		}
		
		function rDelete(rId){
			var $ol = $('#comments ol');
			var bId = ${b.bId};
			$.ajax({
				url:"delteReply.do",
				data:{
					rId:rId
				},
				type:"post",
				success:function(data){
					if(data =="success"){
						confirm("삭제하시겠습니까?.");
						$ol.html("");
						getReplyList();
					}
				},error: function(result){
					console.log(result)
				}
			});
		}
		
		
		function rUpdateView(rId){

			var p =$('#p_'+rId);
			var div=$('#upView_'+rId);
			var type =$('.type_'+rId);
			var textarea ='<textarea id="rContent_'+rId+'"style="margin-top:20px; width:99%">'; 
			var btn =
				'<div id="btn_'+rId+'" class="btn-group float-right">'+
				'<button onclick="rUpdate('+rId+');" class="button button-3d button-mini button-rounded button-white button-light" >수정</button>'+
				'<button  onclick="rCancle('+rId+');" class="button button-3d button-mini button-rounded button-white button-light" >취소</button>'+
				'</div>';
				
				
			p.css("display","none");
			type.css("display","none");
			div.append(textarea);
			div.append(btn)
			
		}
		function rUpdate(rId){
			var rContent = $('#rContent_'+rId).val();
			var div=$('#upView_'+rId);
			var p =$('#p_'+rId);
			console.log(rContent);
			
			$.ajax({
				url:"updateReply.do",
				data:{
					rId:rId,
					rContent:rContent
				},
				type:"post",
				success:function(data){
					if(data =="success"){
						confirm("수정하시겠습니까?");
						div.html('');
						p.html(rContent);
						p.css("display","block");
						type.css("display","block");
						
					}
				},error: function(result){
					console.log(result)
				}
			});
		}
		function rCancle(rId){
			var $ol = $('#comments ol');
			var p =$('#p_'+rId);
			var type =$('.type_'+rId);
			var rContent = $('#rContent_'+rId);
			var btn = $('#btn_'+rId);
			
			p.css("display","block");
			type.css("display","block");
			btn.remove();
			rContent.remove();
		}
			
			
		function addReplyView(obj){
			var rId = $(obj).siblings('input').val();
			console.log(rId);
			var li = $('#rId_'+rId);
			var div=$('#div_'+rId)
			var id  ='<%=id%>';
			$('.type_'+rId).css("display","none");

			
			var ul =
					'<ul class="children" id="children_in'+rId+'">'+
					'	<li class="comment byuser comment-author-_smcl_admin odd alt depth-2" id="li-comment-3">'+
					'		<div id="comment-3" class="comment-wrap clearfix">'+
					'			<div class="comment-meta">'+
					'				<div class="comment-author vcard">'+
					'					<span class="comment-avatar clearfix">'+
					'					<img alt="Image" src="https://1.gravatar.com/avatar/30110f1f3a4238c619bcceb10f4c4484?s=40&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D40&amp;r=G" class="avatar avatar-40 photo" height="40" width="40"></span>'+
					'				</div>'+
					'			</div>'+
					'			<div class="comment-content clearfix">'+
					'				<div class="comment-author">'+id+'</div>'+
					'				<div id="upView_22">'+
					'				<textarea id="rContent_'+rId+'"style="margin-top:20px; width:99%"></textarea>'+
					'				<div class="btn-group float-right">'+
					'					<button onclick="addReply2('+rId+');" class="button button-3d button-mini button-rounded button-white button-light">등록</button>'+
					'					<button onclick="addCancle('+rId+');" class="button button-3d button-mini button-rounded button-white button-light">취소</button>'+
					'				</div>'+
					'			</div>'+
					'			<div class="clear"></div>'+
					'		</div>'+
					'	</li>'+
					'</ul>';
					
					
					
			div.after(ul);		
			
		}
		
		function addReply2(refRid){
			var refBid = ${b.bId};
			var rWriter = '<%=id%>';
			var p =$('#p_'+refRid);
			console.log(refRid)
			var rContent = $('#rContent_'+refRid).val();
			var ul = $('#children_in'+refRid);
			var as = $('.type_'+refRid)
			
			
			
			
			$.ajax({
				url:"addReply.do",
				data:{
					rContent:rContent,
					refRid:refRid,
					rWriter:rWriter,
					refBid:refBid
					},
				type:"post",
				success:function(data){
					if(data =="success"){
						$("#rContent_"+refRid).val(""); // 댓글 등록이 성공을 하면 작성한 글은 초기화 시켜준다.
						confirm("등록하시겠습니까?");
						$ol.html("");
						getReplyList();
	
						
					}
				}
			});
			
		}
		
		
		function addCancle(rId){
			var ul = $('#children_in'+rId);
			ul.remove();
			$('.type_'+rId).css("display","block");
			
		}
		
// 		더보기 리스트

	function moreList(rId,obj){
		var bId = ${ b.bId};
		var li = $('#rId_'+rId);
		var id = '<%=id%>';
		var a2 = 
			' <a class="float-right " href="javascript:void(0);" onclick="moreClose('+rId+',this)";>닫기</a>';

		
		$(obj).parent().html(a2)
		
		$.ajax({
			url:"moreList.do",
			data:{
				bId:bId
				},
			type:"post",
			success:function(data){
				
				if(data.length>0){
					for(var j in data){
						var refRid =data[j].refRid;
						var rId2 = data[j].rId;
						var rWriter = data[j].rWriter;
						if(rId==refRid){
							var children =
					 			'<ul class="children" id="children_'+data[j].refRid+'">'+
					 			'	<li class="comment byuser comment-author-_smcl_admin odd alt depth-2" id="rId_'+data[j].rId+'">'+
					 			'		<div class="comment-wrap clearfix">'+
					 			'			<div class="comment-meta">'+
					 			'				<div class="comment-author vcard">'+
					 			'			    	<input type="hidden" value="'+data[j].rId+'">'+		
					 			'			   		<span class="comment-avatar clearfix">'+
					 			'			    		<img alt="Image" src="https://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60" class="avatar avatar-40 photo avatar-default" height="40" width="40" />'+
					 			'					</span>'+
					 			'				</div>'+
					 			'			</div>'+
					 			'			<div class="comment-content clearfix">'+
					 			'				<div class="comment-author">'+data[j].rWriter+
					 			'					<span>'+data[j].rCreateDate+'</span>'+
					 			'				</div>'+
					 			'				<p id="p_'+data[j].rId+'">'+data[j].rContent+'</p>'+ 
					 			'				<div id="upView_'+data[j].rId+'"></div>'+				
					 			'				<div class="type_'+data[j].rId+'">'+
					 			'		    		<input type="hidden" value="'+data[j].rId+'">'+	
					 			'				</div>'+
					 			'			</div>'+
					 			'			<div class="clear"></div>'+
					 			'		</div>' +
					 			'	</li>'+
					 			'</ul>';
							li.append(children);
							}
						
						if(id!=null){
							if(rWriter==id){	
								$dupReply = 
									'<a class="comment-reply-link"  data-toggle="dropdown"><i class="icon-ellipsis-v"></i></a>'+
									'			<div class="dropdown-menu" style="">'+
									'				<a class="dropdown-item"  href="javascript:void(0);" onclick="rUpdateView('+rId2+');">수정</a>'+
									'				<a class="dropdown-item"  href="javascript:void(0);" onclick="rDelete('+rId2+');">삭제</a>'+
									'		</div>';
								 $('.type_'+rId2).append($dupReply);
							}
						}
					}
				}
			}
		});
	
	}

	function moreClose(rId,obj){
		var div = $('#rId_'+rId +' ul');
		var a2 = 
			' <a class="float-right " href="javascript:void(0);" onclick="moreList('+rId+',this)";>더보기</a>';

		div.remove();
		$('#more_'+rId).html(a2);

	
	
	}


	
		
	</script>
</body>
</html>