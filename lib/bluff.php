<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: HELLO, HELLO1");
//http://localhost/Bluff2/lib/bluff.php/board/show/1 ka8e fora pou kanw allh elegxw gia debug
require_once "./connect/dbconnect.php"; 
require_once "board.php";

session_start();
$sessionID1 = sqlreturnoneitem('select * from game_status;', 'session1');
$sessionID2 = sqlreturnoneitem('select * from game_status;', 'session2');
require_once "handle_functions.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));

$input = json_decode(file_get_contents('php://input'),true);


switch ($r=array_shift($request)) {
	case 'find':
		findPlayerTurn();
	break;	
	case 'cheatSession1': //mono gia debugging
		informationMsg($sessionID1, 'cheatSession1');
	break;
	case 'cheatSession2': //mono gia debugging
		informationMsg($sessionID2, 'cheatSession2');
	break;	
    case 'startuser':
		handle_startuser($method, $sessionID1, $sessionID2);
	break;
	case 'destroy':
		sqlwithoutreturn('update game_status SET status = \'not_active\';');
		sqlwithoutreturn('update game_status SET p_turn = 1;');
		reset_board();
	break;
	case 'checkSessionId':
		$z=rawurldecode(array_shift($request));
		if (sqlreturnoneitem('select * from game_status;', 'session1') == $z){
			successMsg(json_encode(["true","1"]),'checkSessionId');
		}
		else if (sqlreturnoneitem('select * from game_status;', 'session2') == $z){
			successMsg(json_encode(["true","2"]),'checkSessionId');
		}
		else{
			errorMsg("No such session " . $z,'checkSessionId');
		}
	break;
    case 'show' : 
		handle_show($method, array_shift($request), $sessionID1, $sessionID2);
	break; 
    case 'status' : 
		handle_status($method);
	break; 	
	case 'board' : 
	$z=array_shift($request);
	if ((sqlreturnoneitem('select * from game_status;', 'p_turn')=='1' && $sessionID1 == $z) || (sqlreturnoneitem('select * from game_status;', 'p_turn')=="2" && $sessionID2 == $z) || $z == "cheat"){ 	
	switch ($b=array_shift($request)) {
		case '': break;
		case null: break;
		//http://localhost/Bluff2/lib/bluff.php/board/"sessionId"/show
		case 'start':handle_start($method,null);break;
        /*case 'show' : 	
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
		errorMsg('Wrong command','board');
		//header("HTTP/1.1 404 Not Found");
				break;
		}
	}
	else {
		errorMsg('Wrong sessionId or not your turn','board');
	}	
	break;
    default: 
	errorMsg('HTTP/1.1 404 Not Found',"");
	break;
	exit;
}
?>