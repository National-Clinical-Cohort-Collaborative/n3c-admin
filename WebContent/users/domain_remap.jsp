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
			<img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C
			Email Domain to ROR Mapping
		</h2>

		<sql:query var="categories" dataSource="jdbc/N3CLoginTagLib">
	        select substring(email from '.*@(.*)') as email, official_institution, count(*), institutionid, institutionname
	        from n3c_admin.dua_master, n3c_admin.registration as foo
	        where enclave
	          and not exists (select orcid_id from palantir.n3c_user as bar where foo.orcid_id = bar.orcid_id)
	          and official_institution not in ('NIH','login.gov')
	          and (substring(email from '.*@(.*)') = substring(duacontactemail from '.*@(.*)')
	          		or
	          		substring(email from '.*@(.*)') = substring(signatoryemail from '.*@(.*)'))
	          and substring(email from '.*@(.*)') not in ('gmail.com','yahoo.com')
	        group by 1,2,4,5 order by 3 desc;
	    </sql:query>
		<table>
			<tr>
				<th>Email</th>
				<th>Registration Institution</th>
				<th>Count</th>
				<th>DUA ROR</th>
				<th>DUA Institution</th>
			</tr>
			<c:forEach items="${categories.rows}" var="row"
				varStatus="rowCounter">
				<tr>
					<td><a href="submit_domain_remap.jsp?domain=${row.email}&ror=${row.institutionid}">${row.email}</a></td>
					<td>${row.official_institution}</td>
					<td>${row.count}</td>
					<td>${row.institutionid}</td>
					<td>${row.institutionname}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="../footer.jsp" flush="true" />
</body>
</html>
