var indexSlide = 1; //attivo la prima slide fin da subito
showSlides(indexSlide);

function slideMuovi(n) {
	showSlides(indexSlide = indexSlide + n);
}

function slideCorrente(n) {
	showSlides(indexSlide = n);
}

function showSlides(n) {
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	
	if (n < 1) //vado all'ultima slide
		indexSlide = slides.length;
	if (n > slides.length) //riparto dall'inizio
		indexSlide = 1;
	
	for (var i = 0; i < slides.length && i < dots.length; i++) {
		if(i!=indexSlide-1) { //se i non è uguale alla slide corrente non mostro l'immagine e non attivo il pallino
			slides[i].style.display = "none";
			dots[i].className = dots[i].className.replace(" active", "");
		}
		else { //se è uguale alla slide corrente allora mostra l'immagine e attiva il pallino corrispondente
			slides[indexSlide-1].style.display = "block";
			dots[indexSlide-1].className = dots[indexSlide-1].className + " active";
		}
	}
}