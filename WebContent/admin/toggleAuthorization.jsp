<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	update n3c_admin.admin set ${param.auth} = not ${param.auth} where email = ?
	<sql:param>${param.email}</sql:param>
</sql:update>
<c:redirect url="admins.jsp" />
