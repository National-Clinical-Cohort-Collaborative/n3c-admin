<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CLoginTagLib">
	SELECT jsonb_pretty(jsonb_agg(foo))
	FROM (select 'x' as dummy,last_name,first_name,email from n3c_admin.registration where email not in (select email from n3c_admin.admin)) as foo;
</sql:query>
{
    "headers": [
        {"value":"dummy", "label":""},    
        {"value":"last_name", "label":"Last Name"},
        {"value":"first_name", "label":"First Name"},
        {"value":"email", "label":"Email"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
