<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ attribute name="id" required="false" %>


<script>
$(function() {
	$(function(){
		$("#input-${id }").hide();
	})
	
	$("#select-${id}").change(function() {
		console.log("change !!");
		if($("#select-${id}").val() == "A"){
			$("#input-${id }").show();
			$("#input-${id}").keyup(function() {
				console.log('keyup');
				var name = $(this).val();
				$("#select-${id} option:last-child").attr("value", name);
				//console.log($("#input-${id} option:last-child"));
			});
		}else{
			$("#input-${id }").hide();
			$("#input-${id }").val("");
			$("#select-${id} option:last-child").attr("value", "A");
		}
	});
		
})
</script>
<div class="input-group">
<input id="input-${id }" type="text" class="form-control lol-member-input col-8">
<select id="select-${id}" name="${id }" class="form-control lol-member-select">
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
	<option value="A">용병</option>
</select>
</div>