<?php
	include 'conec.php';

  $idEmpleado = $_POST["id"];

  
  $consulta = "UPDATE empleado SET estado = 0 WHERE idEmpleado = $idEmpleado";


  try{
    $stmt = $conn->prepare($consulta);
    $stmt->execute();
    echo  "Empleado eliminado";
    $conn = null;
  }catch(PDOException $e){
    echo "Error: ".$e->getMessage();
  }
?>
