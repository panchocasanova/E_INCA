<?php 
//administrador
session_start();
session_destroy();
include_once ($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.user.php");
if(isset($_POST['login'])){	
	if(!empty($_POST['id']) && !empty($_POST['pass'])){
		$usuario = new user();
		$login = $usuario->login_admin($_POST['id'], $_POST['pass']);
		//var_dump($login);
		if($login <> 0){
			session_start();
			foreach($login as $dato){
				$rut = $dato['RUT'];
				$nombre = $dato['NOMBRE'];
				$paterno = $dato['PATERNO'];
				$materno = $dato['MATERNO'];
				$nombre_completo = $nombre." ".$paterno." ".$materno;
				$_SESSION['nombreCompleto'] = $nombre_completo;
				$_SESSION['rut'] = $rut;				
			}
			header("Location:dashboard.php");
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
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">
	<link rel="shortcut icon" href="img/logo.ico" type="image/x-icon" />
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>
      <div class="login_wrapper">
        <div class="animate form login_form">
			<center><img src="img/logo.png" width="150" height="150"></center>
          <section class="login_content">			
            <form name="logAdmin" method="POST">				
              <h4>INGRESO ADMINISTRADOR</h4>			  
              <div>
                <input type="text" class="form-control " placeholder="Username" required="" name="id">
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" name="pass">
              </div>
              <div>
				<button type="submit" class="btn btn-primary" name="login">INGRESAR</button>                
                <!--<a class="reset_pass" href="#">Lost your password?</a>-->
              </div>

              <div class="clearfix"></div>
              <div class="separator">
                <div>                  
                  <p>©<?php echo date("Y");?> Todos los Derechos Reservados. </p>
				  <p>Instituto de Neurocirug&iacute;a Dr. Alfonso Asenjo.</p>
                </div>
              </div>
            </form>
          </section>
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
