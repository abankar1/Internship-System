<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
	<table>
		<tr>
			<form:form method="post" action="/internship_system/fallReports.html">

				<td><input type="submit" value="FALL PLACEMENT" /></td>


			</form:form>
			<form:form method="post"
				action="/internship_system/companyReports.html">


				<td><input type="submit" value="PARTNER COMPANIES" /></td>

			</form:form>
		</tr>
	</table>
</body>
</html>