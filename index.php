<?php include_once ("/class/class.user.php");
//include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.user.php")
session_start();
session_destroy();
if(isset($_POST['ingresar'])){
  $rut = $_POST['rut'];
  $password = $_POST['password'];
  $obj = new user();
  $respuesta = $obj->login($rut,$password);
  //echo $respuesta;
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
	<link rel="shortcut icon" href="/img/logo.ico" type="image/x-icon" />

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">    
  </head>
  <body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				  <center>
					<img src="img/logo.png" alt="Instituto de Neurociru&iacute;a" width="250" height="250">
					<h1><small>Acceso a plataforma de evaluaci&oacute;n</small></h1>
				  </center>				
			</div>
			  <div class="col-md-4 col-md-offset-4">
				<form name="login_form" method="POST" id="login_form_id">
				  
				  <div>
					<input type="text" class="form-control soloRut" placeholder="Rut" required="" name="rut" />
				  </div><br>
				  <div>
					<input type="password" class="form-control" placeholder="Password" required="" name="password" />
				  </div><br>
				  <div>
					<button type="submit" id="ingresarlogin" name="ingresar" class="btn btn-success btn-block">
						<i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp; Acceder a evaluaci&oacute;n
					</button>
				  </div>         
				</form>
			  </div>			 
		</div>
		<br>
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<?php if(isset($respuesta)){ ?>
					<div id="alerta-login" class="alert alert-danger" role="alert"><center><?php echo $respuesta; ?></center></div>
				<?php } ?>
			</div>
		</div>
	</div>  
	<!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	  $(document).ready(function() {		
		$('.soloRut').keyup(function (){
		 this.value = (this.value + '').replace(/[^0-9Kk]/g, '');
	   });
	   
		<?php if(isset($respuesta)){ ?>
		   setTimeout(function() {
				$("#alerta-login").fadeOut(1500);
			},1000);
		<?php } ?>
	  });
	</script>
  </body>
</html>