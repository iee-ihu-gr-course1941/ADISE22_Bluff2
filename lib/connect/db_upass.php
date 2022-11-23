<?php

	$DB_PASS = 's8umaCRu*';
	$DB_USER = 'root';
	echo gethostname();
	if(gethostname()=='users.iee.ihu.gr' || gethostname()=='legendmod.ml/adise') {
		$db = 'bluff';
	} else {
	    $db = 'test';
}	
?>