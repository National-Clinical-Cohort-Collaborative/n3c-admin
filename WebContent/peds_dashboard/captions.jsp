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
			<h3 class="header-text">Pediatrics Dashboard Captions</h3>
		</div>

		<a href="addCaption.jsp"><i class="fas fa-plus-circle fa-2x text-success"></i></a>
		<sql:query var="admins" dataSource="jdbc/N3CLoginTagLib">
 	       select * from n3c_peds.caption order by tag
 	   </sql:query>
		<table border=1>
			<thead>
				<tr>
					<th></th>
					<th>Tag</th>
					<th>Caption</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${admins.rows}" var="row" varStatus="rowCounter">
					<tr>
						<td><a href="editCaption.jsp?tag=${row.tag}"><i class="fas fa-edit fa-lg text-success"></i></a></td>
						<td>${row.tag}</td>
						<td>${row.caption}</td>
						<td>
							<a href="deleteCaption.jsp?tag=${row.tag}"><i class="fas fa-times-circle fa-lg text-danger"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
