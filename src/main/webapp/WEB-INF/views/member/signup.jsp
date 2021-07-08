<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<c:if test="${not empty param.error }">
		<div id="alert1" class="alert alert-danger" role="alert">
			회원가입에 실패 하였습니다.
		</div>
	</c:if>

	<bd:navbar></bd:navbar>	
	<h1>회원 가입</h1>
	<div class="row">
		<div class="col-12">
			<form action="${appRoot }/member/signup" method="post">
			
				<div class="form-group">
					<label for="input1">아이디</label>
					<input type="text" class="form-control" id="signup-input1" name="userid">
				</div>
				<div class="form-group">
					<label for="input2">비밀번호</label>
					<input type="password" class="form-control" id="signup-input2" name="userpw">
				</div>
				<div class="form-group">
					<label for="input3">이름</label>
					<input type="text" class="form-control" id="signup-input3" name="userName">
				</div>
				<button type="submit" class="btn btn-primary" id="signup-btn1">회원 가입</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>