<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>코드 스페이스</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css"/>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" type="text/css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_board.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<!-- Header -->
								<header id="header">
									<a href="/" class="logo"><strong>FULL STACK</strong> DEVELOPER</a>
									<!-- 바꾸기 -->																
									<c:if test="${user.user_id == null}">
										<ul class="icons">
											<li><a href="/login">로그인</a></li>
											<li><a href="/join">회원가입</a></li>
										</ul>
									</c:if>
									<c:if test="${user.user_id != null}">
										<ul class="icons">
											<li><a href="/logout.do">로그아웃</a></li>
										</ul>
									</c:if>				
								</header>
						<div class="inner">
							<section>
					<h3 class="board_title">자유게시판</h3>
					<br>
					<!-- Break -->
						<form method="post" action="#">
							<div class="col-12 name">
								<select name="demo-category" id="demo-category">
									<option value="">- 선택 -</option>
									<option value="board_title">제목</option>
									<option value="user_id">작성자</option>
									<option value="problem_id">문제 번호</option>
		
								</select>
							</div>
							<input class="search" type="text" name="search" value="검색">
						</form>
							

							<br>
							<!-- Table -->
							<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											
											<th style="text-align: left;">제목</th>
											<th>작성자</th>
											<th>게시일</th>
											<th>문제번호</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="board" items="${board}" >
									      
												 <tr>

												    <td style="text-align: left;">
												    	<a href="/board/${board.board_id}" style="color:black; border:0"><c:out value="${board.board_title}"/></a>
												    </td>
												    <td><c:out value="${board.user_id}"/></td>
												    <td><c:out value="${board.board_upload}"/></td>
												   	<c:if test="${board.problem_id > 0}">
														<td><a href="/problem/${board.problem_id}" style="color:black; border:0"><c:out value="${board.problem_id}"/></a></td>
													</c:if>
													<c:if test="${board.problem_id == 0}">
														<td><c:out value=""/></td>
													</c:if>	
												    
												  </tr>
												  </c:forEach>
										
									</tbody>
								</table>

							</div>
							<a href="/board/insert" style="color: black; border:0">글쓰기</a>
							<div class="page">
								<ul class="paging">
									<li class="page_num"><a href="#">1</a></li>
									<li class="page_num"><a href="#">2</a></li>
									<li class="page_num"><a href="#">3</a></li>
									<li class="page_num"><a href="#">4</a></li>
									<li class="page_num"><a href="#">5</a></li>
									<li class="page_num"><a href="#">6</a></li>
									<li class="page_num"><a href="#">7</a></li>
									<li class="page_num"><a href="#">8</a></li>
								</ul>
							</div>


						</form>
				</section>
								

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<img class="icon" src="<%=request.getContextPath()%>/resources/images/user.png">
										<!-- 사용자의 닉네임 클릭시 마이페이지로 이동 -->
										<c:if test="${user.user_id == null}">
										<h3 class="name"><a href="/login">먼저 로그인 해주세요!</a></h3>
										</c:if>
										<c:if test="${user.user_id != null}">
											<h3 class="name"><a href="/mypage">${user.user_id}</a></h3>
										</c:if>
									</header>
									<ul>
										<!-- 사이드 메뉴바에 Main Page 클릭시 메인페이지로 이동 -->
										<li><a href="/web"><img class="icon" src="<%=request.getContextPath()%>/resources/images/main_icon.png" alt="Main Page" />Main Page</a></li>
										<!-- 사이드 메뉴바에 Problem 클릭시 문제 페이지로 이동 -->
										<li><a href="/problem"><img class="icon" src="<%=request.getContextPath()%>/resources/images/problem_icon.png" alt="Problem Page" />Problem</a></li>
										<li>
											<span class="opener"><img class="icon" src="<%=request.getContextPath()%>/resources/images/board_icon.png" alt="Board Page" />Board</span>
											<ul>
												<!-- 사이드 메뉴바에 Q & A 클릭시 QnA 페이지로 이동 -->
												<li><a href="/question">Q & A</a></li>
												<!-- 사이드 메뉴바에 Free Board 클릭시 자유게시판 페이지로 이동 -->
												<li><a href="/freeboard">Free Board</a></li>
											</ul>
										</li>
									</ul>
								</nav>
						</div>
					</div>
			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>