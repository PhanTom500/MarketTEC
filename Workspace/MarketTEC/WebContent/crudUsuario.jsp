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

<title>Mantenimiento de Usuarios</title>
</head>
<body>

 <div class="container">
 <h1>Crud de Usuarios</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="usuario">
			  		<input type="hidden" name="metodo" value="elimina">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="usuario" class="simple_form" id="defaultForm2"  method="post">
		       		<input type="hidden" name="metodo" value="lista">
		       		<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
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
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombres</th>
												<th>Correo</th>
												<th>Pass</th>
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
										<tbody>
												     
												<c:forEach items="${usuarios}" var="x">
													<tr>
														<td>${x.idUsuario}</td>
														<td>${x.nombres}</td>
														<td>${x.correo}</td>
														<td>${x.pass}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idUsuario}','${x.nombres}','${x.correo}','${x.pass}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idUsuario}');">
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm" accept-charset="UTF-8" action="usuario" class="form-horizontal"     method="post">
							<input type="hidden" name="metodo" value="registra" >
							
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Usuario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombres" name="nombres" placeholder="Ingrese el Nombre Completo" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_correo">Correo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_correo" name="correo" placeholder="Ingrese el correo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pass">Pass</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_pass" name="pass" placeholder="Ingrese la contraseña" type="password" maxlength="20"/>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm" accept-charset="UTF-8"  action="usuario" class="form-horizontal"     method="post">
							<input type="hidden" name="metodo" value="actualiza" >
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Usuario</a></h4>
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
		                                        <label class="col-lg-3 control-label" for="id_nombres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_nombres" name="nombres" placeholder="Ingrese el Nombre Completo" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_correo">Correo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_correo" name="correo" placeholder="Ingrese el correo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_pass">Pass</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_pass" name="pass" placeholder="Ingrese la contraseña" type="text" maxlength="20"/>
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

function editar(id,nombres,correo,pass){	
	//document.getElementById("id_nombre").value ="ELBITA"
	
	$('input[id=id_ID]').val(id);
	$('input[id=id_nombres]').val(nombres);
	$('input[id=id_correo]').val(correo);
	$('input[id=id_pass]').val(pass);
	//$('select[id=id_estado]').val(estado);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
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
        	nombres: {
        		selector : '#id_reg_nombres',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            correo: {
        		selector : '#id_reg_correo',
                validators: {
                    notEmpty: {
                        message: 'El correo es un campo obligatorio'
                    },
                    regexp: {
                    	message : 'Formato de correo incorrecto',
                        regexp : /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$/                 
                    }
                }
            },
            pass: {
        		selector : '#id_reg_pass',
                validators: {
                    notEmpty: {
                        message: 'La contraseña es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'La contraseña es de 5 a 100 caracteres',
                    	min : 8,
                    	max : 100
                    }
                }
            },
            nombres: {
        		selector : '#id_nombres',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            correo: {
        		selector : '#id_correo',
                validators: {
                    notEmpty: {
                        message: 'El correo es un campo obligatorio'
                    },
                    regexp: {
                    	message : 'Formato de correo incorrecto',
                        regexp : /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$/                 
                    }
                }
            },
            pass: {
        		selector : '#id_pass',
                validators: {
                    notEmpty: {
                        message: 'La contraseña es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'La contraseña es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
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