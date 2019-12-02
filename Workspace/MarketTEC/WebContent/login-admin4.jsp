<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  
  <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

  <title>Admin - MarkeTEC | Usuarios</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
    
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i
            class="fas fa-th-large"></i></a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Admin - MarkeTEC</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${user.getNombres()}</a>
        </div>
      </div>
      
      <form id="form_head_index" action="producto" class="header_search_form clearfix" method="post">
			<input type="hidden" name="metodo" value="pindex">
		</form>
      
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="images/home-white.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="javascript:$('#form_head_index').submit();" class="d-block">Ver Página</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Mantenimiento
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./login-admin.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Perfil</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./login-admin2.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Usuarios</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./login-admin3.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Productos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./login-admin4.jsp" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pedido</p>
                </a>
              </li>
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  
  <br>
  
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
  

</div>
  
  
  	<br>
  	
      
     <!-- AQUI --> 
      

  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.0.0-rc.1
    </div>
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="dist/js/demo.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="plugins/raphael/raphael.min.js"></script>
<script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="plugins/jquery-mapael/maps/world_countries.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>

<!-- PAGE SCRIPTS -->
<script src="dist/js/pages/dashboard2.js"></script>


<!-- Scripts del crud -->
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
