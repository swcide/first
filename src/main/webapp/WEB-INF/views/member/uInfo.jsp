<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.info-content{

}

</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

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
										<div class="tab-content clearfix ui-tabs-panel ui-corner-bottom ui-widget-content" id="tab-feeds" aria-labelledby="ui-id-1" role="tabpanel" aria-hidden="false" style="">

												<p>your info</p>

												<table class="table table-bordered table-striped">
												  <thead>
													<tr>
													  <th style="width: 240px;text-align: center"></th>
													  <th ></th>
													</tr>
												  </thead>
												  <tbody>
													<tr>
													  <td style="text-align: center">
														<code>name</code>
													  </td>
													  <td>${loginUser.name }</td>
													</tr>
													<tr>
													  <td style="text-align: center">
														<code>email</code>
													  </td>
													  <td>${loginUser.email }</td>
													</tr>
													<tr>
													  <td style="text-align: center">
														<code>gender</code>
													  </td>
													  		<c:choose>
													<c:when test="${ loginUser.gender eq 'M' }">
														<td>
															<div class="row">
																<div class="col-lg-1">
																	<div>
																		<input id="radio-7" class="radio-style" name="radio-group" type="radio"checked>
																		<label for="radio-7" class="radio-style-2-label ">M</label>
																	</div>
																</div>
																<div class="col-lg-2">
																	<div>
																		<input id="radio-7" class="radio-style" name="radio-group" type="radio" disabled="disabled">
																		<label for="radio-7" class="radio-style-2-label">F</label>
																	</div>
																</div>
															</div>
														</td>
													</c:when>
													<c:when test="${ loginUser.gender eq 'F' }">
														<td>
															<div class="row">
																<div class="col-lg-1">
																	<div>
																		<input id="radio-7" class="radio-style" name="radio-group" type="radio"disabled="disabled">
																		<label for="radio-7" class="radio-style-2-label ">M</label>
																	</div>
																</div>
																<div class="col-lg-2">
																	<div>
																		<input id="radio-7" class="radio-style" name="radio-group" type="radio" checked>
																		<label for="radio-7" class="radio-style-2-label">F</label>
																	</div>
																</div>
															</div>
														</td>
													</c:when>
													<c:otherwise>
														<td>
															<div class="row">
																<div class="col-lg-1">
																	<div>
																		<input id="radio-7" class="radio-style" name="radio-group" type="radio"disabled="disabled">
																		<label for="radio-7" class="radio-style-2-label ">M</label>
																	</div>
																</div>
																<div class="col-lg-2">
																	<div>
																		<input id="radio-7" class="radio-style" name="radio-group" type="radio"disabled="disabled">
																		<label for="radio-7" class="radio-style-2-label">F</label>
																	</div>
																</div>
															</div>
														</td>
													</c:otherwise>
												</c:choose>
													</tr>
													<tr>
													  <td style="text-align: center">
														<code>age</code>
													  </td>
													  <c:if test="${ loginUser.age != 0}">
													  <td>${loginUser.age }</td>
													  </c:if>
													  <c:if test="${ loginUser.age == 0}">
													  <td></td>
													  </c:if>
													</tr>
													<tr>
													  <td style="text-align: center">
														<code>phone</code>
													  </td>
													  <td>${loginUser.phone }</td>
													</tr>
												  </tbody>
												</table>

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
								<a href="mdeleteView.do" class="list-group-item list-group-item-action d-flex justify-content-between"><div>Withdrawal</div><i class="icon-line2-logout"></i></a>
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

</script>





<c:import url="../common/footer.jsp"/>

</body>
</html>