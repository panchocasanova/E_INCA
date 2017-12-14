<?php
include $_SERVER["DOCUMENT_ROOT"]."/evaluacion/config/connection.php";
class user{
  private $db;
  public function user(){
    $this->db = new conexionPDO();
    $this->db = $this->db->conexionPDO();
  }
  public function login($rut, $pass){
    if(!empty($rut) && !empty($pass)){
      $statment = $this->db->prepare("SELECT * FROM evaluaciones.usuario WHERE RUT = ? AND PASSWORD = ? ;");
      $statment->bindParam(1,$rut);
      $statment->bindParam(2,$pass);
      $statment->execute();
      if($statment->rowCount () == 1){
        //echo "Usuario Verificado";
        $datos = $statment->fetch(PDO::FETCH_ASSOC);
        //var_dump($datos);
        session_start();
        $_SESSION['userName'] = $datos['NOMBRE'];
        $_SESSION['userRut'] = $datos['RUT'];
		$_SESSION['userPaterno'] = $datos['PATERNO'];
		$_SESSION['userMaterno'] = $datos['MATERNO'];
        header("location:seleccion.php");
      }else{
        $mensaje =  "Usuario y/o contraseña Incorrectos";
      }
    }else{
      $mensaje = "Ingrese un Usuario y/o Contraseña";
    }
    return $mensaje;
  }
}
?>