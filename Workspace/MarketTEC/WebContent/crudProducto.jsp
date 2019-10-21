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


<style>
	.modal-header, h4, .close {
		background-color: #286090;
		color: white !important;
		text-align: center;
		font-size: 30px;
	}
</style>     

<title>Crud Productos </title>
</head>
<body>

 <div class="container">
 <h1>Crud de Producto</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="producto">
			  		<input type="hidden" name="metodo" value="elimina">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="producto" class="simple_form" id="defaultForm2"  method="post">
		       		<input type="hidden" name="metodo" value="lista">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nombre_filtro">Nombre</label>
							  	<input class="form-control" id="id_nombre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="70"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table class="table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Precio</th>
												<th>Categoria</th>
												<th>Imagen</th>
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
										<tbody>
												     
												<c:forEach items="${productos}" var="x">
													<tr>
														<td>${x.idProducto}</td>
														<td>${x.nombre}</td>
														<td>${x.precio}</td>
														<td>${x.categoria}</td>

														<td><img src="${x.imagen}" height="40"/></td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idProducto}','${x.nombre}','${x.descripcion}','${x.precio}','${x.stock}','${x.imagen}','${x.categoria}','${x.fecRegistro}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idProducto}');">
																<img src='images/delete.gif' width='auto' height='auto' />
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
  
  		 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm" accept-charset="UTF-8" action="producto" class="form-horizontal" method="post">
							<input type="hidden" name="metodo" value="registra" >
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="70"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_descripcion">Descripción</label>
		                                        <div class="col-lg-5">
													<textarea id="id_reg_descripcion" name="descripcion" cols="60" rows="10" placeholder="Ingrese una descripcion" maxlength="20000" ></textarea>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="70"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_stock">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_stock" name="stock" placeholder="Ingrese el stock" type="text" maxlength="70"/>
		                                        </div>
		                                    </div>
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_imagen">Link de Imagen</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_imagen" name="imagen" placeholder="Ingrese el link de la imagen" type="text" maxlength="70" onchange="document.getElementById('imagendos').src=this.value;" />
		                                        </div>
		                                        <label class="col-lg-3 control-label" for="id_reg_imagen">Subir a <a href="https://imgur.com/" target="_blank">https://imgur.com/</a> </label> 
		                                    </div>
		                                    <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_reg_previaFoto"></label>
                                                <div class="col-lg-5">
                                                		
                                                    <img id="imagendos" src="" height="250px"/>
                                                </div>
                                           </div>
										   <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_cboCategoria" name="categoria"   class="form-control">
														<option value=" " >[ Seleccione ]</option>
														<option value="Computadoras & Laptops" >Computadoras & Laptops</option>
														<option value="Camaras & Fotos" >Camaras & Fotos</option>
														<option value="Hardware" >Hardware</option>
														<option value="Smartphones & Tablets" >Smartphones & Tablets</option>
														<option value="TV & Audio" >TV & Audio</option>
														<option value="Gadgets" >Gadgets</option>
														<option value="Electronicos de Coches" >Electronicos de Coches</option>
														<option value="Video Juegos & Consolas" >Video Juegos & Consolas</option>
														<option value="Accesorios" >Accesorios</option>
													</select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
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
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm" accept-charset="UTF-8"  action="producto" class="form-horizontal" method="post">
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
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="70"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_descripcion">Descripción</label>
		                                        <div class="col-lg-5">
													<textarea id="id_reg_descripcion" name="descripcion" cols="60" rows="10" placeholder="Ingrese una descripcion" maxlength="20000" ></textarea>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="70"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_stock">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_stock" name="stock" placeholder="Ingrese el stock" type="text" maxlength="70"/>
		                                        </div>
		                                    </div>
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_imagen">Link de Imagen</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_imagen" name="imagen" placeholder="Ingrese el link de la imagen" type="text" maxlength="70" onchange="document.getElementById('imagentres').src=this.value;" />
		                                        </div>
		                                        <label class="col-lg-3 control-label" for="id_reg_imagen">Subir a <a href="https://imgur.com/" target="_blank">https://imgur.com/</a> </label> 
		                                    </div>
		                                    <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_reg_previaFoto"></label>
                                                <div class="col-lg-5">
                                                		
                                                    <img id="imagentres" src="" height="250px"/>
                                                </div>
                                           </div>
										   <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_cboCategoria" name="categoria"   class="form-control">
														<option value=" " >[ Seleccione ]</option>
														<option value="Computadoras & Laptops" >Computadoras & Laptops</option>
														<option value="Camaras & Fotos" >Camaras & Fotos</option>
														<option value="Hardware" >Hardware</option>
														<option value="Smartphones & Tablets" >Smartphones & Tablets</option>
														<option value="TV & Audio" >TV & Audio</option>
														<option value="Gadgets" >Gadgets</option>
														<option value="Electronicos de Coches" >Electronicos de Coches</option>
														<option value="Video Juegos & Consolas" >Video Juegos & Consolas</option>
														<option value="Accesorios" >Accesorios</option>
													</select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
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

<script type="text/javascript">

function eliminar(id){	 
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
	
}

function registrar(){
	$('#idModalRegistra').modal("show");
}

function formReset()
{
document.getElementById("defaultForm").reset();
}

function editar(id,nombre,descripcion,precio,stock,imagen,categoria,fecRegistro){	
	
	$('input[id=id_ID]').val(id);
	$('input[id=id_reg_nombre]').val(nombre);
	$('[id=id_reg_descripcion]').val(descripcion);
	$('[id=id_reg_precio]').val(precio);
	$('[id=id_reg_stock]').val(stock);
	$('[id=id_reg_imagen]').val(imagen);
	$('[id=id_cboCategoria]').val(categoria);
	$('#idModalActualiza').modal("show");
	formReset();
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
        	nombre: {
        		selector : '#id_reg_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 75 caracteres',
                    	min : 5,
                    	max : 75
                    }
                }
            },
            descripcion: {
            	selector : '#id_reg_descripcion',
                validators: {
                    notEmpty: {
                        message: 'La descripcion es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'La descripcion no debe pasarse de 600',
                    	min : 1,
                    	max : 600
                    }
                }
            },
            precio: {
        		selector : '#id_reg_precio',
                validators: {
                    notEmpty: {
                        message: 'El precio es un campo obligatorio'
                    },
                    regexp: {
                    	message : 'El precio debe ser un valor numerico',
                        regexp : /^[1-9]\d{0,7}(?:.\d{1,4})?$/                 
                    }
                }
            },
            stock: {
        		selector : '#id_reg_stock',
                validators: {
                    notEmpty: {
                        message: 'El stock es un campo obligatorio'
                    },
                    regexp: {
                    	message : 'El stock debe ser un numero entero y no debe ser muy alto',
                        regexp : /^[1-9]\d{0,7}$/                 
                    }
                }
            },
            imagen: {
        		selector : '#id_reg_imagen',
                validators: {
                    notEmpty: {
                        message: 'La imagen es un campo obligatorio'
                    }
                }
            },
            categoria: {
        		selector : '#id_cboCategoria',
                validators: {
                    notEmpty: {
                        message: 'Seleccione una categoria'
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
});
</script>

</body>
</html> 