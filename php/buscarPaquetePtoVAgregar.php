<?php
	include 'conec.php';
	//variables a procesar
	$id = $_POST["IDPaqPtoVA"];


	//variables para la conexión
	/*$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "cinebdd";

	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);*/
	$consulta = "SELECT nombre, precio FROM paquete WHERE idPaquete=$id;";
	//se evalua el valor de entrada para ver si se meustran todos o no

			try {
				$stmt = $conn->prepare($consulta);
			}
			catch(PDOException $e) {
			}

		try{
			$stmt->execute();
				$tuplas ="";
			// set the resulting array to associative
			while($datos = $stmt->fetch(PDO::FETCH_BOTH)){
				$tuplas.=$datos[0]."%".$datos[1];
			}
			echo $tuplas;
		}
		catch(PDOException $e) {
			echo "No hay paquetes en existencia";
		}

?>
