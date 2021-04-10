<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.target { 
	display: inline-block; 
	white-space: nowrap; 
	overflow: hidden; 
	text-overflow: ellipsis; 
}


</style>
</head>
<body>
	<div class="sidebar col-lg-2">
							<div class="sidebar-widgets-wrap">
								<div class="widget widget_links clearfix card">
									<h4 class="card-header"style="margin-bottom: 7px; padding: 2px; background-color:#F5F5F5; text-align: center; ">최신글</h4>
									<ul >
										<c:forEach var="b" items="${toplist}">
											<c:url var="bDetail" value="bDeteil.do">
												<c:param name="bId" value="${b.bId}" />
												<c:param name="currentPage" value="${ pi.currentPage }" />
											</c:url> 
										
										
										<li>
											<a class =" target"href="${bDetail}">${b.bTitle}</a>
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
			</div>

</body>
</html>