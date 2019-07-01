<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Partner Companies Report</title>
 <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="flex-container">
<%@include file="header.jsp"%>s
<a href="<c:url value='/backHome.html'/>">Continue to home</a>
	<table>
		<tbody>
			<tr>
				<td>Partner Companies</td>
			</tr>
			<tr>
				<th>Company Name</th>
				<th>Address</th>
				<th>Cell</th>
				<th>Industry</th>
				<th>Email</th>
				<th>Title</th>
				<th>Description</th>

				<th>No Of Openings</th>



			</tr>

			<c:forEach var="companiesView" items="${companiesView}"
				varStatus="status">
				<tr>
					<td>${companiesView.companyName}</td>
					<td>${companiesView.address}</td>
					<td>${companiesView.cell}</td>
					<td>${companiesView.industry}</td>
					<td><a href="mailto:someone@example.com">${companiesView.email}</a></td>
					<td>${companiesView.title}</td>
					<td>${companiesView.description}</td>

					<td>${companiesView.noOfOpenings}</td>


				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>