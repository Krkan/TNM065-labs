<?php include "dbConnect.php";
session_start();
if(isset($_SESSION['user_name']) && $_SESSION['is_admin']){
	
	
	$user_name = $_GET['user_name'];

	
	
	$file_querry = 'SELECT pic FROM ad WHERE user_name = "' .$user_name. '"';
	
	$result = mysql_query($file_querry) or die(mysql_error());
	
	if(mysql_num_rows($result)>0){
	
	while($file_name = mysql_fetch_object($result)){
		unlink('item-images/'. $file_name->pic);
	}
	}
	$del_querry = 'DELETE FROM ad WHERE user_name = "' .$user_name. '"';
	
	mysql_query($del_querry) or die(mysql_error());
	
	$del_user = 'DELETE FROM user WHERE user_name ="' .$user_name. '"';
	
	mysql_query($del_user) or die(mysql_error());
	
	echo'User and associated ads deleted!';
	
		
	header("refresh:2;url=admin.php");
	
	
}else{
	
	echo 'Unauthorized!';
}


?>