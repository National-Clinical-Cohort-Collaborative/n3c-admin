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
			<h3 class="header-text">N3C Scorecard Captions</h3>
		</div>

    	<form name="caption" method='POST' action='scan.jsp' autocomplete="off" >
  			<div class="form-group row">
    			<label for="name" class="required col-sm-2 col-form-label">Name Pattern</label>
    			<input name="name" type="text" class="form-control" id="tag" value="">
   			</div>
            
            <div style="text-align:left;">
            	<button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
            </div>
    	</form>
		<sql:query var="admins" dataSource="jdbc/N3CLoginTagLib">
 	       select organization,external_org_id,count(*)
 	       from nih_exporter_current.n3c
 	       where external_org_id not in (select external_org_id from nih_exporter_current.ror_binding)
 	       group by 1,2 order by 3 desc,1
 	   </sql:query>
		<table border=1>
			<thead>
				<tr>
					<th>Organization</th>
					<th>ID</th>
					<th>Count</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${admins.rows}" var="row" varStatus="rowCounter">
					<tr>
						<td>${row.organization}</td>
						<td>${row.External_org_id}</td>
						<td>${row.count}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
