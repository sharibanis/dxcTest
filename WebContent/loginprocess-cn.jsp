<!DOCTYPE html>
<html lang="zh-Hans">
<head>
<meta charset="UTF-8">
<title>Result Page</title>

<style>
body{
margin: 100px 0px;
padding:0px;
text-align:center;
align:center;
background-color:#80ced6;
}
p {
font-family:verdana;
}
h2{
font-family:verdana;
}
#un,#ps{
font-family:'Lato'ÂÂ, sans-serif;
color: gray;
}
</style>
</head>

	<body>
	<h2>结果页面</h2>
	<div>
	    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<%@page import="com.dxc.sharib.LoginProcess"%>  
		<%@page import="java.security.*"%>  
		<jsp:useBean id="obj" class="com.dxc.sharib.LoginBean"/>  
		<jsp:setProperty property="*" name="obj"/>  
		  
		<%  
		System.out.println("getUsername: "+ obj.getUsername());
		//System.out.println("getPassword: "+ obj.getPassword());
		String username, password;
		username = obj.getUsername();
		password = obj.getPassword();
	
		if (username == null || password == null) { %>
			<p> <%out.print("无效的用户名或密码");%> </p>
		<% 
			System.out.println("Invalid userid or password for: "+ username);
			username = "";
			password = "";
		}  
		%>  
		<%
		String pw = password;
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
		messageDigest.update(pw.getBytes("UTF-8"));
		byte[] digest = messageDigest.digest();
		obj.setencPassword(digest);
		
		String role = LoginProcess.validate(obj); 
		if (role != null) { %>
			<p> <%out.println(username+": 您已成功登录.");%> </p>
			<p> <%out.println("你的角色是: "+role);%> </p> <%
			session.setAttribute("session","TRUE");  
			System.out.println(username+": successfully logged in.");
		} else  {  %>
			<p> <%out.print("无效的用户名或密码 : "+username);%> </p>
		<%
		System.out.println("Invalid userid or password for: "+ username);
		}  
		%>  
	</div>
	</body>
</html> 
