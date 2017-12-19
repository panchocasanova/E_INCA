<?php
include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.search.php");
include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.functions.php");
//include_once ("/class/class.search.php");
//include_once ("/class/class.functions.php");
ini_set("session.cookie_lifetime","7200");
session_start(); 

//var_dump($_SESSION);
if(!empty($_SESSION) || !isset($_SESSION)){
	$_SESSION["time"] = time();
	//var_dump($_SESSION);
	$rut = $_SESSION['userRut'];
	$nombre= $_SESSION['userName'];
	$paterno = $_SESSION['userPaterno'];
	$materno = $_SESSION['userMaterno'];
	$nombre_completo = $nombre ." ".$paterno." ".$materno;
	$evaluaciones = $_SESSION['evaluacionActual'];
	//var_dump($evaluaciones);
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
	if (time() - $_SESSION["time"] >= 7200)  {
		//echo "Se acabo el tiempo";
		//lo enviamos a la nota que obtuvo por tiempo, segun lo respondido.	
		header("Location:nota.php");
	}
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
	<!--Moment-->
	<script src="vendors/moment/moment.js"></script>
	
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
						<h2 class="StepTitle">INSTRUCCIONES</h2>
							<div class="panel panel-default">
							  <div class="panel-body">
								<p align="justify"><?php echo $descPrueba;?></p>
								<p><b>NIVEL DE EXIGENCIA:</b> <?php echo $nivelPrueba; ?>%</p>
								<p><b>PUNTAJE MAXIMO:</b> <?php echo $puntajeMaximo; ?> puntos.</p>				
							  </div>
							</div>
							<div class="panel panel-success">
							  <div class="panel-heading"><b>INSTRUCCIONES</b></div>
							  <div class="panel-body">
								<ul>
								<?php 
								if($instrucciones <> 0){
								foreach ($instrucciones as $instruccion){?>
									<li><p align="justify"><?php echo $instruccion['DESCRIPCION']; ?></p>				
								<?php } 
								} ?>
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
									$preguntas = $buscar->preguntas_evaluacion($idPrueba, $item['ID']);
									//var_dump($preguntas);
									if($preguntas <> 0 ){
										$a=0;
										foreach ($preguntas as $pregunta){											
											$z=1;
											$a++;
											$id_pregunta = $pregunta['ID'];
											echo '<div class="panel panel-info">
													  <div class="panel-heading"><h4>'.$a.". ".$pregunta['PREGUNTA'].'</h4></div>
													  <div class="panel-body">';
													 $alternativas = $buscar->alternativas_pregunta($id_pregunta);
													 //var_dump($alternativas);
													 
													if($alternativas <> 0){
														echo "<ul class='list-group'>";
															foreach ($alternativas as $alternativa){
																echo "<li class='list-group-item'> <span class='label label-primary'>".integerToRoman($z)."</span> ".$alternativa['DESC_ALTERNATIVA']."</li>";
																$z++;
															}
														echo "</ul>";
													}
													if($pregunta['VOF'] <> 1){
														echo "<p><strong>Seleccione su respuesta:</strong></p>";
														$respuestas1 = $buscar->respuestas_pregunta($id_pregunta);
														//var_dump($respuestas);
														$b=1;
														if($respuestas1 <> 0){
															echo "<ol type='A'>";
															foreach($respuestas1 as $respuesta){
																//var_dump($respuesta);															
																	?>																
																		<li><label class="radio-inline"><input type="radio" name="resp_<?php echo $id_pregunta; ?>" value="<?php echo $respuesta['ID_RESPUESTA'];?>"><?php echo $respuesta['RESPUESTA']?></label></li>
																	<?php
																	$b++;															
															}
															echo "</ol>";
														}
													}else {
														echo "<p><strong>Seleccione su respuesta:</strong></p>";
														$respuestas2 = $buscar->respuestas_pregunta($id_pregunta);
														//var_dump($respuestas);
														$b=1;
														if($respuestas2 <> 0){														
															foreach($respuestas2 as $respuesta){
																//var_dump($respuesta);															
																	?>																
																	<div class="row">
																	  <div class="col-xs-12 col-sm-6 col-md-8"><?php echo $b.". ".$respuesta['RESPUESTA'];?></div>
																	  <div class="col-xs-6 col-md-4">
																		<select class="form-control" name="resp_<?php echo $respuesta['ID_RESPUESTA']; ?>" id="resp_<?php echo $respuesta['ID_RESPUESTA']; ?>">
																		  <option value="0">&nbsp;</option>
																		  <option value="V">SI</option>
																		  <option value ="F">NO</option>
																		  
																		</select>
																	  </div>
																	</div><br>
																	<?php
																	$b++;															
															}
														}
														
													}	
													
											echo '		  </div>
													</div>';							
																																	
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
<!-- Modal Termino evaluacion-->
<div class="modal fade" tabindex="-1" role="dialog" id="fin">
  <div class="modal-dialog" role="document">
    <div class="modal-content alert alert-info">
      <div class="modal-header">        
        <h4 class="modal-title">Finalizar Evaluaci&oacute;n</h4>
      </div>
      <div class="modal-body">
        <p>Estimado(a) <?php echo $nombre_completo; ?>, ¿Está seguro(a) que desea finalizar esta evaluación?. </p>
		<p>Le recordamos que no podrá acceder a esta secci&oacute;n nuevamente.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal" >Me arrenpent&iacute;, revisaré antes.</button>
        <button type="button" class="btn btn-primary" id="btnFinalizar">Sí, estoy seguro(a).</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal Termino evaluacion--> 
<!-- Modal poco tiempo-->
<div class="modal fade" tabindex="-1" role="dialog" id="avisoFin20">
  <div class="modal-dialog" role="document">
    <div class="modal-content alert alert-danger">
      <div class="modal-header">        
        <h4 class="modal-title">Falta poco tiempo</h4>
      </div>
      <div class="modal-body">
        <p>Estimado(a) <?php echo $nombre_completo; ?>, le quedan 20 minutos para finalizar la evaluaci&oacute;n</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal" >Ok, no me ponga nervioso.</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal poco tiempo--> 
<!-- Modal poco tiempo-->
<div class="modal fade" tabindex="-1" role="dialog" id="avisoFin5">
  <div class="modal-dialog" role="document">
    <div class="modal-content alert alert-danger">
      <div class="modal-header">        
        <h4 class="modal-title">Falta poco tiempo</h4>
      </div>
      <div class="modal-body">
        <p>Estimado(a) <?php echo $nombre_completo; ?>, le quedan 5 minutos para finalizar la evaluaci&oacute;n</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal" >Ok, no me ponga nervioso.</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal poco tiempo-->  

    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>    
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			<?php
			//var_dump($items);
			foreach ($items as $item){
				//var_dump($preguntas);		
				$preguntas = $buscar->preguntas_evaluacion($idPrueba, $item['ID']);
				foreach ($preguntas as $pregunta){
					$id_pregunta = $pregunta['ID'];
					if($pregunta['VOF'] <> 1){
						$respuestas1 = $buscar->respuestas_pregunta($id_pregunta);
						//echo $respuesta1;
						if(!isset($respuestas1) || $respuestas1 <> 0){						
						//var_dump($respuestas1);
						?> $("input[name='resp_<?php echo $id_pregunta; ?>']").change(function(){
								var date = new Date();
								var now = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
								//console.log($("input[name='resp_<?php echo $id_pregunta; ?>']:checked").val());
								var idr = $("input[name='resp_<?php echo $id_pregunta; ?>']:checked").val();
								$.post("switch.php",{
									Action:"AP",
									IdP: <?php echo $id_pregunta; ?>,
									Rut: '<?php echo $rut; ?>',
									Idr: idr,
									Date: now
									}, function(data){
									  console.log(data);
								});
							}); <?php	
						}
							
					}else{
						$respuestas2 = $buscar->respuestas_pregunta($id_pregunta);
						//print_r($respuestas2);
						if(!isset($respuestas2) || $respuestas2 <> 0){
							foreach($respuestas2 as $respuesta){
							?> 
								$("select[name=resp_<?php echo $respuesta['ID_RESPUESTA']; ?>]").change(function(){
									//console.log("ID RESPUESTA: "+ "<?php echo $respuesta['ID_RESPUESTA']; ?>"+" valor:"+ $('select[name=resp_<?php echo $respuesta['ID_RESPUESTA']; ?>]').val());
									var idr = <?php echo $respuesta['ID_RESPUESTA']; ?>;
									var vr = $('select[name=resp_<?php echo $respuesta['ID_RESPUESTA']; ?>]').val();
									var date = new Date();
									var now = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
									if($('select[name=resp_<?php echo $respuesta['ID_RESPUESTA']; ?>]').val() != 0){
										$.post("switch.php",{
											Action:"VFP",
											IdP: <?php echo $id_pregunta; ?>,
											Rut: '<?php echo $rut; ?>',
											Idr: idr,
											Date: now,
											Vr: vr
											}, function(data){
											  console.log(data);
										});
									}
								});  
								
								<?php
							}
						}		
					}	
				}							
			}?>
			//  Wizard 
			$('#wizard').smartWizard({
				transitionEffect:'slide',
				onFinish:onFinishCallback
			});
			function onFinishCallback(){
				//alert('Finalizar evaluacion');
				$("#fin").modal({
				  backdrop:'static',
				  keyboard: false
				});
			}
					
			
			$(".buttonNext").dblclick(function(event){
				event.preventDefault();
			});
			$(".buttonPrevious").dblclick(function(event){
				event.preventDefault();
			});
			var timeNext1 = 0;
			var date = new Date();
			var nowInicio;
			var horaInicio;
			$(".buttonNext").click(function(){
				if(timeNext1 == 0){
									
					horaInicio = moment(date.getHours()+":"+date.getMinutes(),'HH:mm');
					
					nowInicio = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
					$.post("switch.php",{
						Action: "TIEMPOINICIO",
						Rut: '<?php echo $rut; ?>',
						IdP: <?php echo $idPrueba;?>,
						Hora: nowInicio						
						}, function(data){
						  if(data != 'OK'){
							  console.log(data);
						  }else{
							  timeNext1 = 1;
						  }					  
					});
				}
				
				$('html, body').animate({scrollTop:0}, 500);
				//return false;
			});
			$(".buttonPrevious").click(function(){
				$('html, body').animate({scrollTop:0}, 500);
				return false;
			});
			var nowFin;
			$("#btnFinalizar").click(function(){				
				nowFin = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
				//guardar puntaje.
				//console.log(now);
				$.post("switch.php",{
					Action: "FINALIZAR",
					Rut: '<?php echo $rut; ?>',
					IdP: <?php echo $idPrueba;?>,
					Hora: nowFin,
					Pmax: <?php echo $puntajeMaximo;?>,
					Nexi: <?php echo $nivelPrueba;?>
					}, function(data){
					  //console.log(data);
					  if(data == 'OK'){
						  window.location.href = "nota.php";
					  }		  
				});				
			});
			
			
				setInterval(function(){
					if(timeNext1 == 1){
						var fecha = new Date();	
						var ahora = moment(fecha.getHours()+":"+fecha.getMinutes(),'HH:mm');
						var diff = 	moment.duration(ahora - horaInicio).minutes();
						console.log(diff);
						// cuando falten 20 minutos para el termino de la evaluacion, le mandamos una alerta. 
						if(diff == 100){
							$("#avisoFin20").modal({
							  backdrop:'static',
							  keyboard: false
							});
						}
						// cuando falten 5 minutos para el termino de la evaluacion, le mandamos una alerta.
						if(diff == 115){
							$("#avisoFin5").modal({
							  backdrop:'static',
							  keyboard: false
							});
						}
						
						
						if(diff == 120){
							$.post("switch.php",{
								Action: "FINALIZAR",
								Rut: '<?php echo $rut; ?>',
								IdP: <?php echo $idPrueba;?>,
								Hora: nowFin,
								Pmax: <?php echo $puntajeMaximo;?>,
								Nexi: <?php echo $nivelPrueba;?>
								}, function(data){
								  //console.log(data);
								  if(data == 'OK'){
									  window.location.href = "nota.php";
								  }		  
							});
						}	
												
					}
				}, 3000); // 5 minutos
				


		});
	</script>
  </body>
</html>