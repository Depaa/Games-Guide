<?php
	require "config.php";
	
	function registrazione()
	{
		echo 'dimmiqualcosa';
		session_start();
		$conn= connessione();
		$query= "INSERT INTO `account` (`Nickname`, `Password`, `Nome`, `Cognome`, `DataNascita`, `Email`) VALUES 
		('$_POST[unick]', '$_POST[upsw]', '$_POST[fname]', '$_POST[lname]' , '$_POST[dnascita]', '$_POST[email]');";
		
		$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		if(!empty($output)) {
			$error_message = "";
			echo "You have registered successfully!";	
			//unset($_POST);
		} else {
			echo "Problem in registration. Try Again!";	
		}
		$conn->close();
	}
	
	
	if(isset($_POST["submitR"])) {
		/* Password Matching Validation */
		if($_POST['upsw'] != $_POST['confirmupsw']){ 
			$error_message = 'Passwords should be same<br>';
			echo "Passwords should be same<br>";
		}

		/* Email Validation */
		if(!isset($error_message)) {
			if (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
				$error_message = "Invalid Email Address";
				echo "Invalid Email Address";
			}
		}

		if(!isset($error_message)) {
			registrazione(); 
		}
	}
	/*('" . $_POST["unick"] . "', '" . $_POST["upsw"] . "', '" . $_POST["fname"] . "', '" .$_POST["lname"] . "', '" . $_POST["dnascita"] . "', '" . $_POST["email"] . "')";*/
?>