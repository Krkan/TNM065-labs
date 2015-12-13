<?php include "dbConnect.php";
session_start();

if(isset($_SESSION['user_name'])){
	
	if(!empty($_POST['title']) && !empty($_POST['description']) && !empty($_POST['price']) && !empty($_POST['title']) && !empty($_POST['item_location'])){

if(!file_exists($_FILES['picture']['tmp_name']) || !is_uploaded_file($_FILES['picture']['tmp_name'])) {
   
   $post_id= $_GET['post_id'];
   $user_name = $_SESSION['user_name'];

   $querry = 'SELECT * FROM ad WHERE post_id = "' . $post_id . '" AND user_name = "' . $user_name .'"';
   
   $result = mysql_query($querry) or die(mysql_error());
   
   $fileName = mysql_fetch_object($result)->pic;
   
   $querry = 'DELETE FROM ad WHERE post_id="' . $post_id . '" AND user_name="' . $user_name . '"';
	
	mysql_query($querry) or die(mysql_error());
	
		$insertion_querry = 'INSERT INTO ad (user_name, post_id, description, pic, date_added, category, item_location, title, price) VALUES ("' . $user_name . '" , "' . $post_id . '" , "' . $_POST['description'] . '" , "' .$fileName. '" , "' . date('Y-m-d') . '" , "' .$_POST['category']. '" , "' .$_POST['item_location']. '" , "' .$_POST['title']. '" , "' .$_POST['price']. '")';

   	mysql_query($insertion_querry) or die(mysql_error());

	echo'Changed!';
		header("refresh:2;url=personal.php");
   
}else{
	
	$post_id= $_GET['post_id'];
   $user_name = $_SESSION['user_name'];
   
   
   $querry = 'SELECT * FROM ad WHERE post_id = "' . $post_id . '" AND user_name = "' . $user_name .'"';
   
   $result = mysql_query($querry) or die(mysql_error());
   
   $fileName = mysql_fetch_object($result)->pic;
   
   unlink('item-images/'. $fileName);
   
	   $querry = 'DELETE FROM ad WHERE post_id="' . $post_id . '" AND user_name="' . $user_name . '"';
	   
	   
	   $tmp_name = $_FILES['picture']['tmp_name'];
	
	
	$location = 'item-images/';
	
	if($_FILES['picture']['type'] == 'image/png'){
		$type='.png';
	}else if($_FILES['picture']['type'] == 'image/jpeg' || $_FILES['picture']['type'] == 'image/jpg'){
		$type='.jpg';
	}
	
	$fileName= time() . $type;
	$location = $location . $fileName;
	move_uploaded_file($tmp_name,$location);
	
	mysql_query($querry) or die(mysql_error());
	
		$insertion_querry = 'INSERT INTO ad (user_name, post_id, description, pic, date_added, category, item_location, title, price) VALUES ("' . $user_name . '" , "' . $post_id . '" , "' . $_POST['description'] . '" , "' .$fileName. '" , "' . date('Y-m-d') . '" , "' .$_POST['category']. '" , "' .$_POST['item_location']. '" , "' .$_POST['title']. '" , "' .$_POST['price']. '")';

   	mysql_query($insertion_querry) or die(mysql_error());

	echo'Changed!';
		header("refresh:2;url=personal.php");
	
	
}
	}else{
		echo 'All fields must be filled!';
		exit();
	}




}else{
	echo 'Error!';
	exit();
}
?>