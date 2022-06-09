<?php
	require_once("phpConnection/connectToDb.php");
	require_once("phpFunctions/_sqlQuery.php");
	require_once("phpFunctions/_dateConversion.php");
	
	if(!isset($_SESSION['lname']) && !isset($_SESSION['fname'])){
		echo '<script>';
		echo 'self.location="login.php";';
		echo '</script>';
	}
	
	$title = sqlSelect("event_name as title","event","1 limit 1");
	$range = sqlSelect("max_c_score as max, min_c_score as min","event","1 limit 1");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><?php echo $title['title'];?></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-theme.min.css" type="text/css" />
    <link href="css/tabulator.css" rel="stylesheet" type="text/css" />
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
</head>

<body>
</body>
</html>