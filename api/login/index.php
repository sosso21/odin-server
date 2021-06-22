<?php
/*
   server login

*/



define("ROOTPATH",   dirname(dirname(__dir__)).DIRECTORY_SEPARATOR );


if (isset($_POST) && !empty($_POST)) {
	require(ROOTPATH.'Class'.DIRECTORY_SEPARATOR.'Login.php');
	$Login = new Login(htmlentities(@$_POST['email']) , htmlentities(@$_POST['pass']) );
     $Youlogin = $Login->Youlogin();
     
	if ($Youlogin) {
    echo '{Success:true}' ;   
    }
    else
    {
        echo  $Login->error() ;
    }
}


?>