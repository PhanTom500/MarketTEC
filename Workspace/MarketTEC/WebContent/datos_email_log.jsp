<%@page import="rest_fb.User_Profile"%>
<%@page import="rest_fb.Get_User_Details"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Contact</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">

</head>

<body>

			
<%
	
	String nom = (String) request.getParameter("nom");
	String cor = (String) request.getParameter("cor");
%>
			

<div class="super_container">
	
	<!-- Header -->
	
	<header class="header">
		<jsp:include page="header.jsp" />
	</header>

	<!-- Contact Info -->

	<div class="contact_info">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="contact_info_container d-flex flex-lg-row flex-column justify-content-between align-items-between">

						<!-- Contact Item -->
						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="images/contact_1.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Phone</div>
								<div class="contact_info_text">+38 068 005 3570</div>
							</div>
						</div>

						<!-- Contact Item -->
						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="images/contact_2.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Email</div>
								<div class="contact_info_text">fastsales@gmail.com</div>
							</div>
						</div>

						<!-- Contact Item -->
						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="images/contact_3.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Address</div>
								<div class="contact_info_text">10 Suffolk at Soho, London, UK</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact Form -->

	<div class="contact_form">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="contact_form_container">
						<div class="contact_form_title">Mi cuenta</div>

						<form action="#" id="contact_form">
							<div class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<h3>Nombres:</h3>
								<input type="text" id="contact_form_name" class="contact_form_name input_field" value="${user.getNombres()}" required="required" data-error="Name is required." readonly="readonly" ><br>
								<h3>Correo:</h3>
								<input type="text" id="contact_form_email" class="contact_form_email input_field" value="${user.getCorreo()}" required="required" data-error="Email is required." readonly="readonly">
								
							</div>
							
							<br>
							<div class="contact_form_title" align="center" >Mis Pedidos</div>
							
							<div class="row" > 
								<div class="col-md-12">
										<div class="content" >
								
											<table id="table" class="table table-striped table-bordered" >
												<thead>
													<tr>
														<th>Numero de Pedido</th>
														<th>Fecha de Registro</th>
														<th>Estado</th>
														<th>Detalles </th>
													
													</tr>
												</thead>
												<tbody>
														     
														<c:forEach items="${pedidosUsu }" var="x">
															<tr>
																<td>${x.idPedido}</td>
																<td>${x.fechaRegistro}</td>
																<td>${x.estado}</td>
											
																<td>
																	<button type='button' data-toggle='modal' onclick="muestraDetalle('${x.idPedido}','${user.getNombres()}','${x.fechaRegistro}','${x.estado }')">
																		<img src='images/edit.gif' width='auto' height='auto' />
																	</button>
																</td>
		
															</tr>
														</c:forEach>
												</tbody>
												
											</table>	
											
										</div>	
								</div>
							</div>
							
							
											
							<div class="contact_form_button">
								<button type="button" class="button contact_submit_button" onclick="irInicio()">Volver</button>
							</div>
						</form>

					</div>
		
				</div>
				</div>
			</div>
		</div>
	
	
	<!-- Modal del CRUD -->
	<div class="modal fade" id="idModalActualiza">
		<span class="clearfix"></span>	
        <div class="modal-dialog" style="max-width: 60%">
            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px">             
                    <center><h4 class="modal-title" id="myModalLabel">Datos del Pedido</h4></center>
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="	true">&times;</button>
                </div>
                <div class="modal-body" style="padding: 20px 10px;">
                	<form id="defaultForm2" accept-charset="UTF-8"  action="pedido" class="form-horizontal" method="post">
                		<input type="hidden" name="metodo" value="actualiza" >
		                <div class="panel-group" id="steps">
               				
                
                
				<div class="container-fluid" >
					<div class="form-group input-group">
						<span class="input-group-addon" style="width:150px;">Cliente:</span>
						<input type="text"  class="form-control" id="id_nombre" readonly="readonly" name="Nombre">
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon" style="width:150px;">Fecha de Registro:</span>
						<input type="date"  class="form-control" id="id_fecha" readonly="readonly" name="fecha">
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon" style="width:150px;">Estado:</span>
						<input type="text" class="form-control" id="id_estado" readonly="readonly" name="Estado">
					</div>
										
				</div>
				
						
				<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
									<table id="table_detalle" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>Imagen</th>
												<th>Producto</th>
												<th>Cantidad</th>
												<th>Precio</th>
											</tr>
										</thead>
										<tbody>
												
										</tbody>
										
									</table>	
									
								</div>	
						</div>
					</div>
					</div>
					</form>
					
				</div>		
				
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="limpiarTabla()"><span class="glyphicon glyphicon-remove"></span> Cerrar</button>
                </div>
            </div>
        </div>
    </div>
		
	<div class="panel"></div>
		
		
		

	<!-- Map -->

	<div class="contact_map">
		<div id="google_map" class="google_map">
			<div class="map_container">
				<div id="map"></div>
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
<script src="plugins/easing/easing.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="js/contact_custom.js"></script>

<script type="text/javascript">
	function cerrarSessionUser() {
			
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession sess = request.getSession();
		sess.setAttribute("user", null);
		sess.invalidate();

		//window.location.href = 'index.jsp';
			
	}
		
</script>

<script type="text/javascript">
	
function muestraDetalle(id,nombre,fecha,estado){
	$("#table_detalle").empty();
	
	$('input[id=id_nombre]').val(nombre);
	$('input[id=id_fecha]').val(fecha);
	$('input[id=id_estado]').val(estado);
	
	
	$.getJSON("pedido",{"metodo":"listaDetalle","id":id},function (data) {
		console.log(data);
		$.each(data, function (index, item) { 
			$("#table_detalle").append("<tr><td><img height='40px' src='"+ item.imagen +"'/></td><td>"+ item.nombre +"</td><td>"+ item.cantidad +"</td><td> $"+ item.precio +"</td></tr>");
		});
	});
	
	$('#idModalActualiza').modal("show");
	
}

function editar(){
	$('#idModalActualiza').modal("show");
}

function limpiarTabla(){
	var table = $('#table_detalle').DataTable();
	
	$("#table_detalle").empty();
	
}

function irInicio(){	 
	$('#form_head_index').submit();
	
}

$(document).ready(function() {
    $('#table').DataTable();
} );
	
</script>


</body>

</html>