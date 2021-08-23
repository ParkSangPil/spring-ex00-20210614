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

<script type="text/javascript">

	$(function() {
		
		$("#sadaribut").click(function() {

			var name1 = $("#name1").val();
			var name2 = $("#name2").val();
			var name3 = $("#name3").val();
			var name4 = $("#name4").val();
			var name5 = $("#name5").val();
			var name6 = $("#name6").val();
			var name7 = $("#name7").val();
			var name8 = $("#name8").val();
			var name9 = $("#name9").val();
			var name10 = $("#name10").val();

			//$("#form1").submit();
			var data = {
				name1 : name1,
				name2 : name2,
				name3 : name3,
				name4 : name4,
				name5 : name5,
				name6 : name6,
				name7 : name7,
				name8 : name8,
				name9 : name9,
				name10 : name10,
			};

			$.ajax({
				type : "post",
				url : "${appRoot }/sample/sadari2",
				data : data,
				success : function(data) {
					for(var i = 0 in data){
						var j = "#name"+(+i+1);
						
						$(j).val(data[i]);
					}
				},
				error : function() {
					console.log("실패");
				}
			});
			
			$.ajax({
				type : "post",
				url : "${appRoot }/sample/sadari3",
				data : data,
				success : function(data) {
					for(var i = 0 in data){
						var j = "#name"+(((+i+1)*10)+(+i+1));
						
						$(j).val(data[i]);
					}
				},
				error : function() {
					console.log("실패");
				}
			});
		})
	})
</script>

</head>
<body style="background-color: rgb(249 247 232);">
<div class="container mt-5">
<a href="${appRoot }/sample/lol" style="text-decoration: none; color: rgb(0 0 0); " class="row justify-content-center"><h1>lol</h1></a>
<div class="row justify-content-center mt-5">
	<input autofocus="autofocus" id="name1" style="width: 50px">
	<input id="name2" style="width: 50px">
	<input id="name3" style="width: 50px">
	<input id="name4" style="width: 50px">
	<input id="name5" style="width: 50px">
	<input id="name6" style="width: 50px">
	<input id="name7" style="width: 50px">
	<input id="name8" style="width: 50px">
	<input id="name9" style="width: 50px">
	<input id="name10" style="width: 50px">
</div>
<div class="container">
	<hr>
</div>
<div class="row justify-content-center">
	<input readonly="readonly" id="name11" style="width: 50px">
	<input readonly="readonly" id="name22" style="width: 50px">
	<input readonly="readonly" id="name33" style="width: 50px">
	<input readonly="readonly" id="name44" style="width: 50px">
	<input readonly="readonly" id="name55" style="width: 50px">
	<input readonly="readonly" id="name66" style="width: 50px">
	<input readonly="readonly" id="name77" style="width: 50px">
	<input readonly="readonly" id="name88" style="width: 50px">
	<input readonly="readonly" id="name99" style="width: 50px">
	<input readonly="readonly" id="name110" style="width: 50px">
</div>
<div class="row justify-content-center mt-5">
	<button type="submit" id="sadaribut" class="btn btn-info">돌려돌려</button>
</div>
</div>
</body>
</html>