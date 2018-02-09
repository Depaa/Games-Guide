<?php
	session_start();
	include_once "config.php";
	
	if (isset($_SESSION['userSession'])!="") {
		header("Location: index.php");
	}
	$error_message=0;
	$success_message=0;
	
	if(isset($_POST["submitREC"])) {
		
		
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
		else
		{
			$controllo="SELECT Password FROM Account WHERE Nickname='".$_POST['unick']."'AND Nome='".$_POST['fname']."'AND Cognome='".$_POST['lname']."'AND DataNascita='".date("Y-m-d", strtotime($_POST['dnascita']))."'AND Email='".$_POST['email']."'";
			$output = $conn->query($controllo) or die("Erroreeeeeeeee nella query MySQL: ".$conn->error);
			if($output->num_rows !=0) {
				$Password= $output->fetch_array();
				$error_message = "";
				$success_message = "La tua password è: ".$Password['Password']."";	
				unset($_POST);
			} else {
				$error_message = "I campi inseriti non sono corretti";	
			}
		}
	}
	?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>Games'Guide: Recupera Password</title>
		<meta name="description" content="Hai perso la password? recuperala inserendo le tue informazioni"/>
		<meta name="author" content="Lucia Fenu, Francesco Battistella, Gianmarco Pettenuzzo, Matteo Depascale"/>
		<meta name="keywords" content="Videogiochi, Password, Registrazione"/>
		<meta name="robots" content="noindex, nofollow"/>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS/Style.css" media="handheld, screen"/>
		<link rel="stylesheet" type="text/css" href="CSS/StyleM.css" media="handheld, screen and (max-width:651px), only screen and (max-device-width:651px)"/>
		<link type="text/css" rel="stylesheet" href="CSS/StyleP.css" media="print"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script type="text/javascript" src="JS/goTop.js"></script>
	</head>
	
	<body>
		<?php 
			include 'Menu.php';
		?>
		
		<div class="pagecontent">
			<div class="registrazione-contenuto">
				<form method="post" action="">
					<fieldset>
					<?php if($success_message) { ?>
					<div class="riga">
						<h4 id="contenutoPrincipale"><?php if(isset($success_message)) echo $success_message; ?></h4>
						<h5>Stai per essere reinderizzato alla <span lang="en">Home</span> fra 10 secondi, clicca <a href="index.php">Qui</a> se non vuoi aspettare</h5>
						<script type="text/javascript" src="JS/indexRedirect.js"></script>
					</div>
					<?php } 
					else
					{?>
					
					<?php if($error_message) { ?>	
					<div class="riga">
						<h4><?php if(isset($error_message)) echo $error_message; ?></h4>
					</div>
					<?php } ?>
					<div class="riga">
						<h4 id="contenutoPrincipale">Nome</h4>
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
					   <h4><span lang="en">Email</span></h4>
						<input type="text" name="email" value="<?php if(isset($_POST['email'])) echo $_POST['email']; ?>"/>
					</div>
					<div class="riga">
						<h4><span lang="en">Nickname</span></h4>
						<input type="text" name="unick" value="<?php if(isset($_POST['unick'])) echo $_POST['unick']; ?>"/>
					</div>
					<button class="registrazionebtn" type="submit" name="submitREC">RECUPERA <span lang="en">PASSWORD</span></button>
					</fieldset>
				</form>
					<?php } ?>
			</div>
		<div id="backtotop" class="backtotop">
			<button onclick="gotopFunction()"><em class="fa fa-arrow-circle-up"></em></button>
		</div>
		</div>
		
<?php 
	include 'Footer.php';
?>
		
	</body>
</html>
