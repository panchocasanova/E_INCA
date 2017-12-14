<?php
include_once ("/class/class.search.php"); 
//include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.search.php"); 
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
//var_dump($evaluaciones);
if(isset($_POST['comenzar_ev_name'])){
	if(isset($_POST['evaluaciones_name']) && $_POST['evaluaciones_name'] != 0){
		//$_POST['evaluaciones_name'] Devuelve el ID de la evaluacion
		$seleccion = $_POST['evaluaciones_name'];
		$eSeleccionada = $buscar->evaluacion_seleccionada($seleccion);
		//var_dump($eSeleccionada);
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
<!-- jQuery -->
    <script src="js/jquery.min.js"></script>    
  </head>
  <body>
  
  <div class="container">
	<div class="row">
	<?php if($evaluaciones !=0){?>
		<div class="page-header">
		  <h2>Bienvenido(a) <small><?php echo $nombre_completo; ?></small></h2>
		</div>
		<div class="col-md-8 col-md-offset-2">
			<div class="jumbotron">			  
			  <p align="justify">Le damos la cordial bienvenida a la plataforma de evaluacion de profesionales. Porfavor, seleccione la evaluaci&oacute;n que desea completar, recuerde seguir las instrucciones.</p>			  
			</div>
		</div>
		<br>
		<div class="col-md-8 col-md-offset-2">
			<form method="POST" id="form_seleccion_id" name="form_seleccion_name">
				<label for="sel1">Selecciones evaluaci&oacute;n</label>
				<select class="form-control" id="evaluaciones_id" name="evaluaciones_name">
					<option value="0">&nbsp;</option>
					<?php foreach($evaluaciones as $evaluacion){ 
							foreach($evaluacion as $eva){
					?>
							
						<option value="<?php echo $eva['ID']; ?>"><?php echo $eva['NOMBRE_PRUEBA']; ?></option>
					<?php } } ?>
				</select>
				<br>
				<div class="col-md-6">
					<button type="submit" id="comenzar_ev_id" name="comenzar_ev_name" class="btn btn-primary btn-block">
						<i class="fa fa-check" aria-hidden="true"></i>&nbsp;&nbsp; Comenzar Evaluaci&oacute;n
					</button>					
				</div>
				<div class="col-md-6">
					
					<a href="index.php" class="btn btn-danger btn-block" id="salir">
						<i class="fa fa-times" aria-hidden="true"></i>&nbsp;&nbsp; Salir
					</a>	
					
				</div>		
			</form>
		</div>
		<?php } else{ ?>
  
	 <div class="modal fade" tabindex="-1" role="dialog" id="aviso">
	  <div class="modal-dialog  " role="document">
		<div class="modal-content">
		  <div class="modal-header">
			
			<h4 class="modal-title">Aviso</h4>
		  </div>
		  <div class="modal-body">
			<center><img src="img/logo.png" alt="Instituto de Neurociru&iacute;a" width="250" height="250"></center>
			<p>En estos momentos no existen evaluaciones pendientes para usted, Si usted esta seguro que tiene pendiente una evaluacion, favor comuniquese con el encargado.</p>
			
		  </div>
		  <div class="modal-footer">
			
			<button type="button btn-block" class="btn btn-primary" id="salir">Salir</button>
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal --> 
	  
  <?php }?> 
	</div>
  </div>
  
 
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			<?php if($evaluaciones ==0){?>
				$("#aviso").modal({
				  backdrop:'static',
				  keyboard: false
				});
				$("#salir").click(function(){
					window.location.href = "index.php";	
				});
			<?php } ?>

		});
		
	</script>	
  </body>
</html>