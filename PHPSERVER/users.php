<?php
function logged_in() {
    if(isset($_SESSION['id'])) {
        return true;
    } 
	else {
        return false;
    }
}

function userExists($username) {
    // global keyword is used to access a global variable from within a function
    global $conn;
    $sql = "SELECT * FROM account WHERE Nickname='$username'";
    $query = $conn->query($sql);
    if($query->num_rows == 1) {
        return true;
    } 
	else {
        return false;
    }
    $connect->close();
    // close the database connection
}
function login($username, $password) {
    global $conn;
	$query = "SELECT Nickname, Password FROM Account WHERE Nickname='$username' AND Password='$password'";
	$result = $conn->query($query) or die("Errore nella query MySQL: ".$conn->error);
	if (($result->num_rows) == 1)
	{
		return true;
		/*$sent=1;
		$row = $result->fetch_assoc();
		$_SESSION['Nickname'] = $row['Password'];
		$TempoDiValidita = 72000; //Cookie attivo per 2 ore
		SettaCookie($_SESSION["Nickname"], $TempoDiValidita);*/

	}
	else
	{
		return false;
	}
	$conn->close();
}

function userdata($username) {
    global $conn;
    $sql = "SELECT * FROM account WHERE Nickname = '$username'";
    $query = $conn->query($sql);
    $result = $query->fetch_assoc();
    if($query->num_rows == 1) {
        return $result;
    } 
	else {
        return false;
    }
    $conn->close();
}

function not_logged_in() {
    if(isset($_SESSION['id']) === FALSE) {
        return true;
    } 
	else {
        return false;
    }
}
 
function getUserDataByUserId($id) {
    global $conn;
    $sql = "SELECT * FROM account WHERE ID = $id";
    $query = $conn->query($sql);
    $result = $query->fetch_assoc();
    return $result;
 
    $conn->close();
}

function logout() {
    if(logged_in() === TRUE){
        // remove all session variable
        session_unset();
        // destroy the session
        session_destroy();
		
        header('location: homee.php');
    }
}

function users_exists_by_id($id, $username) {
    global $conn;
 
    $sql = "SELECT * FROM account WHERE Nickname = '$username' AND ID != $id";
    $query = $conn->query($sql);
    if($query->num_rows >= 1) {
        return true;
    } else {
        return false;
    }
 
    $conn->close();
}
?>