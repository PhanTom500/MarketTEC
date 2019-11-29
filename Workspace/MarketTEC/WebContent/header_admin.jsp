<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
 
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<script src="https://cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>


<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- 
<link rel="stylesheet" href="dist/css/adminlte.min.css">
 -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
 
 
<style>
    .modal-header, h4, .close {
        background-color: #286090;
        color: white !important;
        text-align: center;
        font-size: 30px;
    }
    
    .navbar {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: justify;
	justify-content: space-between;
	padding: .5rem .5rem
}

.navbar>.container, .navbar>.container-fluid {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: justify;
	justify-content: space-between
}

.navbar-brand {
	display: inline-block;
	padding-top: .3125rem;
	padding-bottom: .3125rem;
	margin-right: .5rem;
	font-size: 1.25rem;
	line-height: inherit;
	white-space: nowrap
}

.navbar-brand:focus, .navbar-brand:hover {
	text-decoration: none
}

.navbar-nav {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	padding-left: 0;
	margin-bottom: 0;
	list-style: none
}

.navbar-nav .nav-link {
	padding-right: 0;
	padding-left: 0
}

.navbar-nav .dropdown-menu {
	position: static;
	float: none
}

.navbar-text {
	display: inline-block;
	padding-top: .5rem;
	padding-bottom: .5rem
}

.navbar-collapse {
	-ms-flex-preferred-size: 100%;
	flex-basis: 100%;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-ms-flex-align: center;
	align-items: center
}

.navbar-toggler {
	padding: .25rem .75rem;
	font-size: 1.25rem;
	line-height: 1;
	background-color: transparent;
	border: 1px solid transparent;
	border-radius: .25rem
}

.navbar-toggler:focus, .navbar-toggler:hover {
	text-decoration: none
}

.navbar-toggler-icon {
	display: inline-block;
	width: 1.5em;
	height: 1.5em;
	vertical-align: middle;
	content: "";
	background: no-repeat center center;
	background-size: 100% 100%
}

@media ( max-width :575.98px) {
	.navbar-expand-sm>.container, .navbar-expand-sm>.container-fluid {
		padding-right: 0;
		padding-left: 0
	}
}

@media ( min-width :576px) {
	.navbar-expand-sm {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start
	}
	.navbar-expand-sm .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row
	}
	.navbar-expand-sm .navbar-nav .dropdown-menu {
		position: absolute
	}
	.navbar-expand-sm .navbar-nav .nav-link {
		padding-right: 1rem;
		padding-left: 1rem
	}
	.navbar-expand-sm>.container, .navbar-expand-sm>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap
	}
	.navbar-expand-sm .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto
	}
	.navbar-expand-sm .navbar-toggler {
		display: none
	}
}

@media ( max-width :767.98px) {
	.navbar-expand-md>.container, .navbar-expand-md>.container-fluid {
		padding-right: 0;
		padding-left: 0
	}
}

@media ( min-width :768px) {
	.navbar-expand-md {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start
	}
	.navbar-expand-md .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row
	}
	.navbar-expand-md .navbar-nav .dropdown-menu {
		position: absolute
	}
	.navbar-expand-md .navbar-nav .nav-link {
		padding-right: 1rem;
		padding-left: 1rem
	}
	.navbar-expand-md>.container, .navbar-expand-md>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap
	}
	.navbar-expand-md .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto
	}
	.navbar-expand-md .navbar-toggler {
		display: none
	}
}

@media ( max-width :991.98px) {
	.navbar-expand-lg>.container, .navbar-expand-lg>.container-fluid {
		padding-right: 0;
		padding-left: 0
	}
}

@media ( min-width :992px) {
	.navbar-expand-lg {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start
	}
	.navbar-expand-lg .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row
	}
	.navbar-expand-lg .navbar-nav .dropdown-menu {
		position: absolute
	}
	.navbar-expand-lg .navbar-nav .nav-link {
		padding-right: 1rem;
		padding-left: 1rem
	}
	.navbar-expand-lg>.container, .navbar-expand-lg>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap
	}
	.navbar-expand-lg .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto
	}
	.navbar-expand-lg .navbar-toggler {
		display: none
	}
}

@media ( max-width :1199.98px) {
	.navbar-expand-xl>.container, .navbar-expand-xl>.container-fluid {
		padding-right: 0;
		padding-left: 0
	}
}

@media ( min-width :1200px) {
	.navbar-expand-xl {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start
	}
	.navbar-expand-xl .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row
	}
	.navbar-expand-xl .navbar-nav .dropdown-menu {
		position: absolute
	}
	.navbar-expand-xl .navbar-nav .nav-link {
		padding-right: 1rem;
		padding-left: 1rem
	}
	.navbar-expand-xl>.container, .navbar-expand-xl>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap
	}
	.navbar-expand-xl .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto
	}
	.navbar-expand-xl .navbar-toggler {
		display: none
	}
}

.navbar-expand {
	-ms-flex-flow: row nowrap;
	flex-flow: row nowrap;
	-ms-flex-pack: start;
	justify-content: flex-start
}

.navbar-expand>.container, .navbar-expand>.container-fluid {
	padding-right: 0;
	padding-left: 0
}

.navbar-expand .navbar-nav {
	-ms-flex-direction: row;
	flex-direction: row
}

.navbar-expand .navbar-nav .dropdown-menu {
	position: absolute
}

.navbar-expand .navbar-nav .nav-link {
	padding-right: 1rem;
	padding-left: 1rem
}

.navbar-expand>.container, .navbar-expand>.container-fluid {
	-ms-flex-wrap: nowrap;
	flex-wrap: nowrap
}

.navbar-expand .navbar-collapse {
	display: -ms-flexbox !important;
	display: flex !important;
	-ms-flex-preferred-size: auto;
	flex-basis: auto
}

.navbar-expand .navbar-toggler {
	display: none
}

.navbar-light .navbar-brand {
	color: rgba(0, 0, 0, .9)
}

.navbar-light .navbar-brand:focus, .navbar-light .navbar-brand:hover {
	color: rgba(0, 0, 0, .9)
}

.navbar-light .navbar-nav .nav-link {
	color: rgba(0, 0, 0, .5)
}

.navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover
	{
	color: rgba(0, 0, 0, .7)
}

.navbar-light .navbar-nav .nav-link.disabled {
	color: rgba(0, 0, 0, .3)
}

.navbar-light .navbar-nav .active>.nav-link, .navbar-light .navbar-nav .nav-link.active,
	.navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show>.nav-link
	{
	color: rgba(0, 0, 0, .9)
}

.navbar-light .navbar-toggler {
	color: rgba(0, 0, 0, .5);
	border-color: rgba(0, 0, 0, .1)
}

.navbar-light .navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E")
}

.navbar-light .navbar-text {
	color: rgba(0, 0, 0, .5)
}

.navbar-light .navbar-text a {
	color: rgba(0, 0, 0, .9)
}

.navbar-light .navbar-text a:focus, .navbar-light .navbar-text a:hover {
	color: rgba(0, 0, 0, .9)
}

.navbar-dark .navbar-brand {
	color: #fff
}

.navbar-dark .navbar-brand:focus, .navbar-dark .navbar-brand:hover {
	color: #fff
}

.navbar-dark .navbar-nav .nav-link {
	color: rgba(255, 255, 255, .75)
}

.navbar-dark .navbar-nav .nav-link:focus, .navbar-dark .navbar-nav .nav-link:hover
	{
	color: #fff
}

.navbar-dark .navbar-nav .nav-link.disabled {
	color: rgba(255, 255, 255, .25)
}

.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active,
	.navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link
	{
	color: #fff
}

.navbar-dark .navbar-toggler {
	color: rgba(255, 255, 255, .75);
	border-color: rgba(255, 255, 255, .1)
}

.navbar-dark .navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 0.75)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E")
}

.navbar-dark .navbar-text {
	color: rgba(255, 255, 255, .75)
}

.navbar-dark .navbar-text a {
	color: #fff
}

.navbar-dark .navbar-text a:focus, .navbar-dark .navbar-text a:hover {
	color: #fff
}
    
    
</style>    
 
<title>Tenis </title>
</head>
<!-- 
<body>
	<div class='container'>
	    <div class="logo">
	        <h1>
	            <a href="PI_TennisMesa/">
	                Tennis Club
	                <img class="logo-position" src="images/logo.png" alt="" />
	            </a>
	        </h1>
	    </div>
	    <br>
	    <button type="button" class="btn btn-primary" onclick="window.location.href='/PI_TennisMesa/Mantenimiento.jsp'">Volver al mantenimiento</button><br>&nbsp;<br>
	    <button type="button" class="btn btn-primary" onclick="window.location.href='/PI_TennisMesa/Mantenimiento.jsp'">Vaasd</button><br>&nbsp;<br>
	</div>
</body>
 -->
 
 <body class="hold-transition layout-top-nav">
<div class="wrapper">
	<form id="form_head_index" action="producto" class="header_search_form clearfix" method="post">
			<input type="hidden" name="metodo" value="pindex">
		</form>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-light navbar-white">
    <div class="container">
    	<!-- 
      <a href="index3.html" class="navbar-brand">
        <img src="images/logo-admin.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Panel Admin</span>
      </a>
	 -->
	 
      <!-- Left navbar links -->
      <ul class="navbar-nav" >
        <li class="nav-item">
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="login-admin.jsp" class="nav-link">Panel General</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="crudUsuario.jsp" class="nav-link">Usuarios</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="crudProducto.jsp" class="nav-link">Productos</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="javascript:$('#form_head_index').submit();" class="nav-link">Inicio</a>
        </li>
      </ul>

      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto">
      
        <!-- Messages Dropdown Menu -->
        <li class="nav-item dropdown">
          
        </li>
        
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
          
        </li>
        
        <li class="nav-item">
          
        </li>
      </ul>
    </div>
  </nav>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->


</body>
</html>