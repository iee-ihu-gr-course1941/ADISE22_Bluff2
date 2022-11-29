<?php
	$CurPageURL = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
	if (preg_match('/\bit174940\b/', $CurPageURL)) {
		$DB_PASS = 's8umaCRu*';
		$DB_USER = 'root';
		$dbUsers = "/home/student/it/2017/it174940/mysql/run/mysql.sock";
		$db = 'bluff';
	}
	else if (preg_match('/\bit032378\b/', $CurPageURL)) {
		$DB_PASS = '';
		$DB_USER = 'it032378';
		$dbUsers = "/home/student/it/2003/it032378/mysql/run/mysql.sock";
		$db = 'test';
	}	
	else if (preg_match('/\blocalhost\b/', $CurPageURL)) {
		$DB_PASS = '';
		$DB_USER = 'root';
		$db = 'test';
	}
	//echo $CurPageURL;
	//localhost/Bluff2/lib/connect/db_upass.php
	/*if(gethostname()=='users.iee.ihu.gr' || gethostname()=='legendmod.ml/adise') {
		$db = 'bluff';
	} else {
	    $db = 'test';*/	
?>