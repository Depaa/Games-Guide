<?php
	session_start();
	include_once "config.php";
	
	$queryIN = "SELECT ID, Titolo, MenuImg FROM Notizie ORDER BY Data DESC LIMIT 2";
	$queryIR = "SELECT IDr, Titolo, MenuImg, Recensione.NomeGioco FROM Recensione JOIN Immagini ON Recensione.NomeGioco=Immagini.NomeGioco ORDER BY Data DESC LIMIT 2";
	
	$outputIN = $conn->query($queryIN) or die("Errore nella query MySQL: ".$conn->error);
	$outputIR = $conn->query($queryIR) or die("Errore nella query MySQL: ".$conn->error);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
	<head>
		<title>GamesGuide</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link type="text/css" rel="stylesheet" href="CSS/Style.css" media="handheld, screen"/>
		<link rel="stylesheet" type="text/css" href="CSS/StyleM.css" media="handheld, screen and (max-width:620px), only screen and (max-device-width:620px)"/>
		<link type="text/css" rel="stylesheet" href="CSS/StyleP.css" media="print"/>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
		
		<script type="text/javascript" src="CSS/script.js"></script>
		
	</head>
	
	<body>
		<?php 
			include 'Menu.php';
		?>
		
		<div class="pagecontent">
			<div class="slides-content">
		<?php
			if(!$outputIN) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				foreach($outputIN as $campo => $row) {
					echo '<div class="mySlides">';
						echo '<a href="NewsPage.php?id='.$row['ID'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['Titolo'].'"/></a>';
						echo '<div class="textslide">';
							echo '<h1>'.$row['Titolo'].'</h1>';
						echo '</div>';
					echo '</div>';
				}
			}
			if(!$outputIR) 
				echo '<p> Servizio momentaneamente non disponibile. Riprovare pi&ugrave; tardi</p>';
			else {
				foreach($outputIR as $campo => $row) {
					echo '<div class="mySlides">';
						echo '<a href="RewsPage.php?id='.$row['IDr'].'"><img src="IMG\\' .$row['MenuImg']. '" alt=" '.$row['NomeGioco'].'" lang="en"/></a>';
						echo '<div class="textslide">';
							echo '<h1>'.$row['Titolo'].'</h1>';
						echo '</div>';
					echo '</div>';
				}
			}
		?>
				<a class="prev" onclick="plusSlides(-1)">&laquo;</a>
				<a class="next" onclick="plusSlides(1)">&raquo;</a>
				<div class="dottod">
					<span class="dot" onclick="currentSlide(1)"></span> 
					<span class="dot" onclick="currentSlide(2)"></span> 
					<span class="dot" onclick="currentSlide(3)"></span> 
					<span class="dot" onclick="currentSlide(4)"></span> 
				</div>
			</div>
			
		</div> 
		
		<script>
			var slideIndex = 1;
			showSlides(slideIndex);

			function plusSlides(n) {
				showSlides(slideIndex += n);
			}

			function currentSlide(n) {
				showSlides(slideIndex = n);
			}

			function showSlides(n) {
				var i;
				var slides = document.getElementsByClassName("mySlides");
				var dots = document.getElementsByClassName("dot");
				if (n > slides.length) {slideIndex = 1}    
				if (n < 1) {slideIndex = slides.length}
				for (i = 0; i < slides.length; i++) {
					slides[i].style.display = "none";  
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className.replace(" active", "");
				}
				slides[slideIndex-1].style.display = "block";  
				dots[slideIndex-1].className += " active";
			}
		</script>
		
		
			
		<!--<script>
			var slideIndex = 0;
			showSlides();

			function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {898989999999999999999999999999999999999
			   slides[i].style.display = "none";  89899999999999999999999999999999999898
			}
			slideIndex++;
			if (slideIndex > slides.length) {slideIndex = 1}   8989899999999999999999998 
			for (i = 0; i < dots.length; i++) {89898989899999999999999999999999999999999
				dots[i].className = dots[i].className.replace(" active", "");89899998898
			}
				slides[slideIndex-1].style.display = "block";999999999999999999999999999  
				dots[slideIndex-1].className += " active";999999999999999999999999999999
				setTimeout(showSlides, 2000); // Change image every 2 seconds
			}
		</script>-->
		
		
		
<?php 
	include 'Footer.php';
?>

	</body>
</html> 
