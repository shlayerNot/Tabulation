<?php
	require_once("../phpConnection/connectToDb.php");
$f_name = $_POST['f_name'];
$l_name = $_POST['l_name'];
$mi = $_POST['mi'];
$c_type = $_POST['c_type'];
$c_number = $_POST['c_number'];
mysql_query("INSERT INTO `candidate` (`lname`, `fname`, `mi`, `type`, `number`) VALUES ('$l_name', '$f_name', '$mi', '$c_type', '$c_number')");
?>