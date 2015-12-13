<?php include "dbConnect.php";
session_start();

if(!empty($_POST['title']) && !empty($_POST['description']) && !empty($_POST['price']) && !empty($_POST['title']) && !empty($_FILES['picture']['name']) && !empty($_POST['item_location'])){
	
	$tmp_name = $_FILES['picture']['tmp_name'];
	
	
	$location = 'item-images/';
	
	if($_FILES['picture']['type'] == 'image/png'){
		$type='.png';
	}else if($_FILES['picture']['type'] == 'image/jpeg' || $_FILES['picture']['type'] == 'image/jpg'){
		$type='.jpg';
	}
	$time=time();
	$fileName= $time . $type;
	$location = $location . $fileName;
	move_uploaded_file($tmp_name,$location);
	/*
	$countQuerry= 'SELECT * FROM ad';
	$nrOfCurrentAds = mysql_query($countQuerry) or die(mysql_error());
	$nrOfCurrentAds = mysql_num_rows($nrOfCurrentAds);
	$nrOfCurrentAds = $nrOfCurrentAds+1;
	$post_id = 'ad' . $nrOfCurrentAds;
	*/
	
	$post_id = 'ad' . $time;
	
	$user_name = $_SESSION['user_name'];
	
	
	$insertion_querry = 'INSERT INTO ad (user_name, post_id, description, pic, date_added, category, item_location, title, price) VALUES ("' . $user_name . '" , "' . $post_id . '" , "' . $_POST['description'] . '" , "' .$fileName. '" , "' . date('Y-m-d') . '" , "' .$_POST['category']. '" , "' .$_POST['item_location']. '" , "' .$_POST['title']. '" , "' .$_POST['price']. '")';
	
	mysql_query($insertion_querry) or die(mysql_error());
		echo "Ad has been placed!";
	header("refresh:2;url=personal.php");
	
	
}else{
	echo 'Error, mus enter all fields to insert ad!';
	exit();
}






?>