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

<script type="text/javascript">
$(document).ready(function(){
	$("#list-pagenation1 a").click(function(e){/* 띄어쓰기는 안쪽에 있는 a를 말하는 거다 */
		
		console.log("a요소 클릭됨");
		
		e.preventDefault();
		
		
		var actionForm = $("#actionForm");
		actionForm.find("[name=pageNum]").val($(this).attr("href"));
		
		actionForm.submit();
		
		
	});
	
	
	
	$("#pageUnit").change(function(){
	    var nowPaging = $("#pageUnit option:selected").val();
		
	    if(nowPaging == 10){
	        location.href="${appRoot}/board/list?pageNum=1&amount=10";  /* ${pageMaker.cri.pageNum } 라고 하면 버그가 있엉 */
	    }else if(nowPaging == 20){
	    	location.href="${appRoot}/board/list?pageNum=1&amount=20";
	    }else if(nowPaging == 30){
	    	location.href="${appRoot}/board/list?pageNum=1&amount=30";
	    }
	});
	
});
</script>


</head>
<body>
<div class="container">

	<bd:navbar></bd:navbar>
	
	<form class="form-inline" action="list">
		<h1 style="display: inline-block;">글 목록</h1>
		
		<select class="form-control" id="pageUnit" name="pageUnit" onchange="Change(1)">  <!-- name 을 amount로 바꾸고 onchange를 this.form.submit()로 바꿔도 작동한다 -->
			<option value="10" <c:if test="${cri.amount == 10}">selected="selected"</c:if>>10개씩 보기</option>
	        <option value="20" <c:if test="${cri.amount == 20}">selected="selected"</c:if>>20개씩 보기</option>
	        <option value="30" <c:if test="${cri.amount == 30}">selected="selected"</c:if>>30개씩 보기</option>
		</select>
	</form>
	
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
					
					<c:url value="/board/get" var="getUrl">
						<c:param name="bno" value="${board.bno }"></c:param>
						<c:param name="pageNum" value="${pageMaker.cri.pageNum }"></c:param>
						<c:param name="amount" value="${pageMaker.cri.amount }"></c:param>
						<c:param name="type" value="${pageMaker.cri.type }"></c:param>
						<c:param name="keyword" value="${pageMaker.cri.keyword }"></c:param>
					</c:url>
					
						<a href="${getUrl }">
							${board.title } 
							<c:if test="${board.replyCnt > 0}">
								[${board.replyCnt }]
							</c:if>
						</a>
					</td>
					<td style="text-align: center;">${board.writerName } </td>
					<td style="text-align: center;">
						<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.regdate }"/>
					</td>
					<td style="text-align: center;">
						<fmt:formatDate pattern="yyyy-MM-dd [E요일] a hh:mm:ss" value="${board.updateDate }"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div>
	<nav aria-label="Page navigation example">
	 <ul id="list-pagenation1" class="pagination justify-content-center">
	 <c:if test="${pageMaker.prev }">
	   <li class="page-item">
	     <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
	   </li>
	 </c:if>
	   
	   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num" >
	   	<li class="page-item ${num == cri.pageNum ? 'active' : '' }"><a class="page-link" 
	   	<%-- href="${appRoot }/board/list?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount }" --%>
	   	href="${num }">${num }</a></li>
	   </c:forEach>
	   
	   <c:if test="${pageMaker.next }">
		<li class="page-item">
		  <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
   	   	</li>
	   </c:if>
	  </ul>
	</nav>
	
	<div style="display: none;">
		<form id="actionForm" action="${appRoot }/board/list" method="get">
			<input name="pageNum" value="${pageMaker.cri.pageNum }">
			<input name="amount" value="${pageMaker.cri.amount }">
			<input name="type" value="${pageMaker.cri.type }">
			<input name="keyword" value="${pageMaker.cri.keyword }">
		</form>
	</div>
	
	
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