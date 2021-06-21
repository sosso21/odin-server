<?php
  
// api / prediction

function toJson($Array =[]){
    $data = [];
    foreach ($Array as $key => $value) {
              $element =  $value ;
        $element['curriculum'] =array_unique(explode( ",",$value['curriculum']));
        $element['languages'] =array_unique(explode( ",",$value['languages']));
        array_push($data ,$element);
       }
       return json_encode($data);
}

if (strpos($url, 'api/prediction/all') !==false) {
     
$requestText =  "SELECT univ.* , GROUP_CONCAT( curriculum.name ) as curriculum ,GROUP_CONCAT( languages.name  ) as languages  FROM univ   JOIN curriculum ON univ._id=curriculum.for_univ  JOIN languages ON univ._id=languages.for_univ   GROUP BY univ._id";

$request = $pdo->query($requestText);
$result =  $request->fetchAll(PDO::FETCH_ASSOC );
  
 die(toJson($result)) ; 

 }

 
 if (strpos($url, 'api/prediction/filter/') !==false) {
     
	$filer =str_replace("api/prediction/filter/", "", $url);
	$filer =addslashes(str_replace("%", " ", $filer));
   
    $requestText =  "SELECT univ.* , GROUP_CONCAT( curriculum.name ) as curriculum ,GROUP_CONCAT( languages.name  ) as languages  FROM univ   JOIN curriculum ON univ._id=curriculum.for_univ  JOIN languages ON univ._id=languages.for_univ WHERE univ.name LIKE '%".$filer."%' OR curriculum.name LIKE '%". $filer."%' OR  languages.name  LIKE '%".$filer."%' GROUP BY univ._id";
    
    $request = $pdo->query($requestText);
    $result =  $request->fetchAll(PDO::FETCH_ASSOC );
      
    die(toJson($result)); 
    
     }

//--post
//- give prediction

     if (strpos($url, 'api/prediction/postPrediction/') !==false && !empty($_POST["contry"]) && !empty($_POST["curriculum"]) && !empty($_POST["level"]) && !empty($_POST["tcl"]) && !empty($_POST["publicSchool"]) && !empty($_POST["languages"]) ) {
     
        // variable 
        $contry= addslashes($_POST["contry"]);
        $curriculum= addslashes($_POST["curriculum"]);
        $level= addslashes($_POST["level"]);
        $tcl= addslashes($_POST["tcl"]);
        $publicSchool= addslashes($_POST["publicSchool"]);
        $languages = addslashes($_POST["languages"]);
        
        $requestText =  "SELECT univ.* , GROUP_CONCAT( curriculum.name ) as curriculum ,GROUP_CONCAT( languages.name  ) as languages  FROM univ   JOIN curriculum ON univ._id=curriculum.for_univ  JOIN languages ON univ._id=languages.for_univ WHERE univ.contry ='".$contry."' AND curriculum.name  LIKE '%".$curriculum."%' AND univ.level = '".$level."' AND univ.tcl = '".$tcl."' AND univ.publicSchool = '".$publicSchool."' OR languages.name   LIKE '%".$languages."%' GROUP BY univ._id";
        
        $request = $pdo->query($requestText);
        $result =  $request->fetchAll(PDO::FETCH_ASSOC );
          
        die(toJson($result)); 
        
         }
    
    
    
         if (strpos($url, 'api/prediction/admin/edit') !==false && !empty($_POST["_id"]) && !empty($_POST["name"]) && !empty($_POST["place"]) && !empty($_POST["contry"]) && !empty($_POST["curriculum"]) && !empty($_POST["level"]) && !empty($_POST["tcl"]) && !empty($_POST["publicSchool"]) && !empty($_POST["languages"]) ) {
            $_id = addslashes($_POST["_id"] );
            $name = addslashes($_POST["name"] );
            $place = addslashes($_POST["place"] );
            $contry = addslashes($_POST["contry"] );
            $curriculum = addslashes($_POST["curriculum"] );
            $level = addslashes($_POST["level"] );
            $tcl = addslashes($_POST["tcl"] );
            $publicSchool = addslashes($_POST["publicSchool"] );
            $languages = addslashes($_POST["languages"] );

            $textReqUniv = " UPDATE  `univ`
            SET  `name`= '".$name."',
`place`= '".$place."',
`contry`= '".$contry."',
`level`= '".$level."',
`tcl`= '".$tcl."',
`publicSchool`= '".$publicSchool."'
            WHERE _id = ".$_id ;

$textReqCuriculumDel = " DELETE FROM  `curriculum`
WHERE for_univ = ".$_id ;

$textReqLanguagesDel = " DELETE FROM  `languages`
WHERE for_univ = ".$_id ;

$textReqCuriculumIns = " INSERT INTO `curriculum` (`name`,`for_univ`)
VVALUES " ;
foreach ($curriculum as $key => $value) {
     $textReqCuriculumIns .="('".$value."', '".$_id."' )";
     if ($key+1 != count($curriculum)) {
       $textReqCuriculumIns.= ","
     }
}

$textReLanguagesIns = " INSERT INTO `languages` (`name`,`for_univ`)
VALUES " ;
foreach ($languages as $key => $value) {
     $textReLanguagesIns .="('".$value."', '".$_id."' )";
     if ($key+1 != count($languages)) {
       $textReLanguagesIns.= ","
     }
}

$requestText =  "SELECT univ.* , GROUP_CONCAT( curriculum.name ) as curriculum ,GROUP_CONCAT( languages.name  ) as languages  FROM univ   JOIN curriculum ON univ._id=curriculum.for_univ  JOIN languages ON univ._id=languages.for_univ   GROUP BY univ._id";

$request = $pdo->query($textReqUniv);
$request = $pdo->query($textReqCuriculumDel);
$request = $pdo->query($textReqLanguagesDel);
$request = $pdo->query($textReqCuriculumIns);
$request = $pdo->query($textReLanguagesIns);
$request = $pdo->query($requestText);
$result =  $request->fetchAll(PDO::FETCH_ASSOC );
  
 die(toJson($result)) ; 

         } 


         
         if (strpos($url, 'api/prediction/admin/add') !==false && !empty($_POST["name"]) && !empty($_POST["place"]) && !empty($_POST["contry"]) && !empty($_POST["curriculum"]) && !empty($_POST["level"]) && !empty($_POST["tcl"]) && !empty($_POST["publicSchool"]) && !empty($_POST["languages"]) ) {
            
            $name = addslashes($_POST["name"] );
            $place = addslashes($_POST["place"] );
            $contry = addslashes($_POST["contry"] );
            $curriculum = addslashes($_POST["curriculum"] );
            $level = addslashes($_POST["level"] );
            $tcl = addslashes($_POST["tcl"] );
            $publicSchool = addslashes($_POST["publicSchool"] );
            $languages = addslashes($_POST["languages"] );

            $textReqUniv = " INSERT INTO   `univ` ('name',
'place',
'contry',
'level',
'tcl',
'publicSchool') VALUES( '".$name."',
'".$place."',
'".$contry."',
'".$level."',
'".$tcl."',
'".$publicSchool."' )";
 
 
$request = $pdo->query($textReqUniv);
$request = $pdo->query("SELECT COUNT(*) FROM univ ");
$_id =  $request->fetchAll(PDO::FETCH_ASSOC )[0];

$textReqCuriculumIns = " INSERT INTO `curriculum` (`name`,`for_univ`)
VALUES " ;
foreach ($curriculum as $key => $value) {
     $textReqCuriculumIns .="('".$value."', '".$_id."' )";
     if ($key+1 != count($curriculum)) {
       $textReqCuriculumIns.= ","
     }
}

$textReLanguagesIns = " INSERT INTO `languages` (`name`,`for_univ`)
VALUES " ;
foreach ($languages as $key => $value) {
     $textReLanguagesIns .="('".$value."', '".$_id."' )";
     if ($key+1 != count($languages)) {
       $textReLanguagesIns.= ","
     }
}

$requestText =  "SELECT univ.* , GROUP_CONCAT( curriculum.name ) as curriculum ,GROUP_CONCAT( languages.name  ) as languages  FROM univ   JOIN curriculum ON univ._id=curriculum.for_univ  JOIN languages ON univ._id=languages.for_univ   GROUP BY univ._id";
 
$request = $pdo->query($textReqCuriculumIns);
$request = $pdo->query($textReLanguagesIns); 
$request = $pdo->query($requestText);
$result =  $request->fetchAll(PDO::FETCH_ASSOC );
  
 die(toJson($result)) ; 

         } 


         if (strpos($url, 'api/prediction/admin/del') !==false && !empty($_POST["_id"]) ) {
            $_id = addslashes($_POST["_id"] ); 
            
            $textReqUnivDel = " DELETE FROM  `univ`
            WHERE _id = ".$_id ;
            
            $textReqCuriculumDel = " DELETE FROM  `curriculum`
            WHERE for_univ = ".$_id ;

$textReqLanguagesDel = " DELETE FROM  `languages`
WHERE for_univ = ".$_id ;

$requestText =  "SELECT univ.* , GROUP_CONCAT( curriculum.name ) as curriculum ,GROUP_CONCAT( languages.name  ) as languages  FROM univ   JOIN curriculum ON univ._id=curriculum.for_univ  JOIN languages ON univ._id=languages.for_univ   GROUP BY univ._id";

$request = $pdo->query($textReqUnivDel);
$request = $pdo->query($textReqCuriculumDel);
$request = $pdo->query($textReqLanguagesDel);
$request = $pdo->query($requestText);
$result =  $request->fetchAll(PDO::FETCH_ASSOC );
  
 die(toJson($result)) ; 
 

}