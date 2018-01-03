<?php
	session_start();
	include_once "config.php";
	
	$query1 = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 1";
	$query = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 100 OFFSET 1";
	
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
		<link type="text/css" rel="stylesheet" href="CSS\Style.css" media="handheld, screen"/>
		
		<!--serve per mettere icone carine -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<!--<meta http-equiv="refresh" content="3" />-->
		
	</head>
<body>
		<?php 
			include 'Menu.php';
		?>
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
					if (isset($_SESSION['userSession'])!="") {
						if($rowA['Admin']==1) {
							echo '<a href="deletethings.php?id='.$row['ID'].'&table=Notizie"><button class="deletebtnUL" type="submit" name="submitE">Elimina</button></a>';
						}
					}
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
								if (isset($_SESSION['userSession'])!="") {
									if($rowA['Admin']==1) {
										echo '<a href="deletethings.php?id='.$row['ID'].'&table=Notizie"><button class="deletebtnUL" type="submit" name="submitE">Elimina</button></a>';
									}
								}
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