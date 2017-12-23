<?php
	function connessione() 
	{
		$servername = "localhost";
		$username = "Gian";
		$password = "1r1kVDaJk0jmTmWz";
		$dbname="gamesguide";
		/* Create connection*/
			
		$conn = new mysqli($servername, $username, $password, $dbname);
		if ($conn)
		{
			echo "ok conn";
		}
		else
		{
			echo "no conn";
		}
		return $conn;
	}
?>