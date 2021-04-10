<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<html>
<head>

	<title>Home</title>
</head>
<body >
	<c:import url="common/header.jsp"/>
		<section id="page-title">

			<div class="container clearfix">
				<h1>Home</h1>
			</div>

		</section>
		
		
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">

					<!-- Posts
					============================================= -->
					<div id="posts" class="post-grid row grid-container gutter-30 has-init-isotope" data-layout="fitRows" style="position: relative; height: 700.34px;">
						<c:forEach var="b" items="${list}">			
						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="grid-inner">
								<div class="entry-image">
								</div>
								<div class="entry-title">
								 	 <c:url var="bdetail" value="bDeteil.do">
										<c:param name="bId" value="${ b.bId }"/>
										<c:param name="currentPage" value="${ pi.currentPage }"/>
									  </c:url>
										
									<h2><a href="${ bdetail }">${b.bTitle }</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> ${b.bCreateDate}</li>
										<li><i class="icon-user"></i> ${b.bWriter}</li>
									</ul>
								</div>
								<div class="entry-content">
									<p>${b.bContent }</p>
									<a href="${bdetail}" class="more-link">Read More</a>
								</div>
							</div>
						</div>
						
						</c:forEach>


					</div><!-- #posts end -->

					<!-- Pagination
					============================================= -->
					<ul class="pagination pagination-circle pagination-3d pagination-md justify-content-center">
							
							
							 <c:if test="${ pi.currentPage eq 1 }">
							  <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">«</span></a></li>
							 </c:if>
							 <c:if test="${ pi.currentPage ne 1 }">
								 <c:url var="before" value="home.do">
					                  <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				       		     </c:url>
							  	 <li class="page-item"><a class="page-link" href="${ before }" aria-label="Previous"> <span aria-hidden="true">«</span></a></li>
							  </c:if>
							  <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									
									
									<c:if test="${ p eq pi.currentPage }">
										<li class="page-item active"><a class="page-link" href="${ pagination }">${p}</a></li>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="home.do">
						                    <c:param name="currentPage" value="${ p }"/>
						                </c:url>
										<li class="page-item"><a class="page-link" href="${ pagination }">${p}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${ pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								</c:if>	
								
								<c:if test="${pi.currentPage ne pi.maxPage }">
									<c:url var="after" value="home.do">
						             	<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						            </c:url> 
							  		<li class="page-item"><a class="page-link" href="${after }" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								</c:if>
							</ul>

				</div>
			</div>
		</section>

	<c:import url="common/footer.jsp" />
</body>
</html>
