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
        case 'show' : //show and start
			$c=array_shift($request);
			handle_main($method, $c);break;			
		break;
		case 'throw': 
			$c=array_shift($request);
			$d=array_shift($request);
			$e=array_shift($request);
			$f=array_shift($request);
			handle_throw($method, $c, $d,null,null,null);
		break;	
		default: header("HTTP/1.1 404 Not Found");
				break;
	}
	break;
    default: 	
	header("HTTP/1.1 404 Not Found");
	exit;
}

function handle_main($method, $properties) {
    if($method=='GET') {
		if ($properties!=null){
			show_board($properties);
			}
		else{
			//header('HTTP/1.1405 Method Not Allowed - GET needs 2 parameters');   
		}
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
		if ($properties2==null && $properties3==null && $properties4==null){
			move($properties0, $properties);
		}
		else if ($properties3==null && $properties4==null){
			//header('HTTP/1.1405 Method Not Allowed - GET needs 2 parameters');   
		}
		else if ($properties4==null){
			//header('HTTP/1.1405 Method Not Allowed - GET needs 2 parameters');   
		}	
		else {
			header('HTTP/1.1405 Method Not Allowed - GET needs 1-5 parameters');      
		}		
	}
	else {
        header('HTTP/1.1405 Method Not Allowed');      
	}
}
?>