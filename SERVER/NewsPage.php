<?php
	session_start();
	include_once "config.php";
	
	$id = $_GET['id'];
	$query = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie WHERE ID=$id";
	
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
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
<?php
/*SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie*/
		echo '<div class="pagnotizia">';
		if(!$output) 
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			foreach($output as $campo => $row) {
				echo '<div class="titolonotizia">
					<h1>'.$row['Titolo'].'</h1>
				</div>
				<div class="adminews">
					<h4>Scritto da ' .$row['AdminNick']. ' il ' .date('j M Y', strtotime($row['Data'])). '</h4>
				</div>
				<div class="imgnotizia">
					<img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'"/>
				</div>
				<div class="testonotizia">
						<p> ' .$row['Testo']. ' </p>
				</div>
				<div class="inscommenti">
					<form>
					Commento:
				<textarea name="commento" input type="text" rows="10" cols="100"></textarea>
					<input type="submit" value="Submit">
					</form>
				</div>
				<div class="commenti">
					<h5>Nickcomment | Today at 3:30</h5>
					<p>commentocommentocommentocommentocommento commentocommentocommentocommentocommento commentocommentocommentocommentocommento</p>
				</div>
				<div class="commenti">
					<h5>Nickcomment | Today at 3:30</h5>
					<p>commentocommentocommentocommentocommento commentocommentocommentocommentocommento commentocommentocommentocommentocommento</p>
				</div> ';
				}
			}
		echo '</div> ';
		
?>
	</body>
</html>