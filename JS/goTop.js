window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.documentElement.scrollTop > 400 || document.body.scrollTop > 400)
        document.getElementById("backtotop").style.display = "block";
	else 
        document.getElementById("backtotop").style.display = "none";
}

//clicco il pulsante e torna su, cercare effetto che torna su con calma
function gotopFunction() {
    document.body.scrollTop = 0; //solo Safari perchè è speciale
    document.documentElement.scrollTop = 0;
}
