<?php 
session_start();
//var_dump($_SESSION);
if(!empty($_SESSION)){
	$nombre = $_SESSION['nombreCompleto'];
	$rut = $_SESSION['rut'];
}else{
	header("Location: administrador.php");
}
if(!isset($_GET['idp'])){
	header("Location: administrador.php");
}else{
	include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.search.php");
	include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.functions.php");
	$idPrueba = base64_decode($_GET['idp']);
	$buscar = new buscador();
	$datosPrueba = $buscar->evaluacion_seleccionada($idPrueba);
	$eTerminadas = $buscar->evaluacionesTerminadas($idPrueba);
	$faltantes = $buscar->alumnosFaltantes($idPrueba);
	$totalUsuarios = $buscar->userAll($idPrueba);
	$instrucciones = $buscar->instruccion_evaluacion($idPrueba);
	$listadoTerminadas = $buscar->listadoTerminadas($idPrueba);
	//var_dump($listadoTerminadas);
	if($datosPrueba == 0){
		header("Location: administrador.php");
	}else{
		//var_dump($datosPrueba);
		foreach($datosPrueba as $dato){
			$nombrePrueba = $dato['NOMBRE_PRUEBA'];
			$exigenciaPrueba = $dato['EXIGENCIA'];
			$puntajePrueba = $dato['PUNTAJE_MAXIMO'];
			$fechaInicio = $dato['FECHA_INICIO'];
			$fechaTermino = $dato['FECHA_TERMINO'];
			$diaInicio = date("d", strtotime($fechaInicio));
			$mesInicio = date("m", strtotime($fechaInicio));
			$diaTermino = date("d", strtotime($fechaTermino));
			$mesTermino = date("m", strtotime($fechaTermino));
			$descripcion = $dato['DESCRIPCION'];
			//var_dump($diaInicio);
		}
	}
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Instituto de Neurocirugía</title>
	<link rel="shortcut icon" href="img/logo.ico" type="image/x-icon" />
    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
	<!-- Datatables -->
    <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="administrador.php" class="site_title" alt="Volver al Inicio"><span>Administrador</span></a>
            </div>
            <div class="clearfix"></div>
            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="img/user.png" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Bienvenido,</span>
                <h2><?php echo $nombre; ?></h2>
              </div>
              <div class="clearfix"></div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>Menú General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Inicio <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="dashboard.php">P&aacute;gina Principal</a></li>
                      <!--<li><a href="index2.html">Dashboard2</a></li>-->
                      <!--<li><a href="index3.html">Dashboard3</a></li>-->
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">              
              <a data-toggle="tooltip" data-placement="top" title="Salir" href="administrador.php">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="img/user.png" alt=""><?php echo $nombre; ?>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">                    
                    <li><a href="administrador.php"><i class="fa fa-sign-out pull-right"></i> Salir</a></li>
                  </ul>
                </li>                
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Estadisticas de evaluac&oacute;n</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
				<!--
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
				  -->
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">            
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo $nombrePrueba; ?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>                     
                      
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <p align="justify"><strong>DESCRIPCI&Oacute;N</strong></p>
					  <p align="justify"><?php echo $descripcion; ?></p>
					  <p align="justify"><strong>INSTRUCCIONES</strong></p>
					  <p align="justify">
						<ul>
						  <?php foreach($instrucciones as $instruccion){?>
								<li><?php echo $instruccion['DESCRIPCION'];?></li>							
						  <?php } ?>
						</ul>  
					  </p>
					  					
                  </div>
                </div>
              </div>			  
            </div>
			<div class="row">
				<div class="col-md-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Estadisticas alumnos <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>                      
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
						<ul class="list-unstyled top_profiles scroll-view">
                          <li class="media event">
                            <a class="pull-left border-aero profile_thumb">
                              <i class="fa fa-user aero"></i>
                            </a>
                            <div class="media-body">
                              <a class="title" href="#">Total de Alumnos</a>
                              <p><strong><?php echo $totalUsuarios['CANTIDAD'];?> </strong> Usuarios Habilitados </p>
                              <p> <small>Cantidad de alumnos que estan registrados y habilitados para dar esta evaluaci&oacute;n.</small>
                              </p>
                            </div>
                          </li>
                          <li class="media event">
                            <a class="pull-left border-green profile_thumb">
                              <i class="fa fa-user green"></i>
                            </a>
                            <div class="media-body">
                              <a class="title" href="#">Evaluaciones Terminadas</a>
                              <p><strong><?php echo $eTerminadas["CANTIDAD"]; ?></strong> Usuarios. </p>
                              <p> <small>Indica los usuarios que ya tienen una calificaci&oacute;n.</small>
                              </p>
                            </div>
                          </li>
                          <li class="media event">
                            <a class="pull-left border-blue profile_thumb">
                              <i class="fa fa-user blue"></i>
                            </a>
                            <div class="media-body">
                              <a class="title" href="#">Evaluaciones Faltantes</a>
                              <p><strong><?php echo $faltantes['CANTIDAD'];?> </strong> Usuarios </p>
                              <p> <small>Indica la cantidad de alumnos que no han rendido la evaluaci&oacute;n.</small>
                              </p>
                            </div>
                          </li>						  
                        </ul>
				  </div>
                </div>
              </div>      
				  
				<div class="col-md-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Estadisticas Evaluaci&oacute;n <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>                      
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <article class="media event">
                      <a class="pull-left date ">
                        <p class="month"><?php echo meses($mesInicio);?></p>
                        <p class="day "><?php echo $diaInicio; ?></p>
                      </a>
                      <div class="media-body">
                        <a class="title" href="#">Fecha de Inicio</a>
                        <p>Desde esta fecha, estará habilitada la evaluación.</p>
                      </div>
                    </article>
                    <article class="media event">
                      <a class="pull-left date">
                        <p class="month"><?php echo meses($mesTermino);?></p>
                        <p class="day"><?php echo $diaTermino; ?></p>
                      </a>
                      <div class="media-body">
                        <a class="title" href="#">Fecha de Termino</a>
                        <p>Despues de esta fecha, el usuario no podrá ver la evaluacion.</p>
                      </div>
                    </article>
					<article class="media event">
                      <a class="pull-left date">
                        <p class="month">%</p>
                        <p class="day "><?php echo $exigenciaPrueba; ?></p>
                      </a>
                      <div class="media-body">
                        <a class="title" href="#">Exigencia</a>
                        <p>Grado de exigencia incorporado en la evaluaci&oacute;n.</p>
                      </div>
                    </article>
                    <article class="media event">
                      <a class="pull-left date">
                        <p class="month">MAX</p>
                        <p class="day"><?php echo $puntajePrueba; ?></p>
                      </a>
                      <div class="media-body">
                        <a class="title" href="#">Puntaje Maximo</a>
                        <p>Suma total de todos los items de la evaluaci&oacute;n</p>
                      </div>
                    </article>
                    
					  </div>
					</div>
				  </div>				  
			</div>
			<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Listado total de Alumnos</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <p align="justify">escribir aca </p>
                  </div>
                </div>
              </div>
            </div>
			<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Listado Evaluaciones Terminadas</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <p align="justify">escribir aca </p>
					  <table id="terminadas" class="table table-striped table-bordered">
						<thead>
                        <tr>
                          <th>Rut</th>
                          <th>Nombre</th>
                          <th>Cargo</th>
                          <th>Inicio</th>
                          <th>Termino</th>
                          <th>Puntaje</th>
						  <th>Nota Final</th>
                        </tr>
                      </thead>
					  <tbody>
							<?php foreach($listadoTerminadas as $listado){ ?>
								<tr>
									<td><?php echo $listado['RUT'];?></td>
									<td><?php echo $listado['NOMBRE']." ".$listado['PATERNO']." ".$listado['MATERNO'];?></td>
									<td><?php echo $listado['CARGO'];?></td>
									<td><?php echo $listado['FECHA_INICIO'];?></td>
									<td><?php echo $listado['FECHA_TERMINO'];?></td>
									<td><?php echo $listado['PUNTAJE'];?></td>
									<td><?php echo number_format($listado['NOTA'],1);?></td>
								</tr>
							<?php } ?>
					  </tbody>
					  </table>
                  </div>
                </div>
              </div>
            </div>
			<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Listado Evaluaciones Faltantes</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <p align="justify">escribir aca </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Instituto de Neurocirugía Dr. Alfonso Asenjo.
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/nprogress/nprogress.js"></script>
    <!-- Datatables -->
    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/pdfmake/build/vfs_fonts.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#terminadas').dataTable( {
				"language": {
					"url": "vendors/datatables.net/js/datatables.spanish.lang"
				}
			} );
			
		} );
	</script>
  </body>
</html>
