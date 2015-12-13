<?php include 'prefix.php';?>
<?php include "dbConnect.php";

session_start();

if(isset($_SESSION['user_name'])){
	
	
	echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ad_service SYSTEM "users.dtd">
<?xml-stylesheet type="text/xsl" href="changeAds.xsl"?>


<ad_service>';
	
		
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
	
	
	
	$u_name = $_SESSION['user_name'];
	$post_id = $_GET['post_id'];
	
	
	$get_ad = 'SELECT * FROM ad WHERE post_id = "' .$post_id. '" AND user_name="' .$u_name. '"';

$the_ad=mysql_query($get_ad) or die(mysql_error());


$result = mysql_fetch_object($the_ad);
	
	$user_name=$result->user_name;
	$post_id=$result->post_id;
	$description=$result->description;
	$pic=$result->pic;
	$date_added=$result->date_added;
	$category=$result->category;
	$item_location=$result->item_location;
	$title=$result->title;
	$price=$result->price;

echo '<ads>';
	
	echo '<ad category="' . $category . '">'.
	 '<user_name>' . $user_name . '</user_name>'.
	'<post_id>' . $post_id . '</post_id>'.
	 '<description>' . $description . '</description>'.
	'<pic>'.'item-images/' .$pic. '</pic>'.
	 '<date_added>' . $date_added . '</date_added>'.
	 '<item_location>' . $item_location . '</item_location>' .
	 '<title>' . $title . '</title><price>' . $price . '</price></ad>';
	
	
echo '</ads></ad_service>';
	
	
}else{
	
	echo 'Must log in!';
	exit();
}


?>
<?php include 'changeAd_postfix.php';?>
