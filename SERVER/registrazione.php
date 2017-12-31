<?php
	session_start();
	include_once "config.php";
	
	if (isset($_SESSION['userSession'])!="") {
		header("Location: homee.php");
	}
	$error_message=0;
	$success_message=0;
	if(isset($_POST["submitR"])) {		
		if(empty($_POST["unick"]))
			$error_message = "All Fields are required";
		else if(empty($_POST["fname"]))
			$error_message = "All Fields are required";
		else if(empty($_POST["lname"]))
			$error_message = "All Fields are required";
		else if(empty($_POST["dnascita"]))
			$error_message = "All Fields are required";
		else if(empty($_POST["email"]))
			$error_message = "All Fields are required";
		else if(empty($_POST["upsw"]))
			$error_message = "All Fields are required";
		else if(empty($_POST["confirmupsw"]))
			$error_message = "All Fields are required";
		
		
		else if($_POST['upsw'] != $_POST['confirmupsw'] && !isset($error_message)){ 
			$error_message = 'Passwords should be the same';
		}

		/* Email Validation */
		else if(!isset($error_message) && !filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
			$error_message = "Invalid Email Address";
		}
		else{
			$query= "INSERT INTO `account` (`Nickname`, `Password`, `Nome`, `Cognome`, `DataNascita`, `Email`, `Attivo`) VALUES 
			('$_POST[unick]', '$_POST[upsw]', '$_POST[fname]', '$_POST[lname]' , '$_POST[dnascita]', '$_POST[email]', 1);";
			
			$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
			if(!empty($output)) {
				$error_message = "";
				$success_message = "You have registered successfully!";	
				unset($_POST);
			} else {
				$success_message = "Problem in registration. Try Again!";	
			}
		}
		$conn->close();
	}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>GamesGuide</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		<link type="text/css" rel="stylesheet" href="CSS\Style.css" media="handheld, screen"/>
		
		<!--serve per mettere icone carine -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<!--<meta http-equiv="refresh" content="3" />-->
		
	</head>
	
	<body>
		<?php 
			include 'Menu.php';
		?>
		
		<div class="pagecontent">
			<div class="registrazione-contenuto">
				<form method="post" action="">
					<!--qua andrebbero messi i messaggi d'errore credo -->
					<?php if($success_message) { ?>
					<div class="riga">
						<h4><?php if(isset($success_message)) echo $success_message; ?></h4>
					</div>
					<?php } ?>
					<?php if($error_message) { ?>	
					<div class="riga">
						<h4><?php if(isset($error_message)) echo $error_message; ?></h4>
					</div>
					<?php } ?>
					<div class="riga">
						<h4>Nome</h4>
						<input type="text" name="fname" value="gigi"/> 
					</div>
					<div class="riga">	
						<h4>Cognome</h4>
						<input type="text" name="lname" value="bagigi"/>
					</div>
					<div class="riga">
						<h4>Data di Nascita</h4>
						<input type="text" name="dnascita" value="2000-02-02"/>
					</div>
					<div class="riga">
					   <h4>Email</h4>
						<input type="text" name="email" value="gigiobagigio@gmail.com"/>
					</div>
					<div class="riga">
						<h4>Nickname</h4>
						<input type="text" name="unick" value="gigiobagigio"/>
					</div>
					<div class="riga">	
						<h4>Password</h4>
						<input type="password" name="upsw" value="asdfghjkl"/>
					</div>
					<div class="riga">	
						<h4>Conferma Password</h4>
						<input type="password" name="confirmupsw" value="asdfghjkl"/>
					</div>
					<button class="registrazionebtn" type="submit" name="submitR">REGISTRATI</button>
				</form>
			</div>
		</div>
		
	</body>
</html>

