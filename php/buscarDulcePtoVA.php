<?php
	include 'conec2.php';
	//variables a procesar
	//$tipoBusqueda = $_POST["tipoBusqueda"];
	$campo = $_POST["campoDulcePtoVA"];
	$valor = $_POST["valorDulcePtoVA"];


	//variables para la conexión
	/*$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "inventiolite";

	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
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
			$consulta .= "SELECT id,name, price_out FROM product where category_id = '3' and is_active='1' order by name";
			$stmt = $connD->prepare($consulta);
		}
		catch(PDOException $e) {
		  echo "Error: " . $e->getMessage();
		}
	}
	else {
			try {
					$consulta .= "SELECT id,name, price_out FROM product WHERE category_id = '3' and name LIKE '%$campo%' and is_active='1' order by name";
				$stmt = $connD->prepare($consulta);
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
			    <td>"."<button class='btn btn-primary' type='button' id='AgregarDulceBtnPtoVA' name='AgregarDulceBtnPtoVA'  onclick='agregaDulceIDPtoVA("."$datos[0]".")'>Agregar</button>"."</td>
				</tr>";
			}
			echo $cabecera.$tuplas.$pie;
		}
		catch(PDOException $e) {
			echo "No hay dulces en existencia";
		}

?>