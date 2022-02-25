
<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>

<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹사이트</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}


</style>
</head>
<body>
		<%
			//로긴한사람이라면	 userEmail이라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
			String userEmail = null;
			if (session.getAttribute("userEmail") != null) {
				userEmail = (String) session.getAttribute("userEmail");
			}
			int pageNumber = 1; //기본 페이지 넘버
			//페이지넘버값이 있을때
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
		%>
		<!-- 네비게이션  -->
	<nav class="navbar navbar-default ">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="Main.jsp">자취세끼</a>
		</div>
		<%
if( (String)session.getAttribute("userEmail") == null) 
 {%>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="Login.jsp">로그인</a></li>
				<li><a href="Join.jsp">회원가입</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>로그인 해주세요</li>
			</ul>
		</div>
		<% }else { %>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="BBS.jsp">레시피</a></li>
				<li><a>게시판</a></li>
				<li><a href="LogoutAction.jsp">로그아웃</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><%=(String)session.getAttribute("userEmail")+ "이 로그인 되었습니다." %></li>
			</ul>
		</div>
		<% }%>
	</nav>
		<!-- 게시판 -->
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">이미지</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							BbsDAO bbsDAO = new BbsDAO();

							String path = application.getRealPath("/upload/");
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getRecipeID()%></td>
							<td><a href="View.jsp?recipeID=<%=list.get(i).getRecipeID()%>"><%=list.get(i).getRecipeTitle()%></a></td>
							<td><img src="<%=path + "/" + list.get(i).getFileRealName()%>" width="120" height="100"></td>
							<td><%=list.get(i).getUserEmail()%></td>
							<td><%=list.get(i).getRecipeDate().substring(0, 11) + list.get(i).getRecipeDate().substring(11, 13) + "시"
							+ list.get(i).getRecipeDate().substring(14, 16) + "분"%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<!-- 페이지 넘기기 -->
				<%
					if (pageNumber != 1) {
				%>
				<a href="BBS.jsp?pageNumber=<%=pageNumber - 1%>"
					class="btn btn-success btn-arrow-left">이전</a>
				<%
					}
					if (bbsDAO.nextPage(pageNumber)) {
				%>
				<a href="BBS.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success btn-arrow-left">다음</a>
				<%
					}
				%>
				<!-- 회원만넘어가도록 -->
				<%
					//if logined userID라는 변수에 해당 아이디가 담기고 if not null
					if (userEmail != null) {
				%>
				<a href="Write.jsp" class="btn btn-primary pull-right">글쓰기</a>
				<%
					} else {
				%>
				<button class="btn btn-primary pull-right"
					onclick="if(confirm('로그인 하세요'))location.href='Login.jsp';"
					type="button">글쓰기</button>
				<%
					}
				%>
			</div>
		</div>
		<!-- 애니매이션 담당 JQUERY -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<!-- 부트스트랩 JS  -->
		<script src="js/bootstrap.js"></script>
	</body>
</html>