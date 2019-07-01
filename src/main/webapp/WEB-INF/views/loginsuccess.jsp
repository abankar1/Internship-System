<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
<div class="flex-container">
<%@include file="header.jsp"%>
<a href="<c:url value='/backHome.html'/>">Continue to home</a>
	<table>
		<tbody>
		
			<tr>
				<td>
				<nav class="nav">
					<table>
						<tr>
						
							


								
                                <td><%@include file="reports.jsp"%> </td>
								


							
							<form:form method="post" action="/internship_system/logout.html">


								<td><input type="submit" value="logout" /></td>
							</form:form>
							
						</tr>
					</table>
					</nav>
				</td>
			</tr>
			

			<tr>
				<td>
				<article class="article">
					<table>
						<tr>
							<td class="sides"><c:choose>
									<c:when test="${user.access_rights=='14'}">
										<a href="<c:url value='/editInternships.html'/>"
											target="_blank">Edit Internships</a><br/>
										<a href="<c:url value='/editApplication.html'/>"
											target="_blank">Edit Applications</a><br/>
										
									</c:when>
									<c:otherwise>
										<c:if test="${user.isStudent}">

											<a href="<c:url value='/addEvaluation'/>" target="_blank">Add
												Evaluation</a><br/>
											<a href="<c:url value='/seeApplications'/>" target="_blank">See
												Applications</a><br/>
										</c:if>
									</c:otherwise>
								</c:choose></td>
							<td>
								<table>
									<tr>
										<td>Internship Opportunities</td>
									</tr>
									<tr>
										<td>Search Job Title<form:form
												action="/internship_system/searchTitle.html" method="post">
												<input type="text" name="searchField" />
												<input type="submit" value="Enter" />
											</form:form></td>
									</tr>
									<tr>
										<th>Title</th>
										<th>Description</th>
										<th>Paid</th>
										<th>No Of Openings</th>
										<th>Company Name</th>
										<th>Industry</th>
										<th>More...</th>
									</tr>

									<c:forEach var="internview" items="${internView}"
										varStatus="status">

										<tr>
											<td>${internview.title}</td>
											<td>${internview.description}</td>
											<td>${internview.paidYorNo}</td>
											<td>${internview.noOfOpenings}</td>
											<td>${internview.companyname}</td>
											<td>${internview.industry}</td>
											<td><a
												href="<c:url value='/internshipdetails/${internview.internshipID}'/>">Details</a>
											</td>

										</tr>
									</c:forEach>

								</table>
							</td>
						</tr>
					</table>
					</article>
			</tr>
		</tbody>
	</table>
	<%@include file="footer.jsp"%>
	</div>
</body>


<!-- <body>
<div class="flex-container">
%@include file="header.jsp"%>
	<table>
		<tbody>
		
			<tr>
				<td>
				<nav class="nav">
					<table>
						<tr>
						
							<form:form method="post" action="/internship_system/account.html">


								<td><h3>Welcome</h3></td>
								<td><input type="button" value="ACCOUNT DETAILS" /></td>


							</form:form>
							<form:form method="post" action="/internship_system/logout.html">


								<td><input type="submit" value="logout" /></td>
							</form:form>
							
						</tr>
					</table>
					</nav>
				</td>
			</tr>
			<tr>
				<td>%@include file="reports.jsp"%> <c:if
						test="${user.access_rights} == '14'">
						%@ include file="adminFunction.jsp"%>
					</c:if></td>
			</tr>

			<tr>
				<td>
				<article class="article">
					<table>
						<tr>
							<td><c:choose>
									<c:when test="${user.access_rights=='14'}">
										<a href="<c:url value='/editInternships.html'/>"
											target="_blank">Edit Internships</a><br/>
										<a href="<c:url value='/editApplication.html'/>"
											target="_blank">Edit Applications</a><br/>
										
									</c:when>
									<c:otherwise>
										<c:if test="${user.isStudent}">

											<a href="<c:url value='/addEvaluation'/>" target="_blank">Add
												Evaluation</a><br/>
											<a href="<c:url value='/seeApplications'/>" target="_blank">See
												Applications</a><br/>
										</c:if>
									</c:otherwise>
								</c:choose></td>
							<td>
								<table>
									<tr>
										<td>Internship Opportunities</td>
									</tr>
									<tr>
										<td>Search Job Title<form:form
												action="/internship_system/searchTitle.html" method="post">
												<input type="text" name="searchField" />
												<input type="submit" value="Enter" />
											</form:form></td>
									</tr>
									<tr>
										<td>Title</td>
										<td>Description</td>
										<td>Paid</td>
										<td>No Of Openings</td>
										<td>Company Name</td>
										<td>Industry</td>
										<td>More...</td>
									</tr>

									<c:forEach var="internview" items="${internView}"
										varStatus="status">

										<tr>
											<td>${internview.title}</td>
											<td>${internview.description}</td>
											<td>${internview.paidYorNo}</td>
											<td>${internview.noOfOpenings}</td>
											<td>${internview.companyname}</td>
											<td>${internview.industry}</td>
											<td><a
												href="<c:url value='/internshipdetails/${internview.internshipID}'/>">Details</a>
											</td>

										</tr>
									</c:forEach>

								</table>
							</td>
						</tr>
					</table>
					</article>
			</tr>
		</tbody>
	</table>
	%@include file="footer.jsp"%>
	</div>
</body>-->
</html>