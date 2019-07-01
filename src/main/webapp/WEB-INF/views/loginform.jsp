<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
Login Form
</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="flex-container">
<%@include file="header.jsp"%>
<h3>Login Form</h3>
	<p><FONT color="blue"> Enter username and password </FONT></p>
	<form:form action="/internship_system/loginform.html" method="post">
    <div class="imgcontainer">
    <img src="<c:url value="/resources/images/avatar.png" />" alt="Avatar" class="avatar">
  </div>
		
         <div class="container">
			<label><b>User Name:</b></label><c:if
						test="${userName!=null} && ${userName=='invaliduser'}">
						<c:out value="invaliduser"></c:out>

					</c:if> <input type="text" placeholder="Enter Username" name="userName" /> <br/><label><b>Password:<FONT color="red"></FONT></b></label><input type="password" placeholder="Enter Password" name="password" /><input type="submit" value="Submit" />
            </div>
		
	</form:form>




<!-- 
	<h3>Login Form</h3>
	<FONT color="blue"> Enter username and password </FONT>
	<form:form action="/internship_system/loginform.html" method="post">
		<table>
			<tr>
				<td>User Name:<FONT color="red"></FONT></td>
			</tr>
			<tr>
				<td><c:if
						test="${userName!=null} && ${userName=='invaliduser'}">
						<c:out value="invaliduser"></c:out>

					</c:if> <input type="text" name="userName" /></td>
			</tr>
			<tr>
				<td>Password:<FONT color="red"></FONT></td>
			</tr>
			<tr>
				<td><input type="text" name="password" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form:form>-->
	</div>
</body>
</html>