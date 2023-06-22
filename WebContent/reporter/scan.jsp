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
			<h3 class="header-text">N3C Scorecard Captions</h3>
		</div>

		<form action="submit_link.jsp">
			<button type="submit" name="action" value="submit">Submit</button>

			<a href="candidates.jsp">back</a>
			<div>
				<div class="row">
					<div class="col-xs-5">
						<sql:query var="names" dataSource="jdbc/N3CLoginTagLib">
							select
								ror_id,name
							from n3c_maps.feed_master
							where name ~* ?
							;
							<sql:param>${param.name}</sql:param>
						</sql:query>
						<h3>RORs for: ${param.name}</h3>
						<table class="table table-striped">
							<tr>
								<th>Link?</th>
								<th>ROR ID</th>
								<th>Name</th>
							</tr>
							<c:forEach items="${names.rows}" var="row" varStatus="rowCounter">
								<tr>
									<td><input type="radio" id="ror_id" name="ror_id" value="${row.ror_id}"></td>
									<td>${row.ror_id}</td>
									<td>${row.name}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col-xs-5">
						<sql:query var="names" dataSource="jdbc/N3CLoginTagLib">
							select
								organization,
								external_org_id,
								count(*)
							from nih_exporter_current.n3c where organization ~* ?
							group by 1,2 order by 3 desc,1;
							<sql:param>${param.name}</sql:param>
						</sql:query>

						<h3>NIH Reporter Organizations Mentioning N3C</h3>
						<table class="table table-striped">
							<tr>
								<th>Link?</th>
								<th>Organization</th>
								<th>External Organization ID</th>
								<th>Count</th>
							</tr>
							<c:forEach items="${names.rows}" var="row" varStatus="rowCounter">
								<tr>
									<td><input type="radio" id="org_id" name="org_id" value="${row.external_org_id}"></td>
									<td>${row.organization}</td>
									<td>${row.external_org_id}</td>
									<td>${row.count}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>

		</form>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
