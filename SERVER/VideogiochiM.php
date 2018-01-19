<?php
	session_start();
	include_once "config.php";
	
	$wh="WHERE 1=1 ";
	if($_GET['id']=='xo')
		$wh .= " AND Videogiochi.XboxOne=1";
	else if($_GET['id']=='x3')
		$wh .= " AND Videogiochi.Xbox360=1";
	else if($_GET['id']=='p4')
		$wh .= " AND Videogiochi.Playstation4=1";
	else if($_GET['id']=='p3')
		$wh .= " AND Videogiochi.Playstation3=1";
	else if($_GET['id']=='sw')
		$wh .= " AND Videogiochi.NintendoSwitch=1";
	else if($_GET['id']=='ds')
		$wh .= " AND Videogiochi.NintendoDS=1";
	else if($_GET['id']=='win')
		$wh .= " AND Videogiochi.Windows=1";
	else if($_GET['id']=='mac')
		$wh .= " AND Videogiochi.Mac=1";
	else if($_GET['id']=='xox3')
		$wh .= " AND Videogiochi.XboxOne=1 AND Videogiochi.Xbox360=1";
	else if($_GET['id']=='p4p3')
		$wh .= " AND Videogiochi.Playstation4=1 AND Videogiochi.Playstation3=1";
	else if($_GET['id']=='swds')
		$wh .= " AND Videogiochi.NintendoSwitch=1 AND Videogiochi.NintendoDS=1";
	else if($_GET['id']=='winmac')
		$wh .= " AND Videogiochi.Windows=1 AND Videogiochi.Mac=1";

	
	$queryLIMITE= "SELECT COUNT(*) AS Limite FROM Videogiochi JOIN Immagini ON Videogiochi.Nome=Immagini.NomeGioco JOIN Recensione ON Videogiochi.Nome=Recensione.NomeGioco $wh";
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
	$query= "SELECT IDr, Videogiochi.ID, Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, Videogiochi.Data, PEGI, Descrizione FROM Videogiochi JOIN Immagini ON Videogiochi.Nome=Immagini.NomeGioco JOIN Recensione ON Videogiochi.Nome=Recensione.NomeGioco $wh ORDER BY Videogiochi.Data DESC LIMIT $fine OFFSET $inizio";
	
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
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
		

		
<?php
		echo '<div class="giochiM">'; /*oppure /giochi/ */
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
		/*controlli più link per passare da una pagina all'altra*/
		$precPAG=$correntePAG;
		$postPAG=$correntePAG;
		if($correntePAG>1)
			$precPAG=$correntePAG-1;
		if($correntePAG+1<$totPAG)
			$postPAG=$correntePAG+1;
		echo '<div class="pagbtn">';
			echo '<a href="VideogiochiM.php?id='.$_GET['id'].'&pag='.$precPAG.'">&laquo; </a>'; //<i class="fa fa-arrow-left"></i>
			echo '<a class="activepag" href="#">'.$correntePAG.'</a>';
			echo '<a href="VideogiochiM.php?id='.$_GET['id'].'&pag='.$postPAG.'"> &raquo;</a>';
		echo '</div>';
		echo '</div>'; /*giochi*/
		
?>
		<div class="footer">
			<h4>Progetto del corso di Tecnologie Web anno 2017-2018</h4>
		</div>
	</body>
</html>