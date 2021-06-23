<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">

	<bd:navbar></bd:navbar>
	
	<h1>글 목록</h1>
	<table class="table table-striped">
		<thead>
			<tr class="text-center">
				<th>#</th>
				<th>제목</th>
				<th>작성자</th>
				<th>입력일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="board">
				<tr>
					<td>${board.bno } </td>
					<td>
						<a href="${appRoot }/board/get?bno=${board.bno}">
							${board.title } 
						</a>
					</td>
					<td>${board.writer } </td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.regdate }"/>
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd [E요일] a hh:mm:ss" value="${board.updateDate }"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<c:if test="${not empty result }">
<script type="text/javascript">
$(document).ready(function(){
	
	if(history.state == null){		
		$("#board-modal1").modal('show');
		history.replaceState({},null); /* 이 코드때문에 중복으로 알림이 안나온다. */
		console.log("어서와 처음이지!!!")
	}else{
		console.log("너 여기 왔었어!!!!")
	}
});
</script>

<div id="board-modal1" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">명령이 완료되었습니다.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>글이 ${result }되었습니다! 걱정말라구!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">파랑색 알았따</button>
      </div>
    </div>
  </div>
</div>

</c:if>


</body>
</html>