<?php
function sqlreturnoneitem($sql, $commandd){ //mporei na dextei kai panw apo ena pedia
	global $mysqli;	
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	if ($res->num_rows > 0) {
		$row = $res->fetch_assoc();
		return $row[$commandd];
	}
}
function sqlreturner($sql, $commander, $type){
	global $mysqli;	
	$st = $mysqli->prepare($sql);
	$st->execute();
	if($res = $st->get_result()){
		$temp = $res->fetch_all(MYSQLI_ASSOC);
		if ($type=="informational"){
			successMsg(json_encode($temp),$commander);
		}
		else{
			successMsg(json_encode($temp),$commander);
		}
	}
}
function sqlreturnerOld($sql, $commander){
	global $mysqli;	
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);	
}
function sqlwithoutreturn($sql){
	global $mysqli;	
	$mysqli->query($sql);
}
function show_board($item) {
	$sql = 'call show_boardForMe(' . $item . ')';
	sqlreturner($sql,'show_board','success');
	//sqlreturner('CALL show_board_For_Active_Player()');
}
function game_status() {	
	$sql = 'CALL checkTimer();';
	sqlreturner($sql,'game_status','success');
}
function reset_board() {
	sqlwithoutreturn('call shuffleAll()','reset_board','success');
}
function start() {	
	sqlreturner('CALL start()','start','success');	
}
function move($properties,$properties2) {
	$sql = 'call playerMove(1,' . $properties2 . ')';
	sqlreturner($sql,'move','success');	
}
function manyMoves($properties,$properties0,$properties2,$properties3,$properties4) {
	$sql = 'call manyMoves(' . $properties . ',' . $properties0 . ',' . $properties2 . ',' . $properties3 . ',' . $properties4 . ')';
	sqlreturner($sql,'manyMoves','success');	
}
function pass() {	
	sqlwithoutreturn('call playerMove(2,null)');
}
function bluff() {
	sqlreturner('call playerMove(3,null)','bluff','success');
}
function findPlayerTurn() {
	sqlreturner('SELECT p_turn FROM game_status','findPlayerTurn','informational');
}
?>