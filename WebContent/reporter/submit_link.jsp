<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update dataSource="jdbc/N3CLoginTagLib">
	insert into nih_exporter_current.ror_binding values(?,?)
	<sql:param>${param.ror_id}</sql:param>
	<sql:param>${param.org_id}</sql:param>
</sql:update>

<c:redirect url="candidates.jsp" />
