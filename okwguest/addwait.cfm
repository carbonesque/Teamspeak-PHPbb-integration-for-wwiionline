<cfinclude template="_header.cfm">
<!-- PROCESS THE FORM IF IT HAS BEEN SUBMITTED -->
<cfif IsDefined("form.submit") is "Yes">
	<!--- Check if user is already registered, or on the waitlist --->
	<cfquery name="checkreglist" datasource="OKWTS">
		SELECT * FROM ts2_tsman_users 
		WHERE s_client_name = '#form.s_client_name#'
	</cfquery>
	<cfquery name="checkwaitlist" datasource="OKWTS">
		SELECT * FROM ts2_tsman_waitlist 
		WHERE s_client_name = '#form.s_client_name#'
	</cfquery>
	<!--- Check if the group key is correct ---> 
	<cfquery name="groupinfo" datasource="OKWTS">
		SELECT * FROM ts2_tsman_groups 
		WHERE group_key = '#form.group_key#'
	</cfquery>
	<cfif groupinfo.recordcount EQ 0>
		<cflocation url="error.cfm?id=Invalid group, please browse for a group, or use your group key"> 
	</cfif>
	
	<cfif checkreglist.recordcount EQ 0 AND checkwaitlist.recordcount EQ 0>
	<!--- User does not exist, put new user on the waitlist and send an email --->
		<cfquery name="adduser_ts2_tsman_waitlist" datasource="OKWTS">
			INSERT INTO ts2_tsman_waitlist ( s_client_name, s_client_password, email, group_key, timestamp ) 
			VALUES ( '#form.s_client_name#', '#form.s_client_password#', '#form.email#', '#form.group_key#', Now() )
		</cfquery>
		<cfquery name="parentinfo" datasource="OKWTS">
			SELECT * FROM ts2_tsman_groups 
			WHERE group_id = '#groupinfo.group_parent_id#'
		</cfquery>
		<!--- Audit Trail --->
		<cfquery name="audit" datasource="OKWTS">
			INSERT INTO ts2_tsman_audit ( audit_user, audit_action, audit_object, audit_time) 
			VALUES ( '#form.s_client_name#', 'register', '#form.s_client_name#', Now() )
		</cfquery>
		<cfmail    
		to = "#form.email#"   
		from = "grizwald@panzerlehr.com"     
		subject = "OKW Teamspeak WAIT LIST">
		<cfmailparam name="MIME-Version" value="1.0">
----- DO NOT REPLY TO THIS ADDRESS -- AUTOMATED EMAIL ----- 
		
Your OKW Teamspeak Application has been received.  You account is currently pending approval.
		
// Group Information //
		
Your Group Key: #form.group_key#
Parent Group: #parentinfo.group_name#
Your Group: #groupinfo.group_name#
		
// NOTES //
		
Contact your Chain of Command and let them know you are waiting to be approved.  
		
Verify your group information is correct.  If you group information is incorrect, it can cause a delay in your approval.
		
		</cfmail>
		<script>parent.location="thanks.cfm";</script>
	<cfelse> <!--- User already exists --->
		<div class="size9grey">
			ERROR: An account already exists either with username '<cfoutput>#form.s_client_name#</cfoutput>'
			<br><br>
			This may be an account on the waiting list or already registered.<br>
			<br>
		</div>
	</cfif> 
<cfelse>
	<cfif IsDefined("url.group_key") is "Yes">
		<cfset group_key = '#url.group_key#'>
	<cfelse>
		<cfset group_key = ''>
	</cfif>  
	<!--- DISPLAY IF FORM HAS NOT BEEN SUMBITTED --->
	<cfform name="adduser" method="post" action="addwait.cfm">
		<table width="393" border="0" cellpadding="0" cellspacing="0">
		<!--DWLayoutTable-->
			<tr>
				<td height="22" colspan="2" valign="top" class="size14grey">TEAMSPEAK REGISTRATION </td>
			</tr>
			<tr>
				<td height="22" colspan="2" valign="top" class="size9grey"><br>
			  <span style="color: #990000; font-weight: bold">NOTE:</span> Your Group Key 
			  <span style="font-weight: bold">IS NOT</span> the same as your Squad Key. If you do not know your Group Key, you can use the <a href="http://okw.wwiiol.net/okwguest/adduser.select.php">BROWSE</a> link below to choose your group from the tree.<br>
			  <br>
			  <br></td>
			</tr>
				<tr>
				<td width="107" height="22" valign="baseline" class="size9grey">GROUP KEY </td>
				<td width="279" valign="baseline" class="size9grey">
				<cfinput name="group_key" type="text" size="30" value="#group_key#" required="yes" message="You must enter a group">
				&nbsp; <a href="http://okw.wwiiol.net/okwguest/adduser.select.php">BROWSE GROUPS </a></td>
			</tr>
			<tr>
				<td height="22" valign="baseline" class="size9grey">LOGIN NAME </td>
				<td valign="baseline" class="size9grey">
				<cfinput name="s_client_name" value="" size="15" maxlength="8" required="yes" message="You must enter a name">
				wwiiol game name </td>
			</tr>
			<tr>
				<td height="22" valign="baseline" class="size9grey">PASSWORD</td>
				<td valign="baseline" class="size9grey">
				<cfinput name="s_client_password" type="text" size="15" maxlength="8" value="" required="yes" message="You must enter a password">
				teamspeak password </td>
			</tr>
			<tr>
				<td height="22" valign="baseline" class="size9grey">EMAIL</td>
				<td valign="baseline" class="size9grey">
				<cfinput name="email" type="text" size="30" value="" required="yes" message="You must enter a email">
				&nbsp;</td>
			</tr>
			<tr>
				<td height="22" valign="baseline" class="size9grey"><!--DWLayoutEmptyCell-->&nbsp;</td>
				<td valign="baseline" class="size9grey"><br>
				<input type="submit" name="Submit" value="SUBMIT APPLICATION"></td>
			</tr>
			<tr>
				<td height="22" colspan="2" valign="baseline" class="size9grey"><!--DWLayoutEmptyCell-->&nbsp;</td>
			</tr>
	  </table>
	</cfform>
</cfif>
</body>
</html>
