<?php
	$servername = "localhost";
	$username = "gpettenu";
	$password = "laeph0ud2sohW9au";
	$dbname="gpettenu";

	// crearte connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// check connection
	if($conn->connect_error) {
		die("Connection Failed : " . $conn->error);
	}
?>
