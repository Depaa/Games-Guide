<?php
	$servername = "localhost";
	$username = "Gian";
	$password = "Mlre9k9tzuBFXXMw";
	$dbname="gamesguide";

	// crearte connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// check connection
	if($conn->connect_error) {
		die("Connection Failed : " . $conn->error);
	}
?>