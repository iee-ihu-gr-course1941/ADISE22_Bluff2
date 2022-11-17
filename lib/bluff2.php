<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

header("Access-Control-Allow-Headers: HELLO, HELLO1");
require_once "./connect/dbconnect.php"; 
require_once "./connect/board.php";


$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));

$input = json_decode(file_get_contents('php://input'),true);

switch ($r=array_shift($request)) {
    case 'board' : 
	switch ($b=array_shift($request)) {
		case '': break;
		case null: handle_board($method);break;
		//http://localhost/Bluff2/lib/bluff.php/board/1
        case '1': handle_board($method);break;
		case 'piece': 
					break;
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

function handle_board($method) {
    if($method=='GET') {
            show_board();
    } else if ($method=='POST') {
           reset_board();
    } else {
        header('HTTP/1.1405 Method Not Allowed');
    }
    
}

?>