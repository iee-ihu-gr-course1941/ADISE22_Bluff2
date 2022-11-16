<?php

$method= $_SERVER[REQUEST_METHOD];

$request= explode('/',trim($_SERVER['SCRIPT_NAME'],'/'));


switch($r=array_shift($request))
{
    case 'board' :
        switch($b=array_shift($request))
        {
            case '':
            case 'player':
            
        }
}