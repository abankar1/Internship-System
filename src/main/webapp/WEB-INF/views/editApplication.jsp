<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Application</title>
 <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="flex-container">
<%@include file="header.jsp"%>
<a href="<c:url value='/backHome.html'/>">Continue to home</a>
	<table>
		<tr>
			<th>applicationID</th>
			<th>studentID</th>
			<th>internshipID</th>
			<th>Status</th>
		</tr>
		<tr>
			<td><c:forEach var="app" items="${pending}"
					varStatus="status">

					<tr>
						<td>${app.applicationID}</td>
						<td>${app.studentID}</td>
						<td>${app.internshipID}</td>

						<td><form:form
								action="/internship_system/updateApplication.html/${app.applicationID}"
								method="post">
								<form:select path="Status">
									<option value="12">Pending</option>
									<option value="10">Hired</option>
									<option value="11">Not Hired</option>

								</form:select>
							</form:form></td>


					</tr>
				</c:forEach>
			<td>
		</tr>
	</table>
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>