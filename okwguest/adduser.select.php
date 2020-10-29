<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Select Brigade</title>
<SCRIPT LANGUAGE="Javascript">
<!---
function decision(message, url){
if(confirm(message)) location.href = url;
}
// --->
</SCRIPT>
<link href="http://okw.wwiiol.net/okwadmin/inc/ts.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="dddddd" class="size11grey">
<u>CHOOSE THE GROUP YOU ARE MOST ASSOCIATED WITH</u> <BR>
<BR>
  <?php 
include('../okwadmin/inc/functions.php'); 
require_once('../okwadmin/inc/conf.php'); 
function printtreesquadattach($pid, // Modified printtree() for selecting a brigade for a squad
 $level=0) // internal function variable for counting iterations and indenting branches
  {	
   $attachrank = 10; //The group rank that squads attach to in the current structure is 10
   $result = mysql_query("SELECT * FROM ts2_tsman_groups WHERE group_parent_id = '$pid'") or die (mysql_error()); 	// retrieve all children of $parent 
    while ($row = mysql_fetch_array($result)) 	// display each child 
	{  	
	 $groupid = $row["group_id"]; // groupid of child
     $groupname = $row["group_name"]; // name of child group
	 $grouprank = $row["group_rank"];
 	 $groupkey = $row["group_key"];
		echo str_repeat("&nbsp;",$level*5);  //Indent child branch 7 spaces from parent
		echo "<img src=\"http://okw.wwiiol.net/okwadmin/images/branch_line.gif\" width=\"11\" height=\"19\" border=\"0\" align=\"absbottom\">";
		if ($grouprank < $attachrank) 		// group is a squad make it orange
			echo " <span class=\"squadorange\"><a href=\"http://okw.wwiiol.net/okwguest/addwait.cfm?group_key=$groupkey\" class=\"squadorange\">$groupname</a></span>";
		if ($grouprank == $attachrank) // Group is a brigade show in blue
			echo "   <span class=\"darkblue\"><a href=\"http://okw.wwiiol.net/okwguest/addwait.cfm?group_key=$groupkey\" class=\"darkblue\">$groupname</a></span>";
		if ($grouprank > $attachrank)
			echo " $groupname";
		echo "<br>";
		printtreesquadattach($row['group_id'], $level+1); // recursive find decendants of child group
	}
}
printtreesquadattach(5); //printtree from groupID branch OKW
?>
</body>
</html>
