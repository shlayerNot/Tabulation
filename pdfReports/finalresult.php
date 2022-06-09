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
	
	sqlUpdate("candidate","finalist = 'No'");
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
	padding:0 4px !important;
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
    <div class="row">
    <div class="col-sm-12 text-center">
        <div style="font-size: 27px;margin-top: 10px;font-weight:bold"><?php echo $title['title'];?></div>
        <div style="font-size: 16px;">Municipality Of Balatan<br />
                Province of Camarines 
    </div>
    </div>
    <hr class="result-hr" style="margin:0px;" />
    <div class="result-title" style="padding:10px 0;">Final result for <?php echo $title['title'];?></div>
    <table class="table table-bordered" border="1" style="width:100%;" cellspacing="0">
        <thead>
            <tr>
                <th width="5%">No.</th>
                <th width="25%">Name</th>
                <?php
					$crt = sqlSelectReturnQuery("*","criteria","1 ORDER BY sort");
					while($j = mysql_fetch_assoc($crt)):
                ?>
                	<th width="11%" style="word-break:break-word;"><?php echo $j['name']."(".$j['percentage'].")";?></th>
                <?php endwhile;?>
                <th width="11%">Total Average</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $sql = sqlSelectReturnQuery("*","vcandidate","is_active='Yes' and type='Ms'");
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
                        $crt = sqlSelectReturnQuery("*","criteria","1 ORDER BY sort");
                        $tot = 0;
                        while($j = mysql_fetch_assoc($crt)):
                            $scr = sqlSelect("SUM(score) as score","score","criteria='".$j['name']."' and candidate_id='".$row['id']."'");
                            $ave = ($scr['score']/($cjudge['n'] * $range['max'])) * 100;
                            $tot += $ave;
                    ?>
                            <td align="center"><?php echo number_format((float)$ave, 2, '.', '');?></td>
                    <?php endwhile;?>
                    <th align="center"><?php echo number_format((float)$tot/$ccriteria['n'], 2, '.', '');?></th>
                </tr>
            <?php		
				$ftop5[] = array(number_format((float)$tot/$ccriteria['n'], 2, '.', ''),$row['id']);
                endwhile;
				
				rsort($ftop5);
				for ($row = 0; $row <  4; $row++) {
				   sqlUpdate("candidate","finalist = 'Yes'","id=".$ftop5[$row][1]);
				}
            ?>
        </tbody>
    </table>
    <br />
    <hr class="result-hr" style="margin-top:15px; margin-bottom:0px;" />
    <div class="result-title"  style="padding-top:10px;">TOP 5 (<i>in no particular order</i>)</div>
    <div style="float:left; width:50%;font-size: 14px;">
    	<ul>
        	<?php $qry = sqlSelectReturnQuery("*","vcandidate","is_active='Yes' and finalist='Yes' and type='Ms'");
			while($row = mysql_fetch_assoc($qry)):
				echo '<li>'.$row['type'].". ".$row['full_name'].'</li>';
			endwhile;
			?>
        </ul>
    </div>
    <div style="float:right; width:50%;font-size: 14px;">
    	<ul>
        	<?php $qry = sqlSelectReturnQuery("*","vcandidate","is_active='Yes' and finalist='Yes' and type='Mr'");
			while($row = mysql_fetch_assoc($qry)):
				echo '<li>'.$row['type'].". ".$row['full_name'].'</li>';
			endwhile;
			?>
        </ul>
    </div>
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