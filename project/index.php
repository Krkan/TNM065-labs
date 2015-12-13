<?php include 'prefix.php';?>
<?php
include "dbConnect.php";
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ad_service SYSTEM "users.dtd">
<?xml-stylesheet type="text/xsl" href="http://84.216.133.49/TNM065/project-dtd/generateAds.xsl"?>


<ad_service>';

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

echo '<ads>';


if(trim($_POST['search']) == "" || empty($_POST)){
	
	if($_POST['category'] != "All" && !empty($_POST)){
	$add = ' WHERE category = "' . $_POST['category'].'"';
}else{$add="";}
	
$get_ads = "SELECT * FROM ad" . $add;

$the_ads=mysql_query($get_ads) or die(mysql_error());


while($result = mysql_fetch_object($the_ads)){
	
	$user_name=$result->user_name;
	$post_id=$result->post_id;
	$description=$result->description;
	$pic=$result->pic;
	$date_added=$result->date_added;
	$category=$result->category;
	$item_location=$result->item_location;
	$title=$result->title;
	$price=$result->price;


	
	echo '<ad category="' . $category . '">'.
	 '<user_name>' . $user_name . '</user_name>'.
	'<post_id>' . $post_id . '</post_id>'.
	 '<description>' . $description . '</description>'.
	'<pic>'.'item-images/' .$pic. '</pic>'.
	 '<date_added>' . $date_added . '</date_added>'.
	 '<item_location>' . $item_location . '</item_location>' .
	 '<title>' . $title . '</title><price>' . $price . '</price></ad>';
	
	
}
}else{
	
	if($_POST['category'] != "All"){
	$add = ' AND category = "' . $_POST['category'].'"';
}else{$add="";}
	
	$get_ads = 'SELECT * FROM ad WHERE title LIKE "%' . $_POST['search'] . '%"'.$add. 'OR description LIKE "%' . $_POST['search'] . '%"' . $add;
	$the_ads=mysql_query($get_ads) or die(mysql_error());

	
	while($result = mysql_fetch_object($the_ads)){
	
	$user_name=$result->user_name;
	$post_id=$result->post_id;
	$description=$result->description;
	$pic=$result->pic;
	$date_added=$result->date_added;
	$category=$result->category;
	$item_location=$result->item_location;
	$title=$result->title;
	$price=$result->price;

	
	echo '<ad category="' . $category . '">'.
	 '<user_name>' . $user_name . '</user_name>'.
	'<post_id>' . $post_id . '</post_id>'.
	 '<description>' . $description . '</description>'.
	'<pic>'.'item-images/' .$pic. '</pic>'.
	 '<date_added>' . $date_added . '</date_added>'.
	 '<item_location>' . $item_location . '</item_location>' .
	 '<title>' . $title . '</title><price>' . $price . '</price></ad>';
	
	
}

}

echo'
</ads>

</ad_service>
';




?>
<?php include 'postfix.php';?>
