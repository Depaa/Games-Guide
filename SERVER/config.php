<?php
	$servername = "localhost";
	$username = "mdepasca";
	$password = "uudiengu3Eengucu";
	$dbname="mdepasca";

	// crearte connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// check connection
	if($conn->connect_error) {
		die("Connection Failed : " . $conn->error);
	}
?>
