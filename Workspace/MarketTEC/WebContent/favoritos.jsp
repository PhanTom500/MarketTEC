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
<title>Favoritos</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">

</head>

<body>

<div class="super_container">

	<form id="idFormElimina" action="producto">
		<input type="hidden" name="metodo" value="eliminaFav">
		<input type="hidden" id="id_elimina" name="id">
		<input type="hidden" name="idUsuario" value="${user.idUsuario }">
	</form>
	
	<!-- Header -->
	
	<header class="header">
		<jsp:include page="header.jsp" />
	</header>

	<!-- Cart -->

	<div class="cart_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="cart_container">
						<div class="cart_title">Lista de Favoritos</div>
						<div class="cart_items">
						
							<c:forEach items="${favoritos }" var="x">
								<ul class="cart_list">
									<li class="cart_item clearfix">
										<div class="cart_item_image">
											<img src="${x.imagen }" alt="" width="150" height="125">
										</div>
										<div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
											<div class="cart_item_name cart_info_col">
												<div class="cart_item_title">Nombre</div>
												<div class="cart_item_text">${x.nombre }</div>
											</div>
											<div class="cart_item_color cart_info_col">
												<div class="cart_item_title">Categoria</div>
												<div class="cart_item_text">${x.categoria }</div>
											</div>
											<div class="cart_item_price cart_info_col">
												<div class="cart_item_title">Precio</div>
												<div class="cart_item_text">$${x.precio }</div>
											</div>
											<div class="cart_item_total cart_info_col">
												<div class="cart_item_title"></div>
												<div class="cart_item_text">
													<button type='button' data-toggle='modal' onclick="MensajitoModalFav('${x.idFavorito}')">
														<img src='images/delete.gif' width='auto' height='auto' />
													</button>
												</div>
												
											</div>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>
						
						
						<!-- Order Total -->
						<div class="order_total">
							<div class="order_total_content text-md-right">
								<div class="order_total_title">Cantidad de Productos favoritos:</div>
								<c:forEach items="${cantFavoritos}" var="f">
									<div class="order_total_amount">${f.cantidad} </div>
								</c:forEach>
							</div>
						</div>

						<div class="cart_buttons">
							<button type="button" class="button cart_button_clear" onclick="irInicio()">Ir al Inicio</button>
							<button type="button" class="button cart_button_checkout" onclick="irTienda()">Ir a la Tienda</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Modal de confirmación al eliminar un producto de favoritos -->
	<div class="modal fade right" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-side modal-bottom-right" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title w-100" id="myModalLabel">Confirmación</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ¿Seguro que desea eliminar este producto de favoritos?
	      </div>
	      <div class="modal-footer">
	      	<form id="idFormEliminaModal" action="producto">
	      		<input type="hidden" name="metodo" value="eliminaFav">
				<input type="hidden" id="id_eliminaModal" name="id">
				<input type="hidden" name="idUsuario" value="${user.idUsuario }">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
		        <button type="submit" class="btn btn-primary">Confirmar</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<jsp:include page="footer.jsp" />

</div>

<script type="text/javascript">

function eliminar(id){	 
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
	
}

function irInicio(){	 
	$('#form_head_index').submit();
	
}

function irTienda(){	 
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
	
	function MensajitoModalFav(id){
		$('input[id=id_eliminaModal]').val(id);
        $('#sideModalTR').modal("show");
    }
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
</body>

</html>