<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fall Placement Report</title>
 <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="flex-container">
<%@include file="header.jsp"%>
<a href="<c:url value='/backHome.html'/>">Continue to home</a>
	<table>
		<tbody>
			<tr>
				<th><h2>Placement View</h2></th>
			</tr>
			<tr>

				<th>Student Name</th>
				<th>Company Name</th>
				<th>Supervisor Name</th>
				<th>Notes</th>




			</tr>

			<c:forEach var="placementview" items="${placementview}"
				varStatus="status">
				<tr>
					<td>${placementview.studentName}</td>
					<td>${placementview.companyName}</td>
					<td>${placementview.supervisorName}</td>
					<td>${placementview.notes}</td>



				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>