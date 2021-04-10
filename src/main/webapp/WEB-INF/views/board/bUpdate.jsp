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
	
	<section class="content">
		<div class="write">
			<form method="post" action="bupdate.do" enctype="multipart/form-data">
				<input type="hidden" name="bWriter" value="${ loginUser.id }">
				<input type="hidden" name="bId" value="${b.bId }">
				<input type="hidden" name="originalFileName" value="${b.originalFileName }">
				<input type="hidden" name="renameFileName" value="${b.renameFileName }">	
				<table class="table "style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan=""	style="background-color: #eeeeee; text-align: center;">
								게시판 글쓰기 
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
							 
								<input type="text" class="form-control" value="${b.bTitle }" name="bTitle" maxlength="50"/>
							</td>
						</tr>
						<tr >
							<td>
								<textarea id="summernote" class="form-control" placeholder="" name="bContent" maxlength="2048" style="height: 350px;">${b.bContent }</textarea>
							</td>
						</tr>
					</tbody>
				</table>	
				<input class="form-control-file" type="file" name="uploadFile">
					<c:if test="${ !empty b.originalFileName }">
						<br> 현재 업로드한 파일 :
						<a href="${ contextPath }/resources/buploadFiles/${b.renameFileName}" download="${b.originalFileName}">${b.originalFileName}</a>
					</c:if>
				<button class="button button-rounded button-reveal button-small button-white button-light text-right float-right"><i class="icon-line-arrow-right"></i><span>수정하기</span></button>
			</form>
		</div>
	</section>


	<c:import url="../common/footer.jsp"/>
	
	
	
	
	
	
<script>
	$(document).ready(function() {
	//여기 아래 부분
	var content = 
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  
			  toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
				,
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files, editor, welEditable) {
						uploadSummernoteImageFile(files[0],this);
					}
					
				}
          
		});
	});
	  
	function uploadSummernoteImageFile(file,el) {
		data = new FormData();
		data.append("file", file);
		
		console.log(data)
		$.ajax({
			data : data,
			type : "POST",
			url : "sNoteImg.do",
			contentType : false,
			processData : false,
			success : function(data) {
				console.log(data)
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}

	</script>

</body>
</html>