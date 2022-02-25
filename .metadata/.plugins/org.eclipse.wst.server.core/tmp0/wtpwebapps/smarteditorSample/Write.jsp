<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

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
<!-- Smart Editor -->
<script type="text/javascript" src="<%=request.getContextPath()%>/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/SE2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
 
<!-- Smart Editor -->
<script type="text/javascript">
 
var oEditors = [];
$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "recipeContent",
	    sSkinURI: "/smarteditorSample/SE2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	 
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	$("#save").click(function() {
	    // 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["recipeContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	    $("#recipe").submit();
	});

});
	 
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src=C:/Workspace/Project/smarteditorSample/WebContent/img/'+filepath+'>';
	    oEditors.getById["recipeContent"].exec("PASTE_HTML", [sHTML]);
	}
</script>
<body>
	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
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
		
			<form id="recipe" method="post" action="WriteAction.jsp" enctype="multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="recipeTitle" maxlength="50"/></td>
						</tr>
						<tr>
							<td><input type="file" class="form-control" placeholder="글 제목" name="file" maxlength="50"/></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" id="recipeContent" name="recipeContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
					
				</table>	
				<input type="submit" class="btn btn-primary pull-right" id="save" value="글쓰기" /> 
			</form>
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>