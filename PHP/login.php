<?php
	require "config.php";
	function logIn()
	{
		session_start();
		$conn = connessione();
		$query = "SELECT Nickname, Password FROM Account WHERE Nickname='$_POST[uname]' AND Password='$_POST[psw]'";
		$result = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		if (($result->num_rows) == 1)
		{
			$row = $result->fetch_assoc();
			$_SESSION['Nickname'] = $row['Password'];
			echo "Benvenuto!";
		}
		else
		{
			echo "Ripperoni";
		}
		$conn->close();
	}

			/*if (!empty($row['Nickname']) AND !empty($row['Password'])) 
			{
				$_SESSION['Nickname'] = $row['Password'];
				echo 'ciao';
			}
			else
			{
				echo 'rip';
			}
		}
		else
		{
			echo 'inserisci i dati corretti';
		}
	*/
	if(isset($_POST['submitA'])) 
	{
		logIn();
	}
	
?>