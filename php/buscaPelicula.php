<?php
	include 'conec.php';

	$tipoBusqueda = $_POST["tipoBusqueda"];
	$campo = $_POST["campo"];
	$estado = $_POST["estado"];
	$valor = $_POST["valor"];

	$cabecera = "
	<div class='table-responsive'>
		<table class='table'>
			<thead>
				<tr>
					<th></th>
					<th>ID</th>
					<th>Nombre</th> 
					<th>Genero</th>
					<th>Clasif.</th>
					<th>Duracion</th>
					<th>Sinopsis</th>
					<th>Fecha Estreno</th>
					<th>Fecha Termino</th>
					<th>Eliminar</th>
					<th>Modificar</th>
				</tr>
			</thead>
			<tbody>";

    $pie = "</tbody>
		</table>
	</div>";
	$tuplas="";



	try{
	    /*$conn = new mysqli($servername, $username, $password, $dbname);*/
		$d = date('Y-m-j');
		$consultaPre = "SELECT * FROM pelicula ";
		if($valor != 10){
			if($campo == ""){
				if($estado == 0){
					
				}else if($estado == 1){
					$consultaPre.= "
						WHERE FecharTermino > '".$d."' AND estado = '1' ";
				}else if($estado == 2){
					$consultaPre.= "
						WHERE FechaEstreno > '".$d."' ";
				}else if($estado == 3){
					$consultaPre.= "
						WHERE FecharTermino < '".$d."' ";
				}
			}else{
				if($tipoBusqueda == 0){
					$consultaPre.= "
						WHERE (nombre LIKE '%$campo%' 
						OR genero LIKE '%$campo%'
						OR idPelicula LIKE '%$campo%')";
				}else if ($tipoBusqueda == 1){
					$consultaPre.= "
						WHERE idPelicula LIKE '%$campo%'";
				}else if ($tipoBusqueda == 2){
					$consultaPre.= "
						WHERE nombre LIKE '%$campo%'";
				}else if ($tipoBusqueda == 3){
					$consultaPre.= "
						WHERE genero LIKE '%$campo%'";
				}else if ($tipoBusqueda == 4){
					$consultaPre.= "
						WHERE clasificacion LIKE '%$campo%'";
				}
				if($estado == 0){
					
				}else if($estado == 1){
					$consultaPre.= "
						AND FecharTermino > '".$d."' AND estado = '1' ";
				}else if($estado == 2){
					$consultaPre.= "
						AND FechaEstreno > '".$d."' ";
				}else if($estado == 3){
					$consultaPre.= "
						AND FecharTermino < '".$d."' ";
				}
			}
			
		}
		if($tipoBusqueda == 0){
			$consultaPre.= "ORDER BY estado DESC, nombre";
		}else if ($tipoBusqueda == 1){
			$consultaPre.= "ORDER BY idpelicula";
		}else if ($tipoBusqueda == 2){
			$consultaPre.= "ORDER BY nombre";
		}else if ($tipoBusqueda == 3){
			$consultaPre.= "ORDER BY genero";
		}else if ($tipoBusqueda == 4){
			$consultaPre.= "ORDER BY clasificacion";
		}
		//echo "".$consultaPre;
		$stmt = $conn->prepare($consultaPre);
		try{
			$stmt->execute();
			echo '<p>Resultados para <strong>'.$campo.'</strong></p></br>';
			while($resultados = $stmt->fetch(PDO::FETCH_BOTH)) {
				$estadoaux = $resultados[8];
				$tuplas.="
					<tr>";
				if($estadoaux == 1){
					$tuplas.="
						<td><img src = 'img/buttonG.png' width = 20 height = 20 alt = 'Disponible'>";
				}else{
					$tuplas.="
						<td><img src = 'img/buttonR.png' width = 20 height = 20 alt = 'No disponible'>";
				}
				$tuplas.="
						<td>".$resultados[0]."</td>
						<td>".$resultados[7]."</td>
						<td>".$resultados[4]."</td>
						<td>".$resultados[3]."</td>
						<td>".$resultados[5]."</td>
						<td>".$resultados[6]."</td>
						<td>".$resultados[1]."</td>
						<td>".$resultados[2]."</td>
						<td>"."<button type='button'  id='eliminaPeliculaBtn' name='eliminaPeliculaBtn' value='$resultados[0]'>Eliminar</button>"."</td>
						<td>"."<button type='button'  id='modificaPeliculaBtn' name='modificaPeliculaBtn' value='$resultados[0]'>Modificar</button>"."</td>
					</tr>";
				
			};
		}catch(PDOException $e) {
			echo "No hay registro";
		};
		echo $cabecera.$tuplas.$pie;
	} catch (PDOException $e) {
	    echo "Error: " . $e->getMessage();
	}
	$conn = null;
?>