<?php


//function show_board($properties) {
function show_board() {	
    global $mysqli;	
	//$sql = 'CALL show_boardForMe('. $properties . ')'; //. einai to +
	//$sql = 'CALL show_board_For_Active_Player()'; //. einai to +
	$sql = 'select * from tablo;';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function reset_board() {
	global $mysqli;	
	$sql = 'call shuffleAll()';
	
	$mysqli->query($sql);
	//show_board();
}
function start() {	
    global $mysqli;	
	//$sql = 'CALL show_boardForMe('. $properties . ')'; //. einai to +
	$sql = 'CALL start()'; //. einai to +
	
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);	
}
function move($properties,$properties2) {
	global $mysqli;
	$sql = 'call playerMove(1,' . $properties2 . ')';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
function manyMoves($properties,$properties0,$properties2,$properties3,$properties4) {
	global $mysqli;
	//call manyMoves('J',1,2,NULL,NULL);
	$sql = 'call manyMoves(' . $properties . ',' . $properties0 . ',' . $properties2 . ',' . $properties3 . ',' . $properties4 . ')';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
function pass() {
	global $mysqli;	
	$sql = 'call playerMove(2,null)';
	$mysqli->query($sql);
	//show_board();
}
function bluff() {
    global $mysqli;	
	$sql = 'call playerMove(3,null)';
	
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
function findPlayerTurn() {
	global $mysqli;
	$sql = 'SELECT p_turn FROM game_status';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
?>