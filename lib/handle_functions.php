<?php
session_start();
function errorMsg($msg, $commander){
		header('HTTP/1.1 405 Method Not Allowed');
		//header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg' => $msg, 'commander' => $commander], JSON_PRETTY_PRINT);	
}
function successMsg($msg, $commander){
		header('HTTP/1.1 200 OK');
		//header('Content-type: application/json');
		print json_encode(['successmesg' => $msg, 'commander' => $commander], JSON_PRETTY_PRINT);	
}
function informationMsg($msg, $commander){
		header('HTTP/1.1 100 Informational');
		print json_encode(['successmesg' => $msg, 'commander' => $commander], JSON_PRETTY_PRINT);	
}

function handle_status($method) {	
    if($method=='GET') {
		game_status();
	}
	else {
		errorMsg('Method Not Allowed','status');  
	}
}

function handle_checkSessionId($method, $z){
	if($method=='GET') {
		if (sqlreturnoneitem('select * from game_status;', 'session1') == $z){
			successMsg(json_encode(["true","1"]),'checkSessionId');
		}
		else if (sqlreturnoneitem('select * from game_status;', 'session2') == $z){
			successMsg(json_encode(["true","2"]),'checkSessionId');
		}
		else{
			errorMsg("No such session " . $z,'checkSessionId');
		}
	}	
	else {
        errorMsg('Method Not Allowed','checkSessionId');  
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
        errorMsg('Method Not Allowed','show');  
	}
}
function handle_find($method){ 
	if($method=='GET') {
		findPlayerTurn();
	}
	else {
        errorMsg('Method Not Allowed','find');  
	}	
}
function handle_cheatSession(){ 
	if($method=='GET') {
		informationMsg($sessionID1, 'cheatSession');
	}
	else {
        errorMsg('Method Not Allowed','heatSession');  
	}	
}
function handle_board($method, $request, $sessionID1, $sessionID2) {
	//oi elegxoi ginonte stis methodous pou kalounte
	$z=array_shift($request);
	if ((sqlreturnoneitem('select * from game_status;', 'p_turn')=='1' && $sessionID1 == $z) || (sqlreturnoneitem('select * from game_status;', 'p_turn')=="2" && $sessionID2 == $z) || $z == "cheat"){ 	
		switch ($b=array_shift($request)) {
			case '': break;
			case null: break;
			//http://localhost/Bluff2/lib/bluff.php/board/"sessionId"/show
			case 'start':handle_start($method,null);break;
			/*case 'find' : 	
			handle_main($method);break;				
			break;*/
			case 'throw': //http://localhost/Bluff2/lib/bluff.php/board/throw/"J"/5/6/7/8         //http://localhost/Bluff2/lib/bluff.php/board/throw/%22Q%22/9/10/NULL/NULL
				$c=array_shift($request);
				$d=array_shift($request);
				$e=array_shift($request);
				$f=array_shift($request);
				$g=array_shift($request);
				handle_throw($method, $c, $d, $e, $f, $g);
			break;	
			case 'pass':
				handle_pass($method);
			break;		
			case 'bluff':
				handle_bluff($method);
			break;				
			default: 
			errorMsg('Wrong command','handle_board');
			//header("HTTP/1.1 404 Not Found");
			break;
		}
	}
	else {
		errorMsg('Wrong sessionId or not your turn','board');
	}	
}
function handle_destroy($method) {
	if($method=='POST') {
		sqlwithoutreturn('update game_status SET status = \'not_active\';');
		sqlwithoutreturn('update game_status SET p_turn = 1;');
		reset_board();
	}
	else {
        errorMsg('Method Not Allowed','destroy');  
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
function handle_throw($method, $properties0, $properties, $properties2, $properties3, $properties4) {
    if($method=='POST') {
		manyMoves($properties0, $properties, $properties2, $properties3, $properties4);
	}
	else {
        errorMsg('Method Not Allowed','throw');  
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
        errorMsg('Method Not Allowed','bluff');        
	}
}
?>