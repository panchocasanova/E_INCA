<?php 
include('config.php');
class conexionPDO{
  protected $conexion;
  public function conexionPDO(){
    try{
      $this->conexion = new PDO('mysql:host='.DB_HOST.'; dbname='.DB_NAME.'',DB_USER,DB_PASS);
      $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $this->conexion->exec("SET CHARACTER SET utf8");
      return $this->conexion;
    }catch(Exception $e){
      echo "La Linea de Error es : ". $e->getLine();
    }
  }
}

?>