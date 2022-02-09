<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<style type="text/css" media="all">
@import "resources/n3c_login_style.css";
</style>

<body>

	<jsp:include page="navbar.jsp" flush="true" />

	<c:choose>
		<c:when test="${empty valid}">
			<div class=" n3c_alert">
				<i class="fa fa-exclamation" aria-hidden="true">&emsp;</i>Our apologies, but you must successfully log in through NIH prior to registering. Click <a href="dologin.jsp">here</a> to be redirected.<br />
				<a href="dologin.jsp" class="btn btn-lg btn-n3c" style="margin-top: 30px; margin-bottom: 30px;">Click here to log in.</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container center-box shadow-border">
				<h2 class="header-text">
					<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Admin
				</h2>
				<c:choose>
					<c:when test="${empty user_email}">
						<a href="dologin.jsp" class="btn btn-lg btn-n3c" style="margin-top: 30px; margin-bottom: 30px;">Click here to log in.</a>
					</c:when>
					<c:otherwise>
    			Authorizations for ${user_email}: <br>
    			<br>admin:${admin}
    			<br>public_health:${public_health}
    			<br>public_site:${public_site}
    			<br>peds_dashboard:${peds_dashboard}
    			<br>users:${users}
    			<br>foundry_feed:${foundry_feed}
    		</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
