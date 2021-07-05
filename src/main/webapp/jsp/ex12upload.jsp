<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form action="${appRoot }/uploadex02/sub01" method="post" enctype="multipart/form-data"> <!-- 이건 파일 업로드할 때 고정된 설정 -->
		<input type="file" name="file" accept="image/*"/> <br>
		<input type="submit">
	</form>
</div>
</body>
</html>