<?php
function errorMsg($msg, $commander){
		header('Content-type: application/json');
		//header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg' => $msg, 'commander' => $commander], JSON_PRETTY_PRINT);	
}
function successMsg($msg, $commander){
		header('Content-type: application/json');
		print json_encode(['successmesg' => $msg, 'commander' => $commander], JSON_PRETTY_PRINT);	
}
//function handle_main($method, $properties) {
function handle_main($method,$item) {	
    if($method=='GET') {
		//show_board($properties);
		show_board($item);
	}
	else if ($method=='POST') {
           reset_board();
    } 
	else {
		errorMsg('HTTP/1.1405 Method Not Allowed','board');
        //header('HTTP/1.1405 Method Not Allowed');      
	}
}
function handle_status($method) {	
    if($method=='GET') {
		game_status();
	}
	else {
		errorMsg('HTTP/1.1405 Method Not Allowed','status');  
	}
}
function handle_throw($method, $properties0, $properties, $properties2, $properties3, $properties4) {
    if($method=='GET') {
		manyMoves($properties0, $properties, $properties2, $properties3, $properties4);
	}
	else {
        errorMsg('HTTP/1.1405 Method Not Allowed','board');  
	}
}
function handle_start($method) {
    if($method=='GET') {
		start();
	}
	else {		 
        errorMsg('HTTP/1.1405 Method Not Allowed','board');    
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