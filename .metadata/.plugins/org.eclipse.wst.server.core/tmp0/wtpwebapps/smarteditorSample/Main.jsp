
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
	font-weight: bold;
}

.main ul {
	background-color: #dfdfdf;
	border: 1px solid gray;
}

.main>ul {
	display: inline-block;
}

.main>ul>li {
	display: inline-block;
	float: left;
	width: 200px;
	border: 1px solid gray;
}

.main li>a {
	padding: 10px;
	display: block;
}

.main li:hover>a {
	background-color: black;
	color: white;
}

.main li {
	position: relative;
}

.main ul ul {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	width: 200px;
}

.main li>ul>li {
	
}

.main li:hover>ul {
	display: block;
}

.main {
	text-align: center;
}

a {
	color: inherit;
	text-decoration: inherit;
	font-weight: bold;
}
</style>
<title>자취세끼</title>
</head>
<body>
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


	<div>
		<form action="#" method="post"
			style="display: flex; justify-content: center;">
			<a href="Main.jsp"><img src="image/img1.png" width="100"
				height="100"></a> <input type="text" placeholder="내용을 입력해주세요"
				style="border-radius: 5px; border =1; height: 40px; width: 220px; position: relative; top: 30px;">
			<input type="button" value="검색"
				style="border-radius: 5px; border: none; height: 40px; width: 100px; position: relative; top: 30px;">
		</form>
	</div>

	<div>

		<nav class="main">
			<ul>
				<li><a href="Main.jsp">홈</a></li>

				<li><a href="BBS.jsp">레시피</a>
					<ul>
						<li><a href="#">간단 음식</a></li>
						<li><a href="#">국/탕</a></li>
						<li><a href="#">술안주</a></li>
					</ul></li>


				<li><a href="BBS.jsp">게시판</a>
					<ul>
						<li><a href="#">인천</a></li>
						<li><a href="#">서울</a></li>
					</ul></li>

				<li><a href="Map.jsp">찾아오는길 </a></li>
			</ul>
		</nav>
	</div>

	<div>
		<h1 style="display: flex; justify-content: center">자취세끼 추천 레시피</h1>
		<div style="display: flex; justify-content: space-around;">
			<ul>
				<% 
				BbsDAO BbsDAO = new BbsDAO(); 
				String path = application.getRealPath("/upload/");
				int i=1;
				String SQL = "SELECT * FROM Recipe where RecipeAvailable=1";
				try {
					String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
					String dbID = "a201645006";
					String dbPassword = "manager";
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					ResultSet rs = pstmt.executeQuery();
					Bbs bbs = new Bbs();
					while (rs.next()) {
						if (i > 3) {
							break;
						}
						bbs.setRecipeID(rs.getInt(1));
						bbs.setRecipeTitle(rs.getString(2));
						bbs.setUserEmail(rs.getString(3));
						bbs.setFileRealName(rs.getString(4));
						bbs.setFilepath(rs.getString(5));
						bbs.setRecipeDate(rs.getString(6));
						bbs.setRecipeContent(rs.getString(7));
						bbs.setRecipeAvailable(rs.getInt(8));
				%>
				<li style="border: 1px solid black; display: inline-block;"><a
					href="View.jsp?recipeID=<%=bbs.getRecipeID()%>"> <img
						src="<%=path + "/" + bbs.getFileRealName()%>" width="120"
						height="100"></a>
					<ul>
						<li style="border-top: 1px solid black; text-align: center;"><%=bbs.getRecipeTitle()%></li>
					</ul></li>
				<%
				}
					rs.close();
					pstmt.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</ul>

		</div>
	</div>

	<div>
		<h1 style="display: flex; justify-content: center;">자취세끼 추천 맛집</h1>
	</div>

	<div style="height: 250px;">

		<ul>
			<li style="display: inline-block; font-size: 12;">대표 : 이종건 /
				Email:ex924097@naver.com / F : 032)870-2114<br> 인천광역시 미추홀구
				인하로100인하공업전문대학<br> 문의전화(운영시간 평일 10:00~18:00)<br> 서비스 이용문의
				:010-2231-7425<br> <br> (주)자취세끼
				<ul>
					<li style="display: inline-block;"><a
						href="https://twitter.com/"><img src="image\bird.PNG"></a></li>
					<li style="display: inline-block;"><a
						href="https://www.youtube.com/"><img src="image\youtube.PNG"></a></li>
					<li style="display: inline-block;"><a
						href="https://www.facebook.com/"><img src="image\facebook.PNG"></a></li>
					<li style="display: inline-block;"><a
						href="https://www.instagram.com/"><img src="image\instar.PNG"></a></li>
				</ul>
			</li>
			<li style="display: inline-block; float: right;">
				<ul>
					<li style="display: inline-block;">
						<form action="#" method="post">
							<p>
								<textarea cols="40" rows="10"
									placeholder="회원님들의 의견을 자취세끼에게 알려주세요" style="font-size: 12;"></textarea>
							</p>
							<p style="display: flex; justify-content: center">
								<input type="submit" value="의견제출"
									style="display: flex; justify-content: center; width: 305; height: 30; border: 0;">
							</p>
						</form>
					</li>
				</ul>

			</li>
		</ul>
	</div>












	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>