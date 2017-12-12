<?php
include_once("/class/class.crud.php"); 
if(isset($_POST)){
	var_dump($_POST);
	$crud = new crud();
	switch($_POST['Action']){		
		case 'AP':
			$idpregunta = $_POST['IdP'];
			$idrespuesta = $_POST['Idr'];
			$rut = $_POST['Rut'];
			$fecha = $_POST['Date'];
			$respuesta = $crud->agregar_respuesta($idpregunta, $idrespuesta, $rut, $fecha);
			echo $respuesta;
			break;
		case 'VFP':
			$idpregunta = $_POST['IdP'];
			$idrespuesta = $_POST['Idr'];
			$rut = $_POST['Rut'];
			$fecha = $_POST['Date'];
			$valor = $_POST['Vr'];
	}
}else{
	header("Location:index.php");
}
?>