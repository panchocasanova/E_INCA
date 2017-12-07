<?php 
include $_SERVER["DOCUMENT_ROOT"]."../config/connection.php";
class buscador{
	private $dbuscador;
	public function buscador(){
		$this->dbuscador = new conexionPDO();
		$this->dbuscador = $this->dbuscador->conexionPDO();
	}  
	public function evaluaciones_asociadas($rut){
	  //Busca las evaluaciones que tiene asignada la persona
	  if(!empty($rut)){
		  $statment = $this->dbuscador->prepare("SELECT ID_PRUEBA FROM evaluaciones.usuario_prueba WHERE RUT = ? AND PUNTAJE = 0 AND NOTA = 0");
		  $statment->bindParam(1,$rut);
		  $statment->execute();
		  if($statment->rowCount () > 0){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
				foreach ($datos as $dato){
					$id_prueba = $dato['ID_PRUEBA'];
					$statment2 = $this->dbuscador->prepare("SELECT NOMBRE_PRUEBA FROM evaluaciones.prueba WHERE ID = ? ");
					$statment2->bindParam(1, $id_prueba);
					$statment2->execute();
					if($statment2->rowCount() > 0){
						$nombres[] = $statment2->fetch(PDO::FETCH_ASSOC);
					}
				}
			return $nombres;
		  }else{
			  return 0;
		  }
	  }else{
		  return -1;
	  }	  
	}

	public function evaluacion_seleccionada($id_prueba){
		//Busca la informacion de la evaluacion seleccionada por el usuario.
		$statment = $this->dbuscador->prepare("SELECT * FROM evaluaciones.prueba WHERE ID = ?");
		$statment->bindParam(1, $id_prueba);
		$statment->execute();
		if($statment->rowCount() > 0){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
			//guardamos los datos de la prueba en una variable de sesion y los rescatamos en evaluacion.php
			$_SESSION['evaluacionActual'] = $datos;		  
			return $datos;
		}else{
		return 0;
		}	  
	}
	
	public function instruccion_evaluacion($id_prueba){
		//Busca las instrucciones de la evaluacion seleccionada por el usuario.
		$statment = $this->dbuscador->prepare("SELECT ID, DESCRIPCION FROM evaluaciones.instruccion WHERE ID_PRUEBA = ?");
		$statment->bindParam(1, $id_prueba);
		$statment->execute();
		if($statment->rowCount() > 0 ){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
			return $datos;
		}else{
			return 0;
		}
	}
  
	public function items_evaluacion($id_prueba){
		//busca todos los item correspondientes a la evaluacion selecciona por el usuario.
		$statment = $this->dbuscador->prepare("SELECT * FROM evaluaciones.item WHERE ID_PRUEBA = ? ");
		$statment->bindParam(1, $id_prueba);
		$statment->execute();
		if($statment->rowCount() > 0){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
			return $datos;
		}else{
			return 0;
		}	  
	}
}
?>