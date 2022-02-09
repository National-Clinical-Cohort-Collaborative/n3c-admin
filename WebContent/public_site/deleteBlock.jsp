<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	delete from n3c_public_site.block where tag = ?
	<sql:param>${param.tag}</sql:param>
</sql:update>
<c:redirect url="blocks.jsp" />
