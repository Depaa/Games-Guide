<?php
	include_once "config.php";
	
	$id = $_GET['id'];
	$table = $_GET['table'];
	$idc=$_GET['idc'];
	echo $idc;
	if($table=='Recensione')
	{
		if($idc) { //cancella commento recensione
			$query = $conn->query("DELETE FROM CommentiRecensione WHERE IDc='$idc'");
			header("Location: RewsPage.php?id='".$_GET['id']."' ");
		}
		else	//cancella recensione
		{
			$query = $conn->query("DELETE FROM $table WHERE IDr='$id'");
			header("Location: $table.php");
		}
	}
	else {	//cancella commento notizia
		if($idc) {
			$query = $conn->query("DELETE FROM CommentiNotizie WHERE IDc='$idc'");
			header("Location: NewsPage.php?id='".$_GET['id']."' ");
		}
		else {	//cancella notizia
			$query = $conn->query("DELETE FROM $table WHERE ID='$id'");
			header("Location: $table.php");
		}
	}
	$conn->close();

?>