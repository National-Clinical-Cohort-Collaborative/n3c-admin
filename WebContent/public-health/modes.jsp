<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<h3 class="header-text">Public Health Dashboard Implementation Modes</h3>
		</div>

		<a href="addMode.jsp"><i class="fas fa-plus-circle fa-2x text-success"></i></a>
		<sql:query var="admins" dataSource="jdbc/N3CLoginTagLib">
 	       select * from n3c_dashboard.roster_map order by 1
 	   </sql:query>
		<table border=1>
			<thead>
				<tr>
					<th></th>
					<th>Iframe_info</th>
					<th>JSP</th>
					<th>Mode</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${admins.rows}" var="row" varStatus="rowCounter">
					<tr>
						<td><a href="editMode.jsp?iframe=${row.iframe_info}"><i class="fas fa-edit fa-lg text-success"></i></a></td>
						<td>${row.iframe_info}</td>
						<td>${row.jsp}</td>
						<td>${row.mode}</td>
						<td>
							<c:if test="${not row.visible}"><a href="deleteMode.jsp?iframe_info=${row.iframe_info}"><i class="fas fa-times-circle fa-lg text-danger"></i></a></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
