<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>

<div class="container">
<bd:navbar></bd:navbar>
	<h1>글 쓰기</h1>
	
	<div class="row">
		<div class="col-12">
			<form action="${appRoot }/board/register" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="input1">제목</label>
					<input id="input1" class="form-control" name="title">
				</div>
				<div class="form-group">
					<label for="textarea1">내용</label>
					<textarea id="textarea1" class="form-control" name="content" rows="5" cols=""></textarea>
				</div>
				<div class="form-group">
					<label forinput3>첨부 파일</label>
					<input id="input3" class="form-control" multiple="multiple" type="file" name="file" accept="image/*">
				</div>
				<div class="form-group">
					<label for="input2">작성자</label>
					<input id="input2" class="form-control" name="writer" value="${pinfo.member.userid }" hidden="">
					<input class="form-control" value="${pinfo.member.userName }" readonly="readonly">
				</div>
				<input class="btn btn-primary" type="submit" value="작성">
			</form>
		</div>
	</div>
</div>
</body>
</html>