<?php
	require "dbConnection.php";

	$query = "SELECT Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, DataPub, PEGI, Descrizione FROM Giochi JOIN Immagini ON Giochi.Nome=Immagini.NomeGioco ORDER BY DataPub DESC";
	
	$output = $connection->query($query);
	//$head = file_get_contents('/template/head.txt');
	//$menu = file_get_contents('./template/Menu.txt');
	//$filtro = file_get_contents("./Filtro.txt");
	//echo $head;
	//echo $menu; /*ha dentro <body>*/
	
	echo '
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
		';
	
	echo '
		<body>
		<div class="navbar">
			<div class="dropdownlogo">
				<a href="Home.php"><button class="dropbtnlogo">GAMES  GUIDE</button></a>
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
					<form action="/action_page.php">
						<div class="containerlogin">
							<label>Username</label>
							<input type="text" name="uname"/> <!--placeholder="Enter Username"-->
							<!--il placeholder non ?upportato in html ma lo ?n html5, quindi non valida-->
							<label>Password</label>
							<input type="password" name="psw"/><!--required--> <!--placeholder="Enter Password"-->
							
							<button class="logsigninbtn" type="submit">Accedi</button>
							
							<button class="logsigninbtn" type="submit">Registrati</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	
		';
	
	
	echo '<div class="videogiochi">';
	
	echo '
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

		<h5>Mobile</h5>
		<label class="elenco"> Android
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">iOS
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
	</div>

	<div class="generi">
		<h4> Generi</h4>
		<label class="elenco">RPG
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Corse
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Simulatore
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Azione
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Sparatutto
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Avventura
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Picchiaduro
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Platform
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Horror
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Sport
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Strategia
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
	</div>
</div> 
	
		';
	
		echo '<div class="giochi">'; /*oppure /giochi/ */
		if(!$output) 
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			if($output->num_rows == 0)
				echo '<p> Nessun gioco trovato </p>';
			else {
				foreach($output as $campo => $row) {
						
						echo '<div class="scheda">';
						
							echo '<h3>' .$row['Nome']. '</h3>';
							echo '<img class="immagine" src="IMG\\' .$row['GiocoImg']. '"/>';
							echo '<div class="desc">';
								echo '<div class="descrizionesx">';
									echo '<p> Data uscita:</p>';
									echo '<p> Generi:</p>';
									echo '<p> Disponibile per:</p>';
									echo '<p> PEGI: </p>';
									
								echo '</div>';
								echo '<div class="descrizionedx">';
									echo '<p>' .date('j M Y', strtotime($row['DataPub'])). '</p>';
									echo '<p>' .$row['Genere1']. ' ' .$row['Genere2']. ' ' .$row['Genere3']. '</p>';
									echo '<p>' .$row['Disponibilita']. '</p>';
									echo '<p>' .$row['PEGI']. '</p>';
									
								echo '</div>';
								echo '<a href="#"> La nostra recensione del gioco </a>';
								echo '<p>' .$row['Descrizione']. '</p>';
							echo '</div>';		
							/*echo '<p><a href="viewpost.php?id='.$row['postID'].'">Read More</a></p>';				*/
						echo '</div>';

					}
			}
		}
		echo '</div>'; /*giochi*/
	echo '</div>'; /*videogiochi*/
echo '</body>';
echo '</html>';

mysqli_close($connection);	
?>