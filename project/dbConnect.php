<?php

$host = "mysql.itn.liu.se";
$user = "izmib840_admin";
$pass = "Struckatuur";
$db = "izmib840";


$ms = mysql_pconnect($host, $user, $pass);

if (!$ms)
{
echo "Error, could not connect to database. \n";
mysql_error();
}

mysql_select_db($db) or die("Could not select database");
?>