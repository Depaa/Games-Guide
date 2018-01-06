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
		$wh .= "AND Videogiochi.Windows=1 AND Videogiochi.Mac=1";
	
	$query= "SELECT IDr, Videogiochi.ID, Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, Videogiochi.Data, PEGI, Descrizione FROM Videogiochi JOIN Immagini ON Videogiochi.Nome=Immagini.NomeGioco JOIN Recensione ON Videogiochi.Nome=Recensione.NomeGioco $wh ORDER BY Videogiochi.Data DESC";
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
		

	<div class="videogiochi">
		
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
		echo '</div>'; /*giochi*/
	echo '</body>';
echo '</html>';
?>
