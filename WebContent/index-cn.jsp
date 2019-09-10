<!DOCTYPE html>
<html lang="zh-Hans">
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>
body{
margin: 100px 0px;
padding:0px;
text-align:center;
align:center;
background-color:#80ced6;
}
input[type=text], input[type=password]{
width:20%;
padding:7px 10px;
margin: 8px 0;
display:inline-block;
border: 1px solid #ccc;
box-sizing: border-box;
}
button{
background-color:#4CAF50;
width: 10%;
padding: 9px 5px;
margin:5px 0;
cursor:pointer;
border:none;
color:#ffffff;
}
p {
font-family:verdana;
}
h2{
font-family:verdana;
}
button:hover{
opacity:0.8;
}
#un,#ps{
font-family:'Lato'ÂÂ, sans-serif;
color: gray;
}
</style>
</head>

	<body>
	 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<article>
  <header>
    <h3><a href="index.jsp">English</a> <a href="index-fr.jsp">French</a>  <a href="index-cn.jsp">中文</a></h3>
  </header>
</article>	
	
	
	<h2>登录表格</h2>
	<div id=container style="vertical-align:middle">
		<form action="loginprocess-cn.jsp" method="post">  
			<p>用户名:<input type="text" name="username"/></p>
			<p>&nbsp;&nbsp;密码:<input type="password" name="password"/></p>
			<input type="submit" value="登录"/>
		</form>  
	</div>
	</body>
</html> 