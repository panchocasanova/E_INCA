<?php 
include $_SERVER["DOCUMENT_ROOT"]."../config/connection.php";
class crud{
	private $db;
	public function crud(){
		$this->db = new conexionPDO();
		$this->db = $this->db->conexionPDO();
	}
	public function agregar_respuesta($pregunta, $respuesta, $rut, $fecha, $valor){
		$statment = $this->db->prepare("SELECT * FROM evaluaciones.usuario_respuesta WHERE RUT = ? AND ID_PREGUNTA = ? ");
		//print_r($statment);
		$statment->bindParam(1, $rut);
		$statment->bindParam(2, $pregunta);
		$statment->execute();
		//print_r($statment->rowCount());
		if($statment->rowCount() > 0){
			//print_r("UPDATE");
			//si existe respuesta anterior, asi que se modifica
			$statment = $this->db->prepare("UPDATE evaluaciones.usuario_respuesta SET ID_RESPUESTA = ?, FECHA = ?, VOF = ? WHERE RUT = ? AND ID_PREGUNTA = ?");
			$statment->bindParam(1, $respuesta);
			$statment->bindParam(2, $fecha);
			$statment->bindParam(3, $valor);
			$statment->bindParam(4, $rut);
			$statment->bindParam(5, $pregunta);
			if($statment->execute()){
				return "OK";
			}else{
				return "ERROR 002";
			}
		}else{
			//print_r("INSERT");
			//no existe respuesta anterior, se debe insertar
			$statment = $this->db->prepare("INSERT INTO evaluaciones.usuario_respuesta (RUT, ID_PREGUNTA, ID_RESPUESTA, VOF, FECHA) VALUES (?,?,?,?,?)");
			$statment->bindParam(1, $rut);
			$statment->bindParam(2, $pregunta);
			$statment->bindParam(3, $respuesta);
			$statment->bindParam(4, $valor);
			$statment->bindParam(5, $fecha);
			if($statment->execute()){
				return "OK";
			}else{
				return "ERROR 001";
			}
		}
	}
}	
?>