<?php
	session_start();
	include_once "config.php";
	
	$queryIN = "SELECT ID, Titolo, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 2";
	$queryIR = "SELECT IDr, Titolo, MenuImg, Recensione.NomeGioco FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco ORDER BY Data DESC LIMIT 2";
	
	$outputIN = $conn->query($queryIN) or die("Errore nella query MySQL: ".$conn->error);
	$outputIR = $conn->query($queryIR) or die("Errore nella query MySQL: ".$conn->error);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>Games'Guide</title>
		
		<meta name="description" content="Scopri tutte le notizie e le recensioni riguardo il mondo videoludico">
		<meta name="author" content="Lucia Fenu, Francesco Battistella, Gianmarco Pettenuzzo, Matteo Depascale">
		<meta name="keywords" content="Notizie, Recensioni, Videogiochi">
		<meta name="robots" content="index, follow">
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS/Style.css" media="handheld, screen"/>
		<link rel="stylesheet" type="text/css" href="CSS/StyleM.css" media="handheld, screen and (max-width:651px), only screen and (max-device-width:651px)"/>
		<link type="text/css" rel="stylesheet" href="CSS/StyleP.css" media="print"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<!--per jquery, host google-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			
		<script type="text/javascript" src="JS/goTop.js"></script>
	</head>
	
	<body>
		<script type="text/javascript" src="JS/formControls.js"></script>
		<?php 
			include 'Menu.php';
		?>
		
		<div class="pagecontent">
			<div class="slides-content">
		<?php
			if(!$outputIN) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				foreach($outputIN as $campo => $row) {
					echo '<div class="mySlides">';
						echo '<a id="contenutoPrincipale" href="NewsPage.php?id='.$row['ID'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'"/></a>';
						echo '<div class="textslide">';
							echo '<h1>'.$row['Titolo'].'</h1>';
						echo '</div>';
					echo '</div>';
				}
			}
			if(!$outputIR) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				foreach($outputIR as $campo => $row) {
					echo '<div class="mySlides">';
						echo '<a href="RewsPage.php?id='.$row['IDr'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['NomeGioco'].'" lang="en"/></a>';
						echo '<div class="textslide">';
							echo '<h1>'.$row['Titolo'].'</h1>';
						echo '</div>';
					echo '</div>';
				}
			}
		?>
				<a class="prev" onclick="slideMuovi(-1)">&laquo;</a>
				<a class="next" onclick="slideMuovi(1)">&raquo;</a>
				<div class="dottod">
					<span class="dot" onclick="slideCorrente(1)"></span> 
					<span class="dot" onclick="slideCorrente(2)"></span> 
					<span class="dot" onclick="slideCorrente(3)"></span> 
					<span class="dot" onclick="slideCorrente(4)"></span> 
				</div>
			</div>
		<div id="backtotop" class="backtotop">
			<button onclick="gotopFunction()"><em class="fa fa-arrow-circle-up"></em></button>
		</div>
		</div> 
		
		<!--script che permette di visualizzare l'effetto slide della home-->
		<script type="text/javascript" src="JS/indexSlides.js"></script>
		
<?php 
	include 'Footer.php';
?>

	</body>
</html> 
