<?php
	session_start();
	include_once "config.php";
	
	$queryLIMITE="SELECT COUNT(*) AS Limite FROM Videogiochi";
	$outputLIMITE = $conn->query($queryLIMITE) or die("Errore nella query MySQL: ".$conn->error);
	$LIMITE = mysqli_fetch_assoc($outputLIMITE);
	
	$limitePAG=$LIMITE['Limite'];
	
	$maxPAG=3;
	$minPAG=0;
	
	$correntePAG=0; //pagina corrente
	
	$totPAG=($limitePAG/$maxPAG);
	if($totPAG<1)
		$totPAG=1;
	
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
	
	
	$query = "SELECT IDr, Videogiochi.ID, Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, Videogiochi.Data, PEGI, Descrizione FROM Videogiochi JOIN Immagini ON Videogiochi.Nome=Immagini.NomeGioco JOIN Recensione ON Videogiochi.Nome=Recensione.NomeGioco ORDER BY Videogiochi.Data DESC LIMIT $fine OFFSET $inizio";
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	
	require_once "filtro.php";
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>GamesGuide</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS\Style.css" media="handheld, screen"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
	</head> 

	<body>
		<?php 
			include 'Menu.php';
		?>
		

		<div class="videogiochi">
			<div class="filtro">
				<form action="" method="post">
					<div class="piattaforme">
					<h4> Piattaforme</h4>
					<h5>Xbox</h5>
					<label class="elenco"> Xbox One
						<input type="checkbox" name="xo"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Xbox 360
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
					<label class="elenco">3DS
						<input type="checkbox" name="ds"/>
						<span class="checkmark"></span>
					</label>

					<h5>PC</h5>
					<label class="elenco"> Windows
						<input type="checkbox" name="win"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Mac
						<input type="checkbox" name="mac"/>
						<span class="checkmark"></span>
					</label>
					<button class="filtrobtn" type="submit" name="submitP">Conferma</button>
				</div>
				</form>
				
				<form action="" method="post">
					<div class="generi">
					<h4> Generi</h4>
					<label class="elenco">Avventura
						<input type="checkbox" name="avv"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Azione
						<input type="checkbox" name="azi"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Sport
						<input type="checkbox" name="spo"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Simulazione
						<input type="checkbox" name="sim"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Strategia
						<input type="checkbox" name="str"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Musicale
						<input type="checkbox" name="mus"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Sparatutto
						<input type="checkbox" name="spa"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Picchiaduro
						<input type="checkbox" name="pic"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">FPS
						<input type="checkbox" name="fps"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Piattaforma
						<input type="checkbox" name="pia"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">RPG
						<input type="checkbox" name="rpg"/>
						<span class="checkmark"></span>
					</label>
					<label class="elenco">Horror
						<input type="checkbox" name="hor"/>
						<span class="checkmark"></span>
					</label>
					<button class="filtrobtn" type="submit" name="submitJ">Conferma</button>
				</div>
				</form>
			</div> 
			
<?php
		echo '<div class="giochi">'; /*oppure /giochi/ */
		if(!$output) 
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			if($output->num_rows == 0)
				echo '<p> Nessun gioco trovato </p>';
			else {
				foreach($output as $campo => $row) {
					echo '<div class="scheda">';
						if (isset($_SESSION['userSession'])!="") {
							if($rowA['Admin']==1) {
								echo '<a href="deletethings.php?id='.$row['ID'].'&table=Videogiochi"><button class="deletebtnVID" type="submit" name="submitE">Elimina</button></a>';
							}
						}
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
								echo '<p>' .date('j M Y', strtotime($row['Data'])). '</p>';
								echo '<p>' .$row['Genere1']. ' ' .$row['Genere2']. ' ' .$row['Genere3']. '</p>';
								echo '<p>' .$row['Disponibilita']. '</p>';
								echo '<p>' .$row['PEGI']. '</p>';
							echo '</div>';
							echo '<a href="RewsPage.php?id='.$row['IDr'].'"> La nostra recensione del gioco </a>';
							echo '<p>' .$row['Descrizione']. '</p>';
						echo '</div>';
					echo '</div>';
				}
			}
		}
		$precPAG=$correntePAG;
			$postPAG=$correntePAG;
			if($correntePAG>1)
				$precPAG=$correntePAG-1;
			if($correntePAG+1<$totPAG)
				$postPAG=$correntePAG+1;
			echo '<div class="pagbtn">';
				echo '<a href="Videogiochi.php?pag='.$precPAG.'">&laquo; </a>'; //<i class="fa fa-arrow-left"></i>
				echo '<a class="activepag" href="#">'.$correntePAG.'</a>';
				echo '<a href="Videogiochi.php?pag='.$postPAG.'"> &raquo;</a>';
			echo '</div>';
			echo '</div>'; /*giochi*/
		
			/*controlli più link per passare da una pagina all'altra*/
			
		
		echo '</div>'; /*videogiochi*/
	
?>
		<div class="footer">
			<h4>Progetto del corso di Tecnologie Web anno 2017-2018</h4>
		</div>
	
	</body>
</html>
