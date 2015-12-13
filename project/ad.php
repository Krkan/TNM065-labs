<?php include 'prefix.php';?>
<?php include "dbConnect.php";
if(trim($_GET['post_id'])==""){
	echo 'Error, no data!';
}else{
	
$post_id = $_GET['post_id'];

$querry = 'SELECT * FROM ad WHERE post_id = "' .$post_id. '"';

$result = mysql_query($querry) or die(mysql_error());


if(mysql_num_rows($result) == 1){
	$result = mysql_fetch_object($result) or die(mysql_error());

	$user_name=$result->user_name;
	$post_id=$result->post_id;
	$description=$result->description;
	$pic=$result->pic;
	$date_added=$result->date_added;
	$category=$result->category;
	$item_location=$result->item_location;
	$title=$result->title;
	$price=$result->price;


	
	echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ad_service SYSTEM "users.dtd">
<?xml-stylesheet type="text/xsl" href="ad.xsl"?>


<ad_service><ads>';


	
	echo '<ad category="' . $category . '">'.
	 '<user_name>' . $user_name . '</user_name>'.
	'<post_id>' . $post_id . '</post_id>'.
	 '<description>' . $description . '</description>'.
	'<pic>'.'item-images/' .$pic. '</pic>'.
	 '<date_added>' . $date_added . '</date_added>'.
	 '<item_location>' . $item_location . '</item_location>' .
	 '<title>' . $title . '</title><price>' . $price . '</price></ad>';
	 
	 echo'</ads>';
	 
	 
	 	session_start();
if(isset($_SESSION['user_name'])){

	
	echo '<users>
<user>
<user_name is_admin="';

if($_SESSION['is_admin']){
	echo 'yes';
}else{
	echo'no';
}



echo'">'. $_SESSION['user_name'].'</user_name>
<name>'. $_SESSION['name'] .'</name>
<last_name>'. $_SESSION['lname'] .'</last_name>
<date_of_reg>' . $_SESSION['date'] .'</date_of_reg>
<email>' . $_SESSION['email'] .'</email>
</user>

</users>';
}
echo'</ad_service>';
	
	
}else{
	echo 'No such ad!';
	exit();
}
	
	
	
	
}




?>
<?php include 'ad_postfix.php';?>