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
		<h3 class="header-text">N3C Public Site Text Blocks</h3>
    	
 		<sql:query var="caption" dataSource="jdbc/N3CLoginTagLib">
 	       select * from n3c_public_site.block where tag = ?
 	       <sql:param>${param.tag}</sql:param>
		</sql:query>
		<c:forEach items="${caption.rows}" var="row" varStatus="rowCounter">
	    	<form name="caption" method='POST' action='updateBlock.jsp' autocomplete="off" >
	  			<div class="form-group row">
	    			<label for="tag" class="required col-sm-2 col-form-label">Tag</label>
	    			<label for="" class="required col-sm-2 col-form-label"><i style="color:#adaeb1;">required fields:</i> </label>
	    			<input name="tag" type="text" class="form-control" id="tag" value="${row.tag}">
	   			</div>
	  			<div class="form-group row">
	    			<label for="block" class="required col-sm-2 col-form-label">Block</label>
	    			<div class="col-sm-10">
	    				<textarea name="block" id="block" cols="50" rows="10">${row.block}</textarea>
					</div>
	  			</div>
	            
	            <div style="text-align:right;">
					<input type="hidden" name="orig_tag" value="${param.tag}">
	            	<button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
	            </div>
	    	</form>
    	</c:forEach>
	</div>
    <jsp:include page="../footer.jsp" flush="true" />
</body>
</html>
