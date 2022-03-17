<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<h3 class="header-text">Public Health Dashboard Tab IFrame Definitions</h3>
		</div>

		<a href="addQuestion.jsp"><i class="fas fa-plus-circle fa-2x text-success"></i></a>
		<sql:query var="admins" dataSource="jdbc/N3CLoginTagLib">
 	       select * from n3c_questions.roster order by seqnum
 	   </sql:query>
		<table border=1>
			<thead>
				<tr>
					<th></th>
					<th>Question</th>
					<th>Asked</th>
					<th>IFrame info</th>
					<th>Visible in Production</th>
					<th>Resequence</th>
					<th>IFrame Content</th>
					<th>IFrame Style</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${admins.rows}" var="row" varStatus="rowCounter">
					<tr>
						<td><a href="editQuestion.jsp?iframe=${row.iframe_info}"><i class="fas fa-edit fa-lg text-success"></i></a></td>
						<td>${row.question}</td>
						<td>${row.asked}</td>
						<td>${row.iframe_info}</td>
						<td style="text-align:center">
							<a href="toggleVisibility.jsp?iframe=${row.iframe_info}">
							<c:choose>
								<c:when test="${row.visible}">
									<i class="fas fa-toggle-on fa-lg text-success"></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-toggle-off fa-lg"></i>
								</c:otherwise>
							</c:choose>
							</a>
						</td>
						<td>
							<c:choose>
								<c:when test="${rowCounter.first}">
									<i class="fas fa-angle-double-up fa-lg"></i>
									<i class="fas fa-arrow-up fa-lg"></i>
									<a href="resequenceDown.jsp?iframe=${row.iframe_info}&current=${rowCounter.count}"><i class="fas fa-arrow-down fa-lg text-success"></i></a>
									<a href="resequenceBottom.jsp?iframe=${row.iframe_info}&current=${rowCounter.count}"><i class="fas fa-angle-double-down fa-lg text-success"></i></a>
								</c:when>
								<c:when test="${rowCounter.last}">
									<a href="resequenceTop.jsp?iframe=${row.iframe_info}&current=${rowCounter.count}"><i class="fas fa-angle-double-up fa-lg text-success"></i></a>
									<a href="resequenceUp.jsp?iframe=${row.iframe_info}&current=${rowCounter.count}"><i class="fas fa-arrow-up fa-lg text-success"></i></a>
									<i class="fas fa-arrow-down fa-lg"></i>
									<i class="fas fa-angle-double-down fa-lg"></i>
								</c:when>
								<c:otherwise>
									<a href="resequenceTop.jsp?iframe=${row.iframe_info}&current=${rowCounter.count}"><i class="fas fa-angle-double-up fa-lg text-success"></i></a>
									<a href="resequenceUp.jsp?iframe=${row.iframe_info}&current=${rowCounter.count}"><i class="fas fa-arrow-up fa-lg text-success"></i></a>
									<a href="resequenceDown.jsp?iframe=${row.iframe_info}&current=${rowCounter.count}"><i class="fas fa-arrow-down fa-lg text-success"></i></a>
									<a href="resequenceBottom.jsp?iframe=${row.iframe_info}&current=${rowCounter.count}"><i class="fas fa-angle-double-down fa-lg text-success"></i></a>
								</c:otherwise>
							</c:choose>
						</td>
						<td>${row.iframe_content}</td>
						<td>${row.iframe_style}</td>
						<td>
							<c:if test="${not row.visible}"><a href="deleteQuestion.jsp?current=${rowCounter.count}"><i class="fas fa-times-circle fa-lg text-danger"></i></a></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
