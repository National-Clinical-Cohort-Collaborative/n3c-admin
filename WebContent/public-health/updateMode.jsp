<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	update n3c_dashboard.roster_map set iframe_info = ?, jsp = ?, mode = ?
	where iframe_info = ?
	<sql:param>${param.iframe_info}</sql:param>
	<sql:param>${param.jsp}</sql:param>
	<sql:param>${param.mode}</sql:param>
	<sql:param>${param.iframe}</sql:param>
</sql:update>
<c:redirect url="modes.jsp" />
