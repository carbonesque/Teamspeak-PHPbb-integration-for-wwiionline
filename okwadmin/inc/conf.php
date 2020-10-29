<?php

// conf.php - configuration parameters

// database configuration
$host = "localhost";
$user = "ts_user";
$pass = "ts1121";
$db = "ts_okwteamspeak";
$connection = mysql_connect($host, $user, $pass) or die ("Unable to connect!");
$conn = mysql_connect($host, $user, $pass) or die ("Unable to connect!");
mysql_select_db($db) or die ("Unable to select database!");

$hostname_conf = "localhost";
$database_conf = "ts_okwteamspeak";
$username_conf = "ts_user";
$password_conf = "ts1121";
$conf = mysql_pconnect($hostname_conf, $username_conf, $password_conf) or trigger_error(mysql_error(),E_USER_ERROR); 
mysql_select_db($database_conf) or die ("Unable to select database!");

?>