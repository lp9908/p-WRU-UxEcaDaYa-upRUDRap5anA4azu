<?php
	include 'conec.php';

  $id = $_POST["id"];

  /*$conn = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);*/
  $consulta = "UPDATE pelicula SET estado = 0 WHERE idPelicula = $id";

  try{
    $stmt = $conn->prepare($consulta);
    $stmt->execute();
    echo  "Pelicula eliminada";
    $conn = null;
  }catch(PDOException $e){
    echo "Error: ".$e->getMessage();
  }
?>
