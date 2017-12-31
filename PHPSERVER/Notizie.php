<?php
	require "config.php";
	
	$query1 = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 1";
	$query = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC";
	//$conn = connessione();
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	$output1 = $conn->query($query1) or die("Errore nella query MySQL: ".$conn->error);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>GamesGuide</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		<link type="text/css" rel="stylesheet" href="CSS\StyleNotizie.css" media="handheld, screen"/>
		
		<!--serve per mettere icone carine -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<!--<meta http-equiv="refresh" content="3" />-->
		
	</head>
<body>
		<div class="navbar">
			<div class="dropdownlogo">
				<a href="Homee.php"><button class="dropbtnlogo">GAMES\'  GUIDE</button></a>
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


<!--- parte filtro -->


<div class="News">
<div class="filtro">
	<div class="piattaforme">
		<h4> Piattaforme</h4>
		<h5>Xbox</h5>
		<label class="elenco"> Xbox One
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Xbox 360
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>

		<h5>Playstation</h5>
		<label class="elenco"> Playstation 4
			<input type="checkbox"  name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco"> Playstation 3
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>

		<h5>Nintendo</h5>
		<label class="elenco"> Switch
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">3DS
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>

		<h5>PC</h5>
		<label class="elenco"> Windows
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Mac
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
	</div>

	<div class="data">
		<h4>Anno</h4>
		<label class="elenco">2018
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">2017
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">2016
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">2015
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">2014
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">2013
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">2012
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">2011
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">2010
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
	</div>
</div>

<!-- $query1 = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione ORDER BY Data DESC LIMIT 1"; -->

<?php
echo '<div class="Notizia">';
	echo '<div class="lastnews">';
		if(!$output1) 
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			if($output1->num_rows == 0)
				echo '<p> Nessuna notizia trovato </p>';
			else {
				foreach($output1 as $campo => $row) {
					echo '<div class="lastnewsimg">';
					echo '<a href="NewsPage.php?id='.$row['ID'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'"/></a>';
					echo '</div>';
					echo '<div class="lastnewsoverlay">';
						echo '<div class="lastnewstext">';
						echo '<h4>'.$row['Titolo'].'</h4>';
						echo '<p>Scritto da ' .$row['AdminNick']. ' il ' .date('j M Y', strtotime($row['Data'])). '</p>';
					echo '</div>';
					}
				}
			}
    echo '</div>';
echo '</div>';

	if(!$output) 
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			if($output->num_rows == 0)
				echo '<p> Nessuna notizia trovato </p>';
			else {
				foreach($output as $campo => $row) {
					echo '<div class="notizie">';
						echo '<div class="columnleft">';
						echo '<a href="NewsPage.php?id='.$row['ID'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'" class="imgrec"/></a>';
						echo '</div>';

						echo '<div class="columnright">';
							echo '<div class="testonews">';
								echo '<div class="titolonews">';
									echo '<a href="NewsPage.php?id='.$row['ID'].'" class="br">' .$row['Titolo']. '</a>';
									echo '<div class="By-date-news">';
										echo '<p>Scritto da ' .$row['AdminNick']. ' il ' .date('j M Y', strtotime($row['Data'])). '</p>';
									echo '</div>';
								echo '</div>';
							echo '</div>';
						echo '</div>';
					echo '</div>';
					}
				}
			}


?>

</div>
</div>
</body>
</html>