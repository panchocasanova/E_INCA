<?php 
session_start();
//var_dump($_SESSION);
if(!empty($_SESSION)){
	$nombre = $_SESSION['nombreCompleto'];
	$rut = $_SESSION['rut'];
}else{
	header("Location: administrador.php");
}

if(!empty($_GET)){
	date_default_timezone_set('America/Santiago');
	include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.search.php");
	include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.calcular.php");	
	$rutEvaluado = $_GET['rut'];
	$prueba = $_GET['id'];
	$calcular = new calculo();
	$respuestas = $calcular->puntajeTotal($rutEvaluado, $prueba);
	$erroneas = $_SESSION['erroneas'];
	//var_dump($_SESSION['erroneas']);
	$buscar = new buscador();
	$datosUsuario = $buscar->datosUsuario($rutEvaluado);
	foreach($datosUsuario as $dato){
		$nombreEvaluado = $dato['NOMBRE']." ".$dato['PATERNO']." ".$dato['MATERNO'];
		$cargoEvaluado = $dato['CARGO'];
		$unidadEvaluado = $dato['UNIDAD'];
	}
	$cont = 1;
	$aux=0;
}else{
	header("Location: administrador.php");
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
                      <li><a href="dashboard.php">Pagina Principal</a></li>
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
                <h3>Detalle Evaluaci&oacute;n</h3>
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
                    <h2><?php echo $nombreEvaluado;?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>                      
                      
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      	<div class="panel panel-primary">
						  <div class="panel-heading">
							<h3 class="panel-title">Preguntas erroneas</h3>
						  </div>
						  <div class="panel-body">
							<?php foreach ($erroneas as $error){
									
									$idPregunta = $error["Id"];
									$pregunta = $error["Pregunta"];
									$idCorrecta = $error["idRespuestaCorrecta"];
									$descCorrecta = $error["descRespuestaCorrecta"];
									$idRUser = $error["idRespuestaUser"];
									$userRespuesta = $buscar->detalleRespuesta($idRUser);
									//var_dump($userRespuesta);
									if(isset($error["VOFUser"])) $vofUser = $error["VOFUser"];
									if(isset($error["VOFCorrecta"])) $vofCorrecta = $error["VOFCorrecta"];
									//echo $idPregunta;

									if($idPregunta != $aux){									
										echo  '<p><b>'.$cont.") ".$pregunta.'</b></p>';
										$cont ++;									
									}
									if(isset($error["VOFUser"])){
											echo '<p><b>Pregunta:</b> '.$descCorrecta.'</p>';
											echo '<p class="text-success"><b>Respuesta Correcta:</b> '.$vofCorrecta.'</p>';
											echo '<p class="text-danger"><b>Respuesta usuario:</b> '.$vofUser.'</p>';
									}else{
										echo '<p class="text-success"><b>Respuesta Correcta:</b> '.$descCorrecta.'</p>';
										echo '<p class="text-danger"><b>Respuesta usuario:</b> '.$userRespuesta[0]['RESPUESTA'].'</p>'; 
									}
									
									
									if($idPregunta != $aux){									
										$aux = $idPregunta;
										
									}
									
									echo "<br>";
								}
							?>
							
						  </div>
						</div>
						<input type="button" class ="btn btn-primary" value="Volver pagina anterior" onclick="history.back(-1)" />
						<input type="button" class ="btn btn-default" value="Imprimir" onclick="print()" />
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
    
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
  </body>
</html>
