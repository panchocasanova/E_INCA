<?php 

class calculo{
	private $db;
	public function calculo(){
		$this->db = new conexionPDO();
		$this->db = $this->db->conexionPDO();
	}
	public function puntajeTotal($rut, $idPrueba){
		$total = 0;
		$statment = $this->db->prepare("SELECT pregunta.ID_PRUEBA, pregunta.ID, pregunta.PREGUNTA, pregunta.PUNTAJE, respuesta_pregunta.ID_RESPUESTA, respuesta.RESPUESTA, respuesta.VALOR FROM pregunta, respuesta_pregunta, respuesta WHERE pregunta.ID_prueba = ? AND pregunta.ID = respuesta_pregunta.ID_PREGUNTA AND respuesta_pregunta.ID_RESPUESTA = respuesta.ID");
		$statment->bindParam(1, $idPrueba);
		$statment->execute();
		if($statment->rowCount()>0){
			$preguntas = $statment->fetchAll(PDO::FETCH_ASSOC);			
			$_SESSION['preguntas'] = $preguntas;
			//recorro cada pregunta de la prueba que dio la persona
			foreach ($preguntas as $pregunta){
				$idPregunta = $pregunta['ID'];
				$preguntadescripcion = $pregunta['PREGUNTA'];
				$puntajePregunta = $pregunta['PUNTAJE'];
				$idRespuesta = $pregunta['ID_RESPUESTA'];
				$descRespuestaCorrecta = $pregunta['RESPUESTA'];
				$respuestaCorrecta = $pregunta['VALOR'];
				
				//si la respuesta de las alternativas es correcta.
				if($respuestaCorrecta == 1 || $respuestaCorrecta == 'V' || $respuestaCorrecta == 'F'){
					//Busco todas las respuestas del usuario
					$statmentUser = $this->db->prepare("SELECT ID_PREGUNTA, ID_RESPUESTA, VOF FROM usuario_respuesta WHERE RUT = ?");
					$statmentUser->bindParam(1, $rut);
					$statmentUser->execute();
					if($statmentUser->rowCount() > 0){
						$respuestas = $statmentUser->fetchAll(PDO::FETCH_ASSOC);
						$x=0;
						foreach($respuestas as $respuesta){
							$idPreguser = $respuesta['ID_PREGUNTA']; 
							$idRespuser = $respuesta['ID_RESPUESTA'];
							$respuestaVOF = $respuesta['VOF'];
							
							if($respuestaCorrecta == 1){
								if($idPregunta == $idPreguser){
									if($idRespuesta == $idRespuser ){
										$total+= $puntajePregunta;
										//var_dump($idRespuser);
									}else{
										//Si respondio mal, la registro en un array
										$erronea[] = array("Id" => $idPregunta, "Pregunta" => $preguntadescripcion, "idRespuestaCorrecta" => $idRespuesta, "descRespuestaCorrecta"=>$descRespuestaCorrecta, "idRespuestaUser" => $idRespuser);
									}
								}
							}
							if($respuestaCorrecta == 'V' || $respuestaCorrecta == 'F'){
								if($idPregunta == $idPreguser){
									if($idRespuesta == $idRespuser ){
										if($respuestaCorrecta == $respuestaVOF){
											$total+=$puntajePregunta;
										}else{
											//Si respondio mal, la registro en un array
											//$erronea[] = array("Id"=>$idPregunta, "Pregunta"=>$preguntadescripcion);
											$erronea[] = array("Id" => $idPregunta, "Pregunta" => $preguntadescripcion, "idRespuestaCorrecta" => $idRespuesta, "descRespuestaCorrecta"=>$descRespuestaCorrecta, "idRespuestaUser" => $idRespuser, "VOFUser" => $respuestaVOF, "VOFCorrecta" => $respuestaCorrecta);
										}
									
									}
								}
							}	
							$x++;
						}
					}
				}
			}
			//$_SESSION['TOTAL'] = $total;
			//var_dump($erronea);
			if(!isset($erronea)) $erronea = 0; // si el usuario respondio todas las preguntas correctamente $erronea vale cero.
			$_SESSION['erroneas'] = $erronea;
			return $total;
		}
	}
	
	public function nota($puntajeMaximo, $nivelExigencia, $puntajeObtenido){		
		$nivel = $nivelExigencia/100;
		$puntajeMinimoAprobacion = $puntajeMaximo * $nivel;		
		if($puntajeObtenido > $puntajeMinimoAprobacion){
			$notaFinal = (((7.0-4.0)/($puntajeMaximo-$puntajeMinimoAprobacion))*($puntajeObtenido-$puntajeMinimoAprobacion))+4.0;
		}
		if($puntajeObtenido <= $puntajeMinimoAprobacion){
			$notaFinal = (((4.0-2.0)/($puntajeMinimoAprobacion-0))*($puntajeObtenido-0))+2.0;
		}
		return $notaFinal;
	}
}	
?>