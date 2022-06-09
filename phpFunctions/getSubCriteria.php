<?php
require_once("../phpConnection/connectToDb.php");
require_once("../phpFunctions/_sqlQuery.php");
$query = sqlSelectReturnQuery1("*","sub_criteria","segment ='".$_REQUEST['criteria']."'");
$array = array();
//echo $_REQUEST['criteria'];
//array_push($array);
$num = 0;
while($row = mysql_fetch_assoc($query)){
    //echo $row['name']."\n";
    array_push($array,$row["name"]);
}
json_encode($array);
?>