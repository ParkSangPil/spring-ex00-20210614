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
$("#sadaribut").click(function(e) {
	e.preventDefault();

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
		url : "${appRoot }/sample/sadari",
		data : data,
		success : function(data) {
			$("#duowinrate").val(data.승률 + "%");
			$("#wincount").val(" " + data.승리카운트 + "승");
			$("#loscount").val(data.패배카운트 + "패");
		},
		error : function() {
			console.log("실패");
			$("duowinrate").val("전적이 없습니다");
		}
	});
})
</script>

</head>
<body style="background-color: rgb(249 247 232);">
<div class="container mt-5">
<a href="${appRoot }/sample/lol" style="text-decoration: none; color: rgb(0 0 0); " class="row justify-content-center"><h1>lol</h1></a>
<div>
	<input id="name1" style="width: 50px">
	<input id="name2" style="width: 50px">
	<input id="name3" style="width: 50px">
	<input id="name4" style="width: 50px">
	<input id="name5" style="width: 50px">
	<input id="name6" style="width: 50px">
	<input id="name7" style="width: 50px">
	<input id="name8" style="width: 50px">
	<input id="name9" style="width: 50px">
	<input id="name10" style="width: 50px">
	<button id="sadaribut" class="btn btn-info">돌려돌려</button>
</div>
<div>
	<input id="name11" style="width: 50px">
	<input id="name22" style="width: 50px">
	<input id="name33" style="width: 50px">
	<input id="name44" style="width: 50px">
	<input id="name55" style="width: 50px">
	<input id="name66" style="width: 50px">
	<input id="name77" style="width: 50px">
	<input id="name88" style="width: 50px">
	<input id="name99" style="width: 50px">
	<input id="name1010" style="width: 50px">
</div>
</div>
</body>
</html>