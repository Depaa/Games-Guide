<?php
	include_once "config.php";
	
	$id = $_GET['id'];
	$table = $_GET['table'];
	
	$query = $conn->query("DELETE FROM $table WHERE ID='$id'");
	header("Location: $table.php");

	$conn->close();

?>