<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	insert into n3c_scorecard.text_block values(?,?)
	<sql:param>${param.tag}</sql:param>
	<sql:param>${param.caption}</sql:param>
</sql:update>
<c:redirect url="captions.jsp" />
