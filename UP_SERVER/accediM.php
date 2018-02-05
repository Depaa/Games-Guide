<?php
	session_start();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>Games'Guide: Accedi</title>
		
		<meta name="description" content="Accedi ed entra a far parte delle community di Games'Guide">
		<meta name="author" content="Lucia Fenu, Francesco Battistella, Gianmarco Pettenuzzo, Matteo Depascale">
		<meta name="keywords" content="Videogiochi, Notizie, Accedi, Recensioni, Registrazione">
		<meta name="robots" content="noindex, nofollow">
		
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
		if (!isset($_SESSION['userSession'])) {
			echo '<div class="pagaccesso">';
				echo '<div class="titacc">';
					echo '<h1 id="contenutoPrincipale">ACCEDI</h1>';
				echo '</div>';
				
				echo '<div class="formacc">';
					echo '<?php if(isset($msg)) {echo $msg;} ?>';
					echo '<form method="post" action="">';
						echo '<fieldset>';
							echo '<p><span lang="en">Username</span></p>';
							echo '<input type="text" name="uname" value="admin"/>';
							echo '<p><span lang="en">Password</span></p>';
							echo '<input type="password" name="psw" value="admin"/>';
							echo '<button class="logsigninbtn" type="submit" name="submitA">Accedi</button>';
						echo '</fieldset>';
					echo '</form>';
				echo '</div>';
				
				echo '<div class="regacce">';
					echo '<p>Non sei ancora registrato? Puoi farlo <a href="registrazione.php">qui</a>!</p>';
				echo '</div>';
				
			echo '</div>';
		}
		else {
			echo '<div class="pagaccesso">';
				echo '<div class="titacc">';
					echo '<h1 id="contenutoPrincipale">Benvenuto '.$rowB['Nickname'].'</h1>';
				echo '</div>';
			echo '</div>';
		}
?>
	</body>

<?php 
	include 'Footer.php';
?>

</html>