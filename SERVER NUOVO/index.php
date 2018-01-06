<?php
	session_start();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>GamesGuide</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS\Style.css" media="handheld, screen"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
	</head>
	
	<body>
		<?php 
			include 'Menu.php';
		?>
		
		<div class="pagecontent">
			<div class="slides-content">
				<div class="mySlides">
					<img src="IMG\XboxOneX.jpg" alt="XboxOneX"/>
					<div class="textslide">
						<h1>XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA</h1>
					</div>
				</div>

				<div class="mySlides">
					<img src="IMG\GOW4.jpg" alt="XboxOneX"/>
					<div class="textslide">
						<h1>GOD OF WAR: KRATOS IS BACK OMGOMGOMGOMGOMG NON VEDO L\'ORA MI COMPRO UNA PS4 PER QUESTO GIOCO SICURO</h1>
					</div>
				</div>

				<div class="mySlides">
					<img src="IMG\alexaecho.jpg" alt="XboxOneX"/>
					<div class="textslide">
					<h1>ALEXA ECHO: RISSA SULLE STRADE PER IL BEST SITO EVER</h1>
					</div>
				</div>
			</div>
			
			<div class="dottod">
				<span class="dot"></span> 
				<span class="dot"></span> 
				<span class="dot"></span> 
			</div>
			
			
			<h1>XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA</h1>
			
			<h1>XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA</h1>
			<h1>XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA</h1>
			<h1>XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA</h1>
		</div> 
		
		
			
		<script>
			var slideIndex = 0;
			showSlides();

			function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
			   slides[i].style.display = "none";  
			}
			slideIndex++;
			if (slideIndex > slides.length) {slideIndex = 1}    
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
				slides[slideIndex-1].style.display = "block";  
				dots[slideIndex-1].className += " active";
				setTimeout(showSlides, 2000000); // Change image every 2 seconds
			}
		</script>
		
		<div class="footer">
		
		</div>

	</body>
</html> 
