<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	insert into n3c_admin.dua_organization(ror_id,ror_name,email_domain, incommon_id, incommon_name) select * from (
		(select institutionid, institutionname, substring(duacontactemail from '.*@(.*)') from n3c_admin.dua_master where institutionid = ?) as foo
		natural left outer join
		(select id, display_name from incommon.organization where id = ?
		) as bar)
	<sql:param>${param.dua}</sql:param>
	<sql:param>${param.incommon}</sql:param>
</sql:update>
<c:redirect url="index.jsp" />
