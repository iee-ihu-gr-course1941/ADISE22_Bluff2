<?php
	$CurPageURL = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']; //Έλεγχος πολλαπλών user σε server και χρήση σε τοπικό υπολογιστή
	if (preg_match('/\bΣτοιχείο που κάνει match στον server\b/', $CurPageURL)) {
		$DB_PASS = 'κωδικός';
		$DB_USER = 'όνομα χρήστη';
		$dbUsers = "διέυθυνση του mysql.sock της Mysql";
		$db = 'όνομα βάσης δεδομένων στην Mysql';
	}
	else if (preg_match('/\bΣτοιχείο που κάνει match στον server\b/', $CurPageURL)) { //π.χ else if (preg_match('/\bit032378\b/', $CurPageURL)) {
		$DB_PASS = 'κωδικός'; //π.χ $DB_PASS = ''
		$DB_USER = 'όνομα χρήστη'; //π.χ $DB_PASS = 'it032378' ή $DB_USER = 'root';υυυυ
		$dbUsers = "διέυθυνση του mysql.sock της Mysql"; //π.χ $dbUsers = "/home/student/it/2003/it032378/mysql/run/mysql.sock"
		$db = 'όνομα βάσης δεδομένων στην Mysql'; //π.χ $db = "test"
	}	
	else if (preg_match('/\blocalhost\b/', $CurPageURL)) {
		$DB_PASS = 'κωδικός';
		$DB_USER = 'όνομα χρήστη';
		$db = 'όνομα βάσης δεδομένων στην Mysql';
	}
	
?>