<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: HELLO, HELLO1");
//http://localhost/Bluff2/lib/bluff.php/board/show/1 ka8e fora pou kanw allh elegxw gia debug

require_once "./connect/dbconnect.php"; 
require_once "board.php";

session_start();
$sessionID1 = null;
$sessionID2 = null;
if (sqlreturnoneitem('select * from game_status;', 'session1')==null){
	$sessionID1=session_id();
	sqlwithoutreturn('update game_status set `session1` =' . $sessionID1 . ';');
}

if (sqlreturnoneitem('select * from game_status;', 'session2')==null){
	session_regenerate_id(true);
	$sessionID2=session_id();
	sqlwithoutreturn('update game_status set `session2` =' . $sessionID2 . ';');
}

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));

$input = json_decode(file_get_contents('php://input'),true);


switch ($r=array_shift($request)) {
	case 'find':
		findPlayerTurn();
	break;	
	case 'cheatSession1': //mono gia debugging
		successMsg($sessionID1);
	break;
	case 'cheatSession2': //mono gia debugging
		successMsg($sessionID2);
	break;	
    case 'startuser':
	if (sqlreturnoneitem('select * from game_status;', 'status')=='not_active'){
		sqlwithoutreturn('update game_status SET status = \'player_1_waiting\';');
		successMsg($sesionID1);
		//['successmesg' => $msg]
	}
	else if (sqlreturnoneitem('select * from game_status;', 'status')=='player_1_waiting'){
		sqlwithoutreturn('update game_status SET status = \'initialized\';');
		successMsg($sesionID2);

	}
	else{
		errorMsg('2 players already playing.');
	}
	break;
	case 'board' : 
	$z=array_shift($request);
	if ((sqlreturnoneitem('select * from game_status;', 'p_turn')=='1' && $sesionID1 == $z) || (sqlreturnoneitem('select * from game_status;', 'p_turn')=="2" && $sesionID2 == $z) || $z ="cheat"){ 	
	switch ($b=array_shift($request)) {
		case '': break;
		case null: handle_main($method,null);break;
		//http://localhost/Bluff2/lib/bluff.php/board/"sessionId"/show
		case 'start':handle_start($method,null);break;
        case 'show' : //show and start
			//$c=array_shift($request);
			//handle_main($method, $c);break;	
			handle_main($method);break;				
		break;
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
		errorMsg('Wrong command');
		//header("HTTP/1.1 404 Not Found");
				break;
	}
	}
	else {
		errorMsg('Wrong sessionId');
	}
	break;
    default: 
	errorMsg('HTTP/1.1 404 Not Found');
	break;
	exit;
}
function errorMsg($msg){
		header('Content-type: application/json');
		print json_encode(['errormesg' => $msg], JSON_PRETTY_PRINT);	
}
function successMsg($msg){
		header('Content-type: application/json');
		print json_encode(['successmesg' => $msg], JSON_PRETTY_PRINT);	
}
//function handle_main($method, $properties) {
function handle_main($method) {	
    if($method=='GET') {
		//show_board($properties);
		show_board();
	}
	else if ($method=='POST') {
           reset_board();
    } 
	else {
		errorMsg('HTTP/1.1405 Method Not Allowed');
        //header('HTTP/1.1405 Method Not Allowed');      
	}
}

function handle_throw($method, $properties0, $properties, $properties2, $properties3, $properties4) {
    if($method=='GET') {
		manyMoves($properties0, $properties, $properties2, $properties3, $properties4);
	}
	else {
        errorMsg('HTTP/1.1405 Method Not Allowed');  
	}
}
function handle_start($method) {
    if($method=='GET') {
		start();
	}
	else {		 
        errorMsg('HTTP/1.1405 Method Not Allowed');    
	}
}
function handle_pass($method){
    if($method=='GET') {
		pass();
	}
	else {
        pass();      
	}
}
function handle_bluff($method){
    if($method=='GET') {
		bluff();
	}
	else {
        bluff();      
	}
}
?>