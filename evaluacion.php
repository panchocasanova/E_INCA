<?php
include_once ("/class/class.search.php");
session_start(); 
if(!empty($_SESSION)){
	//var_dump($_SESSION);
	$rut = $_SESSION['userRut'];
	$nombre= $_SESSION['userName'];
	$paterno = $_SESSION['userPaterno'];
	$materno = $_SESSION['userMaterno'];
	$nombre_completo = $nombre ." ".$paterno." ".$materno;
	$evaluaciones = $_SESSION['evaluacionActual'];
	foreach($evaluaciones as $evaluacion){
		//var_dump($evaluacion['NOMBRE_PRUEBA']);
		$idPrueba = $evaluacion['ID'];
		$nombrePrueba = $evaluacion['NOMBRE_PRUEBA'];
		$puntajeMaximo = $evaluacion['PUNTAJE_MAXIMO'];
		$nivelPrueba = $evaluacion['EXIGENCIA'];
		$descPrueba = $evaluacion['DESCRIPCION'];	
	}
	$buscar = new buscador();
	$items = $buscar->items_evaluacion($idPrueba);
	//var_dump($items);
	$instrucciones = $buscar->instruccion_evaluacion($idPrueba);
	//var_dump($instrucciones);	
}else{
	header("Location:index.php");
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
    <title>Instituto de Neurocirugia</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet"> 
	<!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>
  <body>
  <div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">		
			<div class="page-header">
			  <center><img src="img/logo.png" width="100" height="100"></center>
			  <h2 align="center"><?php echo $nombrePrueba?></h2>
			</div>
			<!-- Smart Wizard -->                    
                    <div id="wizard" class="form_wizard wizard_horizontal">
                      <ul class="wizard_steps">
                        <li>
                          <a href="#step-1">
                            <span class="step_no">1</span>
                            <span class="step_descr">
							  Paso 1<br />
							  <small>Instrucciones</small>
						  </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-2">
                            <span class="step_no">2</span>
                            <span class="step_descr">
								  Paso 2<br />
								  <small>Step 2 description</small>
							  </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-3">
                            <span class="step_no">3</span>
                            <span class="step_descr">
							  Paso 3<br />
							  <small>Step 3 description</small>
						  </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-4">
                            <span class="step_no">4</span>
                            <span class="step_descr">
							  Paso 4<br />
							  <small>Step 4 description</small>
							</span>
                          </a>
                        </li>
                      </ul>
                      <div id="step-1">
						<h2 class="StepTitle">Instrucciones</h2>
							<div class="panel panel-default">
							  <div class="panel-body">
								<p align="justify"><?php echo $descPrueba;?></p>
								<p><b>NIVEL DE EXIGENCIA:</b> <?php echo $nivelPrueba; ?>%</p>
								<p><b>PUNTAJE MAXIMO:</b> <?php echo $puntajeMaximo; ?> puntos.</p>				
							  </div>
							</div>
							<div class="panel panel-default">
							  <div class="panel-heading"><b>INSTRUCCIONES</b></div>
							  <div class="panel-body">
								<ul>
								<?php foreach ($instrucciones as $instruccion){?>
									<li><p align="justify"><?php echo $instruccion['DESCRIPCION']; ?></p>				
								<?php } ?>
								</ul>
							  </div>
							</div>
                      </div>
                      <div id="step-2">
                        <h2 class="StepTitle">Step 2 Content</h2>
                        
                      </div>
                      <div id="step-3">
                        <h2 class="StepTitle">Step 3 Content</h2>
                        
                      </div>
                      <div id="step-4">
                        <h2 class="StepTitle">Step 4 Content</h2>
                        
                      </div>
                    </div>
                    <!-- End SmartWizard Content -->		
		</div>
	</div>
  </div>
  <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>	
    <!-- jQuery Smart Wizard -->
    <script src="vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
	<script type="text/javascript">
	  $(document).ready(function() {
		  
	  }); 
	</script>
  </body>
</html>