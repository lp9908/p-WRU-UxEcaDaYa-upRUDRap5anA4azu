<?php
	include 'conec.php';
	//variables a procesar
	//$tipoBusqueda = $_POST["tipoBusqueda"];
	$campo = $_POST["campoPaqPtoVA"];
	$valor = $_POST["valorPaqPtoVA"];


	/*variables para la conexión
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "cinebdd";

	/*$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);*/
	$consulta = "";
	//codigo para crear la tabla
	$cabecera = "<div class='table-responsive'>
  <table class='table'>
    <thead>
      <tr>
      <th>ID</th>
        <th>Nombre</th>
				<th>Precio</th>
				<th>Agregar</th>
      </tr>
    </thead>
    <tbody>";

    $pie="</tbody>
  </table>
  </div>";

	//se evalua el valor de entrada para ver si se meustran todos o no
	if($valor == 10){
		try{
			$consulta .= "SELECT idPaquete,nombre, precio FROM paquete where estado='1' order by nombre";
			$stmt = $conn->prepare($consulta);
		}
		catch(PDOException $e) {
		  echo "Error: " . $e->getMessage();
		}
	}
	else {
			try {
					$consulta .= "SELECT idPaquete,nombre, precio FROM paquete WHERE nombre LIKE '%$campo%' and estado='1' order by nombre";
				$stmt = $conn->prepare($consulta);
				//echo $consulta;
			}
			catch(PDOException $e) {
				//echo "Error: " . $e->getMessage();
			}
		}

		try{
			$stmt->execute();
			$tuplas ="";
			// set the resulting array to associative
			while($datos = $stmt->fetch(PDO::FETCH_BOTH)){
			  $tuplas.="<tr>
        <td>".$datos[0]."</td>
					<td>".$datos[1]."</td>
			    <td>".$datos[2]."</td>
			    <td>"."<button class='btn btn-primary' type='button' id='AgregarPaqueteBtnPtoVA' name='AgregarPaqueteBtnPtoVA'  onclick='agregaPaqueteIDPtoVA("."$datos[0]".")'>Agregar</button>"."</td>
				</tr>";
			}
			echo $cabecera.$tuplas.$pie;
		}
		catch(PDOException $e) {
			echo "No hay paquetes en existencia";
		}

?>
