window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.documentElement.scrollTop > 400)// || document.body.scrollTop > 400)
        document.getElementById("backtotop").style.display = "block";
	else 
        document.getElementById("backtotop").style.display = "none";
}

// When the user clicks on the button, scroll to the top of the document
function gotopFunction() {
    //document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
