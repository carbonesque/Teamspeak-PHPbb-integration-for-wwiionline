<cfinclude template="_header.cfm">
  <cfquery name="sessioninfo" datasource="OKWTS">
  SELECT * FROM ts2_tsman_users WHERE id = #session.id#
  </cfquery>
<!-- PROCESS THE FORM IF IT HAS BEEN SUBMITTED -->
<cfoutput>
<form action="searchresults.cfm" method="GET">
<table class="size9grey" width="350" border="0" cellpadding="5" cellspacing="0">
  <!--DWLayoutTable-->
<tr><td colspan="3" class="size14grey">Search OKW Teamspeak Database</td></tr>
  <tr> 
    <td valign="top" height="29" colspan="3">&nbsp;</td>
  </tr>
  <tr> 
    <td width="144" valign="top"> 
      <input name="search" type="text" size="30">
      SEARCH TERM</td>
    <td width="92" valign="top"> 
      <select name="type">
        <option value="s_client_name">USER NAME</option>
        <option value="group_key">GROUP KEY</option>
      </select>
      TYPE</td>
    <td width="84" valign="top"><input type="submit" name="Submit" value="SEARCH"> 
    </td>
  </tr>
    <tr> 
    <td height="10" colspan="3" valign="top" class="size9grey"> 
      <p><br>&middot; <a href="http://okw.wwiiol.net/okwadmin/pages/groupselect/regusers_group.php">SELECT GROUP FROM GROUP TREE</a> <br>
         <br>&middot; <a href="searchresults.cfm?type=group_key&search=#sessioninfo.group_key#">VIEW ALL USERS IN DATABASE </a><br>
         <br>&middot; <a href="searchresults.cfm?search=LOST">VIEW LOST USERS (not in any group) </a><br>
      </p>
      <cfif #sessioninfo.group_admin# EQ '1'>
<br>
You are a <strong>Level 1</strong> Group Admin.  This means you can only manage / view users within your Group and the 'child' groups below your own.
<cfelseif #sessioninfo.group_admin# GT '1'>
<br>
You are a <strong>Level 2</strong> or Higher Group Admin.  This means you can manage ALL users in the database.
</cfif>
&nbsp;&nbsp;<br>
      <br>
       &nbsp;</td>
  </tr>
  <tr> 
    <td height="84" colspan="3" valign="top"><br>      
      </td>
  </tr>
</table>
</form>
</cfoutput>
</body>
