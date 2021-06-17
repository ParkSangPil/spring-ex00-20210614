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
	<form action="<%= request.getContextPath() %>/ex02/sub07" method="post">
		<input type="checkbox" value="bts" name="fav">bts <br>
		<input type="checkbox" value="red" name="fav">red <br>
		<input type="checkbox" value="twice" name="fav">twice <br>
		<input type="checkbox" value="psy" name="fav">psy <br>
	
		<input type="submit" value="전송">
	</form>
	<hr>
	
	<form action="<%= request.getContextPath() %>/ex02/sub08" method="post">
		<input type="checkbox" value="bts" name="fav">bts <br>
		<input type="checkbox" value="red" name="fav">red <br>
		<input type="checkbox" value="twice" name="fav">twice <br>
		<input type="checkbox" value="psy" name="fav">psy <br>
	
		<input type="submit" value="전송">
	</form>
</div>
</body>
</html>