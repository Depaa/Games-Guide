<?php
	session_start();
	include_once "config.php";
	
	$id = $_GET['id'];
	$query = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie WHERE ID=$id";
	
	$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	
	$notizieA= $output->fetch_array();
	
	$query_commenti= "SELECT IDc, Commentinotizie.Data, Commentinotizie.Ora, Commento, NickName FROM Commentinotizie JOIN Notizie ON Commentinotizie.Titolonotizia=Notizie.Titolo WHERE Notizie.ID=$id ORDER BY Data, Ora DESC";
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
				
				$queryINS= "INSERT INTO `Commentinotizie` (`TitoloNotizia`, `Data`, `Ora`, `Commento`, `NickName`) 
				values ('".$notizieA['Titolo']."', '".date("Y-m-d"). "', '".date("h:i:s")."', '$_POST[commento]', '". $nicknameA['NickName']."');";
				$outputINS= $conn->query($queryINS) or die("Errore nella query MySQL: ".$conn->error);
				if(!empty($outputINS)) 
				{
					$error_message = "";
					header("Location: NewsPage.php?id='".$notizieA['ID']."' ");
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
					<button class="deletebtn" type="submit" name="comment"> Commenta </button>';
					
					 if($error_message) { 	
					echo'<div class="riga">
					 <h4>'; if(isset($error_message)) {echo $error_message;}
					echo '</h4>
					</div>';
					} 
					echo'</form>
				</div>';
				
				foreach($output2 as $campo => $row2) 
				{
					echo '<div class="commenti">';
					
						echo '<h5>'.$row2['NickName']. ' | '.date('j M Y', strtotime($row2['Data'])).','.$row2 ['Ora'].'';
						if (isset($_SESSION['userSession'])!="") {
						if($rowA['Admin']==1) {
							echo '<a href="deletethings.php?id='.$notizieA['ID'].'&idc='.$row2['IDc'].'&table=CommentiNotizie"><button class="deletebtnUL" type="submit" name="submitE">Elimina</button></a>';
						}
					}
						echo '</h5>';
						
						echo'<p>'.$row2['Commento'].' </p>';
						
					echo '</div>';
					
				}
		}
		echo '</div> ';
?>
	</body>
</html>