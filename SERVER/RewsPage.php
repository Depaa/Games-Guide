<?php
	session_start();
	include_once "config.php";
	
	$id = $_GET['id'];
	$query = "SELECT IDr, Recensione.NomeGioco, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco WHERE IDr=$id";
	
	
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	
	$query_commenti= "SELECT Titolorecensione, Commentirecensione.Data, Ora, Commento, NickName FROM Commentirecensione JOIN Recensione WHERE Commentirecensione.Titolorecensione=Recensione.Titolo AND Recensione.IDr=$id";
	$output2= $conn->query($query_commenti) or die("Errore nella query MySQL: ".$conn->error);
	
	
	
	$error_message=0;
	$success_message=0;
	if(isset($_POST['comment']))
	{
		if (!isset($_SESSION['userSession'])) 	/*se non c'è stato un accesso prima*/
		{
			$error_message= "devi fare l'accesso prima";
		}
		else
		{
			if(empty($_POST["commento"]))
			{
				$error_message= "inserisci un commento";
			}
			else
			{
				$query= "INSERT INTO `Commentirecensione` (`TitoloRecensione`, `Data`, `Ora`, `Commento`, `NickName`) 
				values ('', '', '', '$_POST[commento]', '');";
				$output= $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
			if(!empty($output)) 
			{
				$error_message = "";
				$success_message = "commento aggiunto con successo";
			} 
			else 
			{
				$success_message= "commento non aggiunto, riprovare";	
			}
			}
		}
	}
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
					<img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['NomeGioco'].'"/>
				</div>
				<div class="testonotizia">
						<p> ' .$row['Testo']. ' </p>
				</div>
				';
			}
		}
		if (!$output2)
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else
		{
				echo '<div class="inscommenti">
					<form method="post" action="" enctype="multipart/form-data">
					Commento:
					<textarea name="commento" input type="text" rows="10" cols="100"></textarea>
					<button class="aggiungibtn" type="submit" name="comment">Commenta</button>
					</form>
				</div>';
				foreach($output2 as $campo => $row2) 
				{
					echo '<div class="commenti">
						<h5>'.$row2['Nick']. ' | '.date('j M Y', strtotime($row2['Data'])).','.$row2 ['Ora'].'</h5>
						<p>'.$row2['Commento'].' </p>
					</div>';
				}
		}
		echo '</div> ';
?>
	</body>
</html>