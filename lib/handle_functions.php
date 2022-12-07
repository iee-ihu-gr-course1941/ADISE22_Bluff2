<?php
function errorMsg($msg, $commander){
		header('HTTP/1.1 405 Method Not Allowed');
		//header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg' => $msg, 'commander' => $commander], JSON_PRETTY_PRINT);	
}
function successMsg($msg, $commander){
		header('Content-type: application/json');
		print json_encode(['successmesg' => $msg, 'commander' => $commander], JSON_PRETTY_PRINT);	
}
function informationMsg($msg, $commander){
		header('HTTP/1.1 100 Information');
		print json_encode(['successmesg' => $msg, 'commander' => $commander], JSON_PRETTY_PRINT);	
}
//function handle_main($method, $properties) {
function handle_status($method) {	
    if($method=='GET') {
		game_status();
	}
	else {
		errorMsg('Method Not Allowed','status');  
	}
}
function handle_throw($method, $properties0, $properties, $properties2, $properties3, $properties4) {
    if($method=='POST') {
		manyMoves($properties0, $properties, $properties2, $properties3, $properties4);
	}
	else {
        errorMsg('Method Not Allowed','board');  
	}
}
function handle_show($method, $z, $sessionID1, $sessionID2) {
    if($method=='GET') {
		if ($sessionID1 == $z) show_board(1);
		else if ($sessionID2 == $z) show_board(2); 
		else errorMsg('Wrong sessionId','show');
	}
	else if ($method=='POST') {
           reset_board();
    } 	
	else {
        errorMsg('Method Not Allowed','board');  
	}
}

function handle_startuser($method, $sessionID1, $sessionID2) {
	if($method=='POST') {
		if (sqlreturnoneitem('select * from game_status;', 'status')=='not_active'){
			if ($sessionID1==null){
				$sessionID1=session_id();
				sqlwithoutreturn('update game_status set session1 ="' . $sessionID1 . '"');
			}
			sqlwithoutreturn('update game_status SET status = \'player_1_waiting\';');			
			successMsg(json_encode([$sessionID1,"1"]),'startuser');
		}
		else if (sqlreturnoneitem('select * from game_status;', 'status')=='player_1_waiting'){
			if ($sessionID2==null){
				session_regenerate_id(true);
				$sessionID2=session_id();
				sqlwithoutreturn('update game_status set session2 ="' . $sessionID2 . '"');
			}		
			sqlwithoutreturn('update game_status SET status = \'initialized\';');	
			successMsg(json_encode([$sessionID2,"2"]),'startuser');
		}
		else{
			errorMsg('2 players already playing.','startuser');
			}
	}
	else{
		errorMsg('Method Not Allowed','startuser'); 
		//errorMsg('Method Not Allowed','startuser'); 
	}
}
function handle_start($method) {
    if($method=='POST') {
		start();
	}
	else {		 
        errorMsg('Method Not Allowed','board');    
	}
}
function handle_pass($method){
    if($method=='POST') {
		pass();  
	}
	else {
        errorMsg('Method Not Allowed','pass');      
	}
}
function handle_bluff($method){
    if($method=='POST') {
		bluff();
	}
	else {
        errorMsg('Method Not Allowed','pass');        
	}
}
?>