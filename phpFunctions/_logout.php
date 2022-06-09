<?php
	require_once("../phpConnection/connectToDb.php");
	require_once("../phpFunctions/_sqlQuery.php");

	session_destroy();
	header("Location: ../login.php");
?>