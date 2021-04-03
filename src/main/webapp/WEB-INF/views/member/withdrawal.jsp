<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">

					<div class="row gutter-40 col-mb-80">
						<div class="postcontent col-lg-12">

							<h3 style="text-align: center">회원탈퇴</h3>

							<form action="mdelete.do" style="max-width: 25rem; margin: 0 auto;" id="fm">
							
								<div class="form-group">
									<label for="exampleInputEmail1">Password</label>
									<input type="password" class="form-control" id="pwd" aria-describedby="emailHelp" name="pwd">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password check</label>
									<input type="password" class="form-control" id="pwd2" name="pwd2">
								</div>
								
							</form>
							<div class="col-lg-12 text-center">
							<c:url var="mdelete" value="mdelete.do">
						 		<c:param name="id" value="${loginUser.id }"></c:param>
							</c:url>
							<button type="button" id="submit"  class="btn btn-primary mt-3">탈퇴하기</button>
							</div>
							
							<div class="line"></div>

						</div>

						<!-- Sidebar
						============================================= -->
					</div>

				</div>
			</div>
		</section>
		
	<c:import url="../common/footer.jsp"/>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#submit').click(function(){	
				if($('#pwd').val() == ''){
					alert("패스워드를 입력해 주세요.");
					$('#pwd').focus();
					return;
				}else if($('#pwd2').val() == ''){
					alert("패스워드를 입력해 주세요.");
					$('#pwd2').focus();
					return;
				}
				// 체크
				if($('#pwd').val() != $('#pwd2').val()){
					alert("패스워드가 일치하지 않습니다.");
					$('#pwd').focus();
					return;
				}
				
				$.ajax({
					url:"pwdcheck.do",
					type: "POST",
					data: $('#fm').serializeArray(),
					success: function(data){
						console.log(data);
						if(data=="fail"){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							//탈퇴
							var result = confirm('정말 탈퇴 하시겠습니까?');
							if(result){
								location.href='${ mdelete }'
							}
						}
					},
					error: function(){
						alert("서버 에러.");
					}
					
				})
			})
		})
		
	
	</script>
</body>
</html>