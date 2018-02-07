<?php
	session_start();
	include_once "config.php";
	
	$id = $_GET['id'];
	$query = "SELECT IDr, Recensione.NomeGioco, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco WHERE IDr=$id";
	
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	
	$recensioneA= $output->fetch_array();
	
	$query_commenti= "SELECT IDc, Commentirecensione.Data, Ora, Commento, NickName FROM Commentirecensione JOIN Recensione WHERE Commentirecensione.Titolorecensione=Recensione.Titolo AND Recensione.IDr=$id ORDER BY Data DESC, Ora DESC";
	$output2= $conn->query($query_commenti) or die("Errore nella query MySQL: ".$conn->error);
	
	
	$error_message=0;
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
				$queryNICK= "SELECT NickName FROM Account WHERE ID=".$_SESSION['userSession']."";
				$outputNICK= $conn->query($queryNICK) or die("Errore nella query MySQL: ".$conn->error);
				$nicknameA= $outputNICK->fetch_array();
				
				$queryINS= "INSERT INTO `Commentirecensione` (`TitoloRecensione`, `Data`, `Ora`, `Commento`, `NickName`) 
				values ('".$recensioneA['Titolo']."', '".date("Y-m-d"). "', '".date("H:i:s")."',  '$_POST[commento]', '". $nicknameA['NickName']."');";
				
				$outputINS= $conn->query($queryINS) or die("Erroreeeeeeeeeee nella query MySQL: ".$conn->error);
				if(!empty($outputINS)) 
				{
					$error_message = "";
					header("Location: RewsPage.php?id='".$recensioneA['IDr']."' ");
				} 
				
			}
		}
	}
?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>Games'Guide: <?php echo $recensioneA['NomeGioco'];?></title>
		
		<meta name="description" content="Scopri la nostra recensione del gioco <?php echo $recensioneA['NomeGioco'];?>">
		<meta name="author" content="Lucia Fenu, Francesco Battistella, Gianmarco Pettenuzzo, Matteo Depascale">
		<meta name="keywords" content="Videogiochi, Recensioni">
		<meta name="robots" content="index, follow">
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS/Style.css" media="handheld, screen"/>
		<link rel="stylesheet" type="text/css" href="CSS/StyleM.css" media="handheld, screen and (max-width:651px), only screen and (max-device-width:651px)"/>
		<link type="text/css" rel="stylesheet" href="CSS/StyleP.css" media="print"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="JS/goTop.js"></script>
	</head>
	
	<body>
<?php 
	include 'Menu.php';
	setlocale(LC_TIME, 'ita', 'it_IT');
	echo '<div class="pagnotizia">';
		if(!$output) 
			echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
		else {
			foreach($output as $campo => $row) {
				echo '<div class="titolonotizia">
					<h1 id="contenutoPrincipale">'.$row['Titolo'].'</h1>
				</div>
				<div class="adminews">
					<h4>Scritto da ' .$row['AdminNick']. ' il ' .strftime('%d %B %Y', strtotime($row['Data'])). '</h4>
				</div>
				<div class="imgnotizia">
					<img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['NomeGioco'].'" lang="en"/>
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
					<fieldset>
						<p>Commento: </p>
						<textarea name="commento" rows="10" cols="100"></textarea>
						<button class="deletebtn" type="submit" name="comment"> Commenta </button>';
					
						if($error_message) { 	
						echo'<div class="riga"> ';
							echo '<h4>'; if(isset($error_message)) {echo $error_message;}
							echo '</h4>';
						echo '</div>';
						} 
					echo '</fieldset>';
				echo '</form>
			</div>';
			foreach($output2 as $campo => $row2) 
			{
				echo '<div class="commenti">';
					echo '<h5>'.$row2['NickName']. ' | '.strftime('%d %B %Y', strtotime($row['Data'])).','.$row2 ['Ora'].'';
					if (isset($_SESSION['userSession'])!="") {
						if($rowA['Admin']==1) {
							echo '<a href="deletethings.php?id='.$recensioneA['IDr'].'&idc='.$row2['IDc'].'&table=Recensione"><button class="deletebtnUL" type="submit" name="submitE">Elimina</button></a>';
							echo '<a href="deletethings.php?id='.$recensioneA['IDr'].'&idc='.$row2['IDc'].'&table=Recensione"><em class="fa fa-trash"></em></a>';
						}
					}
					echo '</h5>';
					echo'<p>'.$row2['Commento'].' </p>';
				echo '</div>';
			}
		}
		echo '<button class="backtotop" id="backtotop" onclick="gotopFunction()">VAI SU</button>';
		echo '<em class="fa fa-arrow-circle-up" onclick="gotopFunctionM()"></em>';
		echo '</div> ';
?>

<?php 
	include 'Footer.php';
?>
	</body>
</html>
