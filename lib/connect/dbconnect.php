<?php
$host='localhost';

require_once "db_upass.php";

$user=$DB_USER;
$pass=$DB_PASS;

if(gethostname()=='users.iee.ihu.gr' || gethostname()=='legendmod.ml/adise') {
	//$mysqli = new mysqli($host, $user, $pass, $db,null,'~/mysql/run/mysql.sock');
    $mysqli = new mysqli('users.iee.ihu.gr', $user, $pass,'bluff',null,'~/mysql/run/mysql.sock');
    // '/home/student/it/2003/it032378/mysql/run/mysql.sock'
} else {
        //test
		$pass=null;
        $mysqli = new mysqli($host, $user, $pass, $db);
}


if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . 
    $mysqli->connect_errno . ") " . $mysqli->connect_error;
}?>
