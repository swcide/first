<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.write{
	padding: 50px
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<section class="content">
		<div class="write">
			<form method="post" action="writeAction.jsp">
				<table class="table "style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="0"	style="background-color: #eeeeee; text-align: center;">
								게시판 글쓰기 
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type="text" class="form-control" placeholder="글 제목" name="" maxlength="50"/>
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="글 내용" name="" maxlength="2048" style="height: 350px;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>	
				<input class="form-control-file" type="file" name="uploadFile">
				<a href="#" class="button button-rounded button-reveal button-small button-white button-light text-right float-right"><i class="icon-line-arrow-right"></i><span>글쓰기</span></a>
			</form>
		</div>
	</section>


	<c:import url="../common/footer.jsp"/>
</body>
</html>