<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Login or Register</title>
	</head> 
	<body>
		<div id = "logindiv">
	  	   <form name="username and password" action = "ValidateLogin" method = "GET">
		   		<label id = "u" for="unamebar">Username</label>
					<input id = "unamebar" type="text" name="username"/>
				<br/>
				<label id = "p" for="pwordbar">Password</label>
					<input id = "pwordbar" type="password" name="password" autocomplete="off"/>
			 	<br/>
				<button type="submit" id = "login" name = "login">Login</button>
				<a href="ftoregister.jsp" style= "text-decoration:none">Don't have an account? Register your truck here!</a>
		  </form>
	    </div>
	    <div><%=session.getAttribute("error")%></div>
	  <%
	  	if (session.getAttribute("error") == ""){
	  	
	  %>
	  	
	  	<form name = "goToGetInfoServ" action = "GetInfoFromDb" method = "GET">
	  		<p>You're logged in! If you want to edit your truck info click the button</p>
	  		<button type="submit" id = "login" name = "login">Edit Info</button>
	  	</form>
	  <%
	  		}
	  %>
	</body>
</html>