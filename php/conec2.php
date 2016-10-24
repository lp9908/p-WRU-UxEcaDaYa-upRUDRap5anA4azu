<?php
	/*$servernameD = "10.100.69.225";
	$usernameD = "master";
	$passwordD = "master";
	$dbnameD = "inventiolite";*/
	
	$servernameD = "localhost";
	$usernameD = "root";
	$passwordD = "";
	$dbnameD = "inventiolite";

	// Create connection
	$connD = new PDO("mysql:host=$servernameD;dbname=inventiolite", $usernameD, $passwordD, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\''));
	$connD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>