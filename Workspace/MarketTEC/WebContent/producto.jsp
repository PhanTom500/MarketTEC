<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
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
<link rel="stylesheet" type="text/css" href="styles/product_styles.css">
<link rel="stylesheet" type="text/css" href="styles/product_responsive.css">

<script src="https://cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>


</head>

<body>
<%

String id = (String) request.getParameter("id");

Connection con;
String url = "jdbc:mysql://node40846-env-8126333.jelastic.saveincloud.net/markettec";
String Driver = "com.mysql.jdbc.Driver";
String user="root";
String clave = "PMIbbn19949";
Class.forName(Driver);
con=DriverManager.getConnection(url,user,clave);

PreparedStatement ps;
ResultSet rs;
ps=con.prepareStatement("SELECT idproducto, nombre, substring(descripcion,1,46000) as descripcion, precio, stock, imagen, categoria, fecRegistro FROM producto where idproducto = " + id);
rs = ps.executeQuery();

%>


<div class="super_container">
	
	<header class="header">
		<jsp:include page="header.jsp" />
	</header>
	
	<%
		while(rs.next()){
	%>
	
	<!-- Single Product -->

	<div class="single_product">
		<div class="container">
			<div class="row">
			
				<form id="form_addProdCar" action="pedido">
					<input type="hidden" name="metodo" value="carrito">
					<input type="hidden" id="id_regIdProd" name="idProd" value="<%= id%>">
				</form>
			
				<!-- Selected Image -->
				<div class="col-lg-5 order-lg-2 order-1">
					<div class="image_selected"><img src="<%= rs.getString("imagen")%>" alt="" width="400"></div>
				</div>

				<!-- Description -->
				<div class="col-lg-5 order-3">
					<div class="product_description">
						<div class="product_category"><%= rs.getString("categoria")%></div>
						<div class="product_name"><%= rs.getString("nombre")%></div>
						<div class="rating_r rating_r_4 product_rating"><i></i><i></i><i></i><i></i><i></i></div>
						<!-- 
						<div class="product_text"><p><%= rs.getString("descripcion")%></p></div>
						 -->
						<div class="order_info d-flex flex-row">
							<form action="#">
								<div class="clearfix" style="z-index: 1000;">

									<!-- Product Quantity -->
									<div class="product_quantity clearfix">
										<span>Cantidad: </span>
										<input id="quantity_input" type="text" pattern="[0-9]*" value="1">
										<div class="quantity_buttons">
											<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fas fa-chevron-up"></i></div>
											<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fas fa-chevron-down"></i></div>
										</div>
									</div>

									

								</div>

								<div class="product_price">$<%= rs.getDouble("precio")%></div>
								<c:choose>
									<c:when test="${user==null }">
										<div class="button_container">
											<button type="button" class="button cart_button" onClick="agregaProdCar()">Agregar al carrito</button>
											<hr>
											<button type="button" class="button cart_button" onClick="MensajitoModalAddFavErr()">Añadir Favoritos</button>
											<div class="product_fav"><i class="fas fa-heart"></i></div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="button_container">
											<button type="button" class="button cart_button" onclick="agregaProdCar()">Agregar al carrito</button>
											<hr>
											<button type="button" class="button cart_button" onclick="agregaFav(<%= id %>);">Añadir Favoritos</button>
											<div class="product_fav"><i class="fas fa-heart"></i></div>
										</div>
									</c:otherwise>
								</c:choose>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-9 order-3">
					<div class="Detalles">
						<div class="product_name">Descripción</div>
						<div class="product_text"><p><%= rs.getString("descripcion")%></p></div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<%}%>

	<!-- Recently Viewed -->

	<div class="viewed">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="viewed_title_container">
						<h3 class="viewed_title">Visto Recientemente</h3>
						<div class="viewed_nav_container">
							<div class="viewed_nav viewed_prev"><i class="fas fa-chevron-left"></i></div>
							<div class="viewed_nav viewed_next"><i class="fas fa-chevron-right"></i></div>
						</div>
					</div>

					<div class="viewed_slider_container">
						
						<!-- Recently Viewed Slider -->

						<div class="owl-carousel owl-theme viewed_slider">
							
							<!-- Recently Viewed Item -->
							<div class="owl-item">
								<div class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
									<div class="viewed_image"><img src="images/view_1.jpg" alt=""></div>
									<div class="viewed_content text-center">
										<div class="viewed_price">$225<span>$300</span></div>
										<div class="viewed_name"><a href="#">Beoplay H7</a></div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>

							<!-- Recently Viewed Item -->
							<div class="owl-item">
								<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
									<div class="viewed_image"><img src="images/view_2.jpg" alt=""></div>
									<div class="viewed_content text-center">
										<div class="viewed_price">$379</div>
										<div class="viewed_name"><a href="#">LUNA Smartphone</a></div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>

							<!-- Recently Viewed Item -->
							<div class="owl-item">
								<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
									<div class="viewed_image"><img src="images/view_3.jpg" alt=""></div>
									<div class="viewed_content text-center">
										<div class="viewed_price">$225</div>
										<div class="viewed_name"><a href="#">Samsung J730F...</a></div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>

							<!-- Recently Viewed Item -->
							<div class="owl-item">
								<div class="viewed_item is_new d-flex flex-column align-items-center justify-content-center text-center">
									<div class="viewed_image"><img src="images/view_4.jpg" alt=""></div>
									<div class="viewed_content text-center">
										<div class="viewed_price">$379</div>
										<div class="viewed_name"><a href="#">Huawei MediaPad...</a></div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>

							<!-- Recently Viewed Item -->
							<div class="owl-item">
								<div class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
									<div class="viewed_image"><img src="images/view_5.jpg" alt=""></div>
									<div class="viewed_content text-center">
										<div class="viewed_price">$225<span>$300</span></div>
										<div class="viewed_name"><a href="#">Sony PS4 Slim</a></div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>

							<!-- Recently Viewed Item -->
							<div class="owl-item">
								<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
									<div class="viewed_image"><img src="images/view_6.jpg" alt=""></div>
									<div class="viewed_content text-center">
										<div class="viewed_price">$375</div>
										<div class="viewed_name"><a href="#">Speedlink...</a></div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Brands -->

	<div class="brands">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="brands_slider_container">
						
						<!-- Brands Slider -->

						<div class="owl-carousel owl-theme brands_slider">
							
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="images/brands_1.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="images/brands_2.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="images/brands_3.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="images/brands_4.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="images/brands_5.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="images/brands_6.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="images/brands_7.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="images/brands_8.jpg" alt=""></div></div>

						</div>
						
						<!-- Brands Slider Navigation -->
						<div class="brands_nav brands_prev"><i class="fas fa-chevron-left"></i></div>
						<div class="brands_nav brands_next"><i class="fas fa-chevron-right"></i></div>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal de advertencia de logueo favoritos -->
	<div class="modal fade right" id="sideModalTRAggFavErr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-side modal-bottom-right" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title w-100" id="myModalLabel">ALERTA</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        Para realizar esta acción debe iniciar sesión
	      </div>
	      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
		        <button type="button" class="btn btn-primary" onClick="location.href='login.jsp'">Iniciar Sesión</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<jsp:include page="footer.jsp" />
	
</div>


	

<script src="js/jquery-3.3.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/product_custom.js"></script>

<script src="plugins/slick-1.8.0/slick.js"></script>
<script src="js/custom.js"></script>


<script>
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			console.log(response.authResponse.accessToken);
			alert(response.authResponse.accessToken);

			if (response.status === 'connected') {

				//window.location.href = 'Sign_in_Controller.jsp?access_token=' + response.authResponse.accessToken;
				
				window.location.href = 'datos.jsp?access_token=' + response.authResponse.accessToken;

			} else {
				// The person is not logged into your app or we are unable to tell.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			}
		}

		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '436093307250900',
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.8' // use graph api version 2.8
			});

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		};

		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		

		// Here we run a very simple test of the Graph API after login is
		// successful.  See statusChangeCallback() for when this call is made.
</script>
	
<script>
	function cargaProductos() {
		setTimeout(function(){ submitform(); }, 100);
	}
	
	function submitform(){
        //alert('test');
        document.forms["frm1"].submit();
      }
</script>

<script type="text/javascript">

function agregaProdCar(){	 
	$('#form_addProdCar').submit();
	
}

function agregaFav(idPro){	 
	$('input[id=id_regIdPro]').val(idPro);
	$('#form_registraFav').submit();
	
}
</script>

<script type="text/javascript">
	function MessajeFav() {
	    //Ingresamos un mensaje
	    var mensaje = confirm("Inicia sesión para agregar a favoritos");
	    //Verificamos si el usuario acepto el mensaje
	    if (mensaje) {
	        //alert("Por favor Inicia Sesión");
	        location.href='login.jsp'
	    }
	    //Verificamos si el usuario denegó el mensaje
	    else {
	        //alert("¡Haz denegado el mensaje!");
	
	    }
	}
	
	function MensajitoModalAddFavErr(){
        $('#sideModalTRAggFavErr').modal("show");
    }
	
</script>



</body>


</html>