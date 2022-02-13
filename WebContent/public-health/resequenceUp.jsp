<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	update n3c_questions.roster set seqnum = seqnum + 1 where seqnum + 1 =  ?::int
	<sql:param>${param.current}</sql:param>
</sql:update>
<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	update n3c_questions.roster set seqnum = seqnum - 1 where iframe_info = ?
	<sql:param>${param.iframe}</sql:param>
</sql:update>
<c:redirect url="questions.jsp" />
