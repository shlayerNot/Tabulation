<?php
	require_once("../../phpConnection/connectToDb.php");
	require_once("../_sqlQuery.php");
	
	sqlUpdate("candidate","finalist = 'No'");
	
	$range = sqlSelect("max_c_score as max, min_c_score as min","event","1 limit 1");
	$ccriteria = sqlSelect("COUNT(*) as n","criteria");
	$cjudge = sqlSelect("COUNT(*) as n","judge");
	
	$sql = sqlSelectReturnQuery("*","vcandidate","is_active='Yes' and type='Ms'");
	while($row = mysql_fetch_assoc($sql)):
		$crt = sqlSelectReturnQuery("*","criteria","1 ORDER BY sort");
		$tot = 0;
		while($j = mysql_fetch_assoc($crt)):
			$scr = sqlSelect("SUM(score) as score","score","criteria='".$j['name']."' and candidate_id='".$row['id']."'");
			$ave = ($scr['score']/($cjudge['n'] * $range['max'])) * 100;
			$tot += $ave;
		endwhile;
			
		$ftop5[] = array(number_format((float)$tot/$ccriteria['n'], 2, '.', ''),$row['id']);
	endwhile;
	
	rsort($ftop5);
	for ($row = 0; $row <  5; $row++) {
	   sqlUpdate("candidate","finalist = 'Yes'","id=".$ftop5[$row][1]);
	}
	//----------------------------------------Mr
	$tot=0;
	
	$sql = sqlSelectReturnQuery("*","vcandidate","is_active='Yes' and type='Ms'");
	while($row = mysql_fetch_assoc($sql)):
		$crt = sqlSelectReturnQuery("*","criteria","1 ORDER BY sort");
		$tot = 0;
		while($j = mysql_fetch_assoc($crt)):
			$scr = sqlSelect("SUM(score) as score","score","criteria='".$j['name']."' and candidate_id='".$row['id']."'");
			$ave = ($scr['score']/($cjudge['n'] * $range['max'])) * 100;
			$tot += $ave;
		endwhile;
			
		$ftop5[] = array(number_format((float)$tot/$ccriteria['n'], 2, '.', ''),$row['id']);
	endwhile;
	
	rsort($ftop5);
	for ($row = 0; $row <  5; $row++) {
	   sqlUpdate("candidate","finalist = 'Yes'","id=".$ftop5[$row][1]);
	}
?>