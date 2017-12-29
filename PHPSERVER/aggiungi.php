<?php
	require "config.php";
	
	
	function Aggiungi()
	{
		session_start();
		
		$query= "INSERT INTO `giochi` (`Nome`, `DataPub`, `Genere1`, `Genere2`, `Genere3`, `PEGI`, `Disponibilita`, `Playstation3`, `Playstation4`, `Xbox360`,`XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Descrizione`)
		values  ('$_POST[gname]', '$_POST[gdata]', '$_POST[ggenere1]', '$_POST[ggenere2]' , '$_POST[ggenere3]', '$_POST[gpegi]', '$_POST[gdisp]', '". (isset($_POST['p3'])). "', '". (isset($_POST['p4'])). "', '". (isset($_POST['x3'])). "', '". (isset($_POST['xo'])). "', '". (isset($_POST['ds'])). "', '". (isset($_POST['sw'])). "', '". (isset($_POST['win'])). "', '". (isset($_POST['mac'])). "', '$_POST[gdesc]');";
		
		$nuovo_nome=basename($_FILES["gimgvid"]["name"]);//nuovo nome dell'immagine
		$nuovo_nome_vid=basename($_FILES["gimgvid"]["name"]."0");
		
		
		$query2="insert into `Immagini` (`NomeGioco`, `MenuImg`, `GiocoImg`) 
		values ('$_POST[gname]', '$nuovo_nome', '$nuovo_nome_vid');";
		$conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		$conn->query($query2) or die("Errore nella query MySQL: ".$conn->error);
		
		$file_temp=$_FILES['gimgmen']['tmp_name'];
		$file_temp_vid=$_FILES['gimgvid']['tmp_name']; //file temporaneo che contiene l'immagine caricata
		
		$percorso="IMG/"; //cartella sul server dove verrà spostata la foto
		
		$nuovo_nome=$percorso . basename($_FILES["gimgvid"]["name"]);//nuovo nome dell'immagine
		$nuovo_nome_vid=$percorso . basename($_FILES["gimgvid"]["name"]."0");
		
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
		$conn->close();
	}
	if(isset($_POST['submit'])) 
	{
		Aggiungi();
	}
?>