<?php
	require "config.php";
	if(isset($_POST['submit'])) 
	{
		$query = "SELECT Recensione.NomeGioco, ID, AdminNick, Testo, Titolo, Data, MenuImg FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco WHERE XboxOne="isset($_POST['xo'])" AND Xbox360="isset($_POST['x360'])" AND Playstation4="isset($_POST['p4'])" AND Playstation3="isset($_POST['p3'])" AND NintendoSwitch="isset($_POST['sw'])" AND NintendoDS="isset($_POST['ds'])" AND Windows="isset($_POST['win'])" AND Mac="isset($_POST['mac'])"; ";
		
		$output = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
		
		/*if(isset($_POST['xo'])) {
			$query = $query. XboxOne="isset($_POST['xo'])";
		}
		if(isset($_POST['x360'])) {
			$query = $query. Xbox360="isset($_POST['x360'])";
		}
		if(isset($_POST['p4'])) {
			$query = $query. Playstation4="isset($_POST['p4'])";
		}
		if(isset($_POST['p3'])) {
			$query = $query. Playstation3="isset($_POST['p3'])";
		}
		if(isset($_POST['sw'])) {
			$query = $query. NintendoSwitch="isset($_POST['sw'])";
		}
		if(isset($_POST['ds'])) {
			$query = $query. NintendoDS="isset($_POST['ds'])";
		}
		if(isset($_POST['win'])) {
			$query = $query. Windows="isset($_POST['win'])";
		}
		if(isset($_POST['mac'])) {
			$query = $query. Mac="isset($_POST['mac'])";
		}*/
	}
?>
<div class="filtro">
	<form method="post" action="">
		<div class="piattaforme">
			<h4> Piattaforme</h4>
			<h5>Xbox</h5>
			<label class="elenco"> Xbox One
				<input type="checkbox" name="xo">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">Xbox 360
				<input type="checkbox" name="x360">
				<span class="checkmark"></span>
			</label>

			<h5>Playstation</h5>
			<label class="elenco"> Playstation 4
				<input type="checkbox"  name="p4" >
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
			<button class="aggiungibtn" type="submit" name="submit">Conferma</button>
		</div>

		<div class="data">
			<h4>Anno</h4>
			<label class="elenco">2018
				<input type="checkbox" name="18">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">2017
				<input type="checkbox" name="17">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">2016
				<input type="checkbox" name="16">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">2015
				<input type="checkbox" name="15">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">2014
				<input type="checkbox" name="14">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">2013
				<input type="checkbox" name="13">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">2012
				<input type="checkbox" name="12">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">2011
				<input type="checkbox" name="11">
				<span class="checkmark"></span>
			</label>
			<label class="elenco">2010
				<input type="checkbox" name="10">
				<span class="checkmark"></span>
			</label>
		</div>
	</form>
</div>