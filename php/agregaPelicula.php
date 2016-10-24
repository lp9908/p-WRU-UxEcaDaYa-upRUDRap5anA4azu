<?php
	include 'conec.php';
	
	//$idPelicula
	$nombre = $_POST["nombre"];
	$clasificacion = $_POST["clasificacion"];
	$genero = $_POST["genero"];
	$duracion = $_POST["duracion"];
	$sinopsis = $_POST["sinopsis"];
	$fechaE = $_POST["fechaE"];
	$fechaT = $_POST["fechaT"];
	$estado = $_POST["estado"];

	try{
		/*$conn = new mysqli($servername, $username, $password, $dbname);*/
		$sqla = "SELECT COUNT(*) FROM pelicula";
		$stmt = $conn->prepare($sqla);
		$stmt->execute();
		$resultados = $stmt->fetch(PDO::FETCH_BOTH);
		$id = $resultados[0];
		$id++;
		echo("ID de la pelicula: $id. ");
	} catch (PDOException $e){
		echo($sql."<br>".$e->getMessage());
	}
	$conn = null;
	try{
		$conn = new PDO("mysql:host=$servername;dbname=cinebdd", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\''));
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sql = "INSERT INTO pelicula VALUES('$id','$fechaE','$fechaT','$clasificacion', '$genero','$duracion', '$sinopsis', '$nombre', '$estado')";
		$conn->exec($sql);
		echo "Pelicula agregada";
	} catch (PDOException $e){
		echo($sql."<br>".$e->getMessage());
	}
	$conn = null;
?>