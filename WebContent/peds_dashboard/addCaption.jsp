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
		plugins: "hr image link lists table",
		table_default_styles: {},
		toolbar: 'undo redo | styleselect | bold italic | link | outdent indent | numlist bullist | image | hr',
		mode : "textareas"
	});
</script>
<body>


	<jsp:include page="../navbar.jsp" flush="true" />
	
	<div class="container center-box shadow-border">
    	<h2 class="header-text"><img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Admin</h2>
		<h3 class="header-text">Pediatrics Dashboard Captions</h3>
    	
    	<form name="caption" method='POST' action='submitCaption.jsp' autocomplete="off" >
  			<div class="form-group row">
    			<label for="tag" class="required col-sm-2 col-form-label">Tag</label>
    			<label for="" class="required col-sm-2 col-form-label"><i style="color:#adaeb1;">required fields:</i> </label>
    			<input name="tag" type="text" class="form-control" id="tag" value="">
   			</div>
   			<div class="form-group row">
    			<label for="caption" class="required col-sm-2 col-form-label">Caption</label>
    			<div class="col-sm-10">
    				<textarea name="caption" id="caption" cols="50" rows="10"></textarea>
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
