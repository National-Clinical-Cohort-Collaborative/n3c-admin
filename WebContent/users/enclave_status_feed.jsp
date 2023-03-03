<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CLoginTagLib">
select jsonb_pretty(jsonb_agg(n3c_user))
from (select email,orcid_id,created,unite_user_id from palantir.n3c_user natural left outer join n3c_admin.user_binding order by 3 desc) as n3c_user;
</sql:query>
{
    "headers": [
        {"value":"email", "label":"Email"},
        {"value":"orcid_id", "label":"ORCiD"},
        {"value":"created", "label":"Created"},
        {"value":"unite_user_id", "label":"UNITE User ID"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			