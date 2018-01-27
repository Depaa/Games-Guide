<?php
	session_start();
	include_once "config.php";
	
	if (isset($_SESSION['userSession'])!="") {
		header("Location: index.php");
	}
	$error_message=0;
	$success_message=0;
	
	if(isset($_POST["submitR"])) {
		$controllo_nick="SELECT Nickname FROM Account WHERE Nickname= '".$_POST['unick']. "'";
		$controllo_mail = "SELECT Email FROM Account WHERE Email= '".$_POST['email']. "'";
		$risultato_nick = $conn->query($controllo_nick) or die("Errore nella query MySQL: ".$conn->error);
		$risultato_email = $conn->query($controllo_mail) or die("Errore nella query MySQL: ".$conn->error);
		
		
		if(empty($_POST["unick"]))
			$error_message = "Tutti i campi sono richiesti";
		else if(empty($_POST["fname"]))
			$error_message = "Tutti i campi sono richiesti";
		else if(empty($_POST["lname"]))
			$error_message = "Tutti i campi sono richiesti";
		else if(empty($_POST["dnascita"]))
			$error_message = "Tutti i campi sono richiesti";
		else if(empty($_POST["email"]))
			$error_message = "Tutti i campi sono richiesti";
		else if(empty($_POST["upsw"]))
			$error_message = "Tutti i campi sono richiesti";
		else if(empty($_POST["confirmupsw"]))
			$error_message = "Tutti i campi sono richiesti";
		else if($_POST['upsw'] != $_POST['confirmupsw'] ){ 
			$error_message = 'Le password non conincidono';
		}
		
		else if (strlen($_POST['unick']) >10) {
			$error_message = 'Il Nickname deve essere al massimo di 10 caratteri';
		}
		
		else if ($risultato_nick->num_rows != 0) {
			$error_message = 'Nickname gi&agrave; utilizzato';
		}
		
		else if ($risultato_email->num_rows != 0) {
			$error_message = "Email gia usata";
		}
		else {
			$query= "INSERT INTO `Account` (`Nickname`, `Password`, `Nome`, `Cognome`, `DataNascita`, `Email`) VALUES 
			('$_POST[unick]', '$_POST[upsw]', '$_POST[fname]', '$_POST[lname]' , '".date("Y-m-d", strtotime($_POST['dnascita']))."', '$_POST[email]');";
			
			$output = $conn->query($query) or die("Erroreeeeeeeee nella query MySQL: ".$conn->error);
			if(!empty($output)) {
				$error_message = "";
				$success_message = "Complimenti! Ti sei registrato con successo!";	
				unset($_POST);
			} else {
				$success_message = "Problemi con la registrazione :( Riprova.";	
			}
		}
	}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>GamesGuide</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS/Style.css" media="handheld, screen"/>
		<link rel="stylesheet" type="text/css" href="CSS/StyleM.css" media="handheld, screen and (max-width:620px), only screen and (max-device-width:620px)"/>
		<link type="text/css" rel="stylesheet" href="CSS/StyleP.css" media="print"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
		
		<script type="text/javascript" src="CSS/script.js"></script>
	</head>
	
	<body>
		<?php 
			include 'Menu.php';
		?>
		
		<div class="pagecontent">
			<div class="registrazione-contenuto">
				<form method="post" action="">
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
						<input type="text" name="fname" value="<?php if(isset($_POST['fname'])) echo $_POST['fname']; ?>"/> 
					</div>
					<div class="riga">	
						<h4>Cognome</h4>
						<input type="text" name="lname" value="<?php if(isset($_POST['lname'])) echo $_POST['lname']; ?>"/>
					</div>
					<div class="riga">
						<h4>Data di Nascita (gg-mm-aaaa)</h4>
						<input type="text" name="dnascita" value="<?php if(isset($_POST['dnascita'])) echo $_POST['dnascita']; ?>"/>
					</div>
					<div class="riga">
					   <h4>Email</h4>
						<input type="text" name="email" value="<?php if(isset($_POST['email'])) echo $_POST['email']; ?>"/>
					</div>
					<div class="riga">
						<h4>Nickname</h4>
						<input type="text" name="unick" value="<?php if(isset($_POST['unick'])) echo $_POST['unick']; ?>"/>
					</div>
					<div class="riga">	
						<h4>Password</h4>
						<input type="password" name="upsw" value=""/>
					</div>
					<div class="riga">	
						<h4>Conferma Password</h4>
						<input type="password" name="confirmupsw" value=""/>
					</div>
					<p><button class="registrazionebtn" type="submit" name="submitR">REGISTRATI</button></p>
				</form>
			</div>
		</div>
		
		<div class="footer">
			<h4>Progetto del corso di Tecnologie Web anno 2017-2018</h4>
		</div>
		
	</body>
</html>