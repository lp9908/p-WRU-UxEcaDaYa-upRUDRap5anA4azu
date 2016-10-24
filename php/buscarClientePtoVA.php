<?php
	include 'conec.php';
	//variables a procesar
	//$tipoBusqueda = $_POST["tipoBusqueda"];
	$valor = $_POST["valorCliPtoVA"];


	//variables para la conexión
	/*$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "cinebdd";

	/*$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);*/
	$consulta = "";

	//se evalua el valor de entrada para ver si se meustran todos o no
		try{
			$consulta .= "SELECT email,tipoUsuario FROM usuario where idUsuario= $valor";
			$stmt = $conn->prepare($consulta);
		}
		catch(PDOException $e) {
		//  echo "Error: " . $e->getMessage();
		}


		try{
			$stmt->execute();
			$mensaje ="";
			// set the resulting array to associative
			while($datos = $stmt->fetch(PDO::FETCH_BOTH)){
				if($datos[1]=="Golden"){
				$mensaje=$datos[0]."?".$datos[1]."% 40";
			}
			else if($datos[1]=="Black"){
			$mensaje=$datos[0]."?".$datos[1]."% 35";
			}
			else if($datos[1]=="Silver"){
			$mensaje=$datos[0]."?".$datos[1]."% 30";
			}
			else if($datos[1]=="Super Fan"){
			$mensaje=$datos[0]."?".$datos[1]."% 25";
			}
			else if($datos[1]=="Fan Club"){
			$mensaje=$datos[0]."?".$datos[1]."% 20";
			}
			else if($datos[1]=="Fan"){
			$mensaje=$datos[0]."?".$datos[1]."% 15";
			}
			else if($datos[1]=="Cine Club"){
			$mensaje=$datos[0]."?".$datos[1]."% 10";
			}
			echo $mensaje;
		}
	}
		catch(PDOException $e) {
		}

?>
