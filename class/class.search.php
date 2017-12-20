<?php 
//include $_SERVER["DOCUMENT_ROOT"]."../config/connection.php";
include $_SERVER["DOCUMENT_ROOT"]."/evaluacion/config/connection.php";
class buscador{
	private $dbuscador;
	public function buscador(){
		$this->dbuscador = new conexionPDO();
		$this->dbuscador = $this->dbuscador->conexionPDO();
	}  
	public function evaluaciones_asociadas($rut){
	  //Busca las evaluaciones que tiene asignada la persona
	  if(!empty($rut)){
		  /*la fecha de inicio se compara, ya que es importante para determinar si el usuario ingreso a la evaluacion anteriormente, si por alguna razon ingreso. no podra visualizar nuevamente la prueba. y queda con nota 0.*/
		  $statment = $this->dbuscador->prepare("SELECT ID_PRUEBA FROM evaluaciones.usuario_prueba WHERE RUT = ? AND PUNTAJE = 0 AND NOTA = 0 AND FECHA_INICIO = '1800-01-01 00:00:00'");
		  $statment->bindParam(1,$rut);
		  $statment->execute();
		  if($statment->rowCount () > 0){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
			//var_dump($datos);
				foreach ($datos as $dato){
					$id_prueba = $dato['ID_PRUEBA'];
					$statment2 = $this->dbuscador->prepare("SELECT ID, NOMBRE_PRUEBA FROM evaluaciones.prueba WHERE ID = ? ");
					$statment2->bindParam(1, $id_prueba);
					$statment2->execute();
					if($statment2->rowCount() > 0){
						$nombres[] = $statment2->fetchAll(PDO::FETCH_ASSOC);
					}
				}
				//var_dump($nombres);
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
	public function preguntas_evaluacion($id_prueba, $item){
		//busco todas las preguntas de la evaluacion seleccionada por el usuario, indiferente del item al que corresponde.
		$statment = $this->dbuscador->prepare("SELECT * FROM evaluaciones.pregunta WHERE ID_PRUEBA = ? AND ID_ITEM = ? ORDER BY RAND()");
		$statment->bindParam(1, $id_prueba);
		$statment->bindParam(2, $item);
		$statment->execute();
		if($statment->rowCount() > 0){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
			return $datos;
		}else{
			return 0;
		}
	}
	public function alternativas_pregunta($id_pregunta){
		//busco todas las alternativas que corresponden a la pregunta segun el item.
		$statment = $this->dbuscador->prepare("SELECT * FROM evaluaciones.alternativa WHERE ID_PREGUNTA = ? ");
		$statment->bindParam(1, $id_pregunta);
		$statment->execute();
		if($statment->rowCount() > 0 ){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
			return $datos;
		}else{
			return 0;
		}
	}
	public function respuestas_pregunta($id_pregunta){
		//Busco las respuestas habilitadas para la pregunta realizada.
		$statment = $this->dbuscador->prepare("SELECT ID_RESPUESTA, RESPUESTA FROM evaluaciones.respuesta_pregunta, evaluaciones.respuesta WHERE respuesta.ID = respuesta_pregunta.ID_RESPUESTA AND ID_PREGUNTA = ?");
		$statment->bindParam(1, $id_pregunta);
		$statment->execute();
		if($statment->rowCount() > 0){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
			return $datos;
		}else{
			return 0;
		}
	}
	public function evaluaciones(){
		$statment = $this->dbuscador->prepare("SELECT * FROM evaluaciones.prueba");
		$statment->execute();
		if($statment->rowCount() > 0){
			$datos = $statment->fetchAll(PDO::FETCH_ASSOC);
			return $datos;
		}else{
			return 0;
		}
	}
	public function userAll($idPrueba){
		//busca a tdos los usuarios registrados que pueden dar la prueba. 
		$statment = $this->dbuscador->prepare("SELECT count(*) AS CANTIDAD FROM evaluaciones.usuario_prueba WHERE ID_PRUEBA = ?");
		$statment->bindParam(1,$idPrueba);
		$statment->execute();
		if($statment->rowCount() > 0){
			$datos = $statment->fetch(PDO::FETCH_ASSOC);
			return $datos;
		}else{
			return 0;
		}
	}
	public function evaluacionesTerminadas($idPrueba){
		//Busco todos los almunos que han efectuado la evaluacion a consultar, se determina por el campo nota de la tabla usuario prueba.
		$statment = $this->dbuscador->prepare("SELECT count(*) as CANTIDAD FROM evaluaciones.usuario_prueba WHERE ID_PRUEBA = ? AND NOTA > ?; ");
		$statment->bindParam(1,$idPrueba);
		$statment->bindValue(2,0);
		$statment->execute();
		$dato = $statment->fetch(PDO::FETCH_ASSOC);
		return $dato;		
	}
	public function alumnosFaltantes($idPrueba){
		//Busco todos los alumnos que aun faltan por dar la prueba, el campo a consultar es nota. 
		$statment = $this->dbuscador->prepare("SELECT count(*) AS CANTIDAD FROM evaluaciones.usuario_prueba WHERE ID_PRUEBA = ? AND NOTA = ?");
		$statment->bindParam(1, $idPrueba);
		$statment->bindValue(2,0);
		$statment->execute();
		$dato = $statment->fetch(PDO::FETCH_ASSOC);
		return $dato;
	}
	public function listadoTerminadas($idPrueba){
		//Listado de los alumnos que han terminado la evaluacion. 
		$statment = $this->dbuscador->prepare("SELECT usuario.RUT, usuario.NOMBRE, usuario.PATERNO, usuario.MATERNO, usuario.CARGO, usuario_prueba.FECHA_INICIO, usuario_prueba.FECHA_TERMINO, usuario_prueba.PUNTAJE, usuario_prueba.NOTA FROM usuario, usuario_prueba WHERE usuario.RUT=usuario_prueba.RUT AND usuario_prueba.ID_PRUEBA = ? AND usuario_prueba.NOTA > ?;");
		$statment->bindParam(1, $idPrueba);
		$statment->bindValue(2,0);
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