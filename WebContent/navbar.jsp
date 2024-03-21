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
			<c:if test="${not empty public_health}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/public-health/questions.jsp">Public Health Questions</a></li>
			</c:if>
			<c:if test="${not empty public_health_mode}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/public-health/modes.jsp">Public Health Modes</a></li>
			</c:if>
			<c:if test="${not empty public_site}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/public_site/blocks.jsp">Public Site Content</a></li>
			</c:if>
			<c:if test="${not empty peds_dashboard}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/peds_dashboard/captions.jsp">Peds Dashboard Captions</a></li>
			</c:if>
			<c:if test="${not empty recover}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/recover/captions.jsp">RECOVER Dashboard Captions</a></li>
			</c:if>
			<c:if test="${not empty users}">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"	aria-haspopup="true" aria-expanded="false">Users</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="<util:applicationRoot/>/users/admin.jsp">Overall Status</a>
						<a class="dropdown-item" href="<util:applicationRoot/>/users/enclave_status.jsp">User Enclave Status</a>
						<a class="dropdown-item" href="<util:applicationRoot/>/users/user_roster.jsp">User Roster</a>
						<a class="dropdown-item" href="<util:applicationRoot/>/users/user_pending.jsp">Users Pending</a>
						<a class="dropdown-item" href="<util:applicationRoot/>/users/user_scan.jsp">User Scan</a>
						<a class="dropdown-item" href="<util:applicationRoot/>/users/domain_remap.jsp">Domain Remap</a>
						<a class="dropdown-item" href="<util:applicationRoot/>/users/admin_map_email.jsp">Account Mapping</a>
						<a class="dropdown-item" href="<util:applicationRoot/>/users/admin_delete.jsp">User Deletion</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"	aria-haspopup="true" aria-expanded="false">Organizations</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="<util:applicationRoot/>/duas">N3C</a>
						<a class="dropdown-item" href="<util:applicationRoot/>/tenant_duas">Tenant</a>
					</div>
				</li>
			</c:if>
			<c:if test="${not empty foundry_feed}">
				<li class="nav-item"><a class="nav-link" href="<util:applicationRoot/>/foundry_feed/feeds.jsp">Foundry Feeds</a></li>
			</c:if>
			<li class="nav-item" style="flex-grow: 1; text-align: right;"><a class="nav-link" href="<util:applicationRoot/>/logout.jsp"><small>Logout</small></a></li>
		</ul>
	</div>
</nav>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
$(document).on('click', '.dropdown-menu .nav-card', function (e) {
	  e.stopPropagation();
	});
</script>
