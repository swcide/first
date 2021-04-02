<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
 <style>
.board thead tr{
font-size: 15px
}
.board tbody td{
font-size:14px;
}
.board .title{
	 width: 100%; 	
     white-space: nowrap;
}
.sidebar{
	font-size:14px;
}
.widget_links{
text-align: right;
}


.pagination {
font-size: 13px;
}
.title a{
color: #444;

}
.title a:hover{
color: #007bff;;

}
.uName a{
color: #444;

}
.uName a:hover{
color: #007bff;;

}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
		<section id="page-title">
			<div class="container clearfix">
				<h1>Board</h1>
			</div>
		</section>
		
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">

					<div class="row gutter-40 col-mb-80">
						<!-- Post Content
						============================================= -->
						<div class="postcontent col-lg-10">

							<table class="table table-hover board">
							  <thead>
								<tr>
								  <th>#</th>
								  <th class="title">제목</th>
								  <th>작성자</th>
								  <th>작성일</th>
								  <th>조회수</th>
								</tr>
							  </thead>
							
							  <tbody>
								<tr>
								  <td>1</td>
								  <td>
									  <span class="title">
									  	<a href="bDeteil.do">Mark</a>
									  </span>
								  </td>
								  <td>
 									<span class="uName">
								  		<a href="">Mark</a>
								 	 </span></td>
								  <td>@mdo</td>
								  <td>@mdo</td>
								</tr>
								<tr>
								  <td>2</td>
								  <td>Jacob</td>
								  <td>Thorddddddnton</td>
								  <td>@fat</td>
								  <td>@fat</td>
								</tr>
								<tr>
								  <td>3</td>
								  <td>Larry</td>
								  <td>the Bird</td>
								  <td>@twitter</td>
								  <td>@twitter</td>
								</tr>
							  </tbody>
							</table>
							
							<a href="bWrite.do" class="button button-3d button-mini button-rounded button-white button-light" style="float: right; margin-bottom: 25px">글쓰기</a>

							<div class="line"></div>
							<ul class="pagination pagination-rounded pagination-secondary justify-content-center">
							  <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">«</span></a></li>
							  <li class="page-item active"><a class="page-link" href="#">1</a></li>
							  <li class="page-item"><a class="page-link" href="#">2</a></li>
							  <li class="page-item"><a class="page-link" href="#">3</a></li>
							  <li class="page-item"><a class="page-link" href="#">4</a></li>
							  <li class="page-item"><a class="page-link" href="#">5</a></li>
							  <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
							</ul>
						</div><!-- .postcontent end -->
						
						<!-- sidebar -->
						<div class="sidebar col-lg-2">
							<div class="sidebar-widgets-wrap">
								<div class="widget widget_links clearfix">
									<h4 style="margin-bottom: 7px; padding: 2px; background-color:#F5F5F5; text-align: center; ">최신글</h4>
									<ul>
										<li>
											<a href="animations.html">
												이거글자몇글자까지 될예정?
											</a>
										</li>
										<li>
											<a href="animations.html">
												Animations
											</a>
										</li>
										<li>
											<a href="animations.html">
												Animations
											</a>
										</li>
										<li>
											<a href="animations.html">
												Animations
											</a>
										</li>
									</ul>

								</div>

							</div>
						</div>
						<!-- sidebar end -->
					</div>

				</div>
			</div>
		</section>
	<c:import url="../common/footer.jsp"/>
</body>
</html>