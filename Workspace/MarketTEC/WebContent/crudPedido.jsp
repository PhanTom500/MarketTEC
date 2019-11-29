<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<script src="https://cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>




<style>
	.modal-header, h4, .close {
		background-color: #286090;
		color: white !important;
		text-align: center;
		font-size: 30px;
	}
</style>     

<title>Mantenimiento de Pedidos</title>
</head>
<body>
<header class="container">

</header>
 <div class="container">
 <h1>Mantenimiento de Pedidos</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="pedido">
			  		<input type="hidden" name="metodo" value="elimina">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>
			  
			  <form id="form_muestra_detalle" action="pedido" class="header_search_form clearfix" method="post">
					<input type="hidden" name="metodo" value="listaDetalle">
					<input type="hidden" id="id_idPed" name="idPed">
				</form>	
				
		       <form accept-charset="UTF-8"  action="pedido" class="simple_form" id="defaultForm3"  method="post">
		       		<input type="hidden" name="metodo" value="lista">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_filtro">Nombre del Cliente</label>
							  	<input class="form-control" id="id_filtro"  name="filtro1" placeholder="Ingrese el nombre" type="text" maxlength="70"/>
							</div>
						</div>
						
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_filtro">Estado del Pedido</label>
							  
									<select   class="form-control col-lg-3" id="id_filtro" name="filtro2" >
											<option value="" >[ TODOS ]</option>
											<option value="Pendiente" >Pendiente</option>
											<option value="Aprobado" >Aprobado</option>
											<option value="Denegado" >Denegado</option>
											<option value="En curso" >En curso</option>
											<option value="Finalizado" >Finalizado</option>
											<option value="Cancelado" >Cancelado</option>
									</select>
		                       
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="button" class="btn btn-primary" id="id_volver"  onclick="location.href='login-admin4.jsp';">VOLVER</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>NomCliente</th>
												<th>Fecha de Registro</th>
												<th>Estado</th>
												<th>Actualiza </th>
											
											</tr>
										</thead>
										<tbody>
												     
												<c:forEach items="${pedidos}" var="x">
													<tr>
														<td>${x.idPedido}</td>
														<td>${x.nombres}</td>
														<td>${x.fechaRegistro}</td>
														<td>${x.estado}</td>
									
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idPedido}','${x.nombres}','${x.fechaRegistro}','${x.estado}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
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
		 		</form>
		  </div>
  

  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Pedido</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm2" accept-charset="UTF-8"  action="pedido" class="form-horizontal" method="post">
							<input type="hidden" name="metodo" value="actualiza" >
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="id" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombre">Nombre del Cliente</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_nombre" readonly="readonly" name="nombre" type="text" maxlength="70"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_fecha">Fecha de Registro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_fecha" readonly="readonly" name="fecha" type="date" maxlength="70"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_estado">Estado</label>
		                                        <div class="col-lg-5">
													<select id="id_estado" name="estado"   class="form-control">
														<option value=" " >[ Seleccione ]</option>
														<option value="Pendiente" >Pendiente</option>
														<option value="Aprobado" >Aprobado</option>
														<option value="Denegado" >Denegado</option>
														<option value="En curso" >En curso</option>
														<option value="Finalizado" >Finalizado</option>
														<option value="Cancelado" >Cancelado</option>
													</select>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                    
		                                    <div class="row" > 
												<div class="col-md-12">
														<div class="content" >
												
															<table id="table_detalle" class="table table-striped table-bordered" >
																<thead>
																	<tr>
																		<th>ID</th>
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
		                                    
		                                    
		                                    <div class="form-group">
		                                        <div class="col-lg-10 col-lg-offset-10" style="left:inherit">
		                                        	<button type="submit" class="btn btn-primary">Finalizar</button>
		                                        </div>
		                                        
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		

</div>

<!-- Codigo para destruir la tabla detalle
	$("#table_detalle").dataTable().fnClearTable();
 -->

<script type="text/javascript">

function eliminar(id){	 
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
	
}

function registrar(){
	$('#idModalRegistra').modal("show");
}




function editar(id,nombre,fecha,estado){
	
	
	$('input[id=id_ID]').val(id);
	$('input[id=id_nombre]').val(nombre);
	$('input[id=id_fecha]').val(fecha);
	$('input[id=id_estado]').val(estado);
	
	
	
	
	$.getJSON("pedido",{"metodo":"listaDetalle","id":id},function (data) {
		console.log(data);
		
		
		$.each(data, function (index, item) { 
			$("#table_detalle").append("<tr><td>"+ item.idDetPedido +"</td><td><img height='40px' src='"+ item.imagen +"'/></td><td>"+ item.nombre +"</td><td>"+ item.cantidad +"</td><td>"+ item.precio +"</td></tr>");
		});
		
	});
	
	$('#idModalActualiza').modal("show");
	
	
}

$(document).ready(function() {
    $('#table').DataTable();
} );
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        excluded: ':disabled',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	
            estado: {
        		selector : '#id_estado',
                validators: {
                    notEmpty: {
                        message: 'Seleccione un estado'
                    }
                }
            },
           
       	}    
     }).on('error.form.bv', function(e) {
            console.log('error');

            // Active the panel element containing the first invalid element
            var $form         = $(e.target),
                validator     = $form.data('bootstrapValidator'),
                $invalidField = validator.getInvalidFields().eq(0),
                $collapse     = $invalidField.parents('.collapse');

            $collapse.collapse('show');
    });
    
    $('#defaultForm2').bootstrapValidator({
        message: 'This value is not valid',
        excluded: ':disabled',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	
            estado: {
        		selector : '#id_estado',
                validators: {
                    notEmpty: {
                        message: 'Seleccione un estado'
                    }
                }
            },
           
       	}    
     }).on('error.form.bv', function(e) {
            console.log('error');

            // Active the panel element containing the first invalid element
            var $form         = $(e.target),
                validator     = $form.data('bootstrapValidator'),
                $invalidField = validator.getInvalidFields().eq(0),
                $collapse     = $invalidField.parents('.collapse');

            $collapse.collapse('show');
    });
    
    CKEDITOR.replace( 'id_reg_descripcion' );    
    CKEDITOR.replace( 'id_descripcion' );
   
    CKEDITOR.instances['id_reg_descripcion']
    // To use the 'change' event, use CKEditor 4.2 or later
    .on('change', function() {
        var t = CKEDITOR.instances['id_reg_descripcion'].document.getBody().getText();
        $('#id_reg_descripcion').val(t);
        $('#defaultForm').bootstrapValidator('revalidateField', 'descripcion');
    });
    CKEDITOR.instances['id_descripcion']
    // To use the 'change' event, use CKEditor 4.2 or later
    .on('change', function() {
        var t = CKEDITOR.instances['id_descripcion'].document.getBody().getText();
        $('#id_descripcion').val(t);
        $('#defaultForm2').bootstrapValidator('revalidateField', 'descripcion');
    });
    
    
});
</script>

</body>
</html> 