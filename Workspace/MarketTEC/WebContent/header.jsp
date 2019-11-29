<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<style>
.cat_menu .btnCate {
  background-color: #FFFFFF; /* Green */
  border: none;
  color: black;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
}

.cat_menu .btnCate:hover {
  background-color: #FFFFFF; /* Green */
  border: none;
  color: green;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
}

</style>

<title>MarkeTEC</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="plugins/slick-1.8.0/slick.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">



</head>


<body>

	<div id="IdArriba">
		<a href="javascript:void(0)"><span></span></a>
	</div>
	
	<!-- header -->
	<div class="top_bar">
		<div class="container">
			<div class="row">
				<div class="col d-flex flex-row">
					<div class="top_bar_contact_item">
						<div class="top_bar_icon">
							<img src="images/phone.png" alt="">
						</div>
						+51 000 000 0000
					</div>
					<div class="top_bar_contact_item">
						<div class="top_bar_icon">
							<img src="images/mail.png" alt="">
						</div>
						<a href="mailto:fastsales@gmail.com">MarkeTEC@gmail.com</a>
					</div>
					<div class="top_bar_content ml-auto">




						<div class="top_bar_user" >

							<c:choose>
								<c:when test="${user==null}">
									<div class="user_icon">
										<img src="images/user.svg" alt="">
									</div>
									<div>
										<a href="login.jsp">Inicia Ya!</a>
									</div>
								</c:when>
								<c:otherwise>
									
									<c:choose>
										<c:when test="${user.tipo==1}">
											<div class="user_icon">
												<img src="images/logo-admin.jpg" alt="">
											</div>
											<div>
												<a href="login-admin.jsp" class="hvr-overline-from-center scroll">Panel Admin</a>
											</div>
										</c:when>
										<c:otherwise>
											
										</c:otherwise>
									</c:choose>
									
									<div class="user_icon">
										<img src="images/user.svg" alt="">
									</div>
									<div>
										<a href="javascript:$('#form_head_cuenta').submit();" class="hvr-overline-from-center scroll">Mi cuenta</a>
									</div>
									
									<div>
										<form class="login-form" action="usuario" method="post">
											<input type="hidden" name="metodo" value="logout">
											<input type="submit"  id="button" class="btn" value="Salir">
										</form>
									</div>
								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Header Main -->

	<div class="header_main">
		<div class="container">
			<div class="row">

				<!-- Logo -->
				<div class="col-lg-2 col-sm-3 col-3 order-1">
					<div class="logo_container">
						<div class="logo">
							<a href="javascript:$('#form_head_index').submit();">MarkeTEC</a>
						</div>
					</div>
				</div>
				<form id="form_head_index" action="producto" class="header_search_form clearfix" method="post">
					<input type="hidden" name="metodo" value="pindex">
					<input type="hidden" name="idUsuario" value="${user.idUsuario }">
				</form>
				
				<form id="form_head_cuenta" action="pedido" class="header_search_form clearfix" method="post">
					<input type="hidden" name="metodo" value="listaPedidoPorUsuario">
					<input type="hidden" name="idUsuario" value="${user.idUsuario }">
				</form>
				
				<form id="form_favorito" action="producto" class="header_search_form clearfix" method="post">
					<input type="hidden" name="metodo" value="listaFav">
					<input type="hidden" name="idUsuario" value="${user.idUsuario }">
				</form>
				
				<form id="form_registraFav" action="producto">
					<input type="hidden" name="metodo" value="registraFav">
					<input type="hidden" id="id_regIdPro" name="idPro">
					<input type="hidden" name="idUsu" value="${user.idUsuario }">
				</form>
				
				
				<!-- Search -->
				<div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
					<div class="header_search">
						<div class="header_search_content">
							<div class="header_search_form_container">
								<form id="form_head" action="producto" class="header_search_form clearfix" method="post">
									<input type="hidden" name="metodo" value="ptienda">
									<input type="search" name="filtro" class="header_search_input" placeholder="Busca algún producto...">
									<div class="custom_dropdown">
										<div class="custom_dropdown_list">
											<span class="custom_dropdown_placeholder clc">Categorias</span> <i class="fas fa-chevron-down"></i>
											<ul class="custom_list clc">
												<li><a class="clc" href="#">TODAS</a></li>
												<li><a class="clc" href="#">Computadoras</a></li>
												<li><a class="clc" href="#">Laptops</a></li>
												<li><a class="clc" href="#">Camaras</a></li>
												<li><a class="clc" href="#">Hardware</a></li>
												<li><a class="clc" href="#">Smartphones</a></li>
											</ul>
											
										</div>
									</div>
									
									
									<button type="submit" class="header_search_button trans_300"
										value="Submit">
										<img src="images/search.png" alt="">
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- Wishlist -->
				<div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
					<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
						
						<c:choose>
							<c:when test="${user==null }">
								<div class="wishlist d-flex flex-row align-items-center justify-content-end">
									<div class="wishlist_icon"><img src="images/heart.png" alt=""></div>
									<div class="wishlist_content">
										<div class="wishlist_text"><a href="favoritos.jsp">Favoritos</a></div>
										<div class="wishlist_count"></div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="wishlist d-flex flex-row align-items-center justify-content-end">
									<div class="wishlist_icon"><img src="images/heart.png" alt=""></div>
									<div class="wishlist_content">
										<div class="wishlist_text"><a href="javascript:$('#form_favorito').submit();">Favoritos</a></div>
										<c:forEach items="${cantFavoritos}" var="f">
											<div class="wishlist_count">${f.cantidad}</div>
										</c:forEach>
										
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						
						<!-- Cart -->
						<div class="cart">
							<div
								class="cart_container d-flex flex-row align-items-center justify-content-end">
								<div class="cart_icon">
									<img src="images/cart.png" alt="">
									 
									<div class="cart_count">
										<span></span>
									</div>
									 
								</div>
								<div class="cart_content">
									<div class="cart_text">
										<a href="carrito.jsp">Carrito</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Navigation -->

	<nav class="main_nav">
		<div class="container">
			<div class="row">
				<div class="col">

					<div class="main_nav_content d-flex flex-row">

						<!-- Categories Menu -->

						<div class="cat_menu_container">
							<div class="cat_menu_title d-flex flex-row align-items-center justify-content-start">
								<div class="cat_burger">
									<span></span><span></span><span></span>
								</div>
								<div class="cat_menu_text">Categorias</div>
							</div>
							
							<form action="producto" method="post">
								<input type="hidden" name="metodo" value="tiendaXcate">
								<ul class="cat_menu">
									<li><button class="btnCate" type="submit" name="cate" value="Computadoras & Laptops">Computadoras & Laptops</button></li>
									<li><button class="btnCate" type="submit" name="cate" value="Camaras & Fotos">Camaras & Fotos</button></li>
		                            <li><button class="btnCate" type="submit" name="cate" value="Hardware">Hardware</button></li>
		                            <li><button class="btnCate" type="submit" name="cate" value="Smartphones & Tablets">Smartphones & Tablets</button></li>
		                            <li><button class="btnCate" type="submit" name="cate" value="TV & Audio">TV & Audio</button></li>
		                            <li><button class="btnCate" type="submit" name="cate" value="Gadgets">Gadgets</button></li>
		                            <li><button class="btnCate" type="submit" name="cate" value="Electronicos de Coches">Electronicos de Coches</button></li>
		                            <li><button class="btnCate" type="submit" name="cate" value="Video Juegos & Consolas">Video Juegos & Consolas</button></li>
		                            <li><button class="btnCate" type="submit" name="cate" value="Accesorios">Accesorios</button></li>
									<!-- 
									<li><a href="#">Computadoras & Laptops <i class="fas fa-chevron-right ml-auto"></i></a></li>
									<li><a href="#">Cámaras & Fotos<i class="fas fa-chevron-right"></i></a></li>
									<li><a href="#">Hardware<i class="fas fa-chevron-right ml-auto"></i></a></li>
									<li><a href="#">Smartphones & Tablets<i
											class="fas fa-chevron-right"></i></a></li>
									<li><a href="#">TV & Audio<i
											class="fas fa-chevron-right"></i></a></li>
									<li><a href="#">Gadgets<i class="fas fa-chevron-right"></i></a></li>
									<li><a href="#">Electronicos de Coches<i
											class="fas fa-chevron-right"></i></a></li>
									<li><a href="#">Video Juegos & Consolas<i
											class="fas fa-chevron-right"></i></a></li>
									<li><a href="#">Accesorios<i
											class="fas fa-chevron-right"></i></a></li>
									 -->
								</ul>
							</form>
						</div>

						<!-- Main Nav Menu -->

						<div class="main_nav_menu ml-auto">
							<ul class="standard_dropdown main_nav_dropdown">
								<li><a href="javascript:$('#form_head_index').submit();">Inicio<i class="fas fa-chevron-down"></i></a></li>
								<li><a href="javascript:$('#form_head').submit();">Tienda<i class="fas fa-chevron-down"></i></a></li>
								<li class="hassubs"><a href="#">Marcas Destacadas<i
										class="fas fa-chevron-down"></i></a>
									<ul>
										<li><a href="#">Menu Item<i
												class="fas fa-chevron-down"></i></a>
											<ul>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
											</ul></li>
										<li><a href="#">Menu Item<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="#">Menu Item<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="#">Menu Item<i
												class="fas fa-chevron-down"></i></a></li>
									</ul></li>
								<li class="hassubs"><a href="#">Páginas<i
										class="fas fa-chevron-down"></i></a>
									<ul>
										<li><a href="tienda.jsp">Tienda<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="producto.jsp">Producto<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="blog.html">Blog<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="blog_single.html">Blog Post<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="regular.html">Regular Post<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="cart.html">Carrito<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="contact.html">Contacto<i
												class="fas fa-chevron-down"></i></a></li>
									</ul></li>
								<li><a href="blog.html">Blog<i
										class="fas fa-chevron-down"></i></a></li>
								<li><a href="contact.html">Contacto<i
										class="fas fa-chevron-down"></i></a></li>
							</ul>
						</div>

						<!-- Menu Trigger -->

						<div class="menu_trigger_container ml-auto">
							<div
								class="menu_trigger d-flex flex-row align-items-center justify-content-end">
								<div class="menu_burger">
									<div class="menu_trigger_text">Menu</div>
									<div class="cat_burger menu_burger_inner">
										<span></span><span></span><span></span>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</nav>

	<!-- Menu -->

	<div class="page_menu">
		<div class="container">
			<div class="row">
				<div class="col">

					<div class="page_menu_content">

						<div class="page_menu_search">
							<form action="#">
								<input type="search" required="required"
									class="page_menu_search_input"
									placeholder="Busca algún producto...">
							</form>
						</div>
						<ul class="page_menu_nav">
							<li class="page_menu_item has-children"><a href="#">Language<i
									class="fa fa-angle-down"></i></a>
								<ul class="page_menu_selection">
									<li><a href="#">English<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Italian<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Spanish<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Japanese<i class="fa fa-angle-down"></i></a></li>
								</ul></li>
							<li class="page_menu_item has-children"><a href="#">Currency<i
									class="fa fa-angle-down"></i></a>
								<ul class="page_menu_selection">
									<li><a href="#">US Dollar<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">EUR Euro<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">GBP British Pound<i
											class="fa fa-angle-down"></i></a></li>
									<li><a href="#">JPY Japanese Yen<i
											class="fa fa-angle-down"></i></a></li>
								</ul></li>
							<li class="page_menu_item"><a href="index.jsp">Inicio<i
									class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item has-children"><a href="#">Super
									Deals<i class="fa fa-angle-down"></i>
							</a>
								<ul class="page_menu_selection">
									<li><a href="#">Super Deals<i class="fa fa-angle-down"></i></a></li>
									<li class="page_menu_item has-children"><a href="#">Menu
											Item<i class="fa fa-angle-down"></i>
									</a>
										<ul class="page_menu_selection">
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										</ul></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
								</ul></li>
							<li class="page_menu_item has-children"><a href="#">Featured
									Brands<i class="fa fa-angle-down"></i>
							</a>
								<ul class="page_menu_selection">
									<li><a href="#">Featured Brands<i
											class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
								</ul></li>
							<li class="page_menu_item has-children"><a href="#">Trending
									Styles<i class="fa fa-angle-down"></i>
							</a>
								<ul class="page_menu_selection">
									<li><a href="#">Trending Styles<i
											class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
								</ul></li>
							<li class="page_menu_item"><a href="blog.html">blog<i
									class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item"><a href="contact.html">contact<i
									class="fa fa-angle-down"></i></a></li>
						</ul>

						<div class="menu_contact">
							<div class="menu_contact_item">
								<div class="menu_contact_icon">
									<img src="images/phone_white.png" alt="">
								</div>
								+38 068 005 3570
							</div>
							<div class="menu_contact_item">
								<div class="menu_contact_icon">
									<img src="images/mail_white.png" alt="">
								</div>
								<a href="mailto:fastsales@gmail.com">fastsales@gmail.com</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<script type="text/javascript" >
		function cerrarSessionUser() {
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession sess = request.getSession();
			
			sess.setAttribute("user", null);
			sess.invalidate();

			
			//window.location.href = 'index.jsp';
			

		}
		
	</script>
	
	<script>            
		(function(b,c){
			var e=document.createElement('link');
			e.rel='stylesheet',e.type='text/css',
			e.href='https://chatboxlive.blahbox.net/static/css/main.css',
			document.getElementsByTagName('head')[0].appendChild(e);
			var f=document.createElement('script');
			f.onload=function(){
				var g;
				if(c)
					g='previewInit';
				else{
					var h=document.createElement('div');
					g='cbinit',
					h.id='cbinit',
					document.body.append(h)}            
				console.log(document.querySelector('#'+g)),
				chatbox.initChat(document.querySelector('#'+g),b,c)},
				f.src='https://chatboxlive.blahbox.net/static/js/chat-lib.js',
				document.getElementsByTagName('head')[0].appendChild(f)})('33c30fa8c410ad0c0dde3793fd5974ce', 0);          
	
	</script>
	
	
</body>