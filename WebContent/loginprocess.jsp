<!DOCTYPE html>
<html lang="en">
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
font-family:'Lato', sans-serif;
color: gray;
}
</style>
</head>

	<body>
	<h2>Result Page</h2>
	<div>
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
			<p> <%out.print("Invalid userid or password");%> </p>
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
			<p> <%out.println(username+": you are successfully logged in.");%> </p>
			<p> <%out.println("Your role is: "+role);%> </p> <%
			System.out.println(username+": successfully logged in.");
			session.setAttribute("session","TRUE");  
		} else  {  %>
			<p> <%out.print("Invalid userid or password for: "+username);%> </p>
		<%
		System.out.println("Invalid userid or password for: "+ username);
		}  
		%>  
	</div>
	</body>
</html> 
