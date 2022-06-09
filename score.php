<?php
	require_once("phpConnection/connectToDb.php");
	require_once("phpFunctions/_sqlQuery.php");
	require_once("phpFunctions/_dateConversion.php");
	require_once("phpFunctions/ajaxFunction.php");
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
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/tabulator.css?v=1" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="animate/animate.css">
    
</head>
<style>
td{
	padding: 4px 8px !important;
}
</style>
<body style="overflow-y: scroll;">
    <div class="title animated bounceIn">
        <?php echo $title['title'];?>
    </div>
    <div class="animated bounceInRight" style="width: 97.2%; margin-top: 92px;">
        <div class="div-judge pull-left">
            <span><input type="button" value="Submit Score" class="btn btn-primary btn-pageant" id="submit" data-toggle="modal" data-target="#modalAsk"/></span>
            <span><em>JUDGE:</em> <?php echo $_SESSION['fname']." ".$_SESSION['lname'];?></span>
        </div>
        <div class="pull-right power-off" style="margin:0;">
            <i class="fa fa-chevron-circle-left" style="" title="Back to event category" onclick="self.location = 'index.php';">BACK</i>
        </div>
    </div><br /><br />
    <div class="content">
        
    <div class="row animated bounceInDown" style="margin:0;margin-top: 10px;">
    	<form role="form" method="post" name="frmPageant" id="frmPageant" action="phpFunctions/sql/submitScore.php">
    	<div class="col-md-8 col-md-offset-2">
            <table align="center" class="table table-bordered table-main pull-right" border="1" style="">
                <thead>
                    <tr>
                        <?php
                            $row = sqlSelect("*","criteria","name = '".$_REQUEST['criteria']."' limit 1");
                        ?>
                        <th width="40%" colspan="2" style="font-size:20px;"><?php echo strtoupper($row['name']);?></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $sql = sqlSelectReturnQuery2("*","vcandidate","type='Ms' and is_active='Yes'");
                        while($row = mysql_fetch_assoc($sql)):
                    ?>
                    <tr>
                        <td>
                            <div class="candidate-no">Candidate No. <?php echo $row['number'];?></div>
                            <div class="candidate-name"><?php echo $row['type'].". ".$row['full_name'];?></div>
                        </td>
                        <?php
                            $r = sqlSelect("*","criteria","name = '".$_REQUEST['criteria']."' limit 1");
                        ?>
                        <td>
                        <input type="hidden" name="details[]" value="<?php echo $r['name']."//".$row['id'];?>" />
                            <input step="0.01" data-id="<?php echo $row['id'];?>" disabled type="range" name="score[]" class="num pull-left parent-criteria" max="<?php echo $range['max'];?>"  min="<?php echo $range['min'];?>" value="0" />
                            <div class="val pull-right">00</div>
                            <button data-number="<?php echo $row['number']?>" data-name="<?php echo $row['full_name']?>" data-id="<?php echo $row['id']?>" class="btn btn-sm btn-default pull-left set-score-btn" type="button" value="<?php echo $row['id']?>" data-target="#set-score-modal" data-toggle="modal">SET SCORE</button>
                        </td>
                    </tr>
                    <?php						
                        endwhile;
                    ?>
                </tbody>
            </table>
        </div>
        </form>
    </div><br /><br />
    </div>
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
            <h4 class=" modal-title d-inline-block" style="font-weight:bold;"> <?php echo $_REQUEST['criteria'] ?><h4>
            <h4 class="candidate-name-on-modal d-inline-block"></h4>
            </div>
            <div class="modal-body">
                <?php
                $query = sqlSelectReturnQuery1("*","sub_criteria","segment ='".$_REQUEST['criteria']."' order by sort ASC");
                while($row = mysql_fetch_assoc($query)):
                ?>
                    <div class="row">
                        <div class=" form-group col-sm-9">
                            <label for="" style="font-size:20px;" ><?php echo $row['percentage']."% ".$row['name']?></label>
                            <input name="sub-criteria" data-percentage="<?php echo $row['percentage']?>" class="form-control input-lg sub-criteria-range" type="range" data-id="<?php echo $row['id']?>" max="10" min="5" step="0.5">
                        </div>
                        <div class="form-group col-sm-3" style="text-align:center;padding-top:33px;">
                            <input type="number" value="5" class="form-control input-lg sub-criteria-text" min="5" max="10" step="0.5" data-id="<?php echo $row['id']?>">
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
  </div>
</body>
<script>
    $(function(){
        var criteria = "<?php echo $_REQUEST['criteria'] ?>";
        //$('.logout').remove();
        $('table').hide();
        $('table').fadeIn('fast');
       
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
        
        $('.sub-criteria-text').on("change",function(){
            var val = $(this).val();
            $('.sub-criteria-range[data-id ='+$(this).data("id")+']').val(val);
            if(val%.5!=0 && val !=''){
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
            console.log(parent_score+"final score");
            $(".parent-criteria[data-id='"+id+"']").prop("disabled",true);
            parent_score = 0;
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
        $("#frmPageant").on('submit',function(ev){
            $("#frmPageant input[name='score[]']").prop("disabled",false);
        })
    });
    
    /*
    $(".set-score").on("click",function(){
        console.log("phpFunctions/getSubCriteria.php?criteria="<?php echo "+'".$_REQUEST['criteria']."'"?>);
        $.ajax({
            url:"phpFunctions/getSubCriteria.php?criteria="<?php echo "+'".$_REQUEST['criteria']."'"?>,
            type:"post",
            data:"id",
            success:function(data){
                console.log("success"+data+"|*");
            },error:function(){
                console.log("error showing subCat")
            }
        });
    });
    */
</script>
</html>