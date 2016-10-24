

<?php
	$servername = "10.100.73.201";
	$username = "master";
	$password = "master";

	// Create connection
	$conn = new PDO("mysql:host=$servername;dbname=cinebdd", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\''));
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	// Check connection
	
	echo "Connected successfully<br>"; 

	$consulta = "SELECT * FROM empleado";
	$stmt = $conn->prepare($consulta);

	$stmt->execute();
	$tuplas ="";
	// set the resulting array to associative
	while($datos = $stmt->fetch(PDO::FETCH_BOTH)){
		$tuplas.="<tr>
		<td>".$datos[0]."</td>
		<td>".$datos[1]."</td>
		<td>".$datos[2]."</td>
		<td>".$datos[3]."</td>
		<td>".$datos[4]."</td>
		<td>".$datos[5]."</td>
		<td>".$datos[6]."</td>
		<td>".$datos[7]."</td>
			<td>"."<button type='button'  id='eliminaEmpleadoBtn' name='eliminaEmpleadoBtn' value='$datos[0]'>Eliminar</button>"."</td>
			<td>"."<button type='button'  id='modificaEmpleadoBtn' name='modificaEmpleadoBtn' value='$datos[0]'>Modificar</button>"."</td>
			</tr>
			<br>";
	}

	echo $tuplas;
?>