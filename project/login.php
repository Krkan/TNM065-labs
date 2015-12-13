<?php
include "dbConnect.php";


if(!empty($_POST['user_name']) && !empty($_POST['password'])){
	
$login_querry= 'SELECT * FROM user WHERE user_name="'. $_POST['user_name'] . '" AND password="' . $_POST['password'].'"';
	
$login_result = mysql_query($login_querry) or die(mysql_error());
	
	
	 if(mysql_num_rows($login_result)>0){
		 $login_result = mysql_fetch_object($login_result);
		 
		 session_start();
			$_SESSION['user_name'] = $login_result->user_name;
			$_SESSION['name']   = $login_result->name;
			$_SESSION['lname']   = $login_result->lname;
			$_SESSION['email']   = $login_result->email;
			$_SESSION['date']   = $login_result->date_of_reg;
			$_SESSION['is_admin']   = $login_result->is_admin;	 
			
			
			
			header("Location: index.php"); /* Redirect browser */
			exit();
			
		 
	 }else{
		 echo "No such user.";
	 }
	
	
}

?>