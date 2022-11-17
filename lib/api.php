<?php
//C:\xampp\htdocs\api.php
header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");

header("Access-Control-Allow-Headers: HELLO, HELLO1");

error_reporting(E_ALL ^ E_NOTICE);

try
{

	SESSION_START();
    //$username = $_REQUEST['HELLO'];
    //$password = $_REQUEST['HELLO1'];
	
    //if (empty($username) && empty($password))
        //throw new Exception("What's up?", 200);	
    if ($_REQUEST['REQUEST_METHOD'] == "GET")
    {
        $data = 0;
        echo $data;
    }
    else if ($_REQUEST['REQUEST_METHOD'] == "POST")
    {
        $data = 0;
    }
}
catch (Exception $e)
{
    $protocol = $_SERVER["SERVER_PROTOCOL"];
    $code = (($e->getCode() >= 200) ? $e->getCode() : 500);
    $message = $e->getMessage();
    header("$protocol $code $message");
    echo $e->getMessage();
}