<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register my truck</title>
</head>
<body>
	<div id = "registerdiv">
		  	<form action = "ValidateRegistration" method = "GET">
	            <table style="width: 22%" id = "usernamepassword">
	                <tr>
	                    <td>Username</td>
	                </tr>
	                <tr>
	                    <td><input type="text" name="username" /></td>
	                </tr>
	                <tr>
	                    <td>Password</td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="password" /></td>
	                </tr>
	                <tr>
	                    <td>Confirm Password</td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="confirmpassword" /></td>
	                </tr>
	            </table>
			<button type="submit" id = "registersubmission" name = "registersubmission">Register</button>
        	</form>
	  	</div>
	  <div><%=session.getAttribute("error")%></div>
	  <%
	  	if (session.getAttribute("error") == ""){
	  %>
	  	<p> Okay you've successfully registered. Please tell us more about your truck <a href ="ftoinfo.jsp" style= "text-decoration:none">here</a></p>
	  <%
	  	}
	  %>
</body>
</html>