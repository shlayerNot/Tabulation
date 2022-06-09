<?php
	require_once("phpConnection/connectToDb.php");
	require_once("phpFunctions/_sqlQuery.php");
	require_once("phpFunctions/_dateConversion.php");
	
	$title = sqlSelect("event_name as title","event","1 limit 1");
	
	if(isset($_SESSION['lname']) != "" && isset($_SESSION['fname']) != ""){
		header("Location: index.php");
	}
	elseif(isset($_SESSION['admin']) != ""){
		header("Location: administrator.php");
	}
	if(isset($_REQUEST['login']) && isset($_POST['txtlname']) && isset($_POST['txtfname'])){
		$ln = mysql_real_escape_string($_POST['txtlname']);
		$fn = mysql_real_escape_string($_POST['txtfname']);
		
		$row = array();
		$row = sqlSelect("*","judge","lname = '$ln' and fname = '$fn'");
		if($row  > 0){
			$_SESSION['lname'] = $row['lname'];
			$_SESSION['fname'] = $row['fname'];
			$_SESSION['jid'] = $row['id'];
			
		header("Location: index.php");
		}
		else{
			$row = sqlSelect("*","admin_user","username = '$ln' and password = '$fn'");
			if($row  > 0){
				$_SESSION['admin'] = $row['username'];
				
				header("Location: administrator.php");
			}
		}
	}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><?php echo $title['title'];?></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-theme.min.css" type="text/css" />
    <link href="css/tabulator.css" rel="stylesheet" type="text/css" />
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

	<title>Welcome to <?php echo $title['title'];?></title>

    <!-- Bootstrap core CSS -->

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <div class="container">

      <form class="form-signin" role="form" action="?login" method="post">
        <h2 class="form-signin-heading">Please Login</h2>
        <input style="margin-bottom:10px;" type="text" class="form-control lname" name="txtlname" placeholder="Enter last name" required autofocus>
        <input type="text" class="form-control fname" name="txtfname" placeholder="Enter first name" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      </form>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
