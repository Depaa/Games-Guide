<?php
	
	require_once 'config.php';
	require_once 'login.php';
	
	$queryR = "SELECT Recensione.NomeGioco, IDr, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco ORDER BY Data DESC LIMIT 4";
	$queryN = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 4";
	$outputR = $conn->query($queryR) or die("Errore nella query MySQL: ".$conn->error);
	$outputN = $conn->query($queryN) or die("Errore nella query MySQL: ".$conn->error);
	
	echo '<div class="mainContent">';
		echo '<a class="skip" href="#contenutoPrincipale">Vai al contenuto principale</a>';
	echo '</div>';
	
		echo '<div class="navbar">';
			
				echo '<a class="dropbtnlogo" href="index.php"><span lang="en"/>GAMES\' GUIDE</span></a>';
				echo '<div class="dropdown">';
					echo '<a class="dropbtn" href="Notizie.php">Notizie<em class="fa fa-caret-down"></em></a>';
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
								echo '<a href="NewsPage.php?id='.$row['ID'].'">'.$row['Titolo'].'</a>';
							echo '</div>';
						echo '</div>';
						}
					
					echo '<div class="polaroid">';
						echo '<a href="Notizie.php"><img src="IMG\scopritutte.jpg" alt="Notizie Pagina Principale"/></a>';
						echo '<div class="polaroidText">';
							echo '<a href="Notizie.php">SCOPRI TUTTE LE NOSTRE NOTIZIE</a>';
						echo '</div>';
					echo '</div>';
				}
			}
				echo '</div>';
			echo '</div>';
			
			echo '<div class="dropdown">';
				echo '<a class="dropbtn" href="Recensione.php">Recensioni<em class="fa fa-caret-down"></em></a>';
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
				echo '<a class="dropbtn" href="Videogiochi.php">Giochi<em class="fa fa-caret-down"></em></a>';
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
					echo '<a class="dropbtnlogin" href="accediM.php"><em class="fa fa-user-circle"></em></a>';
				echo '</div>';
			} 
			else {
				$query = $conn->query("SELECT * FROM Account WHERE id=".$_SESSION['userSession']);
				$rowA=$query->fetch_array();
				echo '<div class="dropdownlogin">';
				echo '<a class="dropbtnlogin" href="logout.php?logout">'.$rowA['Nickname'].' <em class="fa fa-sign-out"></em></a>';
					if($rowA['Admin']==1) {//se è admin allora può fare cose
						echo '<a class="dropbtnAG" href="Admin.php"><em class="fa fa-plus"></em></a>';
					}
				echo '</div>';
			}
		echo '</div>';
		
		echo '<!--inizio div per menu mobile-->';
			echo '<div class="sandwich">';
				echo '<div class="mobile-toggle">';
				echo '<a href="index.php">GAMES\' GUIDE</a>';
					echo '<div class="hamburger">';
						echo '<em class="fa fa-bars"></em>';
					echo '</div>';
				echo '</div>';
				echo '<ul class="menu collapse">';
					echo '<li><a href="index.php"><span lang="en">Home</span></a><em class="fa fa-home"></em></li>';
					echo '<li><a href="Notizie.php">Notizie</a><em class="fa fa-newspaper-o"></em></li>';
					echo '<li><a href="Recensione.php">RECENSIONI</a><em class="fa fa-book"></em></li>';
					echo '<li><a href="Videogiochi.php">GIOCHI</a><em class="fa fa-gamepad"></em></li>';
					
					if (!isset($_SESSION['userSession'])) { //utente non collegato, accedi o registrati
						echo '<li><a href="accediM.php">ACCEDI</a><em class="fa fa-user-circle"></em></li>';
						echo '<li><a href="registrazione.php">REGISTRATI</a><em class="fa fa-sign-in"></em></li>';
					}
					else { //utente collegato, se sei admin allora puoi aggiungere sennò puoi solo uscire
						$query = $conn->query("SELECT * FROM Account WHERE id=".$_SESSION['userSession']);
						$rowB=$query->fetch_array();
						echo '<li>'.$rowB['Nickname'].'<em class="fa fa-user-circle"></em></li>';
						if($rowB['Admin']==1) { //se è admin allora può fare cose
							echo '<li><a href="Admin.php">AGGIUNGI</a><em class="fa fa-plus"></em></li>';
						}
						echo '<li><a href="logout.php?logout">ESCI</a><em class="fa fa-sign-out"></em></li>';
					}
						
				echo '</ul>';
			echo '</div>';
		echo '<!--fine div per menu mobile-->';
?>
<script type="text/javascript" src="JS/menuMobile.js"></script>
<?php
	$conn->close();
?>