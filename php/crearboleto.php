<?php
	include 'conec.php';

	$total = $_POST["total"];
	$idusuario = $_POST["idUsuario"];
	$idempleado = $_POST["idEmpleado"];
	
	if($idusuario == ""){
		$idUsuario = "0";
	}
	
	try{
		/*$conn = new mysqli($servername, $username, $password, $dbname);*/
		$sqla = "SELECT COUNT(*) FROM ticketalimentos";
		$stmt = $conn->prepare($sqla);
		$stmt->execute();
		$resultados = $stmt->fetch(PDO::FETCH_BOTH);
		$id = $resultados[0];
		$id++;
		echo("ID del ticket: $id. ");
	} catch (PDOException $e){
		echo($sql."<br>".$e->getMessage());
	}
	try{
		$conn = new PDO("mysql:host=$servername;dbname=cinebdd", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\''));
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sqlb = "INSERT INTO ticketalimentos VALUES($id, CURDATE(), CURTIME(), $total, $idusuario, $idempleado)";
		$stmtb = $conn->prepare($sqlb);
		$stmtb->execute();
		echo "Ticket agregado";
	} catch (PDOException $e){
		echo($sqlb."<br>".$e->getMessage());
	}
	$conn = null;
?>