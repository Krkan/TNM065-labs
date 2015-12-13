<?php include "dbConnect.php";

session_start();

if(isset($_SESSION['user_name'])){
	
	$user_name = $_SESSION['user_name'];
	$post_id = $_GET['post_id'];
	
	
	$file_querry = 'SELECT pic FROM ad WHERE post_id = "' .$post_id. '" AND user_name = "' .$user_name. '"';
	$result = mysql_query($file_querry) or die(mysql_error());
	$file_name = mysql_fetch_object($result)->pic;
	
	unlink('item-images/'. $file_name);
	
	
	
	$querry = 'DELETE FROM ad WHERE post_id="' . $post_id . '" AND user_name="' . $user_name . '"';
	
	mysql_query($querry) or die(mysql_error());
	
	echo'Deleted!';
	
	header("refresh:2;url=personal.php");
	
	
}else{
	echo 'Cant delete if not logged in!';
}



?>