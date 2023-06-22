<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="caption" dataSource="jdbc/N3CLoginTagLib">
	update n3c_scorecard.text_block set tag = ?, caption = ?
	where tag = ?
	<sql:param>${param.tag}</sql:param>
	<sql:param>${param.caption}</sql:param>
	<sql:param>${param.orig_tag}</sql:param>
</sql:update>
<c:redirect url="captions.jsp" />
