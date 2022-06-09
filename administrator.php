<?php
	require_once("phpConnection/connectToDb.php");
	require_once("phpFunctions/_sqlQuery.php");
	require_once("phpFunctions/_dateConversion.php");
	
	if(!isset($_SESSION['admin'])){
		header("Location: login.php");
	}
	if(isset($_REQUEST['judge-top-five'])){
		sqlUpdate("event","topCandidates = 'Active'");
	}
	
	$title = sqlSelect("event_name as title","event","1 limit 1");

	$cjudge = sqlSelect("COUNT(*) as n","judge");
	$ccriteria = sqlSelect("COUNT(*) as n","criteria");
	$ccandidate = sqlSelect("COUNT(*) as n","candidate");
	$cscore = sqlSelect("COUNT(*) as n","score");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><?php echo $title['title'];?></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-theme.min.css" type="text/css" />
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/tabulator.css" rel="stylesheet" type="text/css" />
    
</head>
<body style="overflow-y: scroll; color:#FFF !important;">
    <div class="title">
        <?php echo $title['title'];?>
    </div>
    <div class="parent-div-wait">
		<?php
			$sql = sqlSelectReturnQuery("*","criteria","1 ORDER BY sort");
            while($row = mysql_fetch_assoc($sql)):
				$checkScore = sqlSelect("COUNT(DISTINCT (judge)) as cnt","vscore","criteria='".$row['name']."'");
				//echo $checkScore['cnt'].'-----------'.$judge['num'];
				if($checkScore['cnt'] == $cjudge['n']):
        ?>
                    <a href="pdfreports/results.php?category=<?php echo $row['name'];?>" target="_blank">
                        <div class="btn-criteria" style="width: 70%;"><i class="fa fa-print"></i>&nbsp; Print result for <?php echo $row['name'];?> Category</div>
                    </a>
        <?php
				endif;
            endwhile;
			
			$tot = $cjudge['n'] * $ccandidate['n'] * $ccriteria['n'];
			if($tot == $cscore['n']):
				$q = sqlSelect("topCandidates as top","event");
        ?>
				<div class="btn-final-result" onclick="window.open('pdfreports/finalresult.php', '_blank');"><i class="fa fa-print"></i>&nbsp; Print final result</div>
        		<?php if($q['top'] == 'Inactive'):?>
                	<input type="button" onclick="self.location = 'administrator.php?judge-top-five';" value="Judge top 5 candidates? (<?php echo $q['top'];?>)" class="btn btn-primary btn-pageant" style="width:auto; margin:auto 10px ;" />
        <?php 
				endif;
			endif;
			
			$sql2 = sqlSelectReturnQuery("*","vfinal_score","1 GROUP BY judge");
			if(mysql_num_rows($sql2) == $cjudge['n']):
		?>
        <input type="button" onclick="window.open('pdfReports/finalist-final-result.php');" value="Print finalist final score result" class="btn btn-primary btn-pageant" style="width:auto;" />
        <?php
			endif;
		?>
            
        <br />
    </div>
    <div class="footer">
    	<div class="pull-left">Copyright &copy; Camarines Sur Polytechnic Colleges</div>&nbsp;
    	<div class="pull-right"><i class="fa fa-power-off logout" title="Logout" onclick="self.location = 'phpFunctions/_logout.php?admin';"></i> | Web Design and Development by: Caezar Ian Olivares</div>
    </div>
    <script>
		$('.parent-div-wait').height($(document).height());
		$('.parent-div-wait').width($(document).width());
		
		$('.title').hide();
		$('.btn-criteria').hide(); 
		
		$('.btn-criteria').fadeIn('fast');
		$('.title').fadeIn('fast');
	</script>
</body>
</html>