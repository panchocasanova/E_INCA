<?php
include $_SERVER["DOCUMENT_ROOT"]."/evaluacion/config/connection.php";
session_start();
include_once($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.crud.php"); 
include_once($_SERVER["DOCUMENT_ROOT"]."/evaluacion/class/class.calcular.php");

if(isset($_POST)){
	//var_dump($_POST);
	$crud = new crud();
	$calcular = new calculo();
	switch($_POST['Action']){		
		case 'AP':
			$idpregunta = $_POST['IdP'];
			$idrespuesta = $_POST['Idr'];
			$rut = $_POST['Rut'];
			$fecha = $_POST['Date'];
			$valor = null;
			$respuesta = $crud->agregar_respuesta($idpregunta, $idrespuesta, $rut, $fecha, $valor);
			echo $respuesta;
			break;
		case 'VFP':
			$idpregunta = $_POST['IdP'];
			$idrespuesta = $_POST['Idr'];
			$rut = $_POST['Rut'];
			$fecha = $_POST['Date'];
			$valor = $_POST['Vr'];
			$respuesta = $crud->agregar_respuesta($idpregunta, $idrespuesta, $rut, $fecha, $valor);
			echo $respuesta;
			break;
		case 'FINALIZAR':
			$rut = $_POST['Rut'];
			$idPrueba = $_POST['IdP'];
			$horaTermino = $_POST['Hora'];
			$Pmaximoprueba = $_POST['Pmax'];
			$Nivelexigencia= $_POST['Nexi'];
			$puntajeObtenido = $calcular->puntajeTotal($rut, $idPrueba);
			$notaFinal = $calcular->nota($Pmaximoprueba, $Nivelexigencia, $puntajeObtenido);
			$subirPuntaje = $crud->updatePuntaje($rut, $idPrueba, $puntajeObtenido, $horaTermino, $notaFinal);			
			$_SESSION['puntajeObtenido'] = $puntajeObtenido;
			$_SESSION['nota'] = $notaFinal;
			echo $subirPuntaje;
			break;
		case 'TIEMPOINICIO':
			$rut = $_POST['Rut'];
			$idPrueba = $_POST['IdP'];
			$horaInicio = $_POST['Hora'];
			$inicio = $crud->updateHoraInicio($rut, $idPrueba, $horaInicio);
			echo $inicio;
			break;
	}
}else{
	header("Location:index.php");
}
?>