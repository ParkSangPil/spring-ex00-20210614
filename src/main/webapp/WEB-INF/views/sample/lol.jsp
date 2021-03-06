<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="lol" tagdir="/WEB-INF/tags/lol" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://img.icons8.com/ios-glyphs/50/000000/league-of-legends.png" rel="shortcut icon" type="image/x-icon">

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>OP.GG</title>

<script type="text/javascript">
$(function(){
	$("#vic1").change(function(){
		$("#vic2").val("패")
		$("#vic1").val("승")
		$("#span1").html("<h4>승리</h4>")
		$("#span2").html("<h4>패배</h4>")/* text 도 됨 */
	})
	$("#vic2").change(function(){
		$("#vic2").val("승")
		$("#vic1").val("패")
		$("#span1").html("<h4>패배</h4>")
		$("#span2").html("<h4>승리</h4>")
	})
	
	var count1 = 0;
	$(".lol-member-select").change(function(){
		count1 = count1 + 1;
	})
	
	$("#btn5").click(function(e){
		e.preventDefault();
		if($("#vic1").is(":checked") || $("#vic2").is(":checked")){
			if(count1 > 9){
				
				//$("#form1").submit();
				var data = getData();
				
				$.ajax({
					type: "post",
					url: "${appRoot}/sample/register2",
					data: JSON.stringify(data),
					contentType: "application/json",
					success: function() {
						console.log("성공");
					},
					error: function() {
						console.log("실패");
					}
				});
				
				alert("입력 완료.");
				location.reload();
				
			}else{
				alert("모든 선수를 입력하지 않았습니다.");
			}
			
			
		}else{
			alert("승리 여부를 선택 하지 않았습니다.");		
		}
		
		
	})
	
	function getData() {
		// .lol-member-select
		// .lol-kill-input
		// .lol-death-input
		// .lol-assist-input
		// .lol-champ-select
		// .lol-victory-input
		
		var lolMemberSelect = $(".lol-member-select");
		var lolKillInput = $(".lol-kill-input");
		var lolDeathInput = $(".lol-death-input");
		var lolAssistInput = $(".lol-assist-input");
		var lolChampSelect = $(".lol-champ-select");
		var lolVictoryInput = $(".lol-victory-input");
		
		var arr = [];
		for (var i = 0; i < 5; i++) {
			var item = {};
			item.teamn = lolMemberSelect.eq(i).val();
			item.teamk = lolKillInput.eq(i).val();
			item.teamd = lolDeathInput.eq(i).val();
			item.teama = lolAssistInput.eq(i).val();
			
			item.teamc = lolChampSelect.eq((i*2)+1).val();
			
			item.victory = lolVictoryInput.eq(0).val();
			arr.push(item);
		}
		
		for (var i = 5; i < 10; i++) {
			var item = {};
			item.teamn = lolMemberSelect.eq(i).val();
			item.teamk = lolKillInput.eq(i).val();
			item.teamd = lolDeathInput.eq(i).val();
			item.teama = lolAssistInput.eq(i).val();
			
			item.teamc = lolChampSelect.eq((i*2)+1).val();
			// 이새끼 검색기능 넣다보니 똑같은 클래스 두개 들어가서 이렇게 함
			
			item.victory = lolVictoryInput.eq(1).val();
			arr.push(item);
		}
		
		return arr;
	}
})
</script>

<script type="text/javascript">

	$(function() {
		for (let i = 1; i < 16; i++) {
			let champ = $("#" + `\${i}`).text();

			$.ajax({
				type : "post",
				data : {
					champ : champ
				},
				url : "${appRoot}/sample/getBestPlayer",
				success : function(data) {
					$("#" + `\${i}` + "ts").text(data);
				},
				error : function() {
					console.log("실패");
				}

			})
		}

		$("#duobutton").click(function(e) {
			e.preventDefault();

			var Aplayer = $("#Aplayer").val();
			var Bplayer = $("#Bplayer").val();

			//$("#form1").submit();
			var data = {
				Aplayer : Aplayer,
				Bplayer : Bplayer
			};

			$.ajax({
				type : "post",
				url : "${appRoot }/sample/duo",
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
	})
</script>

</head>
<body style="background-color: rgb(249 247 232);">
<div class="container mt-5">

	<div class="row justify-content-center">
		<select id="Aplayer" name="Aplayer" class="form-control col-1">
			<option selected="selected"> </option>
			<option value="깜시">깜시</option>
			<option value="상필">상필</option>
			<option value="짱깨">짱깨</option>
			<option value="이승">이승</option>
			<option value="쥐">쥐</option>
			<option value="게이">게이</option>
			<option value="고기">고기</option>
			<option value="휴지">휴지</option>
			<option value="때">때</option>
			<option value="정력">정력</option>
			<option value="형원">형원</option>
			<option value="사서">사서</option>
		</select>
	<span class="align-self-center">&nbsp와&nbsp</span>
		<select id="Bplayer" name="Bplayer" class="form-control col-1">
			<option selected="selected"> </option>
			<option value="깜시">깜시</option>
			<option value="상필">상필</option>
			<option value="짱깨">짱깨</option>
			<option value="이승">이승</option>
			<option value="쥐">쥐</option>
			<option value="게이">게이</option>
			<option value="고기">고기</option>
			<option value="휴지">휴지</option>
			<option value="때">때</option>
			<option value="정력">정력</option>
			<option value="형원">형원</option>
			<option value="사서">사서</option>
		</select>
	<span class="align-self-center">&nbsp의 승률 : </span>
	<input readonly="readonly" style="border-style: none; width:80px; outline:none; text-align: center; background-color: rgb(249 247 232);" id="duowinrate" value="">
	<button id="duobutton" type="submit" class="btn btn-info">검색</button>
	<input readonly="readonly" style="border-style: none; width:40px; outline:none; text-align: center; background-color: rgb(249 247 232);" id="wincount" value="">
	<input readonly="readonly" style="border-style: none; width:40px; outline:none; text-align: center; background-color: rgb(249 247 232);" id="loscount" value="">
	</div>
	
	<div class="mt-5">
	</div>

	<form id="form1" action="${appRoot }/sample/register" method="post">
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
		
		<input name="team11k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team12k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team13k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team14k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team15k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input name="team11d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team12d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team13d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team14d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team15d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input name="team11a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team12a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team13a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team14a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team15a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		
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
					<input id="vic1" type="radio" name="victory" value="승" class="lol-victory-input">
				</div>
			</div>
			<span id="span1" style="padding-top:50%; display: table-cell; height:auto; text-align: center; vertical-align: middle;" readonly="readonly" class="form-control"><h4>승리</h4></span>
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
		
		<input name="team21k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team22k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team23k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team24k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team25k" style="text-align: center;" type="text" class="form-control lol-kill-input" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input name="team21d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team22d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team23d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team24d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team25d" style="text-align: center;" type="text" class="form-control lol-death-input" placeholder="0" aria-describedby="basic-addon1">
		
		</div>
		
		<div class="col-1">
		
		<input name="team21a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team22a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team23a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team24a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		<input name="team25a" style="text-align: center;" type="text" class="form-control lol-assist-input" placeholder="0" aria-describedby="basic-addon1">
		
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
					<input id="vic2" type="radio" name="victory" value="승"  class="lol-victory-input">
				</div>
			</div>
			<span id="span2" style="padding-top:50%; display: table-cell; height:auto; text-align: center; vertical-align: middle;" readonly="readonly" class="form-control"><h4>승리</h4></span>
		</div>
		
	</div>
	
	<div class="row justify-content-center mt-5">
		<div class="col-10">
			<button id="btn5" class="btn btn-info float-right">확인</button>
		</div>
	</div>
	</form>
	
	<div class="row container mt-5">
		<div class="col-5">
			<table class="table">
				<thead>
				<tr>
					<th style="text-align: center;" scope="col">#</th>
					<th style="text-align: center;" scope="col">이름</th>
					<th style="text-align: center;" scope="col">승률</th>
					<th style="text-align: center;" scope="col">KDA</th>
					<th style="text-align: center;" scope="col">참여</th>
				</tr>
				</thead>
				
				<tbody> 
					<c:forEach items="${list55 }" var="lol" varStatus="status">
					<tr>
						<td style="text-align: center;">${status.index + 1 }</td>
						<td style="text-align: center;">${lol.name }</td>
						<td style="text-align: center;">${lol.winrate } %</td>
						<td style="text-align: center;">${lol.kda}</td>
						<td style="text-align: center;">${lol.total }</td>
					</tr>
					</c:forEach> 
				</tbody>
				
			</table>
		</div>
		
		<div class="col-2">
		
		</div>
		
		<div class="col-5">
         <table class="table">
            <thead>
            <tr>
               <th style="text-align: center;" scope="col">#</th>
               <th style="text-align: center;" scope="col">Champ</th>
               <th style="text-align: center;" scope="col">승률</th>
               <th style="text-align: center;" scope="col">모스트 플레이어</th>
            </tr>
            </thead>
            
            <tbody> 
               <c:forEach items="${list66 }" var="lol2" varStatus="status">
               <tr>
                  <td style="text-align: center;">${status.index + 1 }</td>
                  <td id="${status.index + 1 }" style="text-align: center;">${lol2.champ }</td>
                  <td style="text-align: center;">${lol2.winrate } %</td>
                  <td id="${status.index + 1 }ts"style="text-align: center;"></td>
               </tr>
               </c:forEach>
            </tbody>
            
         </table>
      </div>
	</div>
	
	<a href="${appRoot }/sample/sadari">사다리 타러 가기</a>
				
	<hr>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</div>

</body>
</html>