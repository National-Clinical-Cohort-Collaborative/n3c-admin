<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<c:set var="user_email" scope="session">${attributes.get("email")[0]}</c:set>

<sql:query var="admins" dataSource="jdbc/N3CLoginTagLib">
	select email, admin, public_health, peds_dashboard from n3c_admin.admin where email = ?
	<sql:param>${user_email}</sql:param>
</sql:query>
<c:forEach items="${admins.rows}" var="row" varStatus="rowCounter">
	<c:set scope="session" var='valid' value='yes' />
	<c:if test="${row.admin == true}">
		<c:set scope="session" var='admin' value='yes' />
	</c:if>
	<c:if test="${row.public_health == true}">
		<c:set scope="session" var='public_health' value='yes' />
	</c:if>
	<c:if test="${row.peds_dashboard == true}">
		<c:set scope="session" var='peds_dashboard' value='yes' />
	</c:if>
</c:forEach>

<c:redirect url="index.jsp" />
