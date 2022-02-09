<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<nav class="navbar navbar-expand navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<img src="<util:applicationRoot/>/images/n3c_logo.png" class="n3c_logo_navbar" alt="N3C Logo">
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav" style="display: flex; width: 100%;">
			<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/index.jsp">Home</a></li>
			<c:if test="${not empty admin}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/admin/admins.jsp">Admins</a></li>
			</c:if>
			<c:if test="${not empty public_site}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/public-health/questions.jsp">Public Health Questions</a></li>
			</c:if>
			<c:if test="${not empty public_site}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/public_site/blocks.jsp">Public Site Content</a></li>
			</c:if>
			<c:if test="${not empty peds_dashboard}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/peds_dashboard/captions.jsp">Peds Dashboard Captions</a></li>
			</c:if>
			<c:if test="${not empty users}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/users/user_scan.jsp">Users</a></li>
			</c:if>
			<c:if test="${not empty foundry_feed}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/foundry_feed/feeds.jsp">Foundry Feeds</a></li>
			</c:if>
			<li class="nav-item" style="flex-grow: 1; text-align: right;"><a class="nav-link" href="<util:applicationRoot/>/logout.jsp"><small>Logout</small></a></li>
		</ul>
	</div>
</nav>

<script>
$(document).on('click', '.dropdown-menu .nav-card', function (e) {
	  e.stopPropagation();
	});
</script>
