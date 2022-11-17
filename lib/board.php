<?php


function show_board($properties) {
    global $mysqli;	
	$sql = 'CALL show_boardForMe('. $properties . ')'; //. einai to +
	
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
function move($properties,$properties2) {
	global $mysqli;
	
	$sql = 'call playerMove('. $properties . ',1,'. $properties2 . ')';
	$mysqli->query($sql);
	//show_board();
}
function pass($properties,$properties2) {
	global $mysqli;
	
	$sql = 'call playerMove('. $properties . ',2,null)';
	$mysqli->query($sql);
	//show_board();
}
function bluff($properties,$properties2) {
    global $mysqli;	
	$sql = 'call playerMove('. $properties . ',3,null)';
	
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
?>