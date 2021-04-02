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
	<section id="page-title">

			<div class="container clearfix">
				<h1>Sign In</h1>
			</div>

		</section>
	<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">

					<div class=" justify-content-center row">

						<div class=" col-md-8">


							<h3>Don't have an Account?</h3>

							<form id="register-form" name="register-form" class="row" action="uInsert.do" method="post">

								<div class="col-6 form-group">
									<label for="register-form-name">ID:</label>
									<input type="text" id="register-form-name" name="id" value="" class="form-control">
								</div>

								<div class="col-6 form-group">
									<label for="register-form-email">Email Address:</label>
									<input type="email" id="register-form-email" name="email" value="" class="form-control">
								</div>

								<div class="w-100"></div>

								<div class="col-6 form-group">
									<label for="register-form-username">Choose a Username:</label>
									<input type="text" id="register-form-username" name="name" value="" class="form-control">
								</div>

								<div class="col-6 form-group">
									<label for="register-form-phone">Phone:</label>
									<input type="text" id="register-form-phone" name="phone" value="" class="form-control">
								</div>

								<div class="w-100"></div>

								<div class="col-6 form-group">
									<label for="register-form-password">Choose Password:</label>
									<input type="password" id="register-form-password" name="pwd" value="" class="form-control">
								</div>

								<div class="col-6 form-group">
									<label for="register-form-repassword">Re-enter Password:</label>
									<input type="password" id="register-form-repassword" name="pwd2" value="" class="form-control">
								</div>

								<div class="w-100"></div>

								<div class="col-12 form-group">
									<button  class="btn btn-dark m-0" id="register-form-submit" name="register-form-submit" value="register">Register Now</button>
								</div>

							</form>

						</div>

					</div>

				</div>
			</div>
		</section>

	<c:import url="../common/footer.jsp"/>
</body>
</html>