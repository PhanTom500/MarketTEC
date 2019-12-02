<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<style>
.cart_item_text {
	max-width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: center;
}
</style>

<title>Caja</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">

<!-- Estilos de la tarjeta -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Inconsolata'>
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="./style.css">

</head>

<body>

	<div class="super_container">

		<form id="idFormElimina" action="producto">
			<input type="hidden" name="metodo" value="eliminaFav"> <input
				type="hidden" id="id_elimina" name="id"> <input
				type="hidden" name="idUsuario" value="${user.idUsuario }">
		</form>

		<form id="idFormRegistraCarrito" action="pedido">
			<input type="hidden" name="metodo" value="registra"> <input
				type="hidden" name="idUsuario" value="${user.idUsuario }">
		</form>

		<!-- Header -->

		<header class="header"> <jsp:include page="header.jsp" /> </header>

		<!-- Caja -->
		<br>
		<br>
		<div class="checkout">
			<div class="credit-card-box">
				<div class="flip">
					<div class="front">
						<div class="chip"></div>
						<div class="logo">
							<svg version="1.1" id="visa" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								width="47.834px" height="47.834px" viewBox="0 0 47.834 47.834"
								style="enable-background:new 0 0 47.834 47.834;"> <g>
							<g> <path
								d="M44.688,16.814h-3.004c-0.933,0-1.627,0.254-2.037,1.184l-5.773,13.074h4.083c0,0,0.666-1.758,0.817-2.143
                         c0.447,0,4.414,0.006,4.979,0.006c0.116,0.498,0.474,2.137,0.474,2.137h3.607L44.688,16.814z M39.893,26.01
                         c0.32-0.819,1.549-3.987,1.549-3.987c-0.021,0.039,0.317-0.825,0.518-1.362l0.262,1.23c0,0,0.745,3.406,0.901,4.119H39.893z
                         M34.146,26.404c-0.028,2.963-2.684,4.875-6.771,4.875c-1.743-0.018-3.422-0.361-4.332-0.76l0.547-3.193l0.501,0.228
                         c1.277,0.532,2.104,0.747,3.661,0.747c1.117,0,2.313-0.438,2.325-1.393c0.007-0.625-0.501-1.07-2.016-1.77
                         c-1.476-0.683-3.43-1.827-3.405-3.876c0.021-2.773,2.729-4.708,6.571-4.708c1.506,0,2.713,0.31,3.483,0.599l-0.526,3.092
                         l-0.351-0.165c-0.716-0.288-1.638-0.566-2.91-0.546c-1.522,0-2.228,0.634-2.228,1.227c-0.008,0.668,0.824,1.108,2.184,1.77
                         C33.126,23.546,34.163,24.783,34.146,26.404z M0,16.962l0.05-0.286h6.028c0.813,0.031,1.468,0.29,1.694,1.159l1.311,6.304
                         C7.795,20.842,4.691,18.099,0,16.962z M17.581,16.812l-6.123,14.239l-4.114,0.007L3.862,19.161
                         c2.503,1.602,4.635,4.144,5.386,5.914l0.406,1.469l3.808-9.729L17.581,16.812L17.581,16.812z M19.153,16.8h3.89L20.61,31.066
                         h-3.888L19.153,16.8z" />
							</g> </g> </svg>
						</div>
						<div class="number"></div>
						<div class="card-holder">
							<label>Titular</label>
							<div></div>
						</div>
						<div class="card-expiration-date">
							<label>Expira</label>
							<div></div>
						</div>
					</div>
					<div class="back">
						<div class="strip"></div>
						<div class="logo">
							<svg version="1.1" id="visa" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								width="47.834px" height="47.834px" viewBox="0 0 47.834 47.834"
								style="enable-background:new 0 0 47.834 47.834;"> <g>
							<g> <path
								d="M44.688,16.814h-3.004c-0.933,0-1.627,0.254-2.037,1.184l-5.773,13.074h4.083c0,0,0.666-1.758,0.817-2.143
                         c0.447,0,4.414,0.006,4.979,0.006c0.116,0.498,0.474,2.137,0.474,2.137h3.607L44.688,16.814z M39.893,26.01
                         c0.32-0.819,1.549-3.987,1.549-3.987c-0.021,0.039,0.317-0.825,0.518-1.362l0.262,1.23c0,0,0.745,3.406,0.901,4.119H39.893z
                         M34.146,26.404c-0.028,2.963-2.684,4.875-6.771,4.875c-1.743-0.018-3.422-0.361-4.332-0.76l0.547-3.193l0.501,0.228
                         c1.277,0.532,2.104,0.747,3.661,0.747c1.117,0,2.313-0.438,2.325-1.393c0.007-0.625-0.501-1.07-2.016-1.77
                         c-1.476-0.683-3.43-1.827-3.405-3.876c0.021-2.773,2.729-4.708,6.571-4.708c1.506,0,2.713,0.31,3.483,0.599l-0.526,3.092
                         l-0.351-0.165c-0.716-0.288-1.638-0.566-2.91-0.546c-1.522,0-2.228,0.634-2.228,1.227c-0.008,0.668,0.824,1.108,2.184,1.77
                         C33.126,23.546,34.163,24.783,34.146,26.404z M0,16.962l0.05-0.286h6.028c0.813,0.031,1.468,0.29,1.694,1.159l1.311,6.304
                         C7.795,20.842,4.691,18.099,0,16.962z M17.581,16.812l-6.123,14.239l-4.114,0.007L3.862,19.161
                         c2.503,1.602,4.635,4.144,5.386,5.914l0.406,1.469l3.808-9.729L17.581,16.812L17.581,16.812z M19.153,16.8h3.89L20.61,31.066
                         h-3.888L19.153,16.8z" />
							</g> </g> </svg>

						</div>
						<div class="ccv">
							<label>CCV</label>
							<div></div>
						</div>
					</div>
				</div>
			</div>
			
			<form class="form" autocomplete="off" novalidate>
			 
				<fieldset>
					<label for="card-number">Numero de Tarjeta</label> <input type="num"
						id="card-number" class="input-cart-number" maxlength="4" /> <input
						type="num" id="card-number-1" class="input-cart-number"
						maxlength="4" /> <input type="num" id="card-number-2"
						class="input-cart-number" maxlength="4" /> <input type="num"
						id="card-number-3" class="input-cart-number" maxlength="4" />
				</fieldset>
				<fieldset>
					<label for="card-holder">Titular de la Tarjeta</label> 
					<input type="text" id="card-holder" />
				</fieldset>
				<fieldset class="fieldset-expiration">
					<label for="card-expiration-month">Fecha de Expiracion</label>
					<div class="select">
						<select id="card-expiration-month">
							<option></option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
					</div>
					<div class="select">
						<select id="card-expiration-year">
							<option></option>
							<option>2016</option>
							<option>2017</option>
							<option>2018</option>
							<option>2019</option>
							<option>2020</option>
							<option>2021</option>
							<option>2022</option>
							<option>2023</option>
							<option>2024</option>
							<option>2025</option>
						</select>
					</div>
				</fieldset>
				<fieldset class="fieldset-ccv">
					<label for="card-ccv">CCV</label> <input type="text" id="card-ccv"
						maxlength="3" />
				</fieldset>
				<button type="button" class="btn" onclick="registraPedido()">
					<i class="fa fa-lock"></i> FINALIZAR COMPRA
				</button>
				
			</form>
			 
		</div>


		<!-- Modal de confirmación al eliminar un producto de favoritos -->
		<div class="modal fade right" id="sideModalTR" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-side modal-bottom-right"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title w-100" id="myModalLabel">Confirmación</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">¿Seguro que desea eliminar este
						producto del carrito?</div>
					<div class="modal-footer">
						<form id="idFormEliminaModal" action="pedido">
							<input type="hidden" name="metodo" value="eliminaCarrito">
							<input type="hidden" id="id_eliminaModal" name="id">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cerrar</button>
							<button type="submit" class="btn btn-primary">Confirmar</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal de error de inicio de sesion -->
		<div class="modal fade right" id="sideModalTRIniSes" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-side modal-bottom-right"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title w-100" id="myModalLabel">ALERTA</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Para realizar esta acción debe
						iniciar sesión</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cerrar</button>
						<button type="button" class="btn btn-primary"
							onClick="location.href='login.jsp'">Iniciar Sesión</button>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp" />

	</div>

	<script type="text/javascript">
		function registraPedido() {
			$('#idFormRegistraCarrito').submit();

		}

		function eliminar(id) {
			$('input[id=id_elimina]').val(id);
			$('#idFormElimina').submit();

		}

		function irInicio() {
			$('#form_head_index').submit();

		}

		function irTienda() {
			$('#form_head').submit();

		}
	</script>

	<script type="text/javascript">
		function MessajeEliminarFav(idFav) {
			//Ingresamos un mensaje
			var mensaje = confirm("¿Seguro desea eliminar de favoritos?");
			//Verificamos si el usuario acepto el mensaje
			if (mensaje) {
				//alert("Por favor Inicia Sesión");
				eliminar(idFav);
			}
			//Verificamos si el usuario denegó el mensaje
			else {
				//alert("¡Haz denegado el mensaje!");

			}
		}

		function MensajitoModalFav(id) {
			$('input[id=id_eliminaModal]').val(id);
			$('#sideModalTR').modal("show");
		}

		function MensajitoModalInicSes() {

			$('#sideModalTRIniSes').modal("show");
		}
	</script>

	<script>
		$('.cantidad').mask('00');
		$('.cantidad').on('input', function() {
			var tr = $(this).closest('ul');
			var total = parseInt(tr.data('price')) * $(this).val();
			tr.find('.price-f').html(total)
			tr.data('subtotal', total);
			calc();
		});
		function calc() {
			var sumReal = 00;
			$('.cart_list').each(function() {
				sumReal += parseInt($(this).data('subtotal'));
			});
			$('.target-ammount').html(sumReal);
			localStorage.setItem('ammount', sumReal);
		}
		calc();
	</script>


	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="styles/bootstrap4/popper.js"></script>
	<script src="styles/bootstrap4/bootstrap.min.js"></script>
	<script src="plugins/greensock/TweenMax.min.js"></script>
	<script src="plugins/greensock/TimelineMax.min.js"></script>
	<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
	<script src="plugins/greensock/animation.gsap.min.js"></script>
	<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
	<script src="plugins/easing/easing.js"></script>
	<script src="js/cart_custom.js"></script>

	<!-- Script de la tarjeta -->
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="./script.js"></script>
</body>

</html>