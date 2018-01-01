<?php
	
	require_once 'config.php';
		
	if (isset($_POST['submitA'])) {
		$nick = strip_tags($_POST['uname']);
		$password = strip_tags($_POST['psw']);
		
		$nick = $conn->real_escape_string($nick);
		$password = $conn->real_escape_string($password);
		
		$query = $conn->query("SELECT id, Nickname, Password FROM account WHERE Nickname='$nick'");
		$row=$query->fetch_array();
	 
		$count = $query->num_rows; // if nick/password are correct returns must be 1 row

		if ($password==$row['Password'] && $count==1) {
			$_SESSION['userSession'] = $row['id'];
		} 
		else {
			$msg = "<label> Invalid Username or Password </label>";
		}
	}
	
	$queryR = "SELECT Recensione.NomeGioco, IDr, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco ORDER BY Data DESC LIMIT 4";
	
	$queryN = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 4";
	
	$outputR = $conn->query($queryR) or die("Errore nella query MySQL: ".$conn->error);
	$outputN = $conn->query($queryN) or die("Errore nella query MySQL: ".$conn->error);

		echo '<div class="navbar">';
			echo '<div class="dropdownlogo">';
				echo '<a href="index.php"><button class="dropbtnlogo">GAMES\' GUIDE</button></a>';
			echo '</div>';
			echo '<div class="dropdown">';
				echo '<button class="dropbtn">Notizie<i class="fa fa-caret-down"></i></button>';
				echo '<div class="dropdown-content">';
				
			if(!$outputN) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				if($outputN->num_rows == 0)
					echo '<p> Nessuna notizia trovato </p>';
				else {
					foreach($outputN as $campo => $row) {
						echo '<div class="polaroid">';
							echo '<a href="NewsPage.php?id='.$row['ID'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'"/></a>';
							echo '<div class="polaroidText">';
								echo '<p><a href="NewsPage.php?id='.$row['ID'].'">'.$row['Titolo'].'</a></p>';
							echo '</div>';
						echo '</div>';
						}
					
					echo '<div class="polaroid">';
						echo '<a href="Notizie.php"><img src="IMG\alexaecho.jpg" alt="Notizie Pagina Principale"/></a>';
						echo '<div class="polaroidText">';
							echo '</p><a href="Notizie.php">SCOPRI TUTTE LE NOSTRE NOTIZIE</a></p>';
						echo '</div>';
					echo '</div>';
				}
			}
			echo '</div>';
			echo '</div>';
			
			echo '<div class="dropdown">';
				echo '<button class="dropbtn">Recensioni<i class="fa fa-caret-down"></i></button>';
				echo '<div class="dropdown-content">';
		
			if(!$outputR) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				if($outputR->num_rows == 0)
					echo '<p> Nessuna notizia trovato </p>';
				else {
					foreach($outputR as $campo => $row) {
						echo '<div class="polaroid">';
							echo '<a href="RewsPage.php?id='.$row['IDr'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'"/></a>';
							echo '<div class="polaroidText">';
								echo '<a href="RewsPage.php?id='.$row['IDr'].'">'.$row['Titolo'].'</a>';
							echo '</div>';
						echo '</div>';
						}
						
					echo '<div class="polaroid">';
						echo '<a href="Recensione.php"><img src="IMG\alexaecho.jpg" alt="Recensioni Pagina Principale"/></a>';
						echo '<div class="polaroidText">';
							echo '<a href="Recensione.php">SCOPRI TUTTE LE NOSTRE RECENSIONI</a>';
						echo '</div>';
					echo '</div>';
				}
			}
				echo '</div>';
			echo '</div>';
			
			echo '<div class="dropdown">';
				echo '<button class="dropbtn">Videogiochi<i class="fa fa-caret-down"></i></button>';
				echo '<div class="dropdown-content">';
					echo '<div class="column">';
						echo '<h3>Playstation</h3>';
						echo '<a href="#">Playstation 4</a>';
						echo '<a href="#">Playstation 3</a>';
						echo '<a href="#">TUTTI</a>';
					echo '</div>';
					echo '<div class="column">';
						echo '<h3>Xbox</h3>';
						echo '<a href="#">Xbox One</a>';
						echo '<a href="#">Xbox 360</a>';
						echo '<a href="#">TUTTI</a>';
					echo '</div>';
					echo '<div class="column">';
						echo '<h3>Nintendo</h3>';
						echo '<a href="Admin.php">Nintendo Switch</a>';
						echo '<a href="#">Nintendo DS</a>';
						echo '<a href="#">TUTTI</a>';
					echo '</div>';
					echo '<div class="column">';
						echo '<h3>PC</h3>';
						echo '<a href="#">Windows</a>';
						echo '<a href="#">Mac</a>';
						echo '<a href="#">TUTTI</a>';
					echo '</div>';
					echo '<div class="column">';
						echo '<h3>TUTTI</h3>';
						echo '<a href="Videogiochi.php">TUTTI</a>';
						echo '<a href="Videogiochi.php">TUTTI</a>';
						echo '<a href="Videogiochi.php">TUTTI</a>';
					echo '</div>';
				echo '</div>';
			echo '</div>';
			if (!isset($_SESSION['userSession'])) {	/*se non c'� stato un accesso prima*/
				echo '<div class="dropdownlogin">';
					echo '<button class="dropbtnlogin">Accedi<i class="fa fa-caret-down"></i></button>';
					echo '<div class="dropdown-content-login">';
						echo '<div class="containerlogin">';
							echo '<form method="POST" action="">';
								echo '<label>Username</label>';
								echo '<input type="text" name="uname" value="admin"/>';
								echo '<label>Password</label>';
								echo '<input type="password" name="psw" value="admin"/>';
								echo '<?php if(isset($msg)) {echo $msg;} ?>';
								echo '<button class="logsigninbtn" type="submit" name="submitA">Accedi</button>';
							echo '</form>';
							echo '<a href="registrazione.php"><button class="logsigninbtn">Registrati</button></a>';
						echo '</div>';
					echo '</div>';
				echo '</div>';
			} 
			else {
				$query = $conn->query("SELECT * FROM account WHERE id=".$_SESSION['userSession']);
				$rowA=$query->fetch_array();
				echo '<div class="dropdownlogin">';
					echo '<button class="dropbtnlogin">Ciao, '.$rowA['Nickname'].'<i class="fa fa-caret-down"></i></button>';
					echo '<div class="dropdown-content-login">';
						echo '<div class="containerlogin">';
							if($rowA['Admin']==1) { //se � admin allora pu� fare cose
								echo '<label>Aggiungi schiavo</label>';
								echo '<a href="Admin.php"><button class="logsigninbtn">Aggiungi</button></a>';
							}
							echo '<label>Vattene</label>';
							echo '<a href="logout.php?logout"><button class="logsigninbtn">Esci</button></a>';
						echo '</div>';
					echo '</div>';
				echo '</div>';
			}
		echo '</div>';
	$conn->close();
?>