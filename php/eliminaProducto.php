<?php
	include 'conec.php';

  $idProducto = $_POST["id"];

  /*$conn = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);*/
  $consulta = "UPDATE producto SET estado = 0 WHERE idProducto = $idProducto";


  try{
    $stmt = $conn->prepare($consulta);

    $stmt->execute();
    echo  "Producto eliminado";
    $conn = null;
  }catch(PDOException $e){
    echo "Error: ".$e->getMessage();
  }
?>