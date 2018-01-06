<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname="gamesguide";

	// crearte connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// check connection
	if($conn->connect_error) {
		die("Connection Failed : " . $conn->error);
	}
?>