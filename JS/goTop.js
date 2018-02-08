window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.documentElement.scrollTop > 400 || document.body.scrollTop > 400)
        document.getElementById("backtotop").style.display = "block";
	else 
        document.getElementById("backtotop").style.display = "none";
}

//premo bottone, torna su a 0px
function gotopFunction() {
    document.body.scrollTop = 0; //Safari è speciale
    document.documentElement.scrollTop = 0;
}
