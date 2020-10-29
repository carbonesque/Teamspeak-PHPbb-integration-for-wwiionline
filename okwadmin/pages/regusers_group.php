<body bgcolor="dddddd">
<SCRIPT LANGUAGE="Javascript">
<!---
function decision(message, url){
if(confirm(message)) location.href = url;
}
// --->
</SCRIPT>
<link href="http://okw.wwiiol.net/okwadmin/inc/ts.css" rel="stylesheet" type="text/css">
<div class="size14grey">Select a group to view users.<br></div>
<div class="size10black">
<?php 
include('/home/ts/www/okwadmin/inc/functions.php'); 
require_once('/home/ts/www/okwadmin/inc/conf.php'); 
function printtreesquadattach($pid, // Modified printtree() for selecting a brigade for a squad
 $level=0) // internal function variable for counting iterations and indenting branches
  {	
   $attachrank = 10; //The group rank that squads attach to in the current structure is 10
   $transferid = $_GET['id'];
   $result = mysql_query("SELECT * FROM ts2_tsman_groups WHERE group_parent_id = '$pid'") or die (mysql_error()); 	// retrieve all children of $parent 
    while ($row = mysql_fetch_array($result)) 	// display each child 
	{  	
	 $groupid = $row["group_id"]; // groupid of child
     $groupname = $row["group_name"]; // name of child group
	 $grouprank = $row["group_rank"];
 	 $groupkey = $row["group_key"];
		echo str_repeat("&nbsp;",$level*5);  //Indent child branch 7 spaces from parent
		echo "<img src=\"../images/branch_line.gif\" width=\"11\" height=\"19\" border=\"0\" align=\"absbottom\">";
		if ($grouprank == $attachrank) // show links only for branches at the brigade level
			echo "   <span class=\"darkblue\"><a href=\"http://okw.wwiiol.net:8500/okwadmin/pages/searchresults.cfm?type=group_key&search=$groupkey\" class=\"darkblue\">$groupname</a></span>";
		elseif ($grouprank < $attachrank) 
			echo "&nbsp;&nbsp;
				<span class=\"squadorange\"><a href=\"http://okw.wwiiol.net:8500/okwadmin/pages/searchresults.cfm?type=group_key&search=$groupkey\" class=\"squadorange\">$groupname</a></span>
				&nbsp;&nbsp;
				<a href=\"http://okw.wwiiol.net:8500/okwadmin/pages/groupinfo.cfm?group_id=$groupid\">
				<img src=\"../images/info.gif\"alt=\"View details of this squad\" width=\"29\" height=\"12\" border=\"0\">
				</a>";
		elseif ($grouprank > $attachrank) 
		echo "<a href=\"http://okw.wwiiol.net:8500/okwadmin/pages/searchresults.cfm?type=group_key&search=$groupkey\">$groupname</a>";
		echo "<br>";
		printtreesquadattach($row['group_id'], $level+1); // recursive find decendants of child group
	}
}
printtreesquadattach(5); //printtree from groupID branch OKW
?>
</div>
