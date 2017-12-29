<?php
	require"config.php";
	
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
		<div class="navbar">
			<div class="dropdownlogo">
				<a href="Homee.php"><button class="dropbtnlogo">GAMES\' GUIDE</button></a>
			</div>
			
			<div class="dropdown">
				<button class="dropbtn">Notizie<i class="fa fa-caret-down"></i></button>
				<div class="dropdown-content">  
				
					<div class="polaroid">
						<img src="IMG\XboxOneX.jpg" alt="XboxOneX"/>
						<div class="polaroidText">
							<p>XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\EABFII.jpg" alt="EABFII"/>
						<div class="polaroidText">
							<p>EA: LOOTBOX FLOP
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\E3BestMoments.jpg" alt="alexaecho"/>
						<div class="polaroidText">
							<p>E3: I MIGLIORI MOMENTI
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\bestcontroller.jpg" alt="bestcontroller"/>
						<div class="polaroidText">
							<p>CONTROLLER: CLASSIFICA DEI MIGLIORI CONTROLLER
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\alexaecho.jpg" alt="alexaecho"/>
						<div class="polaroidText">
							<p>ALEXA ECHO: RISSA SULLE STRADE PER IL BEST SITO EVER
							</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="dropdown">
				<button class="dropbtn">Recensioni<i class="fa fa-caret-down"></i></button>
				<div class="dropdown-content">  
				
					<div class="polaroid">
						<img src="IMG\NFSPayback.jpg" alt="NFSPayback"/>
						<div class="polaroidText">
							<p>NEED FOR SPEED PAYBACK: LA VENDETTA E SERVITA
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\SuperMarioOdyssey.jpg" alt="SuperMarioOdyssey"/>
						<div class="polaroidText">
							<p>SUPER MARIO ODYSSEY
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\CODWWII.jpg" alt="CODWWII"/>
						<div class="polaroidText">
							<p>CALL OF DUTY: WORLD WAR II
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\GOW4.jpg" alt="GOW4"/>
						<div class="polaroidText">
							<p>GOD OF WAR: KRATOS IS BACK OMGOMGOMGOMGOMG NON VEDO LORA MI COMPRO UNA PS4 PER QUESTO GIOCO SICURO
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\ACOrigins2.0.jpg" alt="ACOrigins2.0"/>
						<div class="polaroidText">
							<p>ASSASSINS CREED: ORIGINS
							</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="dropdown">
				<button class="dropbtn">Videogiochi<i class="fa fa-caret-down"></i></button>
				<div class="dropdown-content">  
					<div class="column">
						<h3>Playstation</h3>
						<a href="#">Playstation 4</a>
						<a href="#">Playstation 3</a>
						<a href="#">TUTTI</a>
					</div>
					<div class="column">
						<h3>Xbox</h3>
						<a href="#">Xbox One</a>
						<a href="#">Xbox 360</a>
						<a href="#">TUTTI</a>
					</div>
					<div class="column">
						<h3>Nintendo</h3>
						<a href="#">Nintendo Switch</a>
						<a href="#">Nintendo DS</a>
						<a href="#">TUTTI</a>
					</div>
					<div class="column">
						<h3>PC</h3>
						<a href="#">Windows</a>
						<a href="#">Mac</a>
						<a href="#">TUTTI</a>
					</div>
					<div class="column">
						<h3>Mobile</h3>
						<a href="#">Andriod</a>
						<a href="#">iOS</a>
						<a href="#">TUTTI</a>
					</div>
				</div>
			</div>
			<div class="dropdownlogin">
				<button class="dropbtnlogin">Accedi<i class="fa fa-caret-down"></i></button>
				<div class="dropdown-content-login"> 
					<div class="containerlogin">
						<form method="post" action="login.php">
							<label>Username</label>
							<input type="text" name="uname" value="admin"/> 
							<label>Password</label>
							<input type="password" name="psw" value="admin"/>
							
							<button class="logsigninbtn" type="submit" name="submitA">Accedi</button>
						</form>
						<a href="registrazione.php"><button class="logsigninbtn" type="submit" name="submit">Registrati</button></a>
					</div>
				</div>
			</div>
		</div>
		
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

