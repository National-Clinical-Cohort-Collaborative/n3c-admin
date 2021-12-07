<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	delete from n3c_questions.roster where iframe_info = ?
	<sql:param>${param.iframe}</sql:param>
</sql:update>
<c:redirect url="questions.jsp" />
