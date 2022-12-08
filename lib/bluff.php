<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: HELLO, HELLO1");
//http://localhost/Bluff2/lib/bluff.php/board/show/1 ka8e fora pou kanw allh elegxw gia debug
require_once "./connect/dbconnect.php"; 
require_once "board.php";


$sessionID1 = sqlreturnoneitem('select * from game_status;', 'session1');
$sessionID2 = sqlreturnoneitem('select * from game_status;', 'session2');
require_once "handle_functions.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));

$input = json_decode(file_get_contents('php://input'),true);


switch ($r=array_shift($request)) {
	case 'find':
		handle_find($method);
	break;	
	case 'cheatSession1': //mono gia debugging
		handle_cheatSession($method, $sessionID1);		
	break;
	case 'cheatSession2': //mono gia debugging
		handle_cheatSession($method, $sessionID2);	
	break;	
    case 'startuser':
		handle_startuser($method, $sessionID1, $sessionID2);
	break;
	case 'destroy':
		handle_destroy($method);
	break;
	case 'checkSessionId':
		handle_checkSessionId($method, rawurldecode(array_shift($request)));
	break;
    case 'show' : 
		handle_show($method, array_shift($request), $sessionID1, $sessionID2);
	break; 
    case 'status' : 
		handle_status($method);
	break; 	
	case 'board' :
		handle_board($method, $request, $sessionID1, $sessionID2); 		
	break;
    default: 
		errorMsg('HTTP/1.1 404 Not Found',"");
	break;
	exit;
}
?>