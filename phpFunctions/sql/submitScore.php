<?php
	require_once("../../phpConnection/connectToDb.php");
	require_once("../_sqlQuery.php");
	if(isset($_REQUEST['final'])){
		//die($_POST['score'][$k]);
		foreach ($_POST['details'] as $key) {
			$exp = explode('//',$key);
			$k = array_search($key, $_POST['details']);
			echo $exp[1]."//".$exp[0]."//-->".$_POST['score'][$k]."<-k=".$k."-//".$_SESSION['jid'];
			sqlInsertInto("final_score(candidate_id,criteria,score,judge)"," '".$exp[1]."','".$exp[0]."','".$_POST['score'][$k]."','".$_SESSION['jid']."'");
		}
		header("Location: ../../index.php");
		die();
	}
	
	foreach ($_POST['details'] as $key) {
		//die($_POST['score'][$k]);
		$exp = explode('//',$key);
		$k = array_search($key, $_POST['details']);
		sqlInsertInto("score(candidate_id,criteria,score,judge)"," '".$exp[1]."','".$exp[0]."','".$_POST['score'][$k]."','".$_SESSION['jid']."'");
	}
	
	header("Location: ../../index.php");
?>