<?php
$host='localhost';
//$host='users.iee.ihu.gr';
require_once "db_upass.php";

$db = 'bluff';

$user=$DB_USER;
$pass=$DB_PASS;


/*
if(gethostname()=='users.iee.ihu.gr' || gethostname()=='legendmod.ml/adise') {
	$mysqli = new mysqli($host, $user, $pass, $db,null,'~/mysql/run/mysql.sock');
    // '/home/student/it/2003/it032378/mysql/run/mysql.sock'
} else {
        //test
		$pass=null;
        $mysqli = new mysqli($host, $user, $pass, $db);
}*/
if(gethostname()=='users.iee.ihu.gr') {
	$mysqli = new mysqli($host, $user, $pass, $db,null,'~/mysql/run/mysql.sock');
    // '/home/student/it/2003/it032378/mysql/run/mysql.sock'
} else {
        //test
		$pass=null;
        $mysqli = new mysqli($host, $user, $pass, $db);
}

if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . 
    $mysqli->connect_errno . ") " . $mysqli->connect_error;
    echo gethostname();
}?>
