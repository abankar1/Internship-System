<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Internship Details</title>
 <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="flex-container">
<%@include file="header.jsp"%>
<a href="<c:url value='/backHome.html'/>">Continue to home</a>
	<table>
		<tbody>
			<tr>
				<td><b>Complete Details</b></td>
			</tr>
			<c:if test="${user.isStudent}">
				<tr>
					<td><b>Click Apply to be considered for Job
								Position</b></td>
				</tr>
			</c:if>
			<tr>
				<td><c:out value="${internshipDetail}" /></td>
			</tr>
			<tr>
				<c:if test="${user.isStudent}">
					<c:if test="${msg!='Applied'}">
						<td><form:form method="post"
								action="/internship_system/apply.html/${internshipID}">
								<table>
									<tr>
										<td><input type="submit" value="Apply" /></td>
									</tr>
								</table>
							</form:form></td>
					</c:if>
				</c:if>
			</tr>
		</tbody>
	</table>
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>