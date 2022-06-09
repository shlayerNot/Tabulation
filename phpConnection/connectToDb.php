<?php
	session_start();
	$gaSql['user']       = "root";
	$gaSql['password']   = "";
	$gaSql['db']         = "pageant_bato";
	$gaSql['server']     = "localhost";
	error_reporting(E_ALL ^ E_DEPRECATED);
	$gaSql['link'] = mysql_pconnect($gaSql['server'],$gaSql['user'],$gaSql['password'])or die("Cannot connect to server");
	mysql_select_db($gaSql['db'], $gaSql['link'] )or die("Cannot connect to database");
	
	date_default_timezone_set('Asia/Manila');
	$D_today = date('l, jS \of F Y');					// Friday, 11th of April 2014
	$D_date = date('Y\-m\-d');							// 2014-01-31
	$D_date_mdy = date('m\/d\/Y');						// 01/31/2014
	$D_time = date('h:i A');							// 5:01 PM
	
	/*echo '<script>alert("'.$_REQUEST['category'].'");</script>';*/
?>