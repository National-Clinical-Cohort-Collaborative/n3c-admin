<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>

<c:if test="${empty valid}">
	<c:set scope="session" var="not_logged_in" value="t" />
	<c:redirect url="../index.jsp" />
</c:if>

<html>
<jsp:include page="../head.jsp" flush="true" />

<style type="text/css" media="all">
@import "../resources/n3c_login_style.css";
</style>

<body>

	<jsp:include page="../navbar.jsp" flush="true" />

	<div class=" center-box shadow-border">
		<h2 class="header-text">
			<img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Tenant Organization Managment
		</h2>

		<c:if test="${empty param.pattern }">
			<form name="incommon" method='POST' action='index.jsp'>
				<c:set var="ror_pattern" value="${param.ror_pattern}" />
				<div class="form-group row">
					<label for="pattern" class="required col-sm-2 col-form-label">Pattern</label>
					<style>
						.required:after {content: " *"; color: red;}
					</style>
					<div class="col-sm-10">
						<input name="pattern" type="text" size="20" class="form-control" id="pattern" value="${param.pattern}">
					</div>
				</div>
				<div style="text-align: left;">
					<button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
				</div>
				<input type="hidden" name="institution" value="${param.institution}">
			</form>
		</c:if>
		<c:if test="${not empty param.pattern }">
			<form name="incommon" method='POST' action='submit.jsp'>
			<div class="row">
				<div class="col-6">
					<h3>DUA Master</h3>
					<sql:query var="categories" dataSource="jdbc/N3CLoginTagLib">
				        select institutionid, institutionname, substring(tenantduacontactemail from '.*@(.*)') as email
				        from tenant_admin.dua_master
				        where institutionname ~ ? order by 2;
				        <sql:param>${param.pattern}</sql:param>
					</sql:query>
					<table class="table table-hover">
						<thead>
							<tr>
								<th></th>
								<th>ROR ID</th>
								<th>ROR Name</th>
								<th>Email Domain</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${categories.rows}" var="row" varStatus="rowCounter">
								<tr>
									<td><input type="checkbox" name="dua" value="${row.institutionid}"></td>
									<td>${row.institutionid}</td>
									<td>${row.institutionname}</td>
									<td>${row.email}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-6">
					<h3>InCommon Federation</h3>
					<sql:query var="registration" dataSource="jdbc/N3CLoginTagLib">
				        select id, display_name
				        from incommon.organization
				        where display_name ~ ?
				        and federation = '1'
				        order by 2;
				        <sql:param>${param.pattern}</sql:param>
					</sql:query>
					<table class="table table-hover">
						<thead>
							<tr>
								<th></th>
								<th>InCommon ID</th>
								<th>InCommon Name</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${registration.rows}" var="row" varStatus="rowCounter">
								<tr>
									<td><input type="checkbox" name="incommon" value="${row.id}"></td>
									<td>${row.id}</td>
									<td>${row.display_name}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
				<div style="text-align: left;">
					<button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
				</div>
				<input type="hidden" name="institution" value="${param.institution}">
			</form>
		</c:if>
	</div>
	<div class=" center-box shadow-border">
		<h2>Unmapped Organizations</h2>
		<sql:query var="registration" dataSource="jdbc/N3CLoginTagLib">
	        select institutionid, institutionname, substring(tenantduacontactemail from '.*@(.*)') as email, tenantduaexecuted
	        from tenant_admin.dua_master
	        where institutionid not in (select ror_id from tenant_admin.dua_organization)
	        order by 2
		</sql:query>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ROR ID</th>
					<th>ROR Name</th>
					<th>Email Domain</th>
					<th>Date Executed</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${registration.rows}" var="row" varStatus="rowCounter">
					<tr>
						<td>${row.institutionid}</td>
						<td>${row.institutionname}</td>
						<td>${row.email}</td>
						<td>${row.tenantduaexecuted}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class=" center-box shadow-border">
		<h2>Mapped Organizations</h2>
		<sql:query var="registration" dataSource="jdbc/N3CLoginTagLib">
	        select ror_id, ror_name, email_domain, incommon_id
	        from tenant_admin.dua_organization
		</sql:query>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ROR ID</th>
					<th>ROR Name</th>
					<th>Email Domain</th>
					<th>InCommon ID</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${registration.rows}" var="row" varStatus="rowCounter">
					<tr>
						<td>${row.ror_id}</td>
						<td>${row.ror_name}</td>
						<td>${row.email_domain}</td>
						<td>${row.incommon_id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
