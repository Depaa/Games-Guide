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
	
	$queryLIMITE= "SELECT * FROM Videogiochi JOIN Immagini ON Videogiochi.Nome=Immagini.NomeGioco JOIN Recensione ON Videogiochi.Nome=Recensione.NomeGioco $wh";
	$outputLIMITE = $conn->query($queryLIMITE) or die("Errore nella query MySQL: ".$conn->error);
	$limitePAG = mysqli_num_rows($outputLIMITE);
	
	$maxPAG=4;
	$minPAG=0;
	
	$correntePAG=0; //pagina corrente
	
	$totPAG=ceil(($limitePAG)/$maxPAG); //arrotondo all'intero più grande
		
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
	$query= "SELECT IDr, Videogiochi.ID, Nome, GiocoImg, MenuImg, Genere1, Genere2, Genere3, Disponibilita, Videogiochi.Data, PEGI, Descrizione FROM Videogiochi JOIN Immagini ON Videogiochi.Nome=Immagini.NomeGioco JOIN Recensione ON Videogiochi.Nome=Recensione.NomeGioco $wh ORDER BY Videogiochi.Data DESC LIMIT $fine OFFSET $inizio";
	
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>GamesGuide</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS/Style.css" media="handheld, screen"/>
		<link rel="stylesheet" type="text/css" href="CSS/StyleM.css" media="handheld, screen and (max-width:620px), only screen and (max-device-width:620px)"/>
		<link type="text/css" rel="stylesheet" href="CSS/StyleP.css" media="print"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
		
		<script type="text/javascript" src="CSS/script.js"></script>
	</head> 

	<body>
		<?php 
			include 'Menu.php';
		?>
		

		
<?php
		setlocale(LC_TIME, 'ita', 'it_IT');
		
		if(!$output) 
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			if($output->num_rows == 0) {
				echo '<div class="nogamefoundM">';
					echo '<h4>Nessun gioco trovato, suggeriscici un gioco inviando una mail a gamesguide@assistenza.it</h4>';  //qua controllo 0results 
				echo '</div>';
			}
			else {
				echo '<div class="giochiM">'; /*oppure /giochi/ */
				foreach($output as $campo => $row) {
					echo '<div class="scheda">';
						if (isset($_SESSION['userSession'])!="") {
							if($rowA['Admin']==1) {
								echo '<a href="deletethings.php?id='.$row['ID'].'&table=Videogiochi"><button class="deletebtnVID" type="submit" name="submitE">Elimina</button></a>';
							}
						}
						echo '<h3>' .$row['Nome']. '</h3>';
						echo '<img class="immagine1" src="IMG\\' .$row['GiocoImg']. '" alt="' .$row['Nome']. '" lang="en"/>';
						echo '<img class="immagine2" src="IMG\\' .$row['MenuImg']. '" alt="' .$row['Nome']. '" lang="en"/>';
						echo '<div class="desc">';
							echo '<div class="descrizionesx">';
								echo '<p> Data uscita: ' .strftime('%d %B %Y', strtotime($row['Data'])). '</p>';
								echo '<p> Generi: ' .$row['Genere1']. ' ' .$row['Genere2']. ' ' .$row['Genere3']. '</p>';
								echo '<p> Disponibile per: ' .$row['Disponibilita']. ' </p>';
								echo '<p> PEGI: ' .$row['PEGI']. '</p>';
							echo '</div>';
							echo '<div class="descrec">';
								echo '<a href="RewsPage.php?id='.$row['IDr'].'"> La nostra recensione del gioco </a>';
							echo '</div>';
							echo '<div class="descgi">';
								echo '<p>' .$row['Descrizione']. '</p>';
							echo '</div>';
						echo '</div>';
					echo '</div>';
				}
				/*controlli più link per passare da una pagina all'altra*/
					$precPAG=$correntePAG;
					$postPAG=$correntePAG;
					if($correntePAG>1)
						$precPAG=$correntePAG-1;
					if($correntePAG+1<=$totPAG)
						$postPAG=$correntePAG+1;
					echo '<div class="pagbtn">';
						if($correntePAG>1) //nascondo il paging della prima pagina se siamo all'inizio
							echo '<a href="VideogiochiM.php?id='.$_GET['id'].'&pag='.$precPAG.'">&laquo; </a>'; //<i class="fa fa-arrow-left"></i>
						echo '<a class="activepag" href="#">'.$correntePAG.'</a>';
						if($correntePAG<$totPAG) //nascondo il paging dell'ultima pagina se siamo alla fine
							echo '<a href="VideogiochiM.php?id='.$_GET['id'].'&pag='.$postPAG.'"> &raquo;</a>';
					echo '</div>';
				echo '</div>'; /*giochi*/
			}
		}
		
?>
<?php 
	include 'Footer.php';
?>
	</body>
</html>
