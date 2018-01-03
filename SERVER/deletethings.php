<?php
	include_once "config.php";
	
	$id = $_GET['id'];
	$table = $_GET['table'];
	$idc=$_GET['idc'];
	echo $idc;
	if($table=='Recensione')
	{
		$query = $conn->query("DELETE FROM $table WHERE IDr='$id'");
		header("Location: $table.php");
	}
	else {
		if($idc) {
			$query = $conn->query("DELETE FROM $table WHERE IDc='$idc'");
			header("Location: NewsPage.php?id='".$_GET['id']."' ");
		}
		else {
			$query = $conn->query("DELETE FROM $table WHERE ID='$id'");
			header("Location: $table.php");
		}
	}
	$conn->close();

?>