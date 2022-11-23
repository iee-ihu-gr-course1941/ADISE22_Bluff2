<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

header("Access-Control-Allow-Headers: HELLO, HELLO1");
//http://localhost/Bluff2/lib/bluff.php/board/show/1 ka8e fora pou kanw allh elegxw gia debug

require_once "./connect/dbconnect.php"; 
require_once "board.php";


$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));

$input = json_decode(file_get_contents('php://input'),true);

switch ($r=array_shift($request)) {
    case 'board' : 
	switch ($b=array_shift($request)) {
		case '': break;
		case null: handle_main($method,null);break;
		//http://localhost/Bluff2/lib/bluff.php/board/show/1
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
		case 'find':
			findPlayerTurn();
		break;
		case 'pass':
			handle_pass($method);
		break;		
		case 'bluff':
			handle_bluff($method);
		break;				
		default: header("HTTP/1.1 404 Not Found");
				break;
	}
	break;
    default: 	
	header("HTTP/1.1 404 Not Found");
	exit;
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
        header('HTTP/1.1405 Method Not Allowed');      
	}
}

function handle_throw($method, $properties0, $properties, $properties2, $properties3, $properties4) {
    if($method=='GET') {
		manyMoves($properties0, $properties, $properties2, $properties3, $properties4);
	}
	else {
        header('HTTP/1.1405 Method Not Allowed');      
	}
}
function handle_start($method) {
    if($method=='GET') {
		start();
	}
	else {
        header('HTTP/1.1405 Method Not Allowed');      
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