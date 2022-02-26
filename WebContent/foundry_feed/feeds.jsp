<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" flush="true" />

<style type="text/css" media="all">
@import "../resources/n3c_login_style.css";
</style>

<body>

	<jsp:include page="../navbar.jsp" flush="true" />

	<div class="container-fluid" style="padding-left: 5%; padding-right: 5%;">
		<c:if test="$ empty admin}">
			<div class=" n3c_alert">
				<i class="fa fa-exclamation" aria-hidden="true">&emsp;</i>Our apologies, but you must successfully log in through NIH prior to accessing this resource. Click <a href="../dologin.jsp">here</a> to
				be redirected.<br />
			</div>
			<c:redirect url="index.jsp" />
		</c:if>


		<div class="container center-box shadow-border">
			<h2 class="header-text">
				<img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Admin
			</h2>
			<h3 class="header-text">Foundry Feeds</h3>
		</div>

		<a href="addFeed.jsp"><i class="fas fa-plus-circle fa-2x text-success"></i></a>
		<sql:query var="admins" dataSource="jdbc/N3CLoginTagLib">
 	       select rid, active, to_char(created, 'YYYY-MM-DD HH:MI') as created from palantir.tiger_team order by 3 desc,1
 	   </sql:query>
		<table border=1>
			<thead>
				<tr>
					<th>RID</th>
					<th>Active</th>
					<th>Created</th>
					<th>Files</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${admins.rows}" var="row" varStatus="rowCounter">
					<tr>
						<td>${row.rid}</td>
						<td style="text-align:center">
							<a href="toggleActive.jsp?rid=${row.rid}">
							<c:choose>
								<c:when test="${row.active}">
									<i class="fas fa-toggle-on fa-lg text-success"></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-toggle-off fa-lg"></i>
								</c:otherwise>
							</c:choose>
							</a>
						</td>
						<td>
							${row.created}
						</td>
						<td>
							<sql:query var="files" dataSource="jdbc/N3CLoginTagLib">
								select file, to_char(updated, 'YYYY-MM-DD HH:MI') as updated from palantir.tiger_team_file where rid = ? order by 1
								<sql:param>${row.rid}</sql:param>
							</sql:query>
							<ul>
							<c:forEach items="${files.rows}" var="fileVar" varStatus="fileCounter">
								<li>${fileVar.file} (${fileVar.updated})
							</c:forEach>
							</ul>
						</td>
						<td>
							<a href="deleteFeed.jsp?rid=${row.rid}"><i class="fas fa-times-circle fa-lg text-danger"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
