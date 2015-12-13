<?php include "dbConnect.php";


if(trim($_POST['user_name']) != "" && trim($_POST['name'])!="" && trim($_POST['lname'])!="" && trim($_POST['email'])!="" && trim($_POST['password'])!=""){

$user_name = $_POST['user_name'];
$name = $_POST['name'];
$lname = $_POST['lname'];
$email = $_POST['email'];
$password = $_POST['password'];
$date = date('Y-m-d');
$is_admin=0;

$test_querry = 'SELECT * FROM user WHERE user_name="' . $user_name .'"';

$test_querry_result=mysql_query($test_querry) or die(mysql_error());

if(mysql_num_rows($test_querry_result)>0){
	
	echo "Username already exists!";
	header("refresh:5;url=register.php");
	exit();

}else{
	
	
	$inser_querry='INSERT INTO user (user_name, name, lname, password, email, date_of_reg, is_admin) VALUES ("' . $user_name .'" , "' . $name .'" , "' . $lname . '" , "' . $password . '" , "' . $email . '" , "' . $date . '" , "' . $is_admin . '")'; 
	
	mysql_query($inser_querry) or die(mysql_error());
		echo "Registered!";
	header("refresh:5;url=index.php");
	exit();
	
	
}









}else{
	
	echo "All fields need to be filled to register!";
	header("refresh:5;url=register.php");
	exit();
}

?>