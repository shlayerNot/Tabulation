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
			$step = 'step="0.01"';
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
            <span><input type="button" value="Submit Score" class="btn btn-primary btn-pageant" id="submit" data-toggle="modal" data-target="#modalAsk"/></span>
            <span><em>JUDGE:</em> <?php echo $_SESSION['fname']." ".$_SESSION['lname'];?></span>
        </div>
    </div><br /><br />
    <div class="row" style="margin:0;margin-top: 10px;">
    	<form role="form" method="post" name="frmPageant" id="frmPageant" action="phpFunctions/sql/submitScore.php?final">
    	<div class="col-md-6">
            <table class="table table-bordered table-main2 pull-left" border="1" style="margin-bottom:1.5%; width:99%;">
                <thead>
                    <tr>
                        <th></th>
                        <?php
                            $q = sqlSelectReturnQuery("*","final_criteria","1 ORDER BY sort");
							while($row = mysql_fetch_assoc($q)):
                        ?>
                        <th style="font-size:large;"><?php echo strtoupper($row['name']);?></th>
                        <?php endwhile;?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $sql = sqlSelectReturnQuery("*","vcandidate","type='Mr' and is_active='Yes' and finalist='Yes'");
                        while($row = mysql_fetch_assoc($sql)):
                    ?>
                    <tr>
                        <td width="36%" style="padding:10px !important;">
                            <div class="candidate-no">Candidate No. <?php echo $row['number'];?></div>
                            <div class="candidate-name"><?php echo $row['type'].". ".$row['full_name'];?></div>
                        </td>
                        <?php
                            $qr = sqlSelectReturnQuery("*","final_criteria","1 ORDER BY sort");
							while($q = mysql_fetch_assoc($qr)):
                        ?>
                        <td>
                        	<input type="hidden" name="details[]" value="<?php echo $q['name']."//".$row['id'];?>" />
                            <input type="range" data-id="<?php echo $row['id']?>" name="score[]" class="num pull-left parent-criteria" max="<?php echo $range['max'];?>"  min="<?php echo $range['min'];?>" value="0"/>
                            <div class="val pull-right">00</div>
                            <button data-finalcriteria="<?php echo $q['name']?>" data-number="<?php echo $row['number']?>" data-name="<?php echo $row['full_name']?>" data-id="<?php echo $row['id']?>" class="btn btn-sm btn-default pull-left set-score-btn" type="button" value="<?php echo $row['id']?>" data-target="#set-score-modal" data-toggle="modal">SET SCORE</button>
                        
                        </td>
                        <?php endwhile;?>
                    </tr>
                    <?php						
                        endwhile;
                    ?>
                </tbody>
            </table>
        </div>
    	<div class="col-md-6">
            <table align="center" class="table table-bordered table-main pull-right" border="1" style="width:99%;">
                <thead>
                    <tr>
                        <th></th>
                        <?php
                            $q = sqlSelectReturnQuery("*","final_criteria","1 ORDER BY sort");
							while($row = mysql_fetch_assoc($q)):
                        ?>
                        <th style="font-size:large;"><?php echo strtoupper($row['name']);?></th>
                        <?php endwhile;?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $sql = sqlSelectReturnQuery("*","vcandidate","type='Ms' and is_active='Yes' and finalist='Yes'");
                        while($row = mysql_fetch_assoc($sql)):
                    ?>
                    <tr>
                        <td width="36%" style="padding:10px !important;">
                            <div class="candidate-no">Candidate No. <?php echo $row['number'];?></div>
                            <div class="candidate-name"><?php echo $row['type'].". ".$row['full_name'];?></div>
                        </td>
                        <?php
                            $qr = sqlSelectReturnQuery("*","final_criteria","1 ORDER BY sort");
							while($q = mysql_fetch_assoc($qr)):
                        ?>
                        <td>
                        	<input type="hidden" name="details[]" value="<?php echo $q['name']."//".$row['id'];?>" />
                            <input type="range" name="score[]" data-id="<?php echo $row["id"] ?>" class="num pull-left parent-criteria" max="<?php echo $range['max'];?>"  min="<?php echo $range['min'];?>" value="0" step="0.01"/>
                            <div class="val pull-right">00</div>
                            <button data-finalcriteria="<?php echo $q['name']?>" onclick="<?php $final_crit= $q['name'] ?>"data-number="<?php echo $row['number']?>" data-name="<?php echo $row['full_name']?>" data-id="<?php echo $row['id']?>" class="btn btn-sm btn-default pull-left" type="button" value="<?php echo $row['id']?>" data-target="#set-score-modal" data-toggle="modal">SET SCORE</button>
                        
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
    <div class="modal fade" id="set-score-modal" role="dialog">
    <div class="modal-dialog modal-m">
                        
      <!-- Modal content-->
      <form id="set-score-form">
          <input type="hidden" class="hidden-id" value="0">
        <div class="modal-content">
            <div class="modal-header ">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class=" modal-title d-inline-block" style="font-weight:bold;"> <?php echo  $final_crit ?><h4>
            <h4 class="candidate-name-on-modal d-inline-block"></h4>
            </div>
            <div class="modal-body">
                <?php
                $query = sqlSelectReturnQuery1("*","final_sub_criteria","segment ='". $final_crit."' order by sort ASC");
                while($row = mysql_fetch_assoc($query)):
                ?>
                    <div class="row">
                        <div class=" form-group col-sm-9">
                            <label for="" style="font-size:20px;" ><?php echo $row['name']?></label>
                            <input name="sub-criteria" data-percentage="<?php echo $row['percentage']?>" class="form-control input-lg sub-criteria-range " type="range" data-id="<?php echo $row['id']?>" max="10" min="5" step="0.5">
                        </div>
                        <div class="form-group col-sm-3" style="text-align:center;padding-top:33px;">
                            <input type="number" value="5" class="form-control input-lg sub-criteria-text" min="5" max="10" step="0.01" data-id="<?php echo $row['id']?>">
                        </div>
                    </div>
                <?php
                endwhile;
                ?>
            </div>
            <div class="modal-footer">
            <button type="submit" class="btn btn-default" >SUMBIT</button>
            </div>
        </form>
      </div>
      
    </div>
</body>
<script>
	//$('.logout').remove();
    $(function(){
        console.log()
    });
	$('table').hide();
	$('table').fadeIn('fast');
	$('.num').on('change',function(){
		$(this).siblings('.val').html($(this).val());
	});
	$('#btnYes').on('click',function(){
		$('#frmPageant').submit();
	});
    $(".set-score-btn").on("click",function(){
            $("#set-score-form .hidden-id").val($(this).data("id"));
            console.log("GG");
            console.log($(this).data("name")+"|"+$(this).data("id"));
            $(".candidate-name-on-modal").html("#"+$(this).data("number")+" "+$(this).data("name"));
            $("#set-score-form input[type='range']").val(5.5);
            $("#set-score-form input[type='number']").val(5.5);
        });
        
        $('.sub-criteria-range').on("change",function(){
            $('.sub-criteria-text[data-id ='+$(this).data("id")+']').val($(this).val());
            console.log($(this).val());
        });
        
        $('.sub-criteria-text').on("keyup   ",function(){
            var val = $(this).val();
            $('.sub-criteria-range[data-id ='+$(this).data("id")+']').val(val);
            if(val%.5!=0){
                //console.log("not"+val);
                var reminder = val%.5;
                if(val%.5<=2){
                    $(this).val((.5 * Math.round(val/.5)));
                }
            }
            if(val>10)$(this).val(10);
            if(val<1)$(this).val(1);
            console.log($(this).val());
        });
        var parent_score = 0;
        $("#set-score-form").on("submit",function(ev){
            $("#set-score-modal").modal("hide");
            ev.preventDefault();
            console.log("Submitted");
            var id = $("#set-score-form .hidden-id").val();
            $("#set-score-form input[name='sub-criteria']").map(function(){
                console.log($(this).data("percentage"));
                parent_score+=(($(this).data("percentage")*(.01))*($(this).val()));
            });
            $(".parent-criteria[data-id='"+id+"']").prop("disabled",false);
            $(".parent-criteria[data-id='"+id+"']").val(parent_score);
            $(".parent-criteria[data-id='"+id+"']").siblings('.val').html(parent_score.toFixed(2));
            console.log(parent_score+"final score "+id);
            $(".parent-criteria[data-id='"+id+"']").prop("disabled",true);
            parent_score = 0;
            console.log(id+"GGGDD");
            console.log($(".parent-criteria[data-id='"+id+"']").val()+"<------------");
            /*
            $.ajax({
                url:"phpFunctions/setScore.php",
                type:"post",
                data:{
                    cirteria: criteria,
                    candidate_id: id
                    
                },success:function(data){
                    console.log("success saving");
                },error:function(){

                }

            });
            */
        });
</script>
</html>