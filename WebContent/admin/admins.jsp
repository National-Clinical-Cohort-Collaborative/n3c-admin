<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" flush="true" />

<style type="text/css" media="all">
@import "../resources/n3c_login_style.css";
</style>

<body>

	<jsp:include page="../navbar.jsp" flush="true" />

	<div class="container-fluid" style="padding-left: 5%; padding-right: 5%;">
		<c:if test="$ empty admin}">
			<div class=" n3c_alert">
				<i class="fa fa-exclamation" aria-hidden="true">&emsp;</i>Our apologies, but you must successfully log in through NIH prior to accessing this resource. Click <a href="../dologin.jsp">here</a> to
				be redirected.<br />
			</div>
			<c:redirect url="index.jsp" />
		</c:if>


		<div class="container center-box shadow-border">
			<h2 class="header-text">
				<img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Admin
			</h2>
			<h3 class="header-text">Administrative Authorizations</h3>
		</div>

		<a href="addAdmin.jsp"><i class="fas fa-plus-circle fa-2x text-success"></i></a>
		<sql:query var="admins" dataSource="jdbc/N3CLoginTagLib">
 	       select last_name,first_name,admin.email,admin,public_health,peds_dashboard,users,foundry_feed from n3c_admin.admin natural join n3c_admin.registration order by 1,2
 	   </sql:query>
		<table border=1>
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Admin</th>
					<th>Public Health</th>
					<th>Pediatrics Dashboard</th>
					<th>Users</th>
					<th>Foundry Feed</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${admins.rows}" var="row" varStatus="rowCounter">
					<tr>
						<td>${row.last_name}, ${row.first_name}</td>
						<td>${row.email}</td>
						<td style="text-align:center">
							<a href="toggleAuthorization.jsp?auth=admin&email=${row.email}">
							<c:choose>
								<c:when test="${row.admin}">
									<i class="fas fa-toggle-on fa-lg text-success"></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-toggle-off fa-lg"></i>
								</c:otherwise>
							</c:choose>
							</a>
						</td>
						<td style="text-align:center">
							<a href="toggleAuthorization.jsp?auth=public_health&email=${row.email}">
							<c:choose>
								<c:when test="${row.public_health}">
									<i class="fas fa-toggle-on fa-lg text-success"></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-toggle-off fa-lg"></i>
								</c:otherwise>
							</c:choose>
							</a>
						</td>
						<td style="text-align:center">
							<a href="toggleAuthorization.jsp?auth=peds_dashboard&email=${row.email}">
							<c:choose>
								<c:when test="${row.peds_dashboard}">
									<i class="fas fa-toggle-on fa-lg text-success"></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-toggle-off fa-lg"></i>
								</c:otherwise>
							</c:choose>
							</a>
						</td>
						<td style="text-align:center">
							<a href="toggleAuthorization.jsp?auth=users&email=${row.email}">
							<c:choose>
								<c:when test="${row.users}">
									<i class="fas fa-toggle-on fa-lg text-success"></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-toggle-off fa-lg"></i>
								</c:otherwise>
							</c:choose>
							</a>
						</td>
						<td style="text-align:center">
							<a href="toggleAuthorization.jsp?auth=foundry_feed&email=${row.email}">
							<c:choose>
								<c:when test="${row.foundry_feed}">
									<i class="fas fa-toggle-on fa-lg text-success"></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-toggle-off fa-lg"></i>
								</c:otherwise>
							</c:choose>
							</a>
						</td>
						<td>
							<c:if test="${not row.visible}"><a href="deleteAdmin.jsp?email=${row.email}"><i class="fas fa-times-circle fa-lg text-danger"></i></a></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
