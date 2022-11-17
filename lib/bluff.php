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
		case null: handle_game($method,null);break;
		//http://localhost/Bluff2/lib/bluff.php/board/show/1
        case 'show' : 
			$c=array_shift($request);
			handle_game($method, $c);break;			
		break;
		case 'start': 
					handle_game($method);break;	
		case 'player': 
					break;
		default: header("HTTP/1.1 404 Not Found");
				break;
	}
	break;
    default: 	
	header("HTTP/1.1 404 Not Found");
	exit;
}

function handle_game($method, $properties) {
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
?>