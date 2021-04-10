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
	 width: 73%; 	
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
							  <c:forEach var="b" items="${ list }">
								<tr>
								  <td>${b.bId}</td>
								  <td>
								  	<span class="title">
									  <c:url var="bdetail" value="bDeteil.do">
										<c:param name="bId" value="${ b.bId }"/>
										<c:param name="currentPage" value="${ pi.currentPage }"/>
									  </c:url>
										<a href="${ bdetail }">${b.bTitle }</a>
									 </span>
								  </td>
								  <td>
 									<span class="uName">
								  		<a href="">${b.bWriter}</a>
								 	 </span></td>
								  <td>${b.bCreateDate}</td>
								  <td>${b.bCount}</td>
								</tr>
								</c:forEach>
							  </tbody>
							</table>
						
							<c:if test="${!empty sessionScope.loginUser }">	
								<a href="bWriteView.do" class="button button-3d button-mini button-rounded button-white button-light" style="float: right; margin-bottom: 25px">글쓰기</a>
							</c:if>
						
							<div class="line"></div>
							<ul class="pagination pagination-rounded pagination-secondary justify-content-center">
							
							
							 <c:if test="${ pi.currentPage eq 1 }">
							  <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">«</span></a></li>
							 </c:if>
							 <c:if test="${ pi.currentPage ne 1 }">
								 <c:url var="before" value="bList.do">
					                  <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				       		     </c:url>
							  	 <li class="page-item"><a class="page-link" href="${ before }" aria-label="Previous"> <span aria-hidden="true">«</span></a></li>
							  </c:if>
							  <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									
									
									<c:if test="${ p eq pi.currentPage }">
										<li class="page-item active"><a class="page-link" href="${ pagination }">${p}</a></li>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="bList.do">
						                    <c:param name="currentPage" value="${ p }"/>
						                </c:url>
										<li class="page-item"><a class="page-link" href="${ pagination }">${p}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${ pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								</c:if>	
								
								<c:if test="${pi.currentPage ne pi.maxPage }">
									<c:url var="after" value="bList.do">
						             	<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						            </c:url> 
							  		<li class="page-item"><a class="page-link" href="${after }" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								</c:if>
							</ul>
						</div><!-- .postcontent end -->
						
						<!-- sidebar -->
						<c:import url="../common/sidebar.jsp"/>
						<!-- sidebar end -->
					</div>

				</div>
			</div>
		</section>
	<c:import url="../common/footer.jsp"/>
</body>
</html>