<?php
$query="SELECT Nome, DataPub, Disponibilita FROM giochi WHERE Mac=1 AND Windows=1";
	
	$result= mysqli_query($connection, $query);
	
	if (mysqli_num_rows($result) > 0) {
		while ($row=mysqli_fetch_assoc($result)) {
			echo " " . $row["Nome"] . " " .  $row["DataPub"] . " " . $row["Disponibilita"] . "<br>";
		}
	}
	else
		echo "0 results";
?>