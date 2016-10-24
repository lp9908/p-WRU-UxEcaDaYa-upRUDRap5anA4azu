
<?php
	$servername = "10.100.73.201";
	$username = "master";
	$password = "master";

	// Create connection
	$conn = new PDO("mysql:host=$servername;dbname=cinebdd", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\''));
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	// Check connection
	
	echo "Connected successfully<br>"; 

?>