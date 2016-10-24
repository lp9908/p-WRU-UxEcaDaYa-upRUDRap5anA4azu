<?php
	include 'php/conec.php';
	include 'php/conec2.php';

    $listaProductos = json_decode($_POST['productos']);
	//$noTicket = $_POST['noTicket'];
	//echo "No. ".$noTicket;
	
    //variables para la conexión
    /*$servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "cinebdd";*/
//    $elemSIPr = array( );
  //  $elemSIPa = array( );
    $mensaje="";
    $elemSIPr = array( );
	$listaDulce = new ArrayObject();
    $listaPaqProd = new ArrayObject();
    $listaProd = new ArrayObject();
    $existencias="";
  //  $listaPaqProd = (PaqProd) array();
    //$listaPaqProd = array( );
    class PaqProd {
      public $idPaq;
      public $idProd;
      public $cantPP;
      public $cantEE;

      public function PaqProd($idPaq, $idProd, $cantPP, $cantEE ){
          $this->idPaq= $idPaq;
          $this->idProd = $idProd;
          $this->cantPP = $cantPP;
          $this->cantEE = $cantEE;
      }
      public function imp(){
          return "idPaquete"." ".$this->idPaq." "."idProducto"." ".$this->idProd." "."Cantidad"." ".$this->cantPP."\n";
      }
    }
    class Prod {
      public $idP;
      public $cant;
      public $exi;

      public function Prod($idP, $cant , $exi){
          $this->idP = $idP;
          $this->cant = $cant;
          $this->exi = $exi;
      }
    }
	
	class Dulce {
      public $idD;
      public $cantD;
      public $exiD;

      public function Prod($idD, $cantD , $exiD){
          $this->idD = $idD;
          $this->cantD = $cantD;
          $this->exiD = $exiD;
      }
    }
	
	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	try{		
		$sqla = "SELECT COUNT(*) FROM ticketalimentos";
		$stmta = $conn->prepare($sqla);
		$stmta->execute();
		$resultados = $stmta->fetch(PDO::FETCH_BOTH);
		$id = $resultados[0];
		//$id++;
		//echo "".$id;
	}catch(PDOException $e){
		echo "Error: " . $e->getMessage();
	}
	$conn = null;
	
	foreach($listaProductos as $producto) {
		$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		if($producto->tipoE == "producto"){
			try{
				$consulta = "SELECT existencias from  producto where idProducto= $producto->idE";
				$stmt = $conn->prepare($consulta);
			}catch(PDOException $e) {
				//echo "Error: " . $e->getMessage();
			}
			try{
				$stmt->execute();
				//set the resulting array to associative
				while($datos = $stmt->fetch(PDO::FETCH_BOTH)){
					$existencias= $datos[0];
				}
				$conn = null;
			}catch(PDOException $e) {}
			$pr= new Prod($producto->idE,$producto->cantE,$existencias);
			$listaProd->append($pr);
			//$elemSIPr[] = $existencias;
		}else if($producto->tipoE == "dulce"){
			//echo "@Dulce#";
			/*try{
				$consulta = $q;
				$stmt = $connD->prepare($consulta);
			}catch(PDOException $e) {
				//echo "Error: " . $e->getMessage();
			}
			try{
				$stmt->execute();
				//set the resulting array to associative
				while($datos = $stmt->fetch(PDO::FETCH_BOTH)){
					$existencias= $datos[0];
				}
				//$conn = null;
			}catch(PDOException $e) {}
			$d= new Dulce($producto->idE,$producto->cantE,$existencias);
			$listaDulce->append($d);
			//$elemSIPr[] = $existencias;*/
		}else{
			try{
				$consulta = "SELECT * from  paqueteproducto where idPaquete= $producto->idE";
				$stmt = $conn->prepare($consulta);
			}catch(PDOException $e) {
				//echo "Error: " . $e->getMessage();
			}
			try{
				$stmt->execute();
				//set the resulting array to associative
				$ban = "0";
				while($datos = $stmt->fetch(PDO::FETCH_BOTH)){
					if($ban == "0"){
						$ban = "1";
						//echo "#".$datos[1]."@".$producto->cantE."@".$id; //<================================
						try{
							$consultab1 = "INSERT INTO ticketpaquete VALUES($id, $datos[1], $producto->cantE)";
							echo "".$consultab1;
							$stmtb1 = $conn->prepare($consultab1);
							$stmtb1->execute();
						}catch(PDOException $e){
							echo "Error: " . $e->getMessage();
						}
					}
					$p= new PaqProd($datos[1],$datos[0],$datos[2],$producto->cantE );
					$listaPaqProd->append($p);
				}
				$conn = null;
			}catch(PDOException $e){}
		}
	}

      if(sizeof($listaPaqProd)!=0){
        foreach($listaPaqProd as $pp){
        //echo "".$pp->imp();
        }
      }
      else {
      //  $mensaje.="VACIO\n";
      }

if(sizeof($listaPaqProd)!=0){
	foreach($listaPaqProd as $pp){
		try{
			$conn2 = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			$conn2->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$existenciasPP="";
			$consulta2 = "SELECT existencias from  producto where idProducto= $pp->idProd";
			$stmt2 = $conn2->prepare($consulta2);
        }catch(PDOException $e) {
			//echo "Error: " . $e->getMessage();
		}
		//echo $pp->cantPP."#".$pp->cantEE."#";
		try{
			$stmt2->execute();
			//set the resulting array to associative
			while($datos = $stmt2->fetch(PDO::FETCH_BOTH)){
				$existenciasPP = $datos[0];
				//$mensaje.= $datos[0]."\n";
			}
			$conn2 = null;
		}catch(PDOException $e) {
			//echo "Error: " . $e->getMessage();
		}
		//$mensaje.= "---".$pp->cantPP."----IDPROD---".$pp->idProd."\n";
		if(($existenciasPP-($pp->cantPP*$pp->cantEE))<=30){
			$conn3 = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
			$conn3->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$consulta3 = "UPDATE producto SET existencias =  $existenciasPP-($pp->cantPP*$pp->cantEE)+30  where idProducto= $pp->idProd";//<===
			try{
				$stmt3 = $conn3->prepare($consulta3);
				$stmt3->execute();
				//$mensaje="Existencias modificadas";
				$mensaje.= "Se abastecieron existencias del producto con ID ".$pp->idProd."\n";
				$conn3 = null;
			}catch(PDOException $e){
				//echo "Error: ".$e->getMessage();
			}
		}else{
			//$mensaje.= "Entra a mod sin inrementar";
			$conn3 = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
			$conn3->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$consulta3 = "UPDATE producto SET existencias =  $existenciasPP-($pp->cantPP*$pp->cantEE) where idProducto= $pp->idProd";//<===
			try{
				$stmt3 = $conn3->prepare($consulta3);
				$stmt3->execute();
				//$mensaje="Existencias modificadas";
				$conn3 = null;
			}catch(PDOException $e){
				//echo "Error: ".$e->getMessage();
			}
		}
    }
}



if(sizeof($listaProd)!=0){
    foreach($listaProd as $pr){
		$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		try{
			$consultab2 = "INSERT INTO ticketproducto VALUES($id, $pr->idP, $pr->cant)";
			echo "".$consultab2;
			$stmtb2 = $conn->prepare($consultab2);
			$stmtb2->execute();
		}catch(PDOException $e){
			echo "Error: " . $e->getMessage();
		}
		$conn = null;
		if(($pr->exi-$pr->cant)<=30){
			$conn2 = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
			$conn2->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$consulta2 = "UPDATE producto SET existencias =  $pr->exi-$pr->cant+30  where idProducto= $pr->idP";
			try{
				$stmt2 = $conn2->prepare($consulta2);
				$stmt2->execute();
				//echo  "Existencias modificadas";
				$mensaje.= "Se abastecieron existencias del producto con ID ".$pr->idP."\n";
				$conn2 = null;
				//$mensaje="Existencias modificadas";
			}catch(PDOException $e){
				//echo "Error: ".$e->getMessage();
			}
        }else{
			$conn2 = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
			$conn2->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$consulta2 = "UPDATE producto SET existencias =  $pr->exi-$pr->cant  where idProducto= $pr->idP";
			try{
				$stmt2 = $conn2->prepare($consulta2);
				$stmt2->execute();
				//echo "Existencias modificadas";
				$conn2 = null;
				//$mensaje="Existencias modificadas";
			}catch(PDOException $e){
				//echo "Error: ".$e->getMessage();
			}
        }
	}
}
$mensaje.="Existencias modificadas";
  echo $mensaje;

?>
