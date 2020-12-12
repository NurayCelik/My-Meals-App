<?php 
include_once('../databaseConfig/Database.php');
$db = new Database();
 
	$user = $db->select("SELECT meals.id, meals.title, meals.imageUrl, meals.ingredients, meals.steps, meals.duration, meals.complexity, meals.affordability, meals.isFavorite, user_favorites.mealId,
	    user_favorites.userId FROM meals INNER JOIN user_favorites ON
	    meals.id = user_favorites.mealId");
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