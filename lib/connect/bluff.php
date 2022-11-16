<?php

require_once "../lib/dbconnect.php"; 


$method= $_SERVER[REQUEST_METHOD];

$request= explode('/',trim($_SERVER['SCRIPT_NAME'],'/'));
$input = json_decode(file_get_contents('php://input'),true);

switch($r=array_shift($request))
{
    case 'board' :
        switch($b=array_shift($request))
        {
            case '':
            case 'player':
            case
            /player1/1/12345
        }
}