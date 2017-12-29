<?php
	require_once 'init.php';
		
	if(logged_in() === TRUE) {
		header('location: homee.php');
	}
	
	if(isset($_POST['submitA'])) 
	{
		//session_start();
		//echo session_id();
		
		//$conn = connessione();
		
		$username = $_POST['uname'];
		$password = $_POST['psw'];
 
		if($username == "") {
			echo " * Username Field is Required <br />";
		}
	 
		if($password == "") {
			echo " * Password Field is Required <br />";
		}
		
		if($username && $password) {
			if(userExists($username) == TRUE) {
				$login = login($username, $password);
				if($login) {
					echo'andata';
					$userdata = userdata($username);
	 
					$_SESSION['ID'] = $userdata['id'];
	 
					header('location: homee.php');
					exit();
				} 
				else {
					echo "Incorrect username/password combination";
				}
			} 
			else {
				echo "username does not exists";
			}
		}
	}
	
	
?>