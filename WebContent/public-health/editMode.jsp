<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<c:if test="${empty user_email}">
    <c:set scope="session" var="not_logged_in" value="t"/>
    <c:redirect url="../index.jsp"/>
</c:if>
<html>
	<jsp:include page="../head.jsp" flush="true" />

<style type="text/css" media="all">
	@import "../resources/n3c_login_style.css";
@import "<util:applicationRoot/>/resources/autocomplete.css";
</style>

<body>


	<jsp:include page="../navbar.jsp" flush="true" />
	
	<div class="container center-box shadow-border">
    	<h2 class="header-text"><img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Admin</h2>
		<h3 class="header-text">Public Health Dashboard Tab IFrame Definitions</h3>
    	
 		<sql:query var="iframes" dataSource="jdbc/N3CLoginTagLib">
 	       select * from n3c_dashboard.roster_map where iframe_info = ?
 	       <sql:param>${param.iframe}</sql:param>
		</sql:query>
		<c:forEach items="${iframes.rows}" var="row" varStatus="rowCounter">
	    	<form name="mode" method='POST' action='updateMode.jsp' autocomplete="off" >
	  			<div class="form-group row">
	    			<label for="iframe_info" class="required col-sm-2 col-form-label">IFrame Info ([a-z],-)</label>
	                <style>.required:after { content:" *"; color: red; } </style>
	    			<div class="col-sm-6">
	      				<input name="iframe_info" type="text" class="form-control" id="iframe_info" value="${row.iframe_info}">
	    			</div>
	  			</div>
	   			<div class="form-group row">
	    			<label for="jsp" class="required col-sm-2 col-form-label">JSP</label>
	                <style>.required:after { content:" *"; color: red; } </style>
	    			<div class="col-sm-10">
	      				<input name="jsp" type="text" class="form-control" id="jsp" value="${row.jsp}">
	    			</div>
	  			</div>
	  			<div class="form-group row">
	    			<label for="mode" class="required col-sm-2 col-form-label">Implementation Mode</label>
	    			<div class="col-sm-10">
 					<input type="radio" id="D3" name="mode" value="D3" <c:if test="${row.mode == 'D3'}">checked="checked"</c:if>>
 					<label for="D3">D3</label><br>
					<input type="radio" id="Qlik" name="mode" value="Qlik" <c:if test="${row.mode == 'Qlik'}">checked="checked"</c:if>>
					<label for="Qlik">Qlik</label><br>
					<input type="radio" id="unavailable" name="mode" value="unavailable" <c:if test="${row.mode == 'unavailable'}">checked="checked"</c:if>>
					<label for="unavailable">unavailable</label>
	    			</div>
	  			</div>
	            
	            <div style="text-align:right;">
					<input type="hidden" name="iframe" value="${param.iframe}">
	            	<button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
	            </div>
	    	</form>
    	</c:forEach>
	</div>
    <jsp:include page="../footer.jsp" flush="true" />
</body>
</html>
