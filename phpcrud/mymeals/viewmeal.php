<?php 
include_once('databaseConfig/Database.php');
$db = new Database();
     
	$user = $db->select("SELECT * FROM category ORDER BY id DESC");
	$list = array();
	if($user->num_rows > 0){
	while($rowdata = $user->fetch_assoc()) {
			array_push($list,$rowdata);
			//$list[] = $rowdata;
		}
	}
	$db->link->close();
	header('Content-Type: application/json');
	echo json_encode($list);
	
	
 return;
	
	
	

	?>