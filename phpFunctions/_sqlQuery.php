<?php
	//caezar's library copyright 2013-2014 ... Chos!!
	function sqlSelect($columnName, $table, $condition = "1"){
		$query = mysql_query("SELECT ".$columnName." FROM ".$table." WHERE ".$condition."") 
		or die("SELECT ".$columnName." FROM ".$table." WHERE ".$condition."\n"+mysql_error());
		$row = mysql_fetch_assoc($query);
		return $row;
	}
	function sqlSelectReturnQuery($columnName, $table, $condition = "1"){
		//echo "SELECT ".$columnName." FROM ".$table." WHERE ".$condition."!";
		$query = mysql_query("SELECT ".$columnName." FROM ".$table." WHERE ".$condition."") or die("SELECT ".$columnName." FROM ".$table." WHERE ".$condition."".mysql_error());
		return $query;
	}
	function sqlSelectReturnQuery1($columnName, $table, $condition = "1"){
		//echo "SELECT ".$columnName." FROM ".$table." WHERE ".$condition."";
		$query = mysql_query("SELECT ".$columnName." FROM ".$table." WHERE ".$condition."") or die(mysql_error());
		
		return $query;
	}
	function sqlSelectReturnQuery2($columnName, $table, $condition = "1"){
		//echo "SELECT ".$columnName." FROM ".$table." WHERE ".$condition." order By number";
		$query = mysql_query("SELECT ".$columnName." FROM ".$table." WHERE ".$condition." order By number") or die(mysql_error());
		
		return $query;
	}
	function sqlInsertInto($tableColumnName, $value){

		//die("INSERT INTO ".$tableColumnName." VALUES (".$value.")");
		$query = mysql_query("INSERT INTO ".$tableColumnName." VALUES (".$value.")") or die("INSERT INTO ".$tableColumnName." VALUES (".$value.")" +"|"+mysql_error());
	}
	function sqlUpdate($table, $set, $condition = "1"){
		$query = mysql_query("UPDATE ".$table." SET ".$set." WHERE ".$condition."") or die(mysql_error());
	}
	function sqlDelete($table, $condition = "1"){
		$query = mysql_query("DELETE FROM ".$table." WHERE ".$condition."") or die(mysql_error());
	}
?>