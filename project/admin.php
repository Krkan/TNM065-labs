<?php include 'prefix.php';?>
<?php include "dbConnect.php";

session_start();

if(isset($_SESSION['user_name']) && $_SESSION['is_admin']){

echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ad_service SYSTEM "84.216.133.49/TNM065/project-dtd/users.dtd">
<?xml-stylesheet type="text/xsl" href="personal.xsl"?>


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
</user>';


$querry= 'SELECT * FROM user WHERE is_admin IS FALSE';

$result = mysql_query($querry) or die (mysql_error());

while($obj = mysql_fetch_object($result)){
	
	echo'<user><user_name is_admin = "no">'. $obj->user_name.'</user_name>
<name>'. $obj->name .'</name>
<last_name>'. $obj->lname .'</last_name>
<date_of_reg>' . $obj->date_of_reg .'</date_of_reg>
<email>' . $obj->email .'</email>
</user>';
	
	
}






echo'</users></ad_service>';
	
}else{
	
	echo 'Unauthorized!';
	exit();
}





?>
<?php include 'admin_postfix.php';?>