<?php
include_once ("/class/class.search.php"); 
session_start();
if(empty($_SESSION)){
	header("Location:index.php");
}
$rut = $_SESSION['userRut'];
$nombre= $_SESSION['userName'];
$paterno = $_SESSION['userPaterno'];
$materno = $_SESSION['userMaterno'];
$nombre_completo = $nombre ." ".$paterno." ".$materno;
$buscar = new buscador();
$evaluaciones = $buscar->evaluaciones_asociadas($rut);
$contador =1;

if(isset($_POST['comenzar_ev_name'])){
	if(isset($_POST['evaluaciones_name']) && $_POST['evaluaciones_name'] != 0){
		//$_POST['evaluaciones_name'] Devuelve el ID de la evaluacion
		$seleccion = $_POST['evaluaciones_name'];
		$eSeleccionada = $buscar->evaluacion_seleccionada($seleccion);
		if($eSeleccionada <> 0){
			header("Location: evaluacion.php");
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
    <title>Instituto de Neurocirugia</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">    
  </head>
  <body>
  <div class="container">
	<div class="row">
		<div class="page-header">
		  <h2>Bienvenido(a) <small><?php echo $nombre_completo; ?></small></h2>
		</div>
		<div class="col-md-8 col-md-offset-2">
			<div class="jumbotron">			  
			  <p align="justify">Le damos la cordial bienvenida a la plataforma de evaluacion de profesionales, porfavor, seleccione la evaluacion que desea completar, recuerde seguir las instrucciones.</p>			  
			</div>
		</div>
		<br>
		<div class="col-md-8 col-md-offset-2">
			<form method="POST" id="form_seleccion_id" name="form_seleccion_name">
				<label for="sel1">Selecciones evaluaci&oacute;n</label>
				<select class="form-control" id="evaluaciones_id" name="evaluaciones_name">
					<option value="0">&nbsp;</option>
					<?php foreach($evaluaciones as $evaluacion){?>
						<option value="<?php echo $contador?>"><?php echo $evaluacion['NOMBRE_PRUEBA']; ?></option>
					<?php $contador ++; } ?>
				</select>
				<br>
				<div class="col-md-6">
					<button type="submit" id="comenzar_ev_id" name="comenzar_ev_name" class="btn btn-primary btn-block">
						<i class="fa fa-check" aria-hidden="true"></i>&nbsp;&nbsp; Comenzar Evaluaci&oacute;n
					</button>					
				</div>
				<div class="col-md-6">
					<button class="btn btn-danger btn-block">
						<i class="fa fa-times" aria-hidden="true"></i>&nbsp;&nbsp; Salir
					</button>
				</div>		
			</form>
		</div>
	</div>
  </div>
  <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>