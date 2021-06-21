<?php
 
// define value
define("ROOTPATH",dirname(__dir__).DIRECTORY_SEPARATOR );
@$url = strtolower(htmlentities($_GET['url']))  ;
(!$url)?($url='/api'):('');



//--- Data Base 
require(ROOTPATH.'elements'.DIRECTORY_SEPARATOR.'db_config.php');
 $pdo  = new PDO($db_DSN , $db_USER , $db_PASS ) ;
 

 

if(strpos($url, 'api') !==false ){
if(strpos($url, 'api/prediction') !==false ){
	include( ROOTPATH.'api'.DIRECTORY_SEPARATOR."prediction".DIRECTORY_SEPARATOR.'index.php');
}else {
	echo $url;
}
} else{
	require( __dir__.DIRECTORY_SEPARATOR.'404.php');
}
 