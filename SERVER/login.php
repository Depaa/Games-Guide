<?php
	if (isset($_POST['submitA'])) {
		$nick = strip_tags($_POST['uname']);
		$password = strip_tags($_POST['psw']);
		
		$nick = $conn->real_escape_string($nick);
		$password = $conn->real_escape_string($password);
		
		$query = $conn->query("SELECT id, Nickname, Password FROM account WHERE Nickname='$nick'");
		$row=$query->fetch_array();
	 
		$count = $query->num_rows;

		if ($password==$row['Password'] && $count==1) {
			$_SESSION['userSession'] = $row['id'];
		} 
		else {
			$msg = "<label> Invalid Username or Password </label>";
		}
	}
?>