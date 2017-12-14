<?php 

class crud{
	private $db;
	public function crud(){
		$this->db = new conexionPDO();
		$this->db = $this->db->conexionPDO();
	}
	public function agregar_respuesta($pregunta, $respuesta, $rut, $fecha, $valor){
		if($valor == null || $valor == ''){
			$statment = $this->db->prepare("SELECT * FROM evaluaciones.usuario_respuesta WHERE RUT = ? AND ID_PREGUNTA = ? ");
			$statment->bindParam(1, $rut);
			$statment->bindParam(2, $pregunta);
			$statment->execute();
		}else{
			$statment = $this->db->prepare("SELECT * FROM evaluaciones.usuario_respuesta WHERE RUT = ? AND ID_PREGUNTA = ? AND ID_RESPUESTA = ?");
			//var_dump("entro");
			$statment->bindParam(1, $rut);
			$statment->bindParam(2, $pregunta);
			$statment->bindParam(3, $respuesta);
			$statment->execute();			
		}	
		
		if($statment->rowCount() > 0){
			//print_r("UPDATE");
			//si existe respuesta anterior, asi que se modifica
			if($valor == null || $valor == ''){
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
				$statment = $this->db->prepare("UPDATE evaluaciones.usuario_respuesta SET FECHA = ?, VOF = ? WHERE RUT = ? AND ID_PREGUNTA = ? AND ID_RESPUESTA = ?");				
				$statment->bindParam(1, $fecha);
				$statment->bindParam(2, $valor);
				$statment->bindParam(3, $rut);
				$statment->bindParam(4, $pregunta);
				$statment->bindParam(5, $respuesta);
				if($statment->execute()){
					return "OK";
				}else{
					return "ERROR 002";
				}
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
	public function updatePuntaje($rut, $idPrueba, $puntaje, $horaTermino, $nota){
		if($puntaje == null || $puntaje == '') $puntaje = 0;
		$statment = $this->db->prepare("UPDATE evaluaciones.usuario_prueba SET PUNTAJE = ?, FECHA_TERMINO = ?, NOTA = ? WHERE RUT = ? AND ID_PRUEBA = ?");
		$statment->bindParam(1, $puntaje);
		$statment->bindParam(2, $horaTermino);
		$statment->bindParam(3, $nota);
		$statment->bindParam(4, $rut);
		$statment->bindParam(5, $idPrueba);
		if($statment->execute()){
			return "OK";
		}else{
			return "ERROR 003";
		}
	}
	public function updateHoraInicio($rut, $idPrueba, $horaInicio){
		$statment = $this->db->prepare("UPDATE evaluaciones.usuario_prueba SET FECHA_INICIO = ? WHERE RUT = ? AND ID_PRUEBA = ?");
		$statment->bindParam(1, $horaInicio);
		$statment->bindParam(2, $rut);
		$statment->bindParam(3, $idPrueba);
		if($statment->execute()){
			return "OK";
		}else{
			return "ERROR 004";
		}
	}	
	
}	
?>