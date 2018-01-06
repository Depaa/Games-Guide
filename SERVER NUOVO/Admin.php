<?php
	session_start();
	include_once "config.php";
	
	$queryADMIN="SELECT Nickname FROM Account WHERE id=".$_SESSION['userSession']." ";
	$risultatoADMIN = $conn->query($queryADMIN) or die("Errore nella query MySQL: ".$conn->error);
	$nickADMIN = $risultatoADMIN->fetch_array();
	$error_messageG=0;
	$success_messageG=0;
	if(isset($_POST['submitG'])) 
	{
		
		if(empty($_POST["gname"]))
			$error_messageG = "All Fields are required";
		else if(empty($_POST["gdata"]))
			$error_messageG = "All Fields are required";
		else if(empty($_POST["ggenere1"]))
			$error_messageG = "All Fields are required";
		else if(empty($_POST["gpegi"]))
			$error_messageG = "All Fields are required";
		else if(empty($_POST["gdisp"]))
			$error_messageG = "All Fields are required";
		else if(empty($_POST["gdesc"]))
			$error_messageG = "All Fields are required";
		/*else if(!filter_var($_POST["gname"], FILTER_VALIDATE_EMAIL)) //va finito 
			$error_messageG = "Gioco Duplicato";*/
		else {
			$query= "INSERT INTO `Videogiochi` (`Nome`, `Data`, `Genere1`, `Genere2`, `Genere3`, `PEGI`, `Disponibilita`, `Playstation3`, `Playstation4`, `Xbox360`,`XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Descrizione`)
			values  ('$_POST[gname]', '$_POST[gdata]', '$_POST[ggenere1]', '$_POST[ggenere2]' , '$_POST[ggenere3]', '$_POST[gpegi]', '$_POST[gdisp]', '". (isset($_POST['p3'])). "', '". (isset($_POST['p4'])). "', '". (isset($_POST['x3'])). "', '". (isset($_POST['xo'])). "', '". (isset($_POST['ds'])). "', '". (isset($_POST['sw'])). "', '". (isset($_POST['win'])). "', '". (isset($_POST['mac'])). "', '$_POST[gdesc]');";
		
			$nuovo_nome=basename($_FILES["gimgvid"]["name"]);//nuovo nome dell'immagine
			$nuovo_nome_vid= "game-" .basename($_FILES["gimgvid"]["name"]);
		
		
			$query2="insert into `Immagini` (`NomeGioco`, `MenuImg`, `GiocoImg`) 
			values ('$_POST[gname]', '$nuovo_nome', '$nuovo_nome_vid');";
			$output= $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
			if(!empty($output)) 
			{
				$error_messageG = "";
				$success_messageG = "Gioco aggiunto con successo";
			} 
			else 
			{
				$success_messageG = "Gioco non aggiunto, riprovare";	
			}
			$output1= $conn->query($query2) or die("Errore nella query MySQL: ".$conn->error);
			
			$file_temp=$_FILES['gimgmen']['tmp_name'];
			$file_temp_vid=$_FILES['gimgvid']['tmp_name']; //file temporaneo che contiene l'immagine caricata
			
			$percorso="IMG/"; //cartella sul server dove verrà spostata la foto
			
			$nuovo_nome=$percorso . basename($_FILES["gimgvid"]["name"]);//nuovo nome dell'immagine
			$nuovo_nome_vid=$percorso . "game-" .basename($_FILES["gimgvid"]["name"]);
			
			$inviato=file_exists($file_temp);
			$inviato_vid=file_exists($file_temp_vid); //verifica se il file è stato caricato sul server
		
			if ($inviato) {
				move_uploaded_file($_FILES["gimgmen"]["tmp_name"],$nuovo_nome);
				header("Admin.php"); // sposto l'immagine nella cartella e vado alla pagina di visualizzazione
			}
		
			if ($inviato_vid) {
				move_uploaded_file($_FILES["gimgvid"]["tmp_name"],$nuovo_nome_vid);
				header("Admin.php"); // sposto l'immagine nella cartella e vado alla pagina di visualizzazione
			}
		}
	}
	$error_messageN=0;
	$success_messageN=0;
	if(isset($_POST['submitN']))
	{
		if(empty($_POST["ndata"]))
			$error_messageN = "All Fields are required";
		else if(empty($_POST["ntit"]))
			$error_messageN = "All Fields are required";
		
		else if(empty($_POST["ntest"]))
			$error_messageN = "All Fields are required";
		else 
		{
			$nuovo_nome=basename($_FILES["nimg"]["name"]);
		
			$query= "INSERT INTO `notizie` (`Data`, `Titolo`, `AdminNick`, `Testo`, `Playstation3`, `Playstation4`, `Xbox360`,`XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `MenuImg`)
			values ('$_POST[ndata]', '$_POST[ntit]', '".$nickADMIN['Nickname']."', '$_POST[ntest]' ,'". (isset($_POST['p3'])). "', '". (isset($_POST['p4'])). "', '". (isset($_POST['x3'])). "', '". (isset($_POST['xo'])). "', '". (isset($_POST['ds'])). "', '". (isset($_POST['sw'])). "', '". (isset($_POST['win'])). "', '". (isset($_POST['mac'])).  "', '$nuovo_nome');";
		
			$output= $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
			if(!empty($output)) 
			{
				$error_messageN = "";
				$success_messageN = "News aggiunto con successo";
			} 
			else 
			{
				$success_messageN = "News non aggiunto, riprovare";	
			}
		
			$file_temp=$_FILES['nimg']['tmp_name'];
		
			$percorso="IMG/"; //cartella sul server dove verrà spostata la foto
		
			$nuovo_nome=$percorso . basename($_FILES["nimg"]["name"]);//nuovo nome dell'immagine
		
			$inviato=file_exists($file_temp);
			
			if ($inviato) 
			{
				move_uploaded_file($_FILES["nimg"]["tmp_name"],$nuovo_nome);
				header("Admin.php"); // sposto l'immagine nella cartella e vado alla pagina di visualizzazione
			}
			
		}
	}
	$error_messageR=0;
	$success_messageR=0;
	if(isset($_POST['submitR']))
	{
		if(empty($_POST["rdata"]))
			$error_messageR = "All Fields are required";
		else if(empty($_POST["rtit"]))
			$error_messageR = "All Fields are required";
		else if(empty($_POST["rdesc"]))
			$error_messageR = "All Fields are required";
		else if(empty($_POST["rname"]))
			$error_messageR = "All Fields are required";
		else 
		{
			$nome_gioco = $_POST['rname'];
			$query_controllo= "SELECT * FROM Videogiochi WHERE Videogiochi.nome = '$nome_gioco';";
			$controllo=$conn->query($query_controllo) or die("Errore nella query MySQL: ".$conn->error);
			if($controllo->num_rows== 0)
			{
				$error_messageR = "il gioco non esiste";
			}
			else
			{				
				$query= "INSERT INTO `recensione` (`NomeGioco`, `AdminNick`, `Titolo`, `Testo`, `Data`, `Playstation3`, `Playstation4`, `Xbox360`,`XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`)
				values ('$_POST[rname]', '".$nickADMIN['Nickname']."', '$_POST[rtit]', '$_POST[rdesc]' , '$_POST[rdata]', '". (isset($_POST['p3'])). "', '". (isset($_POST['p4'])). "', '". (isset($_POST['x3'])). "', '". (isset($_POST['xo'])). "', '". (isset($_POST['ds'])). "', '". (isset($_POST['sw'])). "', '". (isset($_POST['win'])). "', '". (isset($_POST['mac'])).  "');";
		
				$output= $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
				if(!empty($output)) 
				{
					$error_messageR = "";
					$success_messageR = "Recensione aggiunta con successo";
				} 
				else 
				{
					$success_messageR = "Recensione non aggiunta, riprovare";	
				}	
			}
		}
		
	}
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS\Style.css" media="handheld, screen"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
			
	</head>
	<body>
		<?php 
				include 'Menu.php';
		?>
			
		<div class="localA">
			<p><a href="#AG">Aggiungi Gioco</a></p>
			<p><a href="#AN">Aggiungi News</a></p>
			<p><a href="#AR">Aggiungi Recensione</a></p>
		</div>
			
		<div class="opzioniA">
			<div class="AggA">
			<h3 id="AG"> AGGIUNGI GIOCO</h3>
				<div class="aggiungi-contentA">
					<form method="post" action="" enctype="multipart/form-data">
						<div class="rigaA">
						<?php if($success_messageG) { ?>
						<div class="rigaA">
							<h4><?php if(isset($success_messageG)) echo $success_messageG; ?></h4>
						</div>
						<?php } ?>
						<?php if($error_messageG) { ?>	
						<div class="rigaA">
							<h4><?php if(isset($error_messageG)) echo $error_messageG; ?></h4>
						</div>
						<?php } ?>
							<h4>Nome Gioco</h4>
							<input type="text" name="gname" value ="<?php if(isset($_POST['gname'])) echo $_POST['gname']; ?>" /> 
						</div>
						<div class="rigaA">	
							<h4>Data Pubblicazione (aaaa-mm-gg)</h4>
							<input type="text" name="gdata" value ="<?php if(isset($_POST['gdata'])) echo $_POST['gdata']; ?>"/>
						</div>
						
						<div class="rigaA">
							<h4>Genere1</h4>
							<input type="text" name="ggenere1" value ="<?php if(isset($_POST['ggenere1'])) echo $_POST['ggenere1']; ?>"/>
						</div>
						<div class="rigaA">
						   <h4>Genere2</h4>
							<input type="text" name="ggenere2" value ="<?php if(isset($_POST['ggenere2'])) echo $_POST['ggenere2']; ?>"/>
						</div>
						<div class="rigaA">
							<h4>Genere3</h4>
							<input type="text" name="ggenere3" value ="<?php if(isset($_POST['ggenere3'])) echo $_POST['ggenere3']; ?>"/>
						</div>
						<div class="rigaA">	
							<h4>PEGI</h4>
							<input type="text" name="gpegi" value ="<?php if(isset($_POST['gpegi'])) echo $_POST['gpegi']; ?>"/>
						</div>
						<div class="rigaA">	
							<h4>Piattaforme Disponibili (testo con virgola)</h4>
							<input type="text" name="gdisp" value ="<?php if(isset($_POST['gdisp'])) echo $_POST['gdisp']; ?>"/>
						</div>	
						<div class="rigaA">
							<label class="elencoA"> Xbox One
								<input type="checkbox" name="xo"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">Xbox 360
								<input type="checkbox" name="x3"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Playstation 4
								<input type="checkbox"  name="p4"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Playstation 3
								<input type="checkbox" name="p3"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Switch
								<input type="checkbox" name="sw"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">3DS
								<input type="checkbox" name="ds"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Windows
								<input type="checkbox" name="win"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">Mac
								<input type="checkbox" name="mac"/>
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="rigaA">
							<h4>Descrizione</h4>
							<textarea name="gdesc" rows="10" cols="50"><?php if(isset($_POST['gdesc'])) echo $_POST['gdesc']; ?></textarea> 
						</div>
						 
						<div class="rigaA">	
							<h4>Immagine Menu</h4>
							<input type="file" name="gimgmen"/>
						</div>
						<div class="rigaA">	
							<h4>Immagine Giochi</h4>
							<input type="file" name="gimgvid" id="gimgvid"/>
						</div> 
						   
							<p><button class="aggiungibtnA" type="submit" name="submitG">Conferma</button></p>
						
					</form>
				</div>
			</div>
			<div class="AggA">
			<h3 id="AN"> AGGIUNGI NEWS</h3>
				<div class="aggiungi-contentA">
					<form method="post" action="" enctype="multipart/form-data">
					<?php if($success_messageN) { ?>
						<div class="rigaA">
							<h4><?php if(isset($success_messageN)) echo $success_messageN?></h4>
						</div>
						<?php } ?>
						<?php if($error_messageN) { ?>	
						<div class="rigaA">
							<h4><?php if(isset($error_messageN)) echo $error_messageN?></h4>
						</div>
						<?php } ?>
						<div class="rigaA">
							<h4>Titolo News</h4>
							<input type="text" name="ntit" value ="<?php if(isset($_POST['ntit'])) echo $_POST['ntit']; ?>"/> 
						</div>
						<div class="rigaA">	
							<h4>Data Pubblicazione</h4>
							<input type="text" name="ndata" value ="<?php if(isset($_POST['ndata'])) echo $_POST['ndata']; ?>" />
						</div>
						
						
						<div class="rigaA">
							<label class="elencoA"> Xbox One
								<input type="checkbox" name="xo"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">Xbox 360
								<input type="checkbox" name="x3"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Playstation 4
								<input type="checkbox"  name="p4"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Playstation 3
								<input type="checkbox" name="p3"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Switch
								<input type="checkbox" name="sw"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">3DS
								<input type="checkbox" name="ds"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Windows
								<input type="checkbox" name="win"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">Mac
								<input type="checkbox" name="mac"/>
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="rigaA">
							<h4>Testo</h4>
							<textarea name="ntest" rows="10" cols="50"> <?php if(isset($_POST['ntest'])) echo $_POST['ntest']; ?></textarea> 
						</div>
						<div class="rigaA">	
							<h4>Immagine News</h4>
							<input type="file" name="nimg"/>
						</div>                       
							<p><button class="aggiungibtnA" type="submit" name="submitN">Conferma</button></p>
					</form>
				</div>
			</div>
			<div class="AggA">
			<h3 id="AR"> AGGIUNGI RECENSIONE</h3>
				<div class="aggiungi-contentA">
					<form method="post" action="" enctype="multipart/form-data">
					<?php if($success_messageR) { ?>
						<div class="rigaA">
							<h4><?php if(isset($success_messageR)) echo $success_messageR?></h4>
						</div>
						<?php } ?>
						<?php if($error_messageR) { ?>	
						<div class="rigaA">
							<h4><?php if(isset($error_messageR)) echo $error_messageR?></h4>
						</div>
						<?php } ?>
						<div class="rigaA">
							<h4>Nome Gioco</h4>
							<input type="text" name="rname" value ="<?php if(isset($_POST['rname'])) echo $_POST['rname']; ?>" /> 
						</div>
						
						<div class="rigaA">	
							<h4>Data Pubblicazione</h4>
							<input type="text" name="rdata" value ="<?php if(isset($_POST['rdata'])) echo $_POST['rdata']; ?>"/>
						</div>
						<div class="rigaA">	
							<h4>Titolo Recensione</h4>
							<input type="text" name="rtit" value ="<?php if(isset($_POST['rtit'])) echo $_POST['rtit']; ?>"/>
						</div>	
						<div class="rigaA">
							<label class="elencoA"> Xbox One
								<input type="checkbox" name="xo"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">Xbox 360
								<input type="checkbox" name="x3"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Playstation 4
								<input type="checkbox"  name="p4"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Playstation 3
								<input type="checkbox" name="p3"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Switch
								<input type="checkbox" name="sw"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">3DS
								<input type="checkbox" name="ds"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA"> Windows
								<input type="checkbox" name="win"/>
								<span class="checkmark"></span>
							</label>
							<label class="elencoA">Mac
								<input type="checkbox" name="mac"/>
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="rigaA">
							<h4>Testo Recensione</h4>
							<textarea name="rdesc" rows="10" cols="50"><?php if(isset($_POST['rdesc'])) echo $_POST['rdesc']; ?></textarea> 
						</div>
							<p><button class="aggiungibtnA" type="submit" name="submitR">Conferma</button></p>
					</form>
				</div>
			</div>
		</div>
	<?php
		$conn->close();
	?>
	</body>
</html>
