<?php
	require "config.php";
	function Aggiungi()
	{
		
		
		$conn = connessione();
		if (isset($_POST['xo']))
		{
			$xo = "1";
		} 
		else 
		{
			$xo = "0";
		}
		
		if (isset($_POST['x3']))
		{
			$x3 = "1";
		} 
		else 
		{
			$x3 = "0";
		}
		
		if (isset($_POST['p3']))
		{
			$p3 = "1";
		} 
		else 
		{
			$p3 = "0";
		}
		
		if (isset($_POST['p4']))
		{
			$p4 = "1";
		} 
		else 
		{
			$p4 = "0";
		}
		
		if (isset($_POST['sw']))
		{
			$sw = "1";
		} 
		else 
		{
			$sw = "0";
		}
		
		if (isset($_POST['ds']))
		{
			$ds = "1";
		} 
		else 
		{
			$ds = "0";
		}
		
		if (isset($_POST['win']))
		{
			$win = "1";
		} 
		else 
		{
			$win = "0";
		}
		
		if (isset($_POST['mac']))
		{
			$mac = "1";
		} 
		else 
		{
			$mac = "0";
		}
		session_start();
		$query= "INSERT INTO `giochi` (`Nome`, `DataPub`, `Genere1`, `Genere2`, `Genere3`, `PEGI`, `Disponibilita`, `Playstation3`, `Playstation4`, `Xbox360`, `XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Descrizione`)
		values  ('$_POST[gname]', '$_POST[gdata]', '$_POST[ggenere1]', '$_POST[ggenere2]' , '$_POST[ggenere3]', '$_POST[gpegi]', '$_POST[gdisp]', '". $p3. "', '" .$p4. "', '" .$x3. "', '" .$xo. "', '".$ds. "', '" .$sw. "', '" .$win. "', '" .$mac."', '$_POST[gdesc]');";
		$conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		$conn->close();
	}
	
	
	if(isset($_POST['confirm'])) 
	{
		
		
		Aggiungi();
	}
?>
