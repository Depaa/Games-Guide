<?php
	session_start();
	include_once "config.php";
	
	$queryLIMITE="SELECT * FROM Notizie";
	$outputLIMITE = $conn->query($queryLIMITE) or die("Errore nella query MySQL: ".$conn->error);
	$limitePAG = mysqli_num_rows($outputLIMITE);
		
	$maxPAG=5;
	$minPAG=0;
	
	$correntePAG=0; //pagina corrente
	
	$totPAG=ceil(($limitePAG-1)/$maxPAG); //arrotondo all'intero più grande //limitePAG-1 perchè -1 è la notizia in primo piano
	//if($totPAG<1)
		//$totPAG=1;
	
	if(isset($_GET['pag'])) {
		$correntePAG=$_GET['pag'];
		if($correntePAG>0 && $correntePAG<=$totPAG) {
			$inizio=($correntePAG-1)*$maxPAG;
			$fine=$maxPAG;	//$fine=$inizio+$maxPAG;
		}
		else {
			if($correntePAG>$totPAG)
				$correntePAG=$correntePAG-1;
			else
				$correntePAG=1;
			$inizio=$minPAG;
			$fine=$maxPAG;
		}
	}
	else {
		$correntePAG=1;
		$inizio=$minPAG;
		$fine=$maxPAG;
	}
		
	$query1 = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 1"; //solo la prima immagine
	
	$inizio=$inizio+1;
	$query = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC LIMIT $fine OFFSET $inizio"; //solo la seconda immagine
	
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	$output1 = $conn->query($query1) or die("Errore nella query MySQL: ".$conn->error);
	
	require_once "filtro.php";
	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>Games'Guide: Notizie</title>
		<meta name="description" content="Scopri tutte le notizie sui fatti più recenti del mondo videoludico"/>
		<meta name="author" content="Lucia Fenu, Francesco Battistella, Gianmarco Pettenuzzo, Matteo Depascale"/>
		<meta name="keywords" content="Videogiochi, Notizie"/>
		<meta name="robots" content="index, follow"/>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS/Style.css" media="handheld, screen"/>
		<link rel="stylesheet" type="text/css" href="CSS/StyleM.css" media="handheld, screen and (max-width:651px), only screen and (max-device-width:651px)"/>
		<link type="text/css" rel="stylesheet" href="CSS/StyleP.css" media="print"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="JS/goTop.js"></script>
	</head>
	
	<body>
<?php 
	include 'Menu.php';
?>


	<div class="News">
		<div class="filtro">
			<form action="" method="post">
				<div class="piattaforme">
					<h4> Piattaforme</h4>
					<h5>Xbox</h5>
					<label class="elenco"> Xbox One
						<input type="checkbox" name="xo"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco"> Xbox 360
						<input type="checkbox" name="x3"/>
						<span class="checkmark"></span>
					</label>

					<h5>Playstation</h5>
					<label class="elenco"> Playstation 4
						<input type="checkbox"  name="p4"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco"> Playstation 3
						<input type="checkbox" name="p3"/>
						<span class="checkmark"></span>
					</label>

					<h5>Nintendo</h5>
					<label class="elenco"> Switch
						<input type="checkbox" name="sw"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco"> 3DS
						<input type="checkbox" name="ds"/>
						<span class="checkmark"></span>
					</label>

					<h5>PC</h5>
					<label class="elenco"> Windows
						<input type="checkbox" name="win"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco"> Mac
						<input type="checkbox" name="mac"/>
						<span class="checkmark"></span>
					</label>
					<button class="filtrobtn" type="submit" name="submitNP">Conferma</button>
				</div>
			</form>
				
			<form action="" method="post">
				<div class="data">
					<h4>Anno</h4>
					<label class="elenco">2018
						<input type="checkbox" name="2018"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">2017
						<input type="checkbox" name="2017"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">2016
						<input type="checkbox" name="2016"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">2015
						<input type="checkbox" name="2015"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">2014
						<input type="checkbox" name="2014"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">2013
						<input type="checkbox" name="2013"/>
						<span class="checkmark"></span>
					</label>
					<button class="filtrobtn" type="submit" name="submitND">Conferma</button>
				</div>
			</form>
		</div> 
		
<?php
	
			if(!$output1) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				if($output1->num_rows == 0){
					echo '<div class="nogamefound">';
						echo '<h4>Nessuna notizia trovata, suggeriscici un gioco inviando una mail a gamesguide@assistenza.it</h4>';  //qua controllo 0results 
					echo '</div>';
				}
				else {
					echo '<div class="Notizia">';
					echo '<div class="lastnews">';
					foreach($output1 as $campo => $row) {
						echo '<div class="lastnewsimg">';
						echo '<a id="contenutoPrincipale" href="NewsPage.php?id='.$row['ID'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'" lang="en"/></a>';
						echo '</div>';
						echo '<div class="lastnewsoverlay">';
							echo '<div class="lastnewstext">';
							echo '<h4>'.$row['Titolo'].'</h4>';
							setlocale(LC_TIME, 'ita', 'it_IT');
							echo '<p>Scritto da ' .$row['AdminNick']. ' il ' .strftime('%d %B %Y', strtotime($row['Data'])). '</p>';
							if (isset($_SESSION['userSession'])!="") {
								if($rowA['Admin']==1) {
									echo '<a href="deletethings.php?id='.$row['ID'].'&table=Notizie"><button class="deletebtnUL" type="submit" name="submitE">Elimina</button></a>';
									echo '<a href="deletethings.php?id='.$row['ID'].'&table=Notizie"><em id="trashln" class="fa fa-trash"></em></a>';
								}
							}
							echo '</div>';
						echo '</div>';
					}
				}
			}
			echo '</div>';
	
		if(!$output) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			if($output->num_rows == 0){
				echo '<div class="nonewsFound">';
				echo '</div>';
			}
			else {
				foreach($output as $campo => $row) {
					echo '<div class="notizie">';
						echo '<div class="columnleft">';
						echo '<a href="NewsPage.php?id='.$row['ID'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'" class="imgrec" lang="en"/></a>';
						echo '</div>'; // chiudo col left
						echo '<div class="columnright">';
							echo '<div class="testonews">';
								echo '<div class="titolonews">';
									echo '<a href="NewsPage.php?id='.$row['ID'].'" class="br">' .$row['Titolo']. '</a>';
									echo '<div class="By-date-news">';
										echo '<p>Scritto da ' .$row['AdminNick']. ' il ' .strftime('%d %B %Y', strtotime($row['Data'])). '</p>';
									echo '</div>'; /*chiudo bydate*/
									if (isset($_SESSION['userSession'])!="") {
										if($rowA['Admin']==1) {
											echo '<a href="deletethings.php?id='.$row['ID'].'&table=Notizie"><button class="deletebtn" type="submit" name="submitE">Elimina</button></a>';
											echo '<a href="deletethings.php?id='.$row['ID'].'&table=Notizie"><em class="fa fa-trash"></em></a>';
										}
									}
								echo '</div>'; /*chiudo titolo*/
							echo '</div>'; /*chiudo testo */
						echo '</div>'; /*chiudo col dx*/
					echo '</div>';/*chiudo notizie*/
				} //chiudo for
				if(!isset($_POST['submitND']) AND !isset($_POST['submitNP'])) {
					$prePAG=$correntePAG;
					$postPAG=$correntePAG;
					if($correntePAG>1)
						$prePAG=$correntePAG-1;
					if($correntePAG+1<=$totPAG)
						$postPAG=$correntePAG+1;
					echo '<div class="pagbtn">';
						if($correntePAG>1) //nascondo il paging della prima pagina se siamo all'inizio
							echo '<a href="Notizie.php?pag='.$prePAG.'">&laquo; </a>'; //<i class="fa fa-arrow-left"></i>
						echo '<a class="activepag" href="#">'.$correntePAG.'</a>';
						if($correntePAG<$totPAG) //nascondo il paging dell'ultima pagina se siamo alla fine
							echo '<a href="Notizie.php?pag='.$postPAG.'"> &raquo;</a>';
					echo '</div>';
				}
				else {
					echo '<div class="pagbtn">';
					echo '</div>';
				}
			}
		}
?>
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
