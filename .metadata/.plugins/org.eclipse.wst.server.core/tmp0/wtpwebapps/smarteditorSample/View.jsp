

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
	String path = application.getRealPath("/upload/");
		//로긴한사람이라면	 userEmail라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
		int recipeID = 0;
		if (request.getParameter("recipeID") != null) {
			recipeID = Integer.parseInt(request.getParameter("recipeID"));
		}
		if (recipeID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'BBS.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(recipeID);
		System.out.println(recipeID);
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
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">글 보기 </th>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<td style="width: 20%;"> 글 제목 </td>
							<td colspan="2"><%= bbs.getRecipeTitle() %></td>
						</tr>
						
						<tr>
							<td>이미지</td>	
							<td colspan="2"><img src="<%=path + bbs.getFileRealName()%>" width="100"></td>
						</tr>
						
						<tr>
							<td>작성자</td>	
							<td colspan="2"><%= bbs.getUserEmail() %></td>
						</tr>
						
						<tr>
							<td>작성일</td>	
							<td colspan="2"><%= bbs.getRecipeDate().substring(0, 11) + bbs.getRecipeDate().substring(11, 13) + "시"
							+ bbs.getRecipeDate().substring(14, 16) + "분"%></td>
						</tr>
						
						<tr>
							<td>내용</td>	
							<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getRecipeContent() %></td>
						</tr>
					</tbody>
				</table>	
				<a href = "BBS.jsp" class="btn btn-primary">목록</a>
				<%
				//글작성자 본인일시 수정 삭제 가능 
					UserDAO UserDAO = new UserDAO();
					User user = UserDAO.getUser(userEmail);
					if((userEmail != null && userEmail.equals(bbs.getUserEmail()))|| user.getAdminCheck()==3){
				%>
						<a href="Update.jsp?recipeID=<%= recipeID %>" class="btn btn-primary">수정</a>
						<a href="DeleteAction.jsp?recipeID=<%= recipeID %>" class="btn btn-primary">삭제</a>
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