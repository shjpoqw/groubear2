<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/common/login.css" rel="stylesheet" type="text/css">
</head>
<body>


<body width="100%" height="100%">
    <form action="login.me" method="post" class="loginForm">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="empId" name="empId" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" class="empPwd" name="empPwd" placeholder="PW">
      </div>
      <button type="submit" class="btn" onclick="button()">
        LOG IN
      </button>
    
      <div class="bottomText">
        Don't you have ID? <a href="enrollForm.me">sign up</a>
      </div>
    </form>
  </body>

</body>
</html>