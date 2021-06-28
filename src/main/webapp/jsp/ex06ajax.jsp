<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

</head>
<body>
<h3>
<%= Math.random() %>
</h3>
<div class="container">
	<script>
	$(function() {
		$("#btn1").click(function() {
			console.log("click btn1");
			$.ajax("${appRoot}/rest06/sub01");
		});
		
		$("#btn11").click(function(){
			$.ajax({
				url: "${appRoot}/rest06/sub01"
			});
		});
	});
	</script>
	<button id="btn1">버튼1</button>
	<button id="btn11">버튼1-1</button>
	
	
	<script>
	$(document).ready(function() {
		$("#btn2").click(function() {
			var jqXHR = $.ajax("${appRoot}/rest06/sub02");
			jqXHR.done(function(data) {
				console.log("btn2 done function");
				console.log(data);
			});
		});
	});
	</script>
	<button id="btn2">버튼2</button>
	
	<script>
	$(function() {
		$("#btn3").click(function() {
			$.ajax("${appRoot}/rest06/sub02")
			.done(function(res) {
				console.log("btn3 done function");
				console.log(res);
			});
		});
		
		$("#btn31").click(function(){
			$.ajax({
				url : "${appRoot}/rest06/sub02",
				success : function (res){
					console.log("btn3-1 success function");
					console.log(res);
				}
			});
		});
		
	});
	</script>
	<button id="btn3">BTN3</button>
	<button id="btn31">BTN3-1</button>


	<script type="text/javascript">
		$(function(){
			$("#btn4").click(function(){
				$.ajax("${appRoot}/rest06/sub04").done(function(){
					console.log("성공!!!");
				})
				.fail(function(){
					console.log("실패!!!!!! btn4 fail");
				})
			});
			
			$("#btn41").click(function(){
				$.ajax({
					url: "${appRoot}/rest06/sub04",
					error: function(){
						console.log("실패!!!! btn4-1 error option")
					}
				})
			})
		});
	</script>
	<button id="btn4">BTN4</button>
	<button id="btn41">BTN4-1</button>
	
	<script type="text/javascript">
		$(function(){
			$("#btn5").click(function(){
				$.ajax({
					url: "${appRoot}/rest06/sub05",
					type: "put" // method로 교체가능 POST던 GET이던
				})
			})
		})
	</script>
	<button id="btn5">BTN5</button>
	
	
</div>
</body>
</html>