<?php
function filtro()
{
	$query = "SELECT Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, DataPub, PEGI, Descrizione FROM Giochi JOIN Immagini ON Giochi.Nome=Immagini.NomeGioco WHERE Playstation3='".$_POST['p3']."' AND Playstation4='".$_POST['p4']."'AND Xbox360='".$_POST['x3']."' AND XboxOne='".$_POST['xo']."' AND NintendoDS='".$_POST['ds']."' AND NintendoSwitch='".$_POST['sw']."' AND Windows='".$_POST['win']."' AND Mac='".$_POST['mac']."' ORDER BY DataPub DESC";
	
	return $query;
}


/*
$query = "SELECT Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, DataPub, PEGI, Descrizione FROM Giochi JOIN Immagini ON Giochi.Nome=Immagini.NomeGioco WHERE Playstation3='1' AND Playstation4='".(isset($_POST['p4']))."' AND Xbox360='".(isset($_POST['x3']))."' AND XboxOne='".(isset($_POST['xo']))."' AND NintendoDS='".(isset($_POST['ds']))."' AND NintendoSwitch='".(isset($_POST['sw']))."' AND Windows='".(isset($_POST['win']))."' AND Mac='".(isset($_POST['mac']))."' ORDER BY DataPub DESC";
*/

/*
$query = "SELECT Nome, GiocoImg, Genere1, Genere2, Genere3, Disponibilita, DataPub, PEGI, Descrizione FROM Giochi JOIN Immagini ON Giochi.Nome=Immagini.NomeGioco WHERE Playstation3='".(isset($_POST['p3']))."' AND Playstation4='".(isset($_POST['p4']))."'AND Xbox360='".(isset($_POST['x3']))."' AND XboxOne='".(isset($_POST['xo']))."' AND NintendoDS='".(isset($_POST['ds']))."' AND NintendoSwitch='".(isset($_POST['sw']))."' AND Windows='".(isset($_POST['win']))."' AND Mac='".(isset($_POST['mac']))."' ORDER BY DataPub DESC";
	
	return $query;*/
?>
<div class="filtro">
	<div class="piattaforme">
		<h4> Piattaforme</h4>
		<h5>Xbox</h5>
		<label class="elenco"> Xbox One
			<input type="checkbox" name="xo">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Xbox 360
			<input type="checkbox" name="x3">
			<span class="checkmark"></span>
		</label>

		<h5>Playstation</h5>
		<label class="elenco"> Playstation 4
			<input type="checkbox"  name="p4">
			<span class="checkmark"></span>
		</label>
		<label class="elenco"> Playstation 3
			<input type="checkbox" name="p3">
			<span class="checkmark"></span>
		</label>

		<h5>Nintendo</h5>
		<label class="elenco"> Switch
			<input type="checkbox" name="sw">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">3DS
			<input type="checkbox" name="ds">
			<span class="checkmark"></span>
		</label>

		<h5>PC</h5>
		<label class="elenco"> Windows
			<input type="checkbox" name="win">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Mac
			<input type="checkbox" name="mac">
			<span class="checkmark"></span>
		</label>
	</div>

	<div class="generi">
		<h4> Generi</h4>
		<label class="elenco">RPG
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Corse
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Simulatore
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Azione
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Sparatutto
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Avventura
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Picchiaduro
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Platform
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Horror
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Sport
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
		<label class="elenco">Strategia
			<input type="checkbox" name="circle">
			<span class="checkmark"></span>
		</label>
	</div>
</div> 
