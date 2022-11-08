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

	<div class=" center-box shadow-border">
		<h2 class="header-text">
			<img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C User Scan
		</h2>
		
        <form name="incommon" method='POST' action='user_scan.jsp' >
            <input type="radio" id="column" name="column" value="email" <c:if test="${param.column=='email'}">checked</c:if> > <label for="email">Email</label>&nbsp;&nbsp;&nbsp;
            <input type="radio" id="column" name="column" value="last_name" <c:if test="${empty param.column or param.column=='last_name'}">checked</c:if> > <label for="last_name">Last Name</label><br>
            <c:set var="ror_pattern" value="${param.ror_pattern}"/>
            <div class="form-group row">
                <label for="pattern" class="required col-sm-2 col-form-label">Pattern</label>
                <style>.required:after { content:" *"; color: red; } </style>
                <div class="col-sm-10">
                    <input name="pattern" type="text" size="20" class="form-control" id="pattern" value="${param.pattern}">
                </div>
            </div>
            <div style="text-align:left;">
                <button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
            </div>
            <input type="hidden" name="institution" value="${param.institution}">
        </form>
        <c:if test="${not empty param.pattern }">
	 		<h3>palantir.n3c_user</h3>
		    <sql:query var="categories" dataSource="jdbc/N3CLoginTagLib">
		        select email,first_name,last_name,ror_id,ror_name,una_path,created,unite_user_id
		        from palantir.n3c_user natural left outer join n3c_admin.user_binding
		        where ${param.column} ~ ? order by created desc;
		        <sql:param>${param.pattern}</sql:param>
		    </sql:query>
		    <table class="table table-hover">
		    <thead><tr><th>Email</th><th>First Name</th><th>Last Name</th><th>ROR ID</th><th>ROR Name</th><th>UNA Path</th><th>Created</th><th>User ID</th></tr></thead>
		    <tbody>
		    <c:forEach items="${categories.rows}" var="row" varStatus="rowCounter">
		        <tr><td>${row.email}</td><td>${row.first_name}</td><td>${row.last_name}</td><td>${row.ror_id}</td><td>${row.ror_name}</td><td>${row.una_path}</td><td>${row.created}</td><td>${row.unite_user_id}</td></tr>
		    </c:forEach>
		    </tbody>
		    </table>

	 		<h3>n3c_admin.registration</h3>
		    <sql:query var="registration" dataSource="jdbc/N3CLoginTagLib">
		        select email,first_name,last_name,institution,official_full_name,official_institution,created,updated,enclave
		        from n3c_admin.registration
		        where ${param.column} ~ ? order by created desc;
		        <sql:param>${param.pattern}</sql:param>
		    </sql:query>
		    <table class="table table-hover">
		    <thead><tr><th>Email</th><th>First Name</th><th>Last Name</th><th>Institution</th><th>Official Full Name</th><th>Official Institution</th><th>Created</th><th>Updated</th><th>Enclave</th></tr></thead>
		    <tbody>
		    <c:forEach items="${registration.rows}" var="row" varStatus="rowCounter">
		        <tr><td>${row.email}</td><td>${row.first_name}</td><td>${row.last_name}</td><td>${row.institution}</td><td>${row.official_full_name}</td><td>${row.official_institution}</td><td>${row.created}</td><td>${row.updated}</td><td>${row.enclave}</td></tr>
		    </c:forEach>
		    </tbody>
		    </table>
        </c:if>
	</div>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
