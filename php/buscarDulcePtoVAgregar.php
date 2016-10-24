<?php
	include 'conec2.php';
	//variables a procesar
	$id = $_POST["IDDulcePtoVA"];


	//variables para la conexión
	/*$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "inventiolite";

	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);*/
	$consulta = "SELECT name, price_out FROM product WHERE category_id = '3' and id=$id;";
	//se evalua el valor de entrada para ver si se meustran todos o no

			try {
				$stmt = $connD->prepare($consulta);
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
			echo "No hay dulces en existencia";
		}

?>
