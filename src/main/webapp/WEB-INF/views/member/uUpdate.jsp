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

					<div class="row clearfix">

						<div class="col-md-9">

							<img src="resources/userUpload/DEFAULT.png" class="alignleft img-circle img-thumbnail my-0" alt="Avatar" style="max-width: 84px;">
							
							<div class="heading-block border-0">
								<h3>${username }</h3>
								<span>Your Profile Bio</span>
							</div>

							<div class="clear"></div>

							<div class="row clearfix">

								<div class="col-lg-12">

									<div class="tabs tabs-alt clearfix ui-tabs ui-corner-all ui-widget ui-widget-content" id="tabs-profile">

										<ul class="tab-nav clearfix ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header" role="tablist">
											<li role="tab" tabindex="0" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active ui-state-active" aria-controls="tab-feeds" aria-labelledby="ui-id-1" aria-selected="true" aria-expanded="true"><a href="#tab-feeds" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-1"><i class="icon-rss2"></i>myInfo</a></li>
										</ul>

										<div class="tab-container">
										
											<!-- 유저 변경 폼 -->
											<div class="tab-content clearfix ui-tabs-panel ui-corner-bottom ui-widget-content" id="tab-feeds" aria-labelledby="ui-id-1" role="tabpanel" aria-hidden="false">
												<form action="mUpdate.do" id="fm">
												<input type="hidden"  name="id" id="userId" value="${ loginUser.id }" >
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="inputEmail4">Email</label>
															<input type="email" class="form-control" name="email" id="email" placeholder="${loginUser.email }">
														</div>
														<div class="form-group col-md-6">
															<label for="inputPassword4">Name</label>
															<input type="text" class="form-control" name="name" id="name" placeholder="${loginUser.name }">
														</div>
													</div>
													<div class="form-row">
													<div class="form-group col-md-6">
														<label for="inputAddress">Password</label>
														<input type="password" class="form-control" name="pwd" id="pwd" placeholder="">
													</div>
													<div class="form-group col-md-6">
														<label for="inputAddress2">Password check</label>
														<input type="password"  class="form-control" id="pwd2" placeholder="">
													</div>
													</div>
													<div class="form-row">
														<div class="form-group col-md-3">
															<label for="inputCity">gender</label>
															<div class="form-row">
																<div class="form-group col-md-3">
																	<div>
																		<input id="radio-8" class="radio-style" name="gender" type="radio" value="M">
																		<label for="radio-8" class="radio-style-2-label" >M</label>
																	</div>
																</div>
															
																<div class="form-group col-md-3">
																	<div>
																		<input id="radio-7" class="radio-style" name="gender" type="radio" value="F">
																		<label for="radio-7" class="radio-style-2-label ">F</label>
																	</div>
																</div>
															
															</div>
														</div>
														<div class="form-group col-md-3">
															<label for="birth">birth</label>
															<select id="birth" name="birth" class="form-control">
																
																<option selected=""></option>
																<%for(int i = 1920; i<=2021;i++){ %>
																<option value="<%= i %>"><%= i %></option>
																<%} %>
															</select>
														</div>
														<div class="form-group col-md-6">
															<label for="inputZip">phone</label>
															<input type="text" name="phone" class="form-control" id="phone">
														</div>
													</div>
												
													
												</form>
													<button type="button" onclick="submit()" class="btn btn-primary">수정</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="w-100 line d-block d-md-none"></div>
						<div class="col-md-3">

							<div class="list-group">
								<a href="myInfo.do" class="list-group-item list-group-item-action d-flex justify-content-between"><div>Profile</div><i class="icon-user"></i></a>
								<a href="mUpdateView.do" class="list-group-item list-group-item-action d-flex justify-content-between"><div>Settings</div><i class="icon-cog"></i></a>
								<a href="javascript:void(0);"  onClick="logout()" class="list-group-item list-group-item-action d-flex justify-content-between"><div>Logout</div><i class="icon-power-off"></i></a>
								<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between"><div>Withdrawal</div><i class="icon-line2-logout"></i></a>
							</div>


						</div>

					</div>

				</div>
			</div>
		</section>


<script>
	function logout() {
		var answer;
		answer = confirm("로그아웃 하시겠습니까?");
		
		if(answer == true){
			location.href = "logout.do";
		}
		
	}

	function submit(){
		var answer;
		var pwd =$("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var email =$("#email").val();
		var name =$("#name").val();
		var gender =$("input[name=gender]").is(':checked');
		var birth =$("#birth").val();
		var phone =$("#phone").val();
		
		console.log( phone)
		console.log( email)
		console.log( phone)
		
		answer = confirm("수정 하시겠습니까?");
		
		if (answer == true){
			if(email ==""){
				alert("이메일을 입력하세요")
				return false;
			}else if(name ==""){
				alert("이름을 입력하세요")
				return false;
			}else if(gender!=true){
				alert("성별을 입력하세요")
				return false;
			}else if(birth==""){
				alert("년도를 입력하세요")
				return false;
			}else if(phone==""){
				alert("번호를 입력하세요")
				return false;
			}else if(pwd==""){
				alert("암호를 입력하세요")
				return false;
			}
			else if(pwd != pwd2){
				alert("암호를 정확히 입력하십시오")
				return false;
				
			}else{
				fm.submit();
				
			}
		}
			
		
	}
	
</script>





<c:import url="../common/footer.jsp"/>

</body>
</html>