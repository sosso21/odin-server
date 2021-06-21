/*
----------------------------------------------------------------------------------------------------------------
-- base de donneé mysql 
prediction des universités
----------------------------------------------------------------------------------------------------------------
-- Re-création de la base de données ----------------------------------------------------------------------------Brouillon :
   **- possiblitée de se suppression
   **- possiblité de publier un une universté  
   **- possiblité de publier une nouvelle filière 
   **- Possibliée de Démarrée une prédiction



----------------------------------------------------------------------------------------------------------------
*/

DROP DATABASE IF EXISTS `odin_pred`;
CREATE DATABASE IF NOT EXISTS `odin_pred`;

USE `odin_pred`;

/*
----------------------------------------------------------------------------------------------------------------
-- Création des tables -----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
*/


---  table principal   
/*
 id , name ,
 contry
level
tcl
place
publicSchool
*/

CREATE TABLE IF NOT EXISTS univ
(
	`_id` INT NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(255) NOT NULL,
	`contry` VARCHAR(55) NOT NULL,
	`level`  smallint  DEFAULT 1,
	`tcl`  BOOLEAN DEFAULT  FALSE,
	`place` INT NOT NULL,
	`publicSchool` BOOLEAN DEFAULT  FALSE,
	UNIQUE ( `_id`) ,
  PRIMARY KEY (`_id`)
);


-- create curiculum formation tables

CREATE TABLE IF NOT EXISTS curriculum
(
	`_id` INT NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(255) NOT NULL, 
	`for_univ` INT NOT NULL,
	
		CONSTRAINT `fu_curriculum`
	 FOREIGN KEY (`for_univ`)
	  REFERENCES `univ` (`_id`)
	  ON DELETE CASCADE
	  ON UPDATE RESTRICT , 
	PRIMARY KEY(`_id`)
);



-- create required language  tables

CREATE TABLE IF NOT EXISTS languages
(
	`_id` INT NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(255) NOT NULL, 
	`for_univ` INT NOT NULL,
	
		CONSTRAINT `fu_languages`
	 FOREIGN KEY (`for_univ`)
	  REFERENCES `univ` (`_id`)
	  ON DELETE CASCADE
	  ON UPDATE RESTRICT , 
	PRIMARY KEY(`_id`)
);


-- ceate users 


CREATE TABLE IF NOT EXISTS user
(
	`_id` INT NOT NULL AUTO_INCREMENT, 
	`fname` VARCHAR(255) NOT NULL, 
	`lname` VARCHAR(255) NOT NULL, 
	`email` VARCHAR(25) NOT NULL, 
	`is_admin` BOOLEAN DEFAULT false,
	`sub_date` INT  NOT NULL DEFAULT UNIX_TIMESTAMP() , 
	`password` VARCHAR(255) NOT NULL,
	UNIQUE ( `email`) ,
	
	UNIQUE ( `_id`) ,
	PRIMARY KEY(`_id`)
) ;
 
  
















/*
## ----  insertion des donner 
--good luck ...
*/
--- insert university  : 
   INSERT INTO univ (`name`,`contry`,`level`,`tcl`,`place`,`publicSchool`) VALUES
 ("Université de Chicago",'États-Unis','1','true','400','false'),
 ("Université Tsinghua",'Chine','3','false','700','true'),
 ("Université technique de Munich",'Allemagne','5','true','210','true'),
 ("ETH Zurich",' Suisse','1','false','620','true'),
 ("Université Paris Sciences et Lettres",' France','1','true','700','true'),
 ("Université de Navarre ",' Espagne','1','false','1350','true'),
 ("Université de Cambridge",'Angleterre','5','true','150','true'),
 ("Polytechnique de Milan ",' Italie','1','false','1500','true'),
 ("University of Toronto",' Canada','1','true','530','true'),
 ("Johns Hopkins University",'Etats-Unis','1','false','1000','true'),
 ("Université de Paris",'France','1','false','1000','true'),
 ("Université de Pékin",'Chine','1','false','1050','true'),
 ("Université Agrosup Dijon",'France','3','false','540','false'),
 ("Université de Valence",'Espagne','1','true','1000','true'),
 ("University College London",'Angleterre','5','true','100','true'),
 ("Université de la Tuscia",'Italie','1','false','1500','true'),
 ("université de montréal",'Canada','1','false','710','true'),
 ("université du Zhejiang",'Chine','3','true','1200','true'),
 ("Université Le Havre Normandie",'France','5','false','170','true'),
 ("université franklin switzerland",'Suisse','1','true','930','false');  
 
 
 ----inseet curiculum : 
  INSERT INTO curriculum (`name`,`for_univ` ) VALUES
 ("Analyse de bases de données",'1' ),
 ("Big Data",'1' ),
 ("Cloud computing",'1' ),
 ("Conception d'applications",'1' ),
 ("Sécurité informatique",'1' ),
 ("Système d'information",'2' ),
 ("Big Data",'2' ),
 ("Cloud computing",'2' ),
 ("intelligence artificielle",'2' ),
 ("Cloud computing",'3' ),
 ("intelligence artificielle",'3' ),
 ("Génie logiciel",'3' ),
 ("Cloud computing",'4' ),
 ("intelligence artificielle",'4' ),
 ("Génie logiciel",'4' ),
 ("réseau informatique",'4' ),
 ("Cloud computing",'5' ),
 ("intelligence artificielle",'5' ),
 ("Génie logiciel",'5' ),
 ("réseau informatique",'5' ),
 ("Sécurité informatique",'5' ),
 ("Analyse de bases de données",'6' ),
 ("Big Data",'6' ),
 ("Cloud computing",'6' ),
 ("Génie logiciel",'6' ),
 ("réseau informatique",'6' ),
 ("Sécurité informatique",'6' ),
 ("intelligence artificielle",'7' ),
 ("Cloud computing",'7' ),
 ("Système d'information",'8' ),
 ("Big Data",'8' ),
 ("Cloud computing",'8' ),
 ("intelligence artificielle",'8' ),
 ("Génie logiciel",'8' ),
 ("Analyse de bases de données",'9' ),
 ("Big Data",'9' ),
 ("Cloud computing",'9' ),
 ("intelligence artificielle",'9' ),
 ("Génie logiciel",'9' ),
 ("Cloud computing",'10' ),
 ("intelligence artificielle",'10' ),
 ("Génie logiciel",'10' ),
 ("réseau informatique",'10' ),
 ("Architecture logicielle et matérielle",'10' ),
 ("Cloud computing",'11' ),
 ("intelligence artificielle",'11' ),
 ("Génie logiciel",'11' ),
 ("réseau informatique",'11' ),
 ("Sécurité informatique",'11' ),
 ("Architecture logicielle et matérielle",'11' ),
 ("Conception d'applications",'11' ),
 ("Analyse de bases de données",'12' ),
 ("Big Data",'12' ),
 ("Cloud computing",'12' ),
 ("Génie logiciel",'12' ),
 ("réseau informatique",'12' ),
 ("Sécurité informatique",'12' ),
 ("Architecture logicielle et matérielle",'12' ),
 ("Conception d'applications",'12' ),
 ("Analyse de bases de données",'13' ),
 ("Big Data",'13' ),
 ("Cloud computing",'13' ),
 ("Génie logiciel",'13' ),
 ("réseau informatique",'13' ),
 ("Sécurité informatique",'13' ),
 ("Architecture logicielle et matérielle",'13' ),
 ("Conception d'applications",'13' ),
 ("Système d'information",'13' ),
 ("intelligence artificielle",'13' ),
 ("Analyse de bases de données",'14' ),
 ("Big Data",'14' ),
 ("Cloud computing",'14' ),
 ("Génie logiciel",'14' ),
 ("réseau informatique",'14' ),
 ("Sécurité informatique",'14' ),
 ("Architecture logicielle et matérielle",'14' ),
 ("Conception d'applications",'14' ),
 ("Système d'information",'14' ),
 ("intelligence artificielle",'14' ),
 ("Système d'information",'15' ),
 ("Analyse de bases de données",'16' ),
 ("Big Data",'16' ),
 ("Cloud computing",'16' ),
 ("Génie logiciel",'16' ),
 ("réseau informatique",'16' ),
 ("Sécurité informatique",'16' ),
 ("Architecture logicielle et matérielle",'16' ),
 ("Conception d'applications",'16' ),
 ("Système d'information",'16' ),
 ("intelligence artificielle",'16' ),
 ("Analyse de bases de données",'17' ),
 ("Big Data",'17' ),
 ("Cloud computing",'17' ),
 ("Génie logiciel",'17' ),
 ("réseau informatique",'17' ),
 ("Sécurité informatique",'17' ),
 ("Génie logiciel",'18' ),
 ("réseau informatique",'18' ),
 ("Sécurité informatique",'18' ),
 ("Architecture logicielle et matérielle",'18' ),
 ("Conception d'applications",'18' ),
 ("Système d'information",'18' ),
 ("Système d'information",'19' ),
 ("Big Data",'19' ),
 ("Cloud computing",'19' ),
 ("intelligence artificielle",'19' ),
 ("Génie logiciel",'19' ),
 ("Analyse de bases de données",'20' ),
 ("Big Data",'20' ),
 ("Cloud computing",'20' ),
 ("Génie logiciel",'20' ),
 ("réseau informatique",'20' ),
 ("Sécurité informatique",'20' ),
 ("Architecture logicielle et matérielle",'20' ),
 ("Conception d'applications",'20' ); 
 
 
 
 --insert languaguages:  
  INSERT INTO languages (`name`,`for_univ` ) VALUES
 ('Anglais','1' ),
 ('Espagnol','1' ),
 ('Anglais','2' ),
 ('Chinois','2' ),
 ('Anglais','3' ),
 ('allemand','3' ),
 ('fr','4' ),
 ('Français','5' ),
 ('Français','6' ),
 ('Espagnol','6' ),
 ('Anglais','7' ),
 ('Italien','8' ),
 ('Anglais','9' ),
 ('Français','9' ),
 ('Anglais','10' ),
 ('Français','11' ),
 ('Français','12' ),
 ('Anglais','12' ),
 ('Chinois','12' ),
 ('Français','13' ),
 ('Anglais','13' ),
 ('Espagnol','14' ),
 ('Anglais','15' ),
 ('Italien','16' ),
 ('Français','16' ),
 ('Français','17' ),
 ('Anglais','18' ),
 ('Chinois','18' ),
 ('Français','19' ),
 ('Anglais','20' ),
 ('Suisse','20' );







-- SHOW TABLE STATUS ;
show tables ;
SELECT * FROM    univ ; 
select * from curriculum ; 
select * from languages;

/* 
// comment j'ai generer les données ? 

 // avec ce sctipt js :




////---------
/// donées 

 const data = [
  {name:'Université de Chicago' ,contry : 'États-Unis' ,curriculum : ["Analyse de bases de données" , "Big Data" , "Cloud computing" , "Conception d'applications" , "Sécurité informatique" ] ,languages: [ "Anglais" , "Espagnol"  ] ,level: '1' ,tcl : true ,place: "400" ,publicSchool:false },
  
  {name: 'Université Tsinghua' ,contry : 'Chine' ,curriculum : ["Système d'information" , "Big Data" , "Cloud computing" , "intelligence artificielle" ] ,languages: [ "Anglais" , "Chinois"  ] ,level:  '3' ,tcl : false ,place: "700" ,publicSchool: true },
  
  { name: 'Université technique de Munich' ,contry : 'Allemagne' ,curriculum : [  "Cloud computing" , "intelligence artificielle" , "Génie logiciel"] ,languages: [ "Anglais" , "allemand"  ] ,level:  '5' ,tcl : true ,place: "210" ,publicSchool: true },
  
  { name: 'ETH Zurich' ,contry : ' Suisse' ,curriculum : ["Cloud computing" , "intelligence artificielle" , "Génie logiciel" , "réseau informatique"] ,languages: [ "fr"  ] ,level:  '1' ,tcl : false ,place: "620" ,publicSchool: true },
  
  {name: 'Université Paris Sciences et Lettres' ,contry : ' France' ,curriculum : [  "Cloud computing" , "intelligence artificielle" , "Génie logiciel" , "réseau informatique" , "Sécurité informatique" ] ,languages: [ "Français"  ] ,level:  '1' , tcl :true ,place: "700" , publicSchool:true },
  
  {name:'Université de Navarre ' ,contry : ' Espagne' ,curriculum :[ "Analyse de bases de données" , "Big Data" , "Cloud computing", "Génie logiciel" , "réseau informatique" , "Sécurité informatique" ] ,languages: [ "Français" , "Espagnol"  ] ,level:  '1' ,tcl : false , place: "1350" ,publicSchool: true },
  
  { name: 'Université de Cambridge' ,contry : 'Angleterre' , curriculum :[ "intelligence artificielle" , "Cloud computing" ] ,languages: [ "Anglais" ] ,level:  '5' ,tcl : true ,place: "150" , publicSchool:true },
  
  
  {name: 'Polytechnique de Milan ' ,contry : ' Italie' ,curriculum :["Système d'information" , "Big Data" , "Cloud computing" , "intelligence artificielle" ,  "Génie logiciel"] ,languages: [  "Italien"  ] ,level:  '1' ,tcl : false ,place: "1500" ,publicSchool: true },
  
  {name:  'University of Toronto' ,contry : ' Canada' , 
  curriculum : [ "Analyse de bases de données" , "Big Data" ,"Cloud computing" , "intelligence artificielle" , "Génie logiciel"] , 
   
  languages:  [ "Anglais", "Français"  ] , 
  level:   '1'  , tcl :  true ,  
  place: "530" , publicSchool: true },
  
  {name: 'Johns Hopkins University' ,contry : 'Etats-Unis' ,curriculum : [  "Cloud computing" , "intelligence artificielle" , "Génie logiciel" , "réseau informatique" , "Architecture logicielle et matérielle"] ,languages: [ "Anglais"  ] ,level:  '1' ,tcl : false ,place: "1000" ,publicSchool: true },
  
  
  {name :  'Université de Paris' ,contry : 'France' ,curriculum : ["Cloud computing" , "intelligence artificielle" , "Génie logiciel" , "réseau informatique" , "Sécurité informatique" , "Architecture logicielle et matérielle" , "Conception d'applications" ] ,languages: [ "Français"  ] , level:'1' ,tcl :  false ,place:"1000" ,publicSchool: true },
  
  {name :  'Université de Pékin' ,contry : 'Chine' , curriculum : [  "Analyse de bases de données" , "Big Data" , "Cloud computing", "Génie logiciel" , "réseau informatique" , "Sécurité informatique" , "Architecture logicielle et matérielle" , "Conception d'applications"] , languages:[ "Français" , "Anglais" , "Chinois"  ] ,level: '1' ,tcl :  false , place:"1050" , publicSchool: true },
  
   
  { name : 'Université Agrosup Dijon' ,contry : 'France' ,curriculum :  [ "Analyse de bases de données" , "Big Data" , "Cloud computing", "Génie logiciel" , "réseau informatique" , "Sécurité informatique" , "Architecture logicielle et matérielle" , "Conception d'applications" , "Système d'information" , "intelligence artificielle" ] ,languages:[ "Français" , "Anglais"  ] , level:'3' , tcl : false ,place:"540" ,publicSchool: false },
  
  {name :  'Université de Valence' ,contry : 'Espagne' ,curriculum :  [ "Analyse de bases de données" , "Big Data" , "Cloud computing", "Génie logiciel" , "réseau informatique" , "Sécurité informatique" , "Architecture logicielle et matérielle" , "Conception d'applications" , "Système d'information" , "intelligence artificielle" ] , languages:[  "Espagnol"  ] , level:'1' ,tcl :  true ,place: "1000" ,publicSchool:  true },
  
  { name : 'University College London' ,contry : 'Angleterre' ,curriculum :  [ "Système d'information" ] ,languages: [ "Anglais" ] ,level: '5' , tcl : true ,place:"100" ,publicSchool: true },
  
  {name :  'Université de la Tuscia' ,contry : 'Italie' ,curriculum :  ["Analyse de bases de données" , "Big Data" , "Cloud computing", "Génie logiciel" , "réseau informatique" , "Sécurité informatique" , "Architecture logicielle et matérielle" , "Conception d'applications" , "Système d'information" , "intelligence artificielle" ] ,languages: [  "Italien" , "Français" ] ,level: '1' , tcl : false ,place:"1500" , publicSchool: true },
  
  {name :  'université de montréal' ,contry : 'Canada' ,curriculum :  [   "Analyse de bases de données" , "Big Data" , "Cloud computing", "Génie logiciel" , "réseau informatique" , "Sécurité informatique"] ,languages: [  "Français"  ] ,level: '1' ,tcl :false ,place: "710" ,publicSchool: true },
  
  {name :  'université du Zhejiang' ,contry : 'Chine' , curriculum : [  "Génie logiciel" , "réseau informatique" , "Sécurité informatique" , "Architecture logicielle et matérielle" , "Conception d'applications" , "Système d'information"] ,languages: [ "Anglais" , "Chinois"  ] , level:'3' ,tcl : true ,place:"1200" ,publicSchool: true },
  
  {name :  'Université Le Havre Normandie' ,contry : 'France' , curriculum : [  "Système d'information" , "Big Data" , "Cloud computing" , "intelligence artificielle" ,  "Génie logiciel" ] ,languages: [ "Français"  ] ,level: '5' ,tcl :  false ,place:"170" ,publicSchool: true },
  
  {name :  'université franklin switzerland' ,contry : 'Suisse' ,curriculum :  [  "Analyse de bases de données" , "Big Data" , "Cloud computing", "Génie logiciel" , "réseau informatique" , "Sécurité informatique" , "Architecture logicielle et matérielle" , "Conception d'applications"] ,languages: [ "Anglais" , "Suisse"  ] , level:'1' ,tcl :  true ,place:"930" , publicSchool:false }
  ]



 
// generation 

let syntaxeUniv = "INSERT INTO univ (`name`,`contry`,`level`,`tcl`,`place`,`publicSchool`) VALUES"

let syntaxCurriculum = "INSERT INTO curriculum (`name`,`for_univ` ) VALUES"

let syntaxLanguages = "INSERT INTO languages (`name`,`for_univ` ) VALUES"
 

for (let index = 0; index < data.length; index++) {
  const element = data[index];
  let  lineUniv =  `\n ("${element.name}",'${element.contry}','${element.level}','${element.tcl}','${element.place}','${element.publicSchool}')`

  let lineCurriculum = ""
  element.curriculum.map((i,k)=> {
    lineCurriculum += `\n ("${i}",'${index+1}' )`
    if (element.curriculum.length-1 == k  && data.length-1 == index ) {
      lineCurriculum += ";"
    }else{
      lineCurriculum += ","
    }
    })

    let lineLanguages = ""
    element.languages.map((i,k)=> {
      lineLanguages += `\n ('${i}','${index+1}' )`
      if (element.languages.length-1 == k  && data.length-1 == index ) {
        lineLanguages += ";"
      }else{
        lineLanguages += ","
      }
      })

  if(data.length-1 == index ){
    lineUniv+= ";"
  }else{
    lineUniv+= ","
  }
  syntaxeUniv += lineUniv
  syntaxCurriculum += lineCurriculum
  syntaxLanguages += lineLanguages
}

console.log('--- insert university  : \n  ', syntaxeUniv , " \n \n \n ----inseet curiculum : \n " ,syntaxCurriculum  , "\n \n \n \n --insert languaguages:  \n " ,syntaxLanguages)

*/

show tables ;
SELECT * FROM    univ ; 
select * from curriculum ; 
select * from languages;
