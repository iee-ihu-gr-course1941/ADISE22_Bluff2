<?php
	$CurPageURL = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
	if (str_contains($CurPageURL, 'it174940')) {
		$DB_PASS = 's8umaCRu*';
		$DB_USER = 'root';
		$dbUsers = "/home/student/it/2017/it174940/mysql/run/mysql.sock";
		$db = 'bluff';
	}
	else if (str_contains($CurPageURL, 'it032378')) {
		$DB_PASS = '';
		$DB_USER = 'it032378';
		$dbUsers = "/home/student/it/2003/it032378/mysql/run/mysql.sock";
		$db = 'test';
	}	
	else{
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