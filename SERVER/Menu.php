<?php
	
	require_once 'config.php';
	require_once 'login.php';
	
	$queryR = "SELECT Recensione.NomeGioco, IDr, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco ORDER BY Data DESC LIMIT 4";
	$queryN = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 4";
	$outputR = $conn->query($queryR) or die("Errore nella query MySQL: ".$conn->error);
	$outputN = $conn->query($queryN) or die("Errore nella query MySQL: ".$conn->error);
	
		echo '<div class="navbar">';
			echo '<div class="dropdownlogo">';
				echo '<a href="index.php"><button class="dropbtnlogo">GAMES\' GUIDE</button></a>';
			echo '</div>';
			echo '<div class="dropdown">';
				echo '<a href="Notizie.php"><button class="dropbtn">Notizie<i class="fa fa-caret-down"></i></button></a>';
				echo '<div class="dropdown-content">';
				
			if(!$outputN) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				if($outputN->num_rows == 0)
					echo '<p> Nessuna notizia trovato </p>';
				else {
					foreach($outputN as $campo => $row) {
						echo '<div class="polaroid">';
							echo '<a href="NewsPage.php?id='.$row['ID'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'" lang="en"/></a>';
							echo '<div class="polaroidText">';
								echo '<p><a href="NewsPage.php?id='.$row['ID'].'">'.$row['Titolo'].'</a></p>';
							echo '</div>';
						echo '</div>';
						}
					
					echo '<div class="polaroid">';
						echo '<a href="Notizie.php"><img src="IMG\scopritutte.jpg" alt="Notizie Pagina Principale"/></a>';
						echo '<div class="polaroidText">';
							echo '<p><a href="Notizie.php">SCOPRI TUTTE LE NOSTRE NOTIZIE</a></p>';
						echo '</div>';
					echo '</div>';
				}
			}
				echo '</div>';
			echo '</div>';
			
			echo '<div class="dropdown">';
				echo '<a href="Recensione.php"><button class="dropbtn">Recensioni<i class="fa fa-caret-down"></i></button></a>';
				echo '<div class="dropdown-content">';
		
			if(!$outputR) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				if($outputR->num_rows == 0)
					echo '<p> Nessuna notizia trovato </p>';
				else {
					foreach($outputR as $campo => $row) {
						echo '<div class="polaroid">';
							echo '<a href="RewsPage.php?id='.$row['IDr'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'" lang="en"/></a>';
							echo '<div class="polaroidText">';
								echo '<a href="RewsPage.php?id='.$row['IDr'].'">'.$row['Titolo'].'</a>';
							echo '</div>';
						echo '</div>';
						}
						
					echo '<div class="polaroid">';
						echo '<a href="Recensione.php"><img src="IMG\scopritutte.jpg" alt="Recensioni Pagina Principale"/></a>';
						echo '<div class="polaroidText">';
							echo '<a href="Recensione.php">SCOPRI TUTTE LE NOSTRE RECENSIONI</a>';
						echo '</div>';
					echo '</div>';
				}
			}
				echo '</div>';
			echo '</div>';
			
			echo '<div class="dropdown">';
				echo '<a href="Videogiochi.php"><button class="dropbtn">Giochi<i class="fa fa-caret-down"></i></button></a>';
				echo '<div class="dropdown-content">';
					echo '<div class="column">';
						echo '<h3>Playstation</h3>';
						echo '<a href="VideogiochiM.php?id=p4">Playstation 4</a>';
						echo '<a href="VideogiochiM.php?id=p3">Playstation 3</a>';
						echo '<a href="VideogiochiM.php?id=p4p3">TUTTI</a>';
					echo '</div>';
					echo '<div class="column">';
						echo '<h3>Xbox</h3>';
						echo '<a href="VideogiochiM.php?id=xo">Xbox One</a>';
						echo '<a href="VideogiochiM.php?id=x3">Xbox 360</a>';
						echo '<a href="VideogiochiM.php?id=xox3">TUTTI</a>';
					echo '</div>';
					echo '<div class="column">';
						echo '<h3>Nintendo</h3>';
						echo '<a href="VideogiochiM.php?id=sw">Nintendo Switch</a>';
						echo '<a href="VideogiochiM.php?id=ds">Nintendo DS</a>';
						echo '<a href="VideogiochiM.php?id=swds">TUTTI</a>';
					echo '</div>';
					echo '<div class="column">';
						echo '<h3>PC</h3>';
						echo '<a href="VideogiochiM.php?id=win">Windows</a>';
						echo '<a href="VideogiochiM.php?id=mac">Mac</a>';
						echo '<a href="VideogiochiM.php?id=winmac">TUTTI</a>';
					echo '</div>';
					echo '<div class="column">';
						echo '<h3 class="colonnatutti"><a href="Videogiochi.php">TUTTI</a></h3>';
					echo '</div>';
				echo '</div>';
			echo '</div>';

			if (!isset($_SESSION['userSession'])) {	/*se non c'è stato un accesso prima*/
				echo '<div class="dropdownlogin">';
					echo '<button class="dropbtnlogin">Accedi<i class="fa fa-caret-down"></i></button>';
					echo '<div class="dropdown-content-login">';
						echo '<div class="containerlogin">';
							echo '<form name="loginForm" method="post" action="" onsubmit="return checkFormL()">';
								echo '<label>Username</label>';
								echo '<input type="text" name="uname" id="userL"/>';
								echo '<label>Password</label>';
								echo '<input type="password" name="psw" id="passwordL"/>';
								echo '<?php if(isset($msg)) {echo $msg;} ?>';
								echo '<button class="logsigninbtn" type="submit" name="submitA">Accedi</button>';
							echo '</form>';
							echo '<a href="registrazione.php"><button class="logsigninbtn">Registrati</button></a>';
							echo '<a href="recuperaPassword.php"> Password dimenticata? </a>';
						echo '</div>';
					echo '</div>';
				echo '</div>';
			} 
			else {
				$query = $conn->query("SELECT * FROM Account WHERE id=".$_SESSION['userSession']);
				$rowA=$query->fetch_array();
				echo '<div class="dropdownlogin">';
					echo '<button class="dropbtnlogin">'.$rowA['Nickname'].'<i class="fa fa-caret-down"></i></button>';
					echo '<div class="dropdown-content-login">';
						echo '<div class="containerlogin">';
							if($rowA['Admin']==1) { //se è admin allora può fare cose
								echo '<p>Aggiungi Contenuti</p>';
								echo '<a href="Admin.php"><button class="logsigninbtn">Aggiungi</button></a>';
							}
							echo '<p>Esci</p>';
							echo '<a href="logout.php?logout"><button class="logsigninbtn">Esci</button></a>';
						echo '</div>';
					echo '</div>';
				echo '</div>';
			}
		echo '</div>';
		
		echo '<!--inizio div per menu mobile-->';
			echo '<div class="sandwich">';
				echo '<div class="mobile-toggle">';
				echo '<a href="index.php">GAMES\' GUIDE</a>';
					echo '<div class="hamburger">';
						echo '<i class="fa fa-bars"></i>';
					echo '</div>';
				echo '</div>';
				echo '<ul class="menu collapse">';
					echo '<li><a href="index.php">Home</a><i class="fa fa-home"></i></li>';
					echo '<li><a href="Notizie.php">Notizie</a><i class="fa fa-newspaper-o"></i></li>';
					echo '<li><a href="Recensione.php">RECENSIONI</a><i class="fa fa-book"></i></li>';
					echo '<li><a href="Videogiochi.php">GIOCHI</a><i class="fa fa-gamepad"></i></li>';
					
					if (!isset($_SESSION['userSession'])) { //utente non collegato, accedi o registrati
						echo '<li><a href="accediM.php">ACCEDI</a><i class="fa fa-user-circle"></i></li>';
						echo '<li><a href="registrazione.php">REGISTRATI</a><i class="fa fa-sign-in"></i></li>';
					}
					else { //utente collegato, se sei admin allora puoi aggiungere sennò puoi solo uscire
						$query = $conn->query("SELECT * FROM Account WHERE id=".$_SESSION['userSession']);
						$rowB=$query->fetch_array();
						echo '<li>'.$rowB['Nickname'].'<i class="fa fa-user-circle"></i></li>';
						if($rowB['Admin']==1) { //se è admin allora può fare cose
							echo '<li><a href="Admin.php">AGGIUNGI</a></li>';
						}
						echo '<li><a href="logout.php?logout">ESCI</a><i class="fa fa-sign-out"></i></li>';
					}
						
				echo '</ul>';
			echo '</div>';
		echo '<!--fine div per menu mobile-->';
?>
<script type="text/javascript" src="JS/menuMobile.js"></script>
<?php
	$conn->close();
?>
