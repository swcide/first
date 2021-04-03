<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Poppins:300,400,500,600,700|PT+Serif:400,400i&display=swap" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="resources/css/style.css" type="text/css" />
	<link rel="stylesheet" href="resources/css/dark.css" type="text/css" />
	<link rel="stylesheet" href="resources/css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="resources/css/animate.css" type="text/css" />
	<link rel="stylesheet" href="resources/css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="resources/css/custom.css" type="text/css" />
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
	
	<style>
	.widget_links li{
		font-size: 13px;
	}
	.widget_links ul li a:hover{
	color: #007bff;
	}

	.entry-meta{
	margin:0px;
	color:#444;
	
	}
	</style>
</head>
<body>
<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<header id="header" class="header-size-sm">
			<div class="container">
				<div class="header-row">

					<!-- Logo
					============================================= -->
					<div id="logo" class="mx-auto">
						<a href="home.do" class="standard-logo" data-dark-logo="resources/images/test.jpg"><img src="resources/images/test.jpg" alt="Canvas Logo"></a>
						<a href="home.do" class="retina-logo" data-dark-logo="resources/images/test.jpg"><img src="resources/images/test.jpg	" alt="Canvas Logo"></a>
					</div><!-- #logo end -->


				</div>
			</div>
			
		
		<div id="header-wrap" class="border-top border-f5">
				<div class="container">
					<div class="header-row justify-content-between top-search-parent">
									<!-- login -->
				<div class="header-misc">
					<c:if test="${ empty sessionScope.loginUser }">
						<div  class="inline-block ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active ui-state-active">
							<button class="button button-border button-rounded button-leaf" id="login-form-submit" name="login-form-submit"	data-toggle="modal" data-target="#myModal" value="login">Login</button>
						</div><!-- #top-search end -->
					</c:if>
					
					<c:if test="${ !empty sessionScope.loginUser }">
					
					<div class="header-misc">
						<c:url var="myInfo" value="myInfo.do"/>
			            <c:url var="logout" value="logout.do"/>
							<!-- info
							============================================= -->
						<div id="top-cart" class="header-misc-icon d-none d-sm-block">
							<div class="entry-meta">
								<ul>
								<li><a href="#" id="top-cart-trigger"><i class="icon-user"></i> ${ loginUser.name }</a></li>
								</ul>
							</div>
							
							<div class="top-cart-content">
								<div class="top-cart-title">
									<h4>안녕하세요 ${ loginUser.name }님</h4>
								</div>
								<div class="top-cart-items">
									<div class="top-cart-item">
										<div class="testi-image">
											<a href="#"><img src="resources/images/test.jpg" alt="Customer Testimonails"></a>
										</div>
										<div class="top-cart-item-desc">
											<div class="top-cart-item-desc-title">
												<h5>${ loginUser.email }</h5>
											</div>
										</div>
									</div>
									
								</div>
								<div class="top-cart-action">
									<a href="${myInfo}" class="social-icon si-rounded si-cloudapp" title="Cloudapp">
																<i class="icon-line2-settings"></i>
																<i class="icon-line2-settings"></i>
									</a>
									<a href="${logout}" class="button button-mini button-circle button-red"><i class="icon-off"></i>log out</a>
								</div>
							</div>
						</div><!-- #top-cart end -->

					</div>
					
					
   						
					</c:if>

				</div>
					
		

						

						<!-- Primary Navigation
						============================================= -->
						<nav class="primary-menu">

							<ul class="menu-container">
								<li class="menu-item"><a class="menu-link" href="home.do"><div>Home</div></a></li>
								<li class="menu-item sub-menu">
									<a class="menu-link" href="bList.do"><div>Board<i class="icon-angle-down"></i></div></a>
									<ul class="sub-menu-container" style="">
										<li class="menu-item sub-menu" style="">
											<a class="menu-link" href=><div>Home - Corporate<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style="">
													<a class="menu-link" href="index-corporate.html"><div>Corporate - Layout 1</div></a>
												</li>
												<li class="menu-item" style="">
													<a class="menu-link" href="index-corporate-2.html"><div>Corporate - Layout 2</div></a>
												</li>
												<li class="menu-item" style="">
													<a class="menu-link" href="index-corporate-3.html"><div>Corporate - Layout 3</div></a>
												</li>
												<li class="menu-item" style="">
													<a class="menu-link" href="index-corporate-4.html"><div>Corporate - Layout 4</div></a>
												</li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										
									</ul>
								<button class="sub-menu-trigger icon-chevron-right"></button>
								</li>
							
							</ul>

						</nav><!-- #primary-menu end -->
					</div>
				</div>
			</div>
			<!-- head warp end -->
		</header>
		<!-- #header end -->

		<!-- Page Title
		============================================= -->

		<div class="modal fade show" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
			<div class="modal-dialog">
				<div class="modal-body">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">Login</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body">

								<div class="well well-lg mb-0">
									<form  class="row"  action="login.do" method="post">
	
										<div class="col-12">
											<h3>Login to your Account</h3>
										</div>
	
										<div class="col-12 form-group">
											<label for="login-form-username">ID:</label>
											<input type="text" id="login-form-username" name="id" value="" class="form-control">
										</div>
	
										<div class="col-12 form-group">
											<label for="login-form-password">Password:</label>
											<input type="password" id="login-form-password" name="pwd" value="" class="form-control">
										</div>
	
										<div class="col-12 form-group">
											<button href="login.do"class="btn btn-secondary m-0 float-right" id="login-form-submit" name="login-form-submit" value="login">Login</button>
											<a href="#" class="">Forgot Password?</a>
										</div>
	
									</form>
								</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<a href="uInsertView.do" type="button" class="btn btn-primary">Sign In</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	


</body>
</html>