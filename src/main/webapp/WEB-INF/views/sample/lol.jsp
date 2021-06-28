<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="lol" tagdir="/WEB-INF/tags/lol" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1 class="row justify-content-center">lol</h1>
	
	<div class="row justify-content-center">
		<h4 class="col-3">team1</h4>
		<h5 style="text-align: center;" class="col-1">K</h5>
		<h5 style="text-align: center;" class="col-1">D</h5>
		<h5 style="text-align: center;" class="col-1">A</h5>
		<h4 style="text-align: center;" class="col-2">champ</h4>
	</div>
	<div class="row justify-content-center">
		<div class="col-3">
			<lol:member/>
			<lol:member/>
			<lol:member/>
			<lol:member/>
			<lol:member/>
			
		</div>
		
		<div class="col-1">
		
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-2">
		
		<lol:champlist/>
		<lol:champlist/>
		<lol:champlist/>
		<lol:champlist/>
		<lol:champlist/>
		
		
		</div>
		
	</div>
	
	<br>
	<div class="row justify-content-center">
		<div class="col-8">
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
	</div>
	<div class="row justify-content-center">
		<div class="col-3">
			<lol:member/>
			<lol:member/>
			<lol:member/>
			<lol:member/>
			<lol:member/>
			
		</div>
		
		<div class="col-1">
		
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		<input style="text-align: center;" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-2">

		<lol:champlist/>
		<lol:champlist/>
		<lol:champlist/>
		<lol:champlist/>
		<lol:champlist/>
		
		</div>
		
	</div>
	
</div>

</body>
</html>