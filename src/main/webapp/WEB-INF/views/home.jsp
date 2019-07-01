<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Home</title>
 <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
    <div class="flex-container">
<%@include file="header.jsp"%>
	<form:form method="post" action="/internship_system/submitHome.html">
		<table>
			<tr>
				<td><input type="submit" value="Click To LogIn"  /></td>
			</tr>
		</table>
	</form:form>


</div>

</body>
</html>
