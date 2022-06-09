<?php
	require_once("phpConnection/connectToDb.php");
	require_once("phpFunctions/_sqlQuery.php");
	require_once("phpFunctions/_dateConversion.php");
	
	if(!isset($_SESSION['lname']) && !isset($_SESSION['fname'])){
		header("Location: login.php");
	}
	
	$title = sqlSelect("event_name as title","event","1 limit 1");
	$check = false;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><?php echo $title['title'];?></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-theme.min.css" type="text/css" />
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="css/tabulator.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="animate/animate.css">
</head>

<body style="overflow-y: scroll;">
    <div class="title animated bounceIn delay-3s">
        <?php echo $title['title'];?>
    </div>
    <div class="parent-div-wait">
		<?php
            $sql = sqlSelectReturnQuery("*","criteria","1=1 order by sort");
            while($row = mysql_fetch_assoc($sql)):
				//$sql2 = sqlSelectReturnQuery("name 	","vscore","criteria='".$row['name']."' and judge=".$_SESSION['jid']." order by sort asc");
				//$sql2 = sqlSelectReturnQuery("name","criteria","name IN(SELECT DISTINCT('criteria') FROM vscore WHERE criteria='".$row['name']."' and judge=".$_SESSION['jid'].") order by sort asc");
				$sql2 = sqlSelectReturnQuery("DISTINCT('criteria')","vscore","criteria='".$row['name']."' and judge=".$_SESSION['jid']);
				if(!mysql_num_rows($sql2)):
					$check = true;
					?>
					<div class="btn-criteria animated bounceInDown  " onclick="self.location='score.php?criteria=<?php echo $row['name'];?>'"><?php echo $row['name']?></div>
					<?php
				endif;
            endwhile;
			if($check == false):
				$sql3 = sqlSelect("topCandidates","event");
				if($sql3['topCandidates'] == 'Inactive'){
				?>
				<script>
					setTimeout(function(){
					   window.location.reload(1);
					}, 3000);
				</script>
				<?php
				}else{
					$sql4 = sqlSelectReturnQuery("*","vfinal_score","judge=".$_SESSION['jid']);
					if(mysql_num_rows($sql4) == 0):
						header('Location: top.php');
					else:
					?>
                        <div class="parent-div-wait">
                            <div class="div-wait" >Thank you!</div>
                        </div>
                	<?php
					endif;
				}
		?>
                <div class="parent-div-wait">
                    <div class="div-wait" >Please wait for the Announcement of Top 5<br />Thank you!</div>
                </div>
		<?php
			endif;
        ?>
    </div>
    <div class="footer">
    	<div class="pull-left">Copyright &copy; Camarines Sur Polytechnic Colleges</div>&nbsp;
    	<div class="pull-right"><i class="fa fa-power-off logout" title="Logout" onclick="self.location = 'phpFunctions/_logout.php';"></i> | Web Design and Development by: Caezar Ian Olivares</div>
    </div>
    <script>
		$('.parent-div-wait').height($(document).height());
		$('.parent-div-wait').width($(document).width());
		$('.div-wait').width($(document).width());
		$('.btn-criteria').hide();
		$('.btn-criteria').fadeIn('slow');
		
	</script>
</body>
</html>