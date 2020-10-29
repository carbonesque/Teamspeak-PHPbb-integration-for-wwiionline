<cfinclude template="inc/conf.cfm">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<title>OKW TS ADMIN</title>
	<link href="http://okw.wwiiol.net/okwadmin/inc/ts.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#888888">
<cfquery name = "userinfo" datasource = "OKWTS">
	SELECT * FROM ts2_tsman_users 
	WHERE id = #session.id#
</cfquery>
<cfif #userinfo.recordcount# EQ 0 ><!--- User not logged in --->
	<script>
		self.location="http://okw.wwiiol.net";
    </script>
</cfif>
<cfquery name="groupinfo" datasource="OKWTS">
	SELECT * FROM ts2_tsman_groups 
	WHERE group_key = '#userinfo.group_key#'
</cfquery>
<cfquery name="parentinfo" datasource="OKWTS">
	SELECT * FROM ts2_tsman_groups 
	WHERE group_id = '#groupinfo.group_parent_id#'
</cfquery>
<cfquery name="squadwait" datasource="OKWTS"><!--- Check if user already has a squad pending --->
	SELECT * FROM ts2_tsman_wait_groups 
	WHERE creator = '#session.user#'
</cfquery>
<table align="center" bgcolor="#888888">
  <tr>
    <td background="<cfoutput>#root#</cfoutput>/images/main_head.jpg" align="left" valign="top" width="704" height="85">&nbsp;</td>
  </tr>
</table>
<table align="center" valign="middle" width="700" height="460" border="0" cellpadding="2" cellspacing="0" bgcolor="#000000">
  <tr>
    <td width="700" height="460">
	  <table bgcolor="#dddddd">
        <tr>
          <td  width="400" height="460" valign="top" bgcolor="#dddddd">
		    <iframe src="http://okw.wwiiol.net<cfoutput>#page#</cfoutput>" scrolling="auto" frameborder="0" width="450" height="460"></iframe>
          </td>
          <td width="1" height="460" bgcolor="#bbbbbb"></td>
          <td width="300" height="460" valign="top" bgcolor="#dddddd" class="size9grey">Logged in as: 
		    <strong>&nbsp;<cfoutput>#session.user#</cfoutput>&nbsp;&nbsp;&nbsp;</strong>(<a href="process_logout.cfm">logout</a>)<br>
            <br>
			<cfoutput>
			  <cfswitch expression="#parentinfo.group_rank#">
				<cfcase value="9"><span class="squadorange">#parentinfo.group_name#</span></cfcase>
				<cfcase value="10"><span class="darkblue">#parentinfo.group_name#</span></cfcase>
				<cfdefaultcase><span class="size9grey"><strong>#parentinfo.group_name#</strong></span></cfdefaultcase> 
			  </cfswitch>
			  <br> 
			  &nbsp;&nbsp;<img src="http://okw.wwiiol.net/okwadmin/images/branch_line.gif" width="11" height="19" align="bottom">
			  <cfswitch expression="#groupinfo.group_rank#">
				  <cfcase value="9"><span class="squadorange">#groupinfo.group_name#</span></cfcase>
				  <cfcase value="10"><span class="darkblue">#groupinfo.group_name#</span></cfcase>
				  <cfdefaultcase><span class="size9grey"><strong>#groupinfo.group_name#</strong></span></cfdefaultcase> 
			  </cfswitch>
			</cfoutput><br><br>
			<br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwadmin/pages/yourinfo.cfm">YOUR INFORMATION</a><br>
            <br>&middot;&nbsp;<a href="index.cfm">SERVER WEBPOST</a><br>
			<br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwguest/docs/help.cfm">DOCUMENTATION</a><br>
			<br>
			<br>
            <u>TEAMSPEAK ADMINISTRATION</u><br><!--- Group Admin Block --->
			<cfif #userinfo.group_admin# GT '0'><!--- User is an admin --->
              <br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwadmin/pages/admin/waitlist.cfm">WAIT LIST</a> <br>
              <br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwadmin/pages/searchform.cfm">SEARCH / EDIT USERS</a><br>
              <cfif #groupinfo.group_rank# EQ '9'> <!--- user is a SQUAD admin --->
			  	<br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwadmin/pages/squadadmin/squad_edit.cfm">EDIT SQUAD INFO</a><br>
			  <cfelse> <!--- user is a brigade officer or higher --->
   			    <br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwadmin/pages/admin/approve_squad.cfm">APPROVE SQUADS</a><br>
              </cfif>
			  <cfif #userinfo.group_admin# GT '1'> <!--- user is okw command --->
	            <br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwadmin/pages/admin/audit.cfm">AUDIT RECORDS</a><br>
			    <br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwadmin/pages/admin/adduser.cfm">ADD USER</a><br>
			  </cfif>
              <cfif #userinfo.group_admin# GT '2'><!--- user is the highest level of admin --->
                <br>&middot;&nbsp;<a href="page.cfm?page=/okwadmin/pages/admin/tsman.groups.php">MANAGE GROUPS</a><br>
              <cfelse>
              </cfif>
            <cfelse><!--- User is not an admin, check to see if user qualifies to apply a squad --->
              <cfif #groupinfo.group_rank# EQ '10' AND #squadwait.recordcount# EQ 0>
			    <br>&middot;&nbsp;<a href="page.cfm?page=:8500/okwadmin/pages/squadadmin/squad_add.cfm">APPLY YOUR SQUAD</a><br>
              <cfelse>
                <cfif #squadwait.recordcount# NEQ 0>
                  You have a Squad Pending Approval
                <cfelse>
                  No admin functions available for your account
                </cfif>
              </cfif>
            </cfif>
          </td>
        </tr>
      </table>
	</td>
  </tr>
</table>
<table align="center" gcolor="#888888">
  <tr>
    <td align="right" valign="top" width="704" height="20" class="size9grey"> created by: grizwald / fuZe </td>
  </tr>
</table>
</body>
</html>
