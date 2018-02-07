function checkFormL() {
	var name=document.loginForm.uname.value;
	var password=document.loginForm.psw.value;
	
	if(name="") {
		alert("Inserire uno Username");
		return false;
	}
	else if (password.length<4) {
		alert("Password deve essere di almeno 4 caratteri");
		return false;
	}
}
