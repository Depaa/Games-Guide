function checkFormL() {
	var name=document.loginForm.uname.value;
	var password=document.loginForm.psw.value;
	
	if(name="") {
		alert("Inserire uno Username");
		return false;
	}
	else if (password.length<5) {
		alert("Password deve essere di almeno 5 caratteri");
		return false;
	}
}

function checkFormR() {
	var firstName=document.registerForm.fname.value;
	var lastName=document.registerForm.lname.value;
	var birthday=document.registerForm.dnascita.value;
	var email=document.registerForm.email.value;
	var nickName=document.registerForm.unick.value;
	var password=document.registerForm.upsw.value;
	var confirmPassword=document.registerForm.confirmupsw.value;
	
	if(firstName="") {
		alert("Inserire il Nome");
		return false;
	}
	else if(lastName="") {
		alert("Inserire il Cognome");
		return false;
	}
	else if(birthday="") {
		alert("Inserire la Data di Nascita");
		return false;
	}
	else if(email="") {
		alert("Inserire l'email");
		return false;
	}
	else if(nickName="") {
		alert("Inserire uno Username");
		return false;
	}
	else if(password="") {
		alert("Inserire una password");
		return false;
	}
	else if(confirmPassword="") {
		alert("Inserire nuovamente la password");
		return false;
	}
}