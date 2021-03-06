<?php
	require_once("phpConnection/connectToDb.php");
	require_once("phpFunctions/_sqlQuery.php");
	require_once("phpFunctions/_dateConversion.php");

	if(!isset($_SESSION['lname']) && !isset($_SESSION['fname'])){
		echo '<script>';
		echo 'self.location="login.php";';
		echo '</script>';
	}
	
	$decimal = sqlSelect("decimal_allowed as d","event", "1 limit 1");
		if($decimal['d'] == "Yes"):
			$step = 'step="0.5"';
		else:
			$step = '';
		endif;
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
<style>
td{
	padding: 4px 8px !important;
}
</style>
<body style="overflow-y: scroll;">
    <div class="title">
        <?php echo $title['title'];?>
    </div>
    <div style="width: 97.2%; margin-top: 92px;">
        <div class="div-judge pull-left">
            <?php
                $qrr = sqlSelectReturnQuery("*","score","judge = '".$_SESSION['jid']."' and criteria= '".$_REQUEST['criteria']."'");
                $row = mysql_num_rows($qrr);
                if(!$row):
            ?>
                <span><input type="button" value="Submit Score" class="btn btn-primary btn-pageant" id="submit" data-toggle="modal" data-target="#modalAsk"/></span>\
            <?php
                endif;
            ?>
            <span><em>JUDGE:</em> <?php echo $_SESSION['fname']." ".$_SESSION['lname'];?></span>
        </div>
        <div class="pull-right power-off" style="margin:0;">
            <i class="fa fa-chevron-circle-left" title="Back to event category" onclick="self.location = 'index.php';"></i>
        </div>
    </div><br /><br />
    <div class="row" style="margin:0;margin-top: 10px;">
        <form role="form" method="post" name="frmPageant" id="frmPageant" action="phpFunctions/sql/submitScore.php?criteria=<?php echo $_REQUEST['criteria']; ?>">
    
        <div class="row" style="margin:0;margin-top: 10px;">
            <table align="center" class="table table-bordered table-main pull-right" border="1" style="width:99%;">
                <thead>
                    <tr>
                        <th></th>
                        <?php
                        //final_criteria -- sub_crit
                            $q = sqlSelectReturnQuery("*","sub_criteria","criteria = '".$_REQUEST['criteria']."' ORDER BY sort");
                            while($row = mysql_fetch_assoc($q)):
                        ?>
                        <th style="font-size:large;"><?php echo $row['name'];?></th>
                        <?php
                            endwhile;
                        ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $sql = sqlSelectReturnQuery("*","candidate","type='Ms' and is_active='Yes' and finalist='Yes'");
                        while($row = mysql_fetch_assoc($sql)):
                    ?>
                    <tr>
                        <td width="36%" style="padding:10px !important;">
                            <div class="candidate-no">Candidate No. <?php echo $row['number'];?></div>
                            <div class="candidate-name"><?php echo $row['type'].". ".$row['fname']." ".$row['mi']." ".$row['lname'];?></div>
                        </td>
                        <?php
                            $qr = sqlSelectReturnQuery("*","sub_criteria","criteria = '".$_REQUEST['criteria']."' ORDER BY sort");
                            while($q = mysql_fetch_assoc($qr)):
                        ?>
                        <td>
                            <input type="hidden" name="details[]" value="<?php echo $q['name']."//".$row['id']."//".$row['number']."";?>" />
                            <input type="range" name="score[]" class="num pull-left" max="<?php echo $range['max'];?>"  min="<?php echo $range['min'];?>" value="0" <?php echo $step;?>/>
                            <div class="val pull-right">00</div>
                        </td>
                        <?php endwhile;?>
                    </tr>
                    <?php                       
                        endwhile;
                    ?>
                </tbody>
                
            </table>
        </div>
        </form>
    </div><br /><br />
    <?php
        require_once("phpFunctions/modal/modalAsk.html");
    ?>
    <div class="footer">
        <div class="pull-left">Copyright &copy; Camarines Sur Polytechnic Colleges</div>&nbsp;
        <div class="pull-right"><i class="fa fa-power-off logout" title="Logout" onclick="self.location = 'phpFunctions/_logout.php?admin';"></i> | Web Design and Development by: Caezar Ian Olivares</div>
    </div>
</body>
<script>
	//$('.logout').remove();
	$('table').hide();
	$('table').fadeIn('fast');
	$('.num').on('change',function(){
		$(this).siblings('.val').html($(this).val());
	});
	$('#btnYes').on('click',function(){
		$('#frmPageant').submit();
	});
</script>
</html>