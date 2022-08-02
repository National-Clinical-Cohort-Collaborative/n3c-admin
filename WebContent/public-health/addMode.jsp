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
    	
    	<form name="mode" method='POST' action='submitMode.jsp' autocomplete="off" >
   			<div class="form-group row">
    			<label for="iframe_info" class="required col-sm-2 col-form-label">IFrame Info ([a-z],-)</label>
                <style>.required:after { content:" *"; color: red; } </style>
    			<div class="col-sm-6">
      				<input name="iframe_info" type="text" class="form-control" id="iframe_info" value="">
    			</div>
  			</div>
   			<div class="form-group row">
    			<label for="jsp" class="required col-sm-2 col-form-label">JSP Target Page</label>
                <style>.required:after { content:" *"; color: red; } </style>
    			<div class="col-sm-10">
      				<input name="jsp" type="text" class="form-control" id="jsp" value="">
    			</div>
  			</div>
   			<div class="form-group row">
    			<label for="mode" class="required col-sm-2 col-form-label">Implementation Mode</label>
                <style>.required:after { content:" *"; color: red; } </style>
    			<div class="col-sm-10">
 					<input type="radio" id="D3" name="mode" value="D3">
 					<label for="D3">D3</label><br>
					<input type="radio" id="Qlik" name="mode" value="Qlik">
					<label for="Qlik">Qlik</label><br>
					<input type="radio" id="unavailable" name="mode" value="unavailable" checked="checked">
					<label for="unavailable">unavailable</label>
    			</div>
  			</div>
            
            <div style="text-align:right;">
            	<button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
            </div>
    	</form>
	</div>
    <jsp:include page="../footer.jsp" flush="true" />
</body>
</html>
