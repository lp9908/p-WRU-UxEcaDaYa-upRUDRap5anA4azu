<?php
	/*$servername = "10.100.67.162";
	$username = "master";
	$password = "master";
	$dbname = "cinebdd";*/
		
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "cinebdd";

	// Create connection
	$conn = new PDO("mysql:host=$servername;dbname=information_schema", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\''));
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>