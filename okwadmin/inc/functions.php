<?php require_once('conf.php'); 

function rndstring($length) // generate random key or length $length
{
	$key = crypt(uniqid(rand(),1));  //generate a random id encrypt it and store it in $password 
	$key = strip_tags(stripslashes($key)); //to remove any slashes that might have come 
	$key = str_replace(".","",$key); //Removing any . 
	$key = strrev(str_replace("/","",$key));  //Removing / and reversing the string 
	$key = substr($key,0,$length);  //take the first 10 characters from the $key
	return $key;
}

function groupkey($key = "1NJkbHF3os")  // Old Vestigial function.  Not used

// generate key and test
// check key against group tables to se if it exists
// if key exists then generate another key
// return the unique key
{
//	$key = rndstring(10); // generate a key
	$query_rsfindgroupkey = "SELECT * FROM ts2_tsman_groups WHERE group_key = '$key'";  // find if key already exists
	$rsfindgroupkey = mysql_query($query_rsfindgroupkey) or die(mysql_error());
	$row_rsfindgroupkey = mysql_fetch_assoc($rsfindgroupkey);
	$totalRows_rsfindgroupkey = mysql_num_rows($rsfindgroupkey);
	if ($totalRows_rsfindgroupkey < 1) return $key; // if no match then return unique key
	else groupkey(rndstring(10)); // otherwise run the function again
}	


// ----==== delete branch and children ====----
function deletebranch($id) 
{
	$query1 = "DELETE FROM ts2_tsman_groups WHERE group_id = '$id'";
	$result1 = mysql_query($query1) or die ("Error in query: $query1. " . mysql_error());
	$query2 = "DELETE FROM ts2_tsman_groupdetails WHERE group_id = '$id'";
	$result2 = mysql_query($query2) or die ("Error in query: $query2. " . mysql_error());
	deletechildren($id); //delete children
} 
function deletechildren($pid)  // delete every child group from deleted group
{  
	$result = mysql_query("SELECT * FROM ts2_tsman_groups WHERE group_parent_id = '$pid'") or die (mysql_error()); 
   	while ($row = mysql_fetch_array($result)) 		// run delete routine for each child 
	{  	
		$groupid = $row["group_id"]; 		
		$query1 = "DELETE FROM ts2_tsman_groups WHERE group_id = '$groupid'";  // delete query
		$result1 = mysql_query($query1) or die ("Error in query: $query1. " . mysql_error());
		$query2 = "DELETE FROM ts2_tsman_groupdetails WHERE group_id = '$groupid'";
		$result2 = mysql_query($query2) or die ("Error in query: $query2. " . mysql_error());
		deletechildren($row['group_id']); 		// find more children up the branch
	}	
} 	

function formatDate($val)
{
	$arr = explode("-", $val);
	return date("M d", mktime(0,0,0, $arr[1], $arr[2], $arr[0]));
}


function printtreeold($pid, // starting from groupid
					$level=0) // internal function variable for counting iterations and indenting branches
{	/* find record with parentid = $pid 
	If there is no record where parentid = $pid then return 1?
	assign record entries to variables
	print those variables with indent
	then call this function with parentid as the new $var	*/
	
	$result = mysql_query("SELECT * FROM ts2_tsman_groups WHERE group_parent_id = '$pid'") or die (mysql_error()); 	// retrieve all children of $parent 
    while ($row = mysql_fetch_array($result)) 	// display each child 
	{ 
    	$groupid = $row["group_id"]; // groupid of child
    	$groupname = $row["group_name"]; // name of child group
    	// the row to be looped. 
		echo str_repeat("&nbsp;",$level*7);  //Indent child branch 7 spaces from parent
		echo "|----";
		echo "$groupname";
		echo "<br>";
		printtree($row['group_id'], $before_string, $after_string, $level+1); // recursive find decendants of child group
	}
}

?>
