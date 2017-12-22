<?php 
//nota 
session_start();
if(!empty($_SESSION) || !isset($_SESSION)){
	//var_dump($_SESSION);
	//var_dump($_SESSION['EstadoPuntaje']);
	//var_dump($_SESSION['erroneas']);
	$respuestasErroneas = $_SESSION['erroneas'];
	$aux = 0;
	foreach($respuestasErroneas as $erronea){
		//echo $erronea;
		if($aux != $erronea['Id']){
			//echo "Valor aux: ".$aux." Valor id:".$erronea['Id'];
			echo $erronea['Id']." ".$erronea['Pregunta']."<br>";	
		}
		$aux = $erronea["Id"];		
	}
	
	$rut = $_SESSION['userRut'];
	$nombre= $_SESSION['userName'];
	$paterno = $_SESSION['userPaterno'];
	$materno = $_SESSION['userMaterno'];
	$nombre_completo = $nombre ." ".$paterno." ".$materno;
	$evaluaciones = $_SESSION['evaluacionActual'];
	$puntajeObtenido = $_SESSION['puntajeObtenido'];
	$notaFinal = $_SESSION['nota'];
	foreach($evaluaciones as $evaluacion){
		$idPrueba = $evaluacion['ID'];
		$nombrePrueba = $evaluacion['NOMBRE_PRUEBA'];
		$puntajeMaximo = $evaluacion['PUNTAJE_MAXIMO'];
		$nivelPrueba = $evaluacion['EXIGENCIA'];
		$descPrueba = $evaluacion['DESCRIPCION'];	
	}
	//session_destroy();
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
	<link rel="shortcut icon" href="img/logo.ico" type="image/x-icon" />
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet"> 
	<!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
	<!-- jQuery -->
    <script src="js/jquery.min.js"></script>	
  </head>
  <body>
  <div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
		<div class="page-header">
		  <center><h1>NOTA FINAL<small></small></h1></center>
		</div>
			<div class="jumbotron">
				<center><img src="img/logo.png" alt="Instituto de Neurociru&iacute;a" width="200" height="200"></center>
			  <table class="table">
				<tr>
					<td>Nombre Evaluaci&oacute;n:</td>
					<td><?php echo $nombrePrueba; ?></td>
				</tr>
				<tr>
					<td>Nombre Evaluado:</td>
					<td><?php echo $nombre_completo;?></td>
				</tr>
				<tr>
					<td>Puntaje Obtenido:</td>
					<td><?php echo $puntajeObtenido;?></td>
				</tr>
				<tr>
					<td>Puntaje M&aacute;ximo:</td>
					<td><?php echo $puntajeMaximo; ?></td>
				</tr>
				<tr>
					<td>Grado de Exigencia:</td>
					<td><?php echo $nivelPrueba;?> %</td>
				</tr>
				<tr>
					<td>Nota Obtenida:</td>
					<td><?php echo number_format($notaFinal,1); ?></td>
				</tr>
			  </table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<button class="btn btn-warning btn-block" onclick="window.print();">Imprimir</button>
			<button class="btn btn-primary btn-block" id="salir">SALIR</button>
		</div>
	</div>	
  </div>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>    
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#salir").click(function(){
				window.location.href="index.php";
			});
		});
		
	</script>	
  </body>
</html>