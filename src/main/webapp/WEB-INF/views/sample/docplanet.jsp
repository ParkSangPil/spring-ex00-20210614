<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="lol" tagdir="/WEB-INF/tags/lol"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>구독</title>

</head>

<body style="background-color: rgb(249, 247, 232);">
	<div class="header row"
		style="background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.1) 0px 20px 20px -20px;">


		<div class="col-2">
			<div class="fixed-top">
				<div class="collapse" id="navbarToggleExternalContent">
					<div class="bg-dark p-4">
						<h5 class="text-white h4">Collapsed content</h5>
						<span class="text-muted">Toggleable via the navbar brand.</span>
					</div>
				</div>
				<nav class="navbar navbar-dark bg-light" style="background-color: rgb(249, 247, 232);" >
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarToggleExternalContent"
						aria-controls="navbarToggleExternalContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</nav>
			</div>

		</div>

		<div class="col-10">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">

				<nav class="navbar navbar-dark bg-dark">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarToggleExternalContent"
						aria-controls="navbarToggleExternalContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</nav>


				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarScroll" aria-controls="navbarScroll"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarScroll">
					<ul class="nav d-flex justify-content-end"
						style="margin-left: 70%;">
						<li style="color: black; text-decoration: none;"
							class="nav-item active"><a class="nav-link" href="#">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li style="color: black; text-decoration: none;" class="nav-item"><a
							class="nav-link" href="#">Link</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarScrollingDropdown" role="button" data-toggle="dropdown"
							aria-expanded="false"> Link </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarScrollingDropdown">
								<li><a href="/serviceCenter/notice">공지사항</a></li>
								<li><a href="/serviceCenter/faq">자주하는 질문</a></li>
								<li><a href="/serviceCenter/myPersonalInquery">1:1 문의</a></li>
								<li><a href="/serviceCenter/qna">고객의 소리</a></li>
							</ul></li>
						<li style="color: black; text-decoration: none;" class="nav-item"><a
							class="nav-link" href="#">로그인</a></li>
					</ul>
				</div>
			</nav>
		</div>



	</div>

</body>
</html>