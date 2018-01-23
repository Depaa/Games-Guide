<?php
	$wh="WHERE 1=1 ";
	if(isset($_POST['submitP'])) {
		
		if(isset($_POST['xo']))
			$wh .= " AND Videogiochi.XboxOne=1";
		if(isset($_POST['x3']))
			$wh .= " AND Videogiochi.Xbox360=1";
		if(isset($_POST['p4']))
			$wh .= " AND Videogiochi.Playstation4=1";
		if(isset($_POST['p3']))
			$wh .= " AND Videogiochi.Playstation3=1";
		if(isset($_POST['sw']))
			$wh .= " AND Videogiochi.NintendoSwitch=1";
		if(isset($_POST['ds']))
			$wh .= " AND Videogiochi.NintendoDS=1";
		if(isset($_POST['win']))
			$wh .= " AND Videogiochi.Windows=1";
		if(isset($_POST['mac']))
			$wh .= " AND Videogiochi.Mac=1";	
		
		$query= "SELECT IDr, Videogiochi.ID, Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, Videogiochi.Data, PEGI, Descrizione FROM Videogiochi JOIN Immagini ON Videogiochi.Nome=Immagini.NomeGioco JOIN Recensione ON Videogiochi.Nome=Recensione.NomeGioco $wh ORDER BY Videogiochi.Data DESC";
		$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	}
	
	
	$wh="WHERE 1=1 ";
	if(isset($_POST['submitJ'])) {
		if(isset($_POST['avv']))
			$wh .= " AND (Videogiochi.Genere1='Avventura' OR Videogiochi.Genere2='Avventura' OR Videogiochi.Genere3='Avventura')";
		if(isset($_POST['azi']))
			$wh .= "AND (Videogiochi.Genere1='Azione' OR Videogiochi.Genere2='Azione' OR Videogiochi.Genere3='Azione')";
		if(isset($_POST['spo']))
			$wh .= " AND (Videogiochi.Genere1='Sport' OR Videogiochi.Genere2='Sport' OR Videogiochi.Genere3='Sport')";
		if(isset($_POST['sim']))
			$wh .= " AND (Videogiochi.Genere1='Simulazione' OR Videogiochi.Genere2='Simulazione' OR Videogiochi.Genere3='Simulazione')";
		if(isset($_POST['str']))
			$wh .= " AND (Videogiochi.Genere1='Strategia' OR Videogiochi.Genere2='Strategia' OR Videogiochi.Genere3='Strategia')";
		if(isset($_POST['mus']))
			$wh .= " AND (Videogiochi.Genere1='Musicale' OR Videogiochi.Genere2='Musicale' OR Videogiochi.Genere3='Musicale')";
		if(isset($_POST['spa']))
			$wh .= " AND (Videogiochi.Genere1='Sparattutto' OR Videogiochi.Genere2='Sparattutto' OR Videogiochi.Genere3='Sparattutto')";
		if(isset($_POST['pic']))
			$wh .= " AND (Videogiochi.Genere1='Picchiaduro' OR Videogiochi.Genere2='Picchiaduro' OR Videogiochi.Genere3='Picchiaduro')";
		if(isset($_POST['fps']))
			$wh .= " AND (Videogiochi.Genere1='FPS' OR Videogiochi.Genere2='FPS' OR Videogiochi.Genere3='FPS')";
		if(isset($_POST['pia']))
			$wh .= " AND (Videogiochi.Genere1='Piattaforma' OR Videogiochi.Genere2='Piattaforma' OR Videogiochi.Genere3='Piattaforma')";
		if(isset($_POST['rpg']))
			$wh .= " AND (Videogiochi.Genere1='RPG' OR Videogiochi.Genere2='RPG' OR Videogiochi.Genere3='RPG')";
		if(isset($_POST['hor']))
			$wh .= " AND (Videogiochi.Genere1='Horror' OR Videogiochi.Genere2='Horror' OR Videogiochi.Genere3='Horror')";
		
		$query= "SELECT IDr, Videogiochi.ID, Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, Videogiochi.Data, PEGI, Descrizione FROM Videogiochi JOIN Immagini ON Videogiochi.Nome=Immagini.NomeGioco JOIN Recensione ON Videogiochi.Nome=Recensione.NomeGioco $wh ORDER BY Videogiochi.Data DESC LIMIT 100 OFFSET 1";
		$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	}

	$wh="WHERE 1=1 ";
	if(isset($_POST['submitRP'])) {
		if(isset($_POST['xo']))
			$wh .= " AND XboxOne=1";
		if(isset($_POST['x3']))
			$wh .= " AND Xbox360=1";
		if(isset($_POST['p4']))
			$wh .= " AND Playstation4=1";
		if(isset($_POST['p3']))
			$wh .= " AND Playstation3=1";
		if(isset($_POST['sw']))
			$wh .= " AND NintendoSwitch=1";
		if(isset($_POST['ds']))
			$wh .= " AND NintendoDS=1";
		if(isset($_POST['win']))
			$wh .= " AND Windows=1";
		if(isset($_POST['mac']))
			$wh .= " AND Mac=1";
		
		//$inizio2=$inizio+1;
		$query1 = "SELECT Recensione.NomeGioco, IDr, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco $wh ORDER BY Data DESC LIMIT 1";
		/*$query = "SELECT Recensione.NomeGioco, IDr, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco $wh ORDER BY Data DESC LIMIT $fine OFFSET $inizio2";*/
		
		$query = "SELECT Recensione.NomeGioco, IDr, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco $wh ORDER BY Data DESC LIMIT 100 OFFSET 1";
		
		$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		$output1 = $conn->query($query1) or die("Errore nella query MySQL: ".$conn->error);
	}
	
	$wh="WHERE 1=1 ";
	if(isset($_POST['submitRD'])) {
		if(isset($_POST['2018']))
			$wh .= " AND Data>'2017-12-31' AND Data <'2018-12-31'";
		else if(isset($_POST['2017']))
			$wh .= " AND Data>'2016-12-31' AND Data <'2017-12-31'";
		else if(isset($_POST['2016']))
			$wh .= " AND Data>'2015-12-31' AND Data <'2016-12-31'";
		else if(isset($_POST['2015']))
			$wh .= " AND Data>'2014-12-31' AND Data <'2015-12-31'";
		else if(isset($_POST['2014']))
			$wh .= " AND Data>'2013-12-31' AND Data <'2014-12-31'";
		else if(isset($_POST['2013']))
			$wh .= " AND Data>'2012-12-31' AND Data <'2013-12-31'";
		
		$query1 = "SELECT Recensione.NomeGioco, IDr, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco $wh ORDER BY Data DESC LIMIT 1";
		$query = "SELECT Recensione.NomeGioco, IDr, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco $wh  ORDER BY Data DESC LIMIT 100 OFFSET 1";
		
		$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		$output1 = $conn->query($query1) or die("Errore nella query MySQL: ".$conn->error);
	}
	
	$wh="WHERE 1=1 ";
	if(isset($_POST['submitNP'])) {
		if(isset($_POST['xo']))
			$wh .= " AND XboxOne=1";
		if(isset($_POST['x3']))
			$wh .= " AND Xbox360=1";
		if(isset($_POST['p4']))
			$wh .= " AND Playstation4=1";
		if(isset($_POST['p3']))
			$wh .= " AND Playstation3=1";
		if(isset($_POST['sw']))
			$wh .= " AND NintendoSwitch=1";
		if(isset($_POST['ds']))
			$wh .= " AND NintendoDS=1";
		if(isset($_POST['win']))
			$wh .= " AND Windows=1";
		if(isset($_POST['mac']))
			$wh .= " AND Mac=1";
		
		$query1 = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie $wh ORDER BY Data DESC LIMIT 1";
		$query = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie $wh ORDER BY Data DESC LIMIT 100 OFFSET 1";
		
		$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		$output1 = $conn->query($query1) or die("Errore nella query MySQL: ".$conn->error);
	}
	
	$wh="WHERE 1=1 ";
	if(isset($_POST['submitND'])) {
		if(isset($_POST['2018']))
			$wh .= " AND Data>'2017-12-31' AND Data <'2018-12-31'";
		else if(isset($_POST['2017']))
			$wh .= " AND Data>'2016-12-31' AND Data <'2017-12-31'";
		else if(isset($_POST['2016']))
			$wh .= " AND Data>'2015-12-31' AND Data <'2016-12-31'";
		else if(isset($_POST['2015']))
			$wh .= " AND Data>'2014-12-31' AND Data <'2015-12-31'";
		else if(isset($_POST['2014']))
			$wh .= " AND Data>'2013-12-31' AND Data <'2014-12-31'";
		else if(isset($_POST['2013']))
			$wh .= " AND Data>'2012-12-31' AND Data <'2013-12-31'";
		
		$query1 = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie $wh ORDER BY Data DESC LIMIT 1";
		$query = "SELECT ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Notizie $wh ORDER BY Data DESC LIMIT 100 OFFSET 1";
		
		$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		$output1 = $conn->query($query1) or die("Errore nella query MySQL: ".$conn->error);
	}
?>