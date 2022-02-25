<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>관리자 가입</title>
</head>
<body>
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expaned="false">
         <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="Main.jsp">자취세끼</a>
      </div>
   <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
         <li><a href="Login.jsp">로그인</a></li>
         <li><a href="Join.jsp">회원가입</a></li>
      </ul>
  </div> 
 </nav>
   <!-- 로긴폼 -->
   <div class="container">
     <div class="col-lg-4"></div>
     <div class="col-lg-4">
     <h1 align="center">관리자 로그인 창</h1>
     <form method="post" action="AdminJoinAction.jsp">
      <h3 style="text-align: center;"> <img src="image/logo1.PNG" width="300" height="300"></h3>
   <div class="form-group">
   <input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
   </div>
   <div class="form-group">
   <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
   </div>
   <div class="form-group">
   <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
   </div>
   <div class="form-group">
   <input type="text" class="form-control" placeholder="생년월일 ex)19971216" name="userDate" maxlength="20">
   </div>
   <input type="submit" class="btn btn-primary form-control" value="회원가입">
</form>
 </div>
</div>
</div>
   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>
</body>
</html>