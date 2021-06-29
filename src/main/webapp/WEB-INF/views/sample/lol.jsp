<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="lol" tagdir="/WEB-INF/tags/lol" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>OP.GG</title>

<script type="text/javascript">
$(function(){
	$("#vic1").change(function(){
		$("#vic2").val("패")
		$("#vic1").val("승")
	})
	$("#vic2").change(function(){
		$("#vic1").val("패")
		$("#vic2").val("승")
	})
	
	$("#btn5").click(function(e){
		e.preventDefault();
		if($("#vic1").is(:"checked") || $("vic2").is(:"checked")){
			$(this).submit();
		}else{
			alert("승리 여부를 선택 하지 않았습니다.");		
		}
	})
})
</script>

</head>
<body>
<div class="container mt-5">
	<form action="${appRoot }/sample/register" method="post">
	<h1 class="row justify-content-center">lol</h1>
	
	<div class="row justify-content-center mt-5">
		<h4 class="col-3">team1</h4>
		<h5 style="text-align: center;" class="col-1">K</h5>
		<h5 style="text-align: center;" class="col-1">D</h5>
		<h5 style="text-align: center;" class="col-1">A</h5>
		<h4 style="text-align: center;" class="col-2">champ</h4>
		<h4 class="col-2"></h4>
	</div>
	<div class="row justify-content-center">
		<div class="col-3">
			<lol:member id="team11"/>
			<lol:member id="team12"/>
			<lol:member id="team13"/>
			<lol:member id="team14"/>
			<lol:member id="team15"/>
			
		</div>
		
		<div class="col-1">
		
		<input name="team11k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team12k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team13k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team14k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team15k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input name="team11d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team12d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team13d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team14d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team15d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input name="team11a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team12a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team13a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team14a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team15a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-2">
		
		<lol:champlist id="team11c"/>
		<lol:champlist id="team12c"/>
		<lol:champlist id="team13c"/>
		<lol:champlist id="team14c"/>
		<lol:champlist id="team15c"/>
		
		
		</div>
		
		<div class="input-group col-2">
			<div class="input-group-prepend">
				<div class="input-group-text">
					<input id="vic1" type="radio" name="victory1" value="승">
				</div>
			</div>
			<span style="padding-top:50%; display: table-cell; height:auto; text-align: center; vertical-align: middle;" readonly="readonly" class="form-control" >승리</span>
		</div>
		
	</div>
	
	<br>
	<div class="row justify-content-center">
		<div class="col-10">
			<hr>
		</div>
	</div>
	<br>
	
	<div class="row justify-content-center">
		<h4 class="col-3">team2</h4>
		<h5 style="text-align: center;" class="col-1">K</h5>
		<h5 style="text-align: center;" class="col-1">D</h5>
		<h5 style="text-align: center;" class="col-1">A</h5>
		<h4 style="text-align: center;" class="col-2">champ</h4>
		<h4 class="col-2"></h4>
	</div>
	<div class="row justify-content-center">
		<div class="col-3">
			<lol:member id="team21"/>
			<lol:member id="team22"/>
			<lol:member id="team23"/>
			<lol:member id="team24"/>
			<lol:member id="team25"/>
			
		</div>
		
		<div class="col-1">
		
		<input name="team21k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team22k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team23k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team24k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team25k" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input name="team21d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team22d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team23d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team24d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team25d" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input name="team21a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team22a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team23a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team24a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input name="team25a" style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-2">

		<lol:champlist id="team21c"/>
		<lol:champlist id="team22c"/>
		<lol:champlist id="team23c"/>
		<lol:champlist id="team24c"/>
		<lol:champlist id="team25c"/>
		
		</div>
		
		<div class="input-group col-2">
			<div class="input-group-prepend">
				<div class="input-group-text">
					<input id="vic2" type="radio" name="victory2" value="승">
				</div>
			</div>
			<span style="padding-top:50%; display: table-cell; height:auto; text-align: center; vertical-align: middle;" readonly="readonly" class="form-control" >승리</span>
		</div>
		
	</div>
	
	
	
	<div class="row justify-content-center mt-5">
		<div class="col-10">
			<button id="btn5" class="btn btn-info float-right">확인</button>
		</div>
	</div>
	</form>
	
</div>

</body>
</html>