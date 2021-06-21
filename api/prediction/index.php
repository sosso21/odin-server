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
//- giv prediction

     if (strpos($url, 'api/prediction/postPrediction/') !==false && !empty($_POST["contry"]) && !empty($_POST["curriculum"]) && !empty($_POST["level"]) && !empty($_POST["tcl"]) && !empty($_POST["publicSchool"]) && !empty($_POST["languages"]) ) {
     
        // variable 
        $contry= addslashes($_POST["contry"]);
        $curriculum= addslashes($_POST["curriculum"]);
        $level= addslashes($_POST["level"]);
        $tcl= addslashes($_POST["tcl"]);
        $publicSchool= addslashes($_POST["publicSchool"]);
        $languages = addslashes($_POST["languages"]);
        
        $requestText =  "SELECT univ.* , GROUP_CONCAT( curriculum.name ) as curriculum ,GROUP_CONCAT( languages.name  ) as languages  FROM univ   JOIN curriculum ON univ._id=curriculum.for_univ  JOIN languages ON univ._id=languages.for_univ WHERE univ.contry ='".$contry."' AND curriculum.name  LIKE '%".$filer."%' AND univ.level = '".$level."' AND univ.tcl = '".$tcl."' AND univ.publicSchool = '".$publicSchool."' OR languages.name   LIKE '%".$languages."%' GROUP BY univ._id";
        
        $request = $pdo->query($requestText);
        $result =  $request->fetchAll(PDO::FETCH_ASSOC );
          
        die(toJson($result)); 
        
         }
    
    
    