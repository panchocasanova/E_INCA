<?php
include_once ("/class/class.search.php");
include_once ("/class/class.functions.php");
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
	$x=2;
	$y=2;
	//echo integerToRoman(2910);
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
	<!-- jQuery -->
    <script src="js/jquery.min.js"></script>
	<!-- jQuery Smart Wizard -->
    <script src="vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
	<script type="text/javascript">
    $(document).ready(function(){    	
    	//  Wizard 
		$('#wizard').smartWizard({
			transitionEffect:'slide',
			onFinish:onFinishCallback
		});
	  
		function onFinishCallback(){
			alert('Finalizar evaluacion');
		}		
		
		$(".buttonNext").dblclick(function(event){
			event.preventDefault();
		});
		$(".buttonPrevious").dblclick(function(event){
			event.preventDefault();
		});
		
	});
</script>
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
							  <small>INSTRUCCIONES</small>
						  </span>
                          </a>
                        </li>
						
						<?php foreach ($items as $item){  
							$titulo_item = explode(".", $item['DESC_ITEM']);
						?>
						
							<li>
							  <a href="#step-<?php echo $x;?>">
								<span class="step_no"><?php echo $x; ?></span>
								<span class="step_descr">
									  Paso <?php echo $x; ?><br />
									  <small><?php echo $titulo_item[0]; ?></small>
								  </span>
							  </a>
							</li>
													
						<?php $x++; } ?>
                                               
                      </ul>
                      <div id="step-1">
						<h2 class="StepTitle">INSTRUCICONES</h2>
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
					  
					  <?php foreach ($items as $item){  
							$titulo_item = explode(".", $item['DESC_ITEM']);
						?>
						<div id="step-<?php echo $y; ?>">
							<h2 class="StepTitle"><?php echo $titulo_item[0]; ?></h2>
							<div class="panel panel-primary">
							  <div class="panel-heading">
								<h3 class="panel-title"><?php echo $titulo_item[1]; ?></h3>
							  </div>
							  <div class="panel-body">
								<?php 
									$preguntas = $buscar->preguntas_evaluacion($idPrueba, $y-1);
									//var_dump($preguntas);
									if($preguntas <> 0 ){
										foreach ($preguntas as $pregunta){
											$z=1;
											$id_pregunta = $pregunta['ID'];
											echo '<div class="panel panel-info">
													  <div class="panel-heading"><h4>'.$pregunta['ID'].". ".$pregunta['PREGUNTA'].'</h4></div>
													  <div class="panel-body">';
													 $alternativas = $buscar->alternativas_pregunta($id_pregunta); 
													if($alternativas <> 0){
														echo "<ul class='list-group'>";
															foreach ($alternativas as $alternativa){
																echo "<li class='list-group-item'> <span class='label label-primary'>".integerToRoman($z)."</span> ".$alternativa['DESC_ALTERNATIVA']."</li>";
																$z++;
															}
														echo "</ul>";
													}
													echo "<p>Seleccione su respuesta:</p>";
													$respuestas = $buscar->respuestas_pregunta($id_pregunta);
													//var_dump($respuestas);
													$b=1;
													if($respuestas <> 0){
														foreach($respuestas as $respuesta){
															?>
															<ul>
																<li type="circle"><input type="radio" name="<?php echo $id_pregunta; ?>" value="<?php echo $respuesta['ID_RESPUESTA'];?>"><?php echo $respuesta['RESPUESTA']?></li>
															</ul>
															<?php
															$b++;
														}
													}
													
											echo '		  </div>
													</div>';								
											
											//echo "<p>".$pregunta['ID'].". ".$pregunta['PREGUNTA']."</p><br>";											
											//var_dump($alternativas);											
										}
									}	
								?>
							  </div>
							</div>	
						</div>
					  <?php $y++; } ?>                 
                                          
                    </div>
                    <!-- End SmartWizard Content -->		
		</div>
	</div>
  </div>  
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>    
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>	
  </body>
</html>