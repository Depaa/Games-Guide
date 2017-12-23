<?php
	require "config.php";
	function Aggiungi()
	{
		session_start();
		$conn = connessione();
		$query= "INSERT INTO `giochi` (`Nome`, `DataPub`, `Genere1`, `Genere2`, `Genere3`, `PEGI`,`Valutazione`, `Disponibilita`, `Playstation3`, `Playstation4`, `Xbox360`,`XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Descrizione`)
		values  ('$_POST[gname]', '$_POST[gdata]', '$_POST[ggenere1]', null , null, '$_POST[gpegi]', null, '$_POST[gdisp]', '$_POST[p3]', '$_POST[p4]', '$_POST[x3]', '$_POST[xo]', '$_POST[ds]', '$_POST[sw]', '$_POST[win]', '$_POST[mac]', '$_POST[gdesc]');";
		$query2="insert into `Immagini` (`NomeGioco`, `MenuImg`, `GiocoImg`)	values ('$_POST[gname]', 'NFSPayback.jpg', 'NFSPayback0.jpg');";
		$conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		$conn->query($query2) or die("Errore nella query MySQL: ".$conn->error);
		$conn->close();
	}
	if(isset($_POST['confirm'])) 
	{
		Aggiungi();
	}
?>