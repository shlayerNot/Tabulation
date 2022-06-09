<?php
	error_reporting(E_ALL);
	require_once("../phpConnection/connectToDb.php");
	require_once("../dompdf/dompdf_config.inc.php");
	require_once("../phpFunctions/_sqlQuery.php");
	require_once("../phpFunctions/_dateConversion.php");
	//ob_start();
	
	$title = sqlSelect("event_name as title","event","1 limit 1");
	$range = sqlSelect("max_c_score as max, min_c_score as min","event","1 limit 1");
	$ccriteria = sqlSelect("COUNT(*) as n","criteria");
	$cjudge = sqlSelect("COUNT(*) as n","judge");
	
    $eventCategory = sqlSelect("*","criteria","name = '".$_REQUEST['category']."' limit 1");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Result</title>
	<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/tabulator.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<style>
thead{
	background: #ddd;
}
td{
	padding:1px 4px !important;
	vertical-align:middle;
}
th{
	padding:3px !important;
	text-align:center;
	vertical-align:middle;
}
table{
	margin: 0 !important;
}
</style>
<body class="result"  style="font-size:14px;">
    <div class="row">
    <div class="col-sm-12 text-center">
        <div style="font-size: 27px;margin-top: 10px;font-weight:bold"><?php echo $title['title'];?></div>
        <div style="font-size: 16px;">Municipality Of Bato<br />
                Province of Camarines 
    </div>
    </div>
    <hr class="result-hr" style="margin:0;" />
    <div style="font-size: 17px; margin-left:18px; padding:10px 0;">Final result for <?php echo $_REQUEST['category'];?> Category</div>
    <table class="table table-bordered" border="1" style="width:100%;" cellspacing="0">
        <thead>
            <tr>
                <th style="width:60px;">No.</th>
                <th width="28%">Name</th>
                <?php
                    $a=1;
					$jdg = sqlSelectReturnQuery("*","judge","1 ORDER BY id ASC");
					while($j = mysql_fetch_assoc($jdg)):
                ?>
                	<th>Judge No. <?php echo $a++?></th>
                <?php endwhile;?>
                <th width="10%">Total</th>
                <th width="10%">Total Average</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $sql = sqlSelectReturnQuery("SUM( score ) AS tscore, vscore . *","vscore","criteria='".$_REQUEST['category']."' and c_type='Ms' and c_is_active='Yes' GROUP BY candidate_id ORDER BY tscore DESC");
                while($row = mysql_fetch_assoc($sql)):
					$ave = ($row['tscore']/($cjudge['n'] * $range['max'])) * 100;
            ?>
            <tr>
                <td>
                    <div style="text-align:center;">#<?php echo $row['c_number'];?></div>
                </td>
                <td>
                    <div style="text-align:left;"><?php echo $row['c_type'].". ".$row['candidate_full_name'];?></div>
                </td>
                <?php
					$jdg = sqlSelectReturnQuery("*","judge","1 ORDER BY id ASC");
					while($j = mysql_fetch_assoc($jdg)):
						$scr = sqlSelect("*","score","criteria='".$_REQUEST['category']."' and candidate_id='".$row['candidate_id']."' and judge=".$j['id']);
                ?>
                	<td align="center"><?php echo $scr['score'];?></td>
                <?php endwhile;?>
                <td align="center"><?php echo $row['tscore'];?></td>
                <td align="center"><b><?php echo number_format((float)$ave, 2, '.', '');?></b></td>
            </tr>
            <?php						
                endwhile;
            ?>
        </tbody>
    </table>
    <br />
    <br />
<div class="row">
<?php
$i=1;
$jdg = sqlSelectReturnQuery("*","judge","1 ORDER BY id ASC");
while($j = mysql_fetch_assoc($jdg)):
?>
    
    <?php if($i==11){
        ?>
        <br/>
        <div class="col-sm-12" style="margin: 20px;text-align:center;">_____________________<br/>Chairman</div>
    <?php }
    else{

    ?>
    
        <div class="col-sm-2" style="margin: 20px;text-align:center;">_____________________<br/>Judge No.  <?php echo $i++?></div>
    
                	<!--<div style="margin: 20px">Judge No. <?php //echo$i++;?></div>-->
    <?php } endwhile;?>
    </div>
    <br />
    <!-- <table class="table table-bordered" border="1" style="width:100%;" cellspacing="0">
        <thead>
            <tr>
                <th style="width:40px;">No.</th>
                <th width="28%">Name</th>
                <?php
					$jdg = sqlSelectReturnQuery("*","judge","1 ORDER BY id ASC");
					while($j = mysql_fetch_assoc($jdg)):
                ?>
                	<th>Judge No. <?php echo $j['id'];?></th>
                <?php endwhile;?>
                <th width="10%">Total</th>
                <th width="10%">Total Average</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $sql = sqlSelectReturnQuery("SUM( score ) AS tscore, vscore . *","vscore","criteria='".$_REQUEST['category']."' and c_type='Mr' and c_is_active='Yes' GROUP BY candidate_id ORDER BY tscore DESC");
                while($row = mysql_fetch_assoc($sql)):
					$ave = ($row['tscore']/($cjudge['n'] * $range['max'])) * 100;
            ?>
            <tr>
                <td>
                    <div style="text-align:center;">#<?php echo $row['c_number'];?></div>
                </td>
                <td>
                    <div style="text-align:left;"><?php echo $row['c_type'].". ".$row['candidate_full_name'];?></div>
                </td>
                <?php
					$jdg = sqlSelectReturnQuery("*","judge","1 ORDER BY id ASC");
					while($j = mysql_fetch_assoc($jdg)):
						$scr = sqlSelect("*","score","criteria='".$_REQUEST['category']."' and candidate_id='".$row['candidate_id']."' and judge=".$j['id']);
                ?>
                	<td align="center"><?php echo $scr['score'];?></td>
                <?php endwhile;?>
                <td align="center"><?php echo $row['tscore'];?></td>
                <td align="center"><b><?php echo number_format((float)$ave, 2, '.', '');?></b></td>
            </tr>
            <?php						
                endwhile;
            ?>
        </tbody>
    </table> -->
</body>
</html>
<?php 
/*
	$html = ob_get_clean(); 
	$dompdf = new DOMPDF();
	$dompdf->load_html($html);
	$dompdf->set_paper('folio', 'portrait');
	$dompdf->render();
	$dompdf->stream("report.pdf", array("Attachment" => 0));*/
?>