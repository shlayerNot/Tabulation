<?php
	require_once("../phpConnection/connectToDb.php");?>
	
	<div class="container"  style="color: #000;">
	<h3>Official Candidates</h3>
	<div class="col-md-4">
		<table class='table table-condensed table-hover table-responsive table-bordered'>
		<?php
		$sqlmr = mysql_query("SELECT * from candidate WHERE type = 'Mr' order by number");
		?>
				<thead>
					 <tr class='info'>
						<th>No.</th>
						<th>Name</th>
						<th></th>
					  </tr>
				</thead>
				<tbody>
				<?php
				while($row = mysql_fetch_array($sqlmr)){
				echo"
				<tr>
					<td>".$row['number']."</td>
					<td>".$row['fname']." ".$row['mi']." ".$row['lname']."</td>
					<td><span class='fa fa-edit fa-fw edit'></span><span class='fa fa-trash fa-fw delete'></span></td>
				</tr>
				";
				}
				?>
				</tbody>
		</table>	
	</div>
	
	<div class="col-md-4">
		<table class='table table-condensed table-hover table-responsive table-bordered'>
		<?php
		$sqlms = mysql_query("SELECT * from candidate WHERE type = 'Ms' order by number");
		?>
				<thead>
					 <tr class='danger'>
						<th>No.</th>
						<th>Name</th>
						<th></th>
					  </tr>
				</thead>
				<tbody>
				<?php
				while($row = mysql_fetch_array($sqlms)){
				echo"
				<tr>
					<td>".$row['number']."</td>
					<td>".$row['fname']." ".$row['mi']." ".$row['lname']."</td>
					<td><span class='fa fa-edit fa-fw edit'></span><span class='fa fa-trash fa-fw delete'></span></td>
				</tr>
				";
				}
				?>
				</tbody>
		</table>	
	</div>
	</div>