<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	update n3c_questions.roster set question = ?, description = ?, limitations = ?, iframe_info = ?, iframe_content = ?, iframe_style = ?
	where iframe_info = ?
	<sql:param>${param.question}</sql:param>
	<sql:param>${param.description}</sql:param>
	<sql:param>${param.limitations}</sql:param>
	<sql:param>${param.iframe_info}</sql:param>
	<sql:param>${param.iframe_content}</sql:param>
	<sql:param>${param.iframe_style}</sql:param>
	<sql:param>${param.iframe}</sql:param>
</sql:update>
<c:redirect url="questions.jsp" />
