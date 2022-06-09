<?php 
function dateConversion($dt){
//example 01/31/2014
	$dateArray = explode("-", $dt);
	$dtReturn = $dateArray[1]."/".$dateArray[2]."/".$dateArray[0];

	return $dtReturn;
}
function dateConversion2($dt){
//example January 1, 2014
	$dateArray = explode("-", $dt);
	$dtReturn = date("F", mktime(0, 0, 0, $dateArray[1], $dateArray[2], $dateArray[0]))." ".date("j", mktime(0, 0, 0, $dateArray[1], $dateArray[2], $dateArray[0])).", ".date("Y", mktime(0, 0, 0, $dateArray[1], $dateArray[2], $dateArray[0]));

	return $dtReturn;
}
function dateConversion3($dt){
//example Jan 1, 2014
	$dateArray = explode("-", $dt);
	$dtReturn = date("M", mktime(0, 0, 0, $dateArray[1], $dateArray[2], $dateArray[0]))." ".date("j", mktime(0, 0, 0, $dateArray[1], $dateArray[2], $dateArray[0])).", ".date("Y", mktime(0, 0, 0, $dateArray[1], $dateArray[2], $dateArray[0]));

	return $dtReturn;
}
?>