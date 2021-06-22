<?php 
/* server Sign up
*/

define("ROOTPATH",   dirname(dirname(__dir__)).DIRECTORY_SEPARATOR );



if (isset($_POST) && !empty($_POST)) {

	require( ROOTPATH .'Class'.DIRECTORY_SEPARATOR.'Register.php');
  $subscrib = new Register(htmlentities(@$_POST['fname']) , htmlentities(@$_POST['lname']) , htmlentities(@$_POST['email']) , htmlentities(@$_POST['pass1']) ,  htmlentities(@$_POST['pass2']) , htmlentities(@$_POST['conditions'])   ); 

	if(  $subscrib->isbeenregister() ){
     
   	die('{success:'. htmlentities(@$_POST['email']) .'%hash%'.hash('sha256',htmlentities($_POST['pass'])).'}' ) ;
  }	
  elseif(  !$subscrib->isbeenregister() )
  {
    die(json_encode( $subscrib->seeErrors())) ;
  }
  
}



