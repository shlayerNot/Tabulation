<?php
	error_reporting(E_ALL);
	require_once("../phpConnection/connectToDb.php");
	require_once("../dompdf/dompdf_config.inc.php");
	require_once("../phpFunctions/_sqlQuery.php");
	require_once("../phpFunctions/_dateConversion.php");
	//ob_start();
	
	$title = sqlSelect("event_name as title","event","1 limit 1");
	$range = sqlSelect("max_c_score as max, min_c_score as min","event","1 limit 1");
	$ccriteria = sqlSelect("COUNT(*) as n","final_criteria");
	$cjudge = sqlSelect("COUNT(*) as n","judge");
	
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
<body class="result" style="font-size:12px;" >
    <!-------------------------------------------------------------------------------------------------------------------->
    <?php
	$qry = sqlSelectReturnQuery("*","final_criteria");
	while($rw = mysql_fetch_assoc($qry)):
	?>
        <div class="result-title" style="padding:5px 0;">Final result for <?php echo $rw['name'];?> Category</div>
        <table class="table table-bordered" border="1" style="width:100%;" cellspacing="0">
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
                    <th width="10%">Average</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $sql = sqlSelectReturnQuery("SUM( score ) AS tscore, vfinal_score . *","vfinal_score","criteria='".$rw['name']."' and c_type='Ms' and c_is_active='Yes' GROUP BY candidate_id ORDER BY tscore DESC");
                    while($row = mysql_fetch_assoc($sql)):
                        $ave = ($row['tscore']/($cjudge['n'] * $range['max'])) * 100;
                ?>
                <tr>
                    <td>
                        <div style="text-align:center;">#<?php echo $row['c_number'];?></div>
                    </td>
                    <td>
                        <div style="text-align:left;"><?php echo $row['c_type'].". ".$row['c_full_name'];?></div>
                    </td>
                    <?php
                        $jdg = sqlSelectReturnQuery("*","judge","1 ORDER BY id ASC");
                        while($j = mysql_fetch_assoc($jdg)):
                            $scr = sqlSelect("*","final_score","criteria='".$rw['name']."' and candidate_id='".$row['candidate_id']."' and judge=".$j['id']);
                    ?>
                        <td align="center"><?php echo $scr['score'];?></td>
                    <?php endwhile;?>
                    <td align="center"><?php echo $row['tscore'];?></td>
                    <td align="center" style="font-weight:bold;"><?php echo number_format((float)$ave, 2, '.', '');?></td>
                </tr>
                <?php						
                    endwhile;
                ?>
            </tbody>
        </table>
        <table class="table table-bordered" border="1" style="width:100%; margin-top:10px;" cellspacing="0">
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
                    <th width="10%">Average</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $sql = sqlSelectReturnQuery("SUM( score ) AS tscore, vfinal_score . *","vfinal_score","criteria='".$rw['name']."' and c_type='Mr' and c_is_active='Yes' GROUP BY candidate_id ORDER BY tscore DESC");
                    while($row = mysql_fetch_assoc($sql)):
                        $ave = ($row['tscore']/($cjudge['n'] * $range['max'])) * 100;
                ?>
                <tr>
                    <td>
                        <div style="text-align:center;">#<?php echo $row['c_number'];?></div>
                    </td>
                    <td>
                        <div style="text-align:left;"><?php echo $row['c_type'].". ".$row['c_full_name'];?></div>
                    </td>
                    <?php
                        $jdg = sqlSelectReturnQuery("*","judge","1 ORDER BY id ASC");
                        while($j = mysql_fetch_assoc($jdg)):
                            $scr = sqlSelect("*","final_score","criteria='".$rw['name']."' and candidate_id='".$row['candidate_id']."' and judge=".$j['id']);
                    ?>
                        <td align="center"><?php echo $scr['score'];?></td>
                    <?php endwhile;?>
                    <td align="center"><?php echo $row['tscore'];?></td>
                    <td align="center" style="font-weight:bold;"><?php echo number_format((float)$ave, 2, '.', '');?></td>
                </tr>
                <?php						
                    endwhile;
                ?>
            </tbody>
        </table>
    <?php
	endwhile;
	?>
    <!-------------------------------------------------------------------------------------------------------------------->
    <div class="result-title" style="padding:5px 0;">Top 5 Final result</div>
    <table class="table table-bordered" border="1" style="width:100%;" cellspacing="0">
        <thead>
            <tr>
                <th width="7%">No.</th>
                <th width="35%">Name</th>
                <?php
					$crt = sqlSelectReturnQuery("*","final_criteria","1 ORDER BY sort");
					while($j = mysql_fetch_assoc($crt)):
                ?>
                	<th width="17%" style="word-break:break-word;"><?php echo $j['name'];?></th>
                <?php endwhile;?>
                <th width="11%">Average</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $sql = sqlSelectReturnQuery("*","vcandidate","is_active='Yes' and type='Ms' and finalist='Yes'");
                while($row = mysql_fetch_assoc($sql)):
            ?>
                <tr>
                    <td>
                        <div style="text-align:center;">#<?php echo $row['number'];?></div>
                    </td>
                    <td>
                        <div style="text-align:left;"><?php echo $row['type'].". ".$row['full_name'];?></div>
                    </td>
                    <?php
                        $crt = sqlSelectReturnQuery("*","final_criteria","1 ORDER BY sort");
                        $tot = 0;
                        while($j = mysql_fetch_assoc($crt)):
                            $scr = sqlSelect("SUM(score) as score","final_score","criteria='".$j['name']."' and candidate_id='".$row['id']."'");
                            $ave = ($scr['score']/($cjudge['n'] * $range['max'])) * 100;
                            $tot += $ave;
                    ?>
                            <td align="center"><?php echo number_format((float)$ave, 2, '.', '');?></td>
                    <?php endwhile;?>
                    <th align="center"><?php echo number_format((float)$tot/$ccriteria['n'], 2, '.', '');?></th>
                </tr>
            <?php
                endwhile;
            ?>
        </tbody>
    </table>
    <table class="table table-bordered" border="1" style="width:100%; margin-top:10px;" cellspacing="0">
        <thead>
            <tr>
                <th width="7%">No.</th>
                <th width="35%">Name</th>
                <?php
					$crt = sqlSelectReturnQuery("*","final_criteria","1 ORDER BY sort");
					while($j = mysql_fetch_assoc($crt)):
                ?>
                	<th width="17%" style="word-break:break-word;"><?php echo $j['name'];?></th>
                <?php endwhile;?>
                <th width="11%">Average</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $sql = sqlSelectReturnQuery("*","vcandidate","is_active='Yes' and type='Mr' and finalist='Yes'");
                while($row = mysql_fetch_assoc($sql)):
            ?>
                <tr>
                    <td>
                        <div style="text-align:center;">#<?php echo $row['number'];?></div>
                    </td>
                    <td>
                        <div style="text-align:left;"><?php echo $row['type'].". ".$row['full_name'];?></div>
                    </td>
                    <?php
                        $crt = sqlSelectReturnQuery("*","final_criteria","1 ORDER BY sort");
                        $tot = 0;
                        while($j = mysql_fetch_assoc($crt)):
                            $scr = sqlSelect("SUM(score) as score","final_score","criteria='".$j['name']."' and candidate_id='".$row['id']."'");
                            $ave = ($scr['score']/($cjudge['n'] * $range['max'])) * 100;
                            $tot += $ave;
                    ?>
                            <td align="center"><?php echo number_format((float)$ave, 2, '.', '');?></td>
                    <?php endwhile;?>
                    <th align="center"><?php echo number_format((float)$tot/$ccriteria['n'], 2, '.', '');?></th>
                </tr>
            <?php
                endwhile;
            ?>
        </tbody>
    </table>
    <br />
    
</body>
</html>
<?php 
/*
	$html = ob_get_clean(); 
	$dompdf = new DOMPDF();
	$dompdf->load_html($html);
	$dompdf->set_paper('folio', 'portrait');
	$dompdf->render();
	$dompdf->stream("report.pdf", array("Attachment" => 0));
	*/
?>