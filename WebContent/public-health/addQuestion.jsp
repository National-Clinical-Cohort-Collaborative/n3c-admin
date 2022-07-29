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

<script type="text/javascript" src="../resources/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		plugins: "hr image link lists table code",
		table_default_styles: {},
		toolbar: 'undo redo | styleselect | bold italic | link | outdent indent | numlist bullist | image | hr | code',
		mode : "textareas"
	});
</script>
<body>


	<jsp:include page="../navbar.jsp" flush="true" />
	
	<div class="container center-box shadow-border">
    	<h2 class="header-text"><img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Admin</h2>
		<h3 class="header-text">Public Health Dashboard Tab IFrame Definitions</h3>
    	
    	<form name="registration" method='POST' action='submitQuestion.jsp' autocomplete="off" >
  			<div class="form-group row">
    			<label for="question" class="required col-sm-2 col-form-label">Question</label>
    			<label for="" class="required col-sm-2 col-form-label"><i style="color:#adaeb1;">required fields:</i> </label>
    			<input name="question" type="text" class="form-control" id="question" value="">
   			</div>
  			<div class="form-group row">
    			<label for="iframe_info" class="required col-sm-2 col-form-label">IFrame Info ([a-z],-)</label>
                <style>.required:after { content:" *"; color: red; } </style>
    			<div class="col-sm-6">
      				<input name="iframe_info" type="text" class="form-control" id="iframe_info" value="">
    			</div>
  			</div>
   			<div class="form-group row">
    			<label for="iframe_content" class="required col-sm-2 col-form-label">IFrame Content</label>
                <style>.required:after { content:" *"; color: red; } </style>
    			<div class="col-sm-10">
      				<input name="iframe_content" type="text" class="form-control" id="iframe_content" value="">
    			</div>
  			</div>
  			<div class="form-group row">
    			<label for="iframe_style" class="required col-sm-2 col-form-label">IFrame Style</label>
    			<div class="col-sm-10">
      				<input name="iframe_style" type="text" class="form-control" id="iframe_style" value="">
    			</div>
  			</div>
  			<div class="form-group row">
    			<label for="description" class="required col-sm-2 col-form-label">Description</label>
    			<div class="col-sm-10">
    				<textarea name="description" id="description" cols="50" rows="5"></textarea>
				</div>
  			</div>
  			<div class="form-group row">
    			<label for="limitations" class="required col-sm-2 col-form-label">Limitations</label>
    			<div class="col-sm-10">
    				<textarea name="limitations" id="limitations" cols="50" rows="10"></textarea>
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
