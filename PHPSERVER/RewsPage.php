<?php
	require "config.php";
	
	$id = $_GET['id'];
	$query = "SELECT ID, Recensione.NomeGioco, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco WHERE ID=$id";
	//$conn = connessione();
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
							<p>NEED FOR SPEED PAYBACK: LA VENDETTA E\' SERVITA
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
							<p>GOD OF WAR: KRATOS IS BACK OMGOMGOMGOMGOMG NON VEDO L\'ORA MI COMPRO UNA PS4 PER QUESTO GIOCO SICURO
							</p>
						</div>
					</div>
					
					<div class="polaroid">
						<img src="IMG\ACOrigins2.0.jpg" alt="ACOrigins2.0"/>
						<div class="polaroidText">
							<p>ASSASSIN\'S CREED: ORIGINS
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
						<a href="Videogiochi.php">Xbox One</a>
						<a href="#">Xbox 360</a>
						<a href="#">TUTTI</a>
					</div>
					<div class="column">
						<h3>Nintendo</h3>
						<a href="Admin.php">Nintendo Switch</a>
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
					<form method="POST" action="login.php">
						<div class="containerlogin">
							<label>Username</label>
							<input type="text" name="uname" value="admin"/> <!--placeholder="Enter Username"-->
							<!--il placeholder non 衳upportato in html ma lo 衩n html5, quindi non valida-->
							<label>Password</label>
							<input type="password" name="psw" value="admin"/><!--required--> <!--placeholder="Enter Password"-->
							
							<button class="logsigninbtn" type="submit" name="submitA" value="Log-In">Accedi</button>
							
							<button class="logsigninbtn" type="submit" name="submitR">Registrati</button>
						</div>
					</form>
				</div>
			</div>
		</div>


<?php
/*$query = "SELECT ID, AdminNick, Testo, Titolo, Recensione.Data, MenuImg, CommentiRecensione.Data, CommentiRecensione.Data, CommentiRecensione.Commento, CommentiRecensione.Nick FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco JOIN CommentiRecensione ON CommentiRecensione.TitoloRec=Recensione.Titolo WHERE ID=$id";*/
		echo '<div class="pagnotizia">';
		if(!$output) 
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			foreach($output as $campo => $row) {
				echo '<div class="titolonotizia">
					<h1>'.$row['Titolo'].'</h1>
				</div>
				<div class="adminews">
					<h4>Scritto da ' .$row['AdminNick']. ' il ' .date('j M Y', strtotime($row['Data'])). '</h4>
				</div>
				<div class="imgnotizia">
					<img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['NomeGioco'].'"/>
				</div>
				<div class="testonotizia">
						<p> ' .$row['Testo']. ' </p>
				</div>
				<div class="inscommenti">
					<form>
					Commento:
				<textarea name="commento" input type="text" rows="10" cols="100"></textarea>
					<input type="submit" value="Submit">
					</form>
				</div>
				<div class="commenti">
					<h5>Nickcomment | Today at 3:30</h5>
					<p>commentocommentocommentocommentocommento commentocommentocommentocommentocommento commentocommentocommentocommentocommento</p>
				</div>
				<div class="commenti">
					<h5>Nickcomment | Today at 3:30</h5>
					<p>commentocommentocommentocommentocommento commentocommentocommentocommentocommento commentocommentocommentocommentocommento</p>
				</div> ';
				}
			}
		echo '</div> ';
		
?>
	</body>
</html>
