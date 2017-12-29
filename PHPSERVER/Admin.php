<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="CSS\Admin.css" media="handheld, screen"/>
	
	<!--serve per mettere icone carine -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	


</head>
<body>

	
	<div class="local">
		<p><a href="#AG">Aggiungi Gioco</a></p>
		<p><a href="#AR">Aggiungi Recensione</a></p>
		<p><a href="#AN">Aggiungi News</a></p>
	</div>
		
	<div class="opzioni">
		<div class="Agg">
		<h3 id="AG"> AGGIUNGI GIOCO</h3>
			<div class="aggiungi-content">
                <form method="post" action="aggiungi.php" enctype="multipart/form-data">
					<div class="riga">
                        <h4>Nome Gioco</h4>
                        <input type="text" name="gname" value="Gioco" required/> 
                    </div>
					<div class="riga">	
						<h4>Data Pubblicazione</h4>
                        <input type="text" name="gdata" value="2017-12-13" required/>
					</div>
					
					<div class="riga">
                        <h4>Genere1</h4>
                        <input type="text" name="ggenere1" value="Azione" required/>
					</div>
					<div class="riga">
					   <h4>Genere2</h4>
                        <input type="text" name="ggenere2"/>
					</div>
					<div class="riga">
						<h4>Genere3</h4>
                        <input type="text" name="ggenere3"/>
					</div>
					<div class="riga">	
						<h4>PEGI</h4>
                        <input type="text" name="gpegi" value="12" required/>
					</div>
					<div class="riga">	
                        <h4>Piattaforme Disponibili (testo con virgola)</h4>
                        <input type="text" name="gdisp" value="asdfsdfds" required/>
					</div>	
					<div class="riga" id="check">
                        <label class="elenco"> Xbox One
							<input type="checkbox" name="xo">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">Xbox 360
							<input type="checkbox" name="x3">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Playstation 4
							<input type="checkbox"  name="p4">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Playstation 3
							<input type="checkbox" name="p3">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Switch
							<input type="checkbox" name="sw">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">3DS
							<input type="checkbox" name="ds">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Windows
							<input type="checkbox" name="win">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">Mac
							<input type="checkbox" name="mac">
							<span class="checkmark"></span>
						</label>
					</div>
                    <div class="riga">
                        <h4>Descrizione</h4>
                        <textarea name="gdesc" rows="10" cols="50"></textarea> 
					</div>
					 
					<div class="riga">	
						<h4>Immagine Menu</h4>
                        <input type="file" name="gimgmen" required/>
                    </div>
					<div class="riga">	
						<h4>Immagine Giochi</h4>
                        <input type="file" name="gimgvid" id="gimgvid"/>
                    </div> 
                       
                        <button class="aggiungibtn" type="submit" name="submit">Conferma</button>
                </form>
            </div>
		</div>
		<div class="Agg">
		<h3 id="AR"> AGGIUNGI RECENSIONE</h3>
			<div class="aggiungi-content">
                <form action="/action_page.php">
					<div class="riga">
                        <h4>Nome Gioco</h4>
                        <input type="text" name="gname" required/> 
                    </div>
					<div class="riga">	
						<h4>Data Pubblicazione</h4>
                        <input type="text" name="gdata" required/>
					</div>
					
					<div class="riga">
                        <h4>Genere1</h4>
                        <input type="text" name="ggenere1" required/>
					</div>
					<div class="riga">
					   <h4>Genere2</h4>
                        <input type="text" name="ggenere2"/>
					</div>
					<div class="riga">
						<h4>Genere3</h4>
                        <input type="text" name="ggenere3"/>
					</div>
					<div class="riga">	
						<h4>PEGI</h4>
                        <input type="text" name="gpegi" required/>
					</div>
					<div class="riga">	
                        <h4>Piattaforme Disponibili (testo con virgola)</h4>
                        <input type="text" name="gdisp" required/>
					</div>	
					<div class="riga" id="check">
                        <label class="elenco"> Xbox One
							<input type="checkbox" name="circle">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">Xbox 360
							<input type="checkbox" name="circle">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Playstation 4
							<input type="checkbox"  name="circle">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Playstation 3
							<input type="checkbox" name="circle">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Switch
							<input type="checkbox" name="circle">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">3DS
							<input type="checkbox" name="circle">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Windows
							<input type="checkbox" name="circle">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">Mac
							<input type="checkbox" name="circle">
							<span class="checkmark"></span>
						</label>
					</div>
                    <div class="riga">
                        <h4>Descrizione</h4>
                        <textarea name="gdesc" rows="10" cols="50"></textarea> 
					</div>
					 
					<div class="riga">	
						<h4>Immagine Menu</h4>
                        <input type="file" name="gimg" required/><!--required--> <!--placeholder="Enter Password"-->
                    </div>
					<div class="riga">	
						<h4>Immagine Giochi</h4>
                        <input type="file" name="gimg" required/><!--required--> <!--placeholder="Enter Password"-->
                    </div>
                       
                        <button class="aggiungibtn" type="submit">Conferma</button>
                </form>
            </div>
		</div><div class="Agg">
		<h3 id="AN"> AGGIUNGI NEWS</h3>
			<div class="aggiungi-content">
                <form action="aggiungi.php">
					<div class="riga">
                        <h4>Nome Gioco</h4>
                        <input type="text" name="gname" required/> 
                    </div>
					<div class="riga">	
						<h4>Data Pubblicazione</h4>
                        <input type="text" name="gdata" required/>
					</div>
					
					<div class="riga">
                        <h4>Genere1</h4>
                        <input type="text" name="ggenere1" required/>
					</div>
					<div class="riga">
					   <h4>Genere2</h4>
                        <input type="text" name="ggenere2"/>
					</div>
					<div class="riga">
						<h4>Genere3</h4>
                        <input type="text" name="ggenere3"/>
					</div>
					<div class="riga">	
						<h4>PEGI</h4>
                        <input type="text" name="gpegi" required/>
					</div>
					<div class="riga">	
                        <h4>Piattaforme Disponibili (testo con virgola)</h4>
                        <input type="text" name="gdisp" required/>
					</div>	
					<div class="riga" id="check">
                        <label class="elenco"> Xbox One
							<input type="checkbox" name="xo">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">Xbox 360
							<input type="checkbox" name="x3">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Playstation 4
							<input type="checkbox"  name="p4">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Playstation 3
							<input type="checkbox" name="p3">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Switch
							<input type="checkbox" name="sw">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">3DS
							<input type="checkbox" name="3ds">
							<span class="checkmark"></span>
						</label>
						<label class="elenco"> Windows
							<input type="checkbox" name="win">
							<span class="checkmark"></span>
						</label>
						<label class="elenco">Mac
							<input type="checkbox" name="mac">
							<span class="checkmark"></span>
						</label>
					</div>
                    <div class="riga">
                        <h4>Descrizione</h4>
                        <textarea name="gdesc" rows="10" cols="50"></textarea> 
					</div>
					 
					<div class="riga">	
						<h4>Immagine Menu</h4>
                        <input type="file" name="gimg" required/><!--required--> <!--placeholder="Enter Password"-->
                    </div>
					<div class="riga">	
						<h4>Immagine Giochi</h4>
                        <input type="file" name="gimg" required/><!--required--> <!--placeholder="Enter Password"-->
                    </div>
                       
                        <button class="aggiungibtn" type="submit">Conferma</button>
                </form>
            </div>
		</div>
	</div>
		
		
		
</body>