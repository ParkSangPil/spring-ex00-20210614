<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

<script type="text/javascript">
$(function() {
	var canUseId = false;
	var passwordConfirm = false;
	
	// 아이디 중복 확인
	$("#id-dup-btn").click(function() {
		var idVal = $("#signup-input1").val();
		var messageElem = $("#id-message");
		canUseId = false;
		toggleEnableSubmit();
		
		if (idVal == "") {
			// 아이디가 입력되지 않았을 때
			$("#id-message").removeClass("text-success");
			$("#id-message").addClass("text-danger");
			messageElem.text("아이디를 입력해주세요.");
			
			
		} else {
			// 아이디가 입력되어있을 때
			var data = {id : idVal};
			$.ajax({
				type: "get",
				url: "${appRoot}/member/dup",
				data: data,
				success: function (data) {
					if (data == "success") {
						console.log("사용 가능한 아이디");
						canUseId = true;
						var ans = confirm("사용 가능한 아이디 입니다. 사용하시겠습니까?");
						
							if(ans){
								$("#id-message").removeClass("text-danger");
								$("#id-message").addClass("text-success");
								messageElem.text("사용가능한 아이디 입니다.");											
								$("#signup-input1").attr("readonly", "readonly");
							}
							
					} else if (data == "exist") {
						console.log("사용 불가능한 아이디");
						$("#id-message").removeClass("text-success");
						$("#id-message").addClass("text-danger");
						messageElem.text("이미 있는 아이디 입니다.");
					}
					
					toggleEnableSubmit();
				}, 
				error: function() {
					console.log("아이디 중복 체크 실패");
				}
				
			});
		}
	})
	
	
	// 패스워드 확인
	$("#signup-input2, #signup-input4").keyup(function() {
		var pw1 = $("#signup-input2").val();
		var pw2 = $("#signup-input4").val();
		var submitBtn = $("#signup-btn1");
		passwordConfirm = false;
		
		if (pw1 != pw2) {
			passwordConfirm = false;
			$("#password-message").removeClass("text-success");
			$("#password-message").addClass("text-danger");
			$("#password-message").text("패스워드가 일치하지 않습니다.");	
		} else {
			
			if(pw1 == ""){
				passwordConfirm = false;
				$("#password-message").text("패스워드를 입력해 주세요.");
			}else{
				passwordConfirm = true;
				$("#password-message").removeClass("text-danger");
				$("#password-message").addClass("text-success");
				$("#password-message").text("패스워드가 일치합니다.");	
			}
		}
		
		// submit 버튼 disable/enalbe 토글
		toggleEnableSubmit();
	});
	
	function toggleEnableSubmit() {
		if (passwordConfirm && canUseId) {
			$("#signup-btn1").removeAttr("disabled");
		} else {
			$("#signup-btn1").attr("disabled", "disabled");
		}
	}
});
</script>

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
					<label for="signup-input1">아이디</label>
					<div class="input-group">
						<input type="text" class="form-control" id="signup-input1" name="userid" >
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
							        id="id-dup-btn">
							아이디 중복 체크        
							</button>
						</div>
					</div>
					<small id="id-message" class="form-text"></small>
					
					
				</div>
				<div class="form-group">
					<label for="input2">비밀번호</label>
					<input type="password" class="form-control" id="signup-input2" name="userpw">
				</div>
				<div class="form-group">
					<label for="signup-input4">패스워드 확인</label>
					<input type="password" class="form-control" id="signup-input4">
					<small id="password-message" class="form-text text-danger"></small>
				</div>
				<div class="form-group">
					<label for="input3">이름</label>
					<input type="text" class="form-control" id="signup-input3" name="userName">
				</div>
				<button type="submit" class="btn btn-primary" id="signup-btn1" disabled="disabled">회원 가입</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>