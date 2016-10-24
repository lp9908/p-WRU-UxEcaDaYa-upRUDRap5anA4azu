<?php
	include 'conec.php';

	//variables a procesar
	//$tipoBusqueda = $_POST["tipoBusqueda"];
		//$noTicket = $_POST["noTicket"];
		//$estado = $_POST["estadoProd"];
		//$valor = $_POST["valorProd"];
		//$tipoBusqueda = $_POST["tipoBusquedaProd"];


	//variables para la conexión
	/*$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "cinebdd";

	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);*/
	
	try{		
		$sqla = "SELECT COUNT(*) FROM ticketalimentos";
		$stmta = $conn->prepare($sqla);
		$stmta->execute();
		$resultados = $stmta->fetch(PDO::FETCH_BOTH);
		$id = $resultados[0];
		//$id++;
		//echo "".$id;
	}catch(PDOException $e){
		//echo "Error: " . $e->getMessage();
	}
	
	//se evalua el valor de entrada para ver si se meustran todos o no
	
	try{
		$consulta = "SELECT * FROM ticketalimentos where idTicket='$id'";
		$stmt = $conn->prepare($consulta);
	}catch(PDOException $e) {
		//echo "Error: " . $e->getMessage();
	}
	
	try{
		$stmt->execute();
		$tuplas ="";
		$datos = $stmt->fetch(PDO::FETCH_BOTH);
		$total = $datos[3];
		$idUser = $datos[4];
		$idEmpl = $datos[5];
	}catch(PDOException $e) {
		//echo "No hay registro";
	}
	$cabecera = "";
	$cabecera .= "
	<div class='table-responsive'>
		<table class='table'>
			<thead>
				<tr>
    				<th colspan='4'>Cine Mundo</th>
  				</tr>
				<tr>
    				<th colspan='4'>Ticket de compra</th>
  				</tr>
				<tr>
    				<th colspan='2'>Ticket numero</th>
    				<th colspan='2'>".$datos[0]."</th>
  				</tr>
				<tr>
    				<th colspan='2'>Fecha de compra</th>
    				<th colspan='2'>".$datos[1]."</th>
  				</tr>
				<tr>
    				<th colspan='2'>Hora de la compra</th>
    				<th colspan='2'>".$datos[2]."</th>
  				</tr>";

	try{
		$consulta = " SELECT u.nombre
					  FROM usuario u, ticketalimentos t
					  WHERE u.idusuario = t.idusuario
					  AND t.idticket = '$id'";
		$stmt = $conn->prepare($consulta);
	}catch(PDOException $e) {
		//echo "Error: " . $e->getMessage();
	}
	
	try{
		$stmt->execute();
		$datos = $stmt->fetch(PDO::FETCH_BOTH);
		$nombreUsuario = $datos[0];
	}catch(PDOException $e) {
		//echo "No hay registro";
	}

	$cabecera .= "
				<tr>
    				<th colspan='2'>Nombre de cliente</th>
    				<th colspan='2'>".$nombreUsuario."</th>
  				</tr>";

	try{
		$consulta = "SELECT e.nombre
					 FROM empleado e, ticketalimentos t
					 WHERE e.idempleado = t.idempleado
					 AND t.idticket = '$id'";
		$stmt = $conn->prepare($consulta);
	}catch(PDOException $e) {
		//echo "Error: " . $e->getMessage();
	}
	
	try{
		$stmt->execute();
		$datos = $stmt->fetch(PDO::FETCH_BOTH);
		$nombreEmpleado = $datos[0];
	}catch(PDOException $e) {
		//echo "No hay registro";
	}

	$cabecera .= "
				<tr>
    				<th colspan='2'>Nombre de empleado</th>
    				<th colspan='2'>".$nombreEmpleado."</th>
  				</tr>
  				<tr>
    				<th>Producto</th>
    				<th>Cantidad</th>
    				<th>Precioo Unitario</th>
    				<th>Subtotal</th>
  				</tr>
			</thead>
			<tbody>";
	
	try{
		$consulta = "SELECT SUM(p.preciounitario  * tp.cantidad) AS total
					 FROM producto p, ticketproducto tp, ticketalimentos t
					 WHERE t.idticket = tp.idticket
					 AND tp.idproducto = p.idproducto
					 AND t.idticket = '$id'";
		$stmt = $conn->prepare($consulta);
	}catch(PDOException $e) {
		//echo "Error: " . $e->getMessage();
	}
	
	try{
		$stmt->execute();
		$datos = $stmt->fetch(PDO::FETCH_BOTH);
		$Prototal = $datos[0];
	}catch(PDOException $e) {
		//echo "No hay registro";
	}
	
	try{
		$consulta = "SELECT SUM(p.precio  * tp.cantidad) AS total
					 FROM paquete p, ticketpaquete tp, ticketalimentos t
					 WHERE t.idticket = tp.idticket
					 AND tp.idpaquete = p.idpaquete
					 AND t.idticket = '$id'";
		$stmt = $conn->prepare($consulta);
	}catch(PDOException $e) {
		//echo "Error: " . $e->getMessage();
	}
	
	try{
		$stmt->execute();
		$datos = $stmt->fetch(PDO::FETCH_BOTH);
		$Paqtotal = $datos[0];
	}catch(PDOException $e) {
		//echo "No hay registro";
	}
	if($Prototal == null){$Prototal = 0;}
	if($Paqtotal == null){$Paqtotal = 0;}
	$Dtotal = $total - $Prototal - $Paqtotal;
	if($Dtotal != 0){
		$dulces = "
				<tr>
					<td>Dulces</td>
					<td>1</td>
					<td>".$Dtotal."</td>
					<td>".$Dtotal."</td>
				</tr>";
	}else{
		$dulces = "";
	}
    $pie = "
				<tr>
    				<th></th>
    				<th></th>
    				<th>Total</th>
    				<th>".$total."</th>
  				</tr>
				<tr>
    				<th colspan='4'>Pago en efectivo</th>
  				</tr>
				<tr>
    				<th colspan='4'>Gracias por su visita</th>
  				</tr>
			</tbody>
		</table>
	</div>";
	$tuplas="";
		$consultaPre = "SELECT p.nombre,  tp.cantidad, p.precio, (p.precio * tp.cantidad) AS total
						FROM paquete p, ticketpaquete tp, ticketalimentos t
						WHERE t.idticket = tp.idticket
						AND tp.idpaquete = p.idpaquete
						AND t.idticket = '$id'";
		$stmt = $conn->prepare($consultaPre);
		try{
			$stmt->execute();
			while($resultados = $stmt->fetch(PDO::FETCH_BOTH)) {
				$tuplas.="
				<tr>
					<td>".$resultados[0]."</td>
					<td>".$resultados[1]."</td>
					<td>".$resultados[2]."</td>
					<td>".$resultados[3]."</td>
				</tr>";				
			};
		}catch(PDOException $e) {
			//echo "No hay registro";
		};
		$consultaPre = "SELECT p.nombre,  tp.cantidad, p.preciounitario, (p.preciounitario * tp.cantidad) AS total
						FROM producto p, ticketproducto tp, ticketalimentos t
						WHERE t.idticket = tp.idticket
						AND tp.idproducto = p.idproducto
						AND t.idticket = '$id'";
		$stmt = $conn->prepare($consultaPre);
		try{
			$stmt->execute();
			while($resultados = $stmt->fetch(PDO::FETCH_BOTH)) {
				$tuplas.="
				<tr>
					<td>".$resultados[0]."</td>
					<td>".$resultados[1]."</td>
					<td>".$resultados[2]."</td>
					<td>".$resultados[3]."</td>
				</tr>";				
			};
		}catch(PDOException $e) {
			//echo "No hay registro";
		};
		echo $cabecera.$tuplas.$dulces.$pie;
?>
