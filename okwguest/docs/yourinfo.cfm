<!-- PROCESS THE FORM IF IT HAS BEEN SUBMITTED -->
<cfif IsDefined("form.submit") is "Yes">
  <cfquery name="update_tsman_users" datasource="OKWTS">
  UPDATE ts2_tsman_users SET s_client_name = '#form.s_client_name#', s_client_password = '#form.s_client_password#', email = '#form.email#', group_key = '#form.group_key#' WHERE s_client_name = '#form.s_client_name#'
  </cfquery>
  <cfquery name="update_ts2_clients" datasource="OKWTS">
  UPDATE ts2_clients SET s_client_name = '#form.s_client_name#', s_client_password = '#form.s_client_password#' WHERE s_client_name = '#form.s_client_name#'
  </cfquery>
  <script>parent.location="../page.cfm?page=:8500/okwadmin/pages/yourinfo.cfm";</script>
  <cfelse>
  <!-- DISPLAY IF FORM HAS NOT BEEN SUMBITTED -->
  <cfinclude template="_header.cfm">
  <cfquery name="userinfo" datasource="OKWTS">
  SELECT * FROM ts2_tsman_users WHERE id = '#session.id#'
  </cfquery>
  <cfquery name="groupinfo" datasource="OKWTS">
  SELECT * FROM ts2_tsman_groups WHERE group_key = '#userinfo.group_key#'
  </cfquery>
  <cfquery name="parentinfo" datasource="OKWTS">
  SELECT * FROM ts2_tsman_groups WHERE group_id = '#groupinfo.group_parent_id#'
  </cfquery>
<cfif IsDefined("url.group_key") is "Yes">
<cfset group_key = '#url.group_key#'>
<cfelse>
<cfset group_key = '#userinfo.group_key#'>
</cfif>    
  <cfform name="editinfo" method="post" action="yourinfo.cfm">
    <input type="hidden" name="s_client_name" value="<cfoutput>#userinfo.s_client_name#</cfoutput>">
    <table width="375" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td height="22" colspan="2" valign="top" class="size14grey">Edit Your Information </td>
      </tr>
      <tr>
        <td height="22" colspan="2" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey">GROUP KEY </td>
        <td width="276" valign="baseline" class="size9grey"><input name="group_key" type="text" size="30" value="<cfoutput>#group_key#</cfoutput>">
&nbsp; <a href="http://okw.wwiiol.net/okwadmin/pages/groupselect/yourinfo.select.php">BROWSE</a></td>
      </tr>	  
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey">LOGIN NAME </td>
        <td width="276" valign="baseline" class="size9grey"><input value="<cfoutput>#userinfo.s_client_name#</cfoutput>" size="15">
&nbsp;your wwiiol game name </td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey">PASSWORD</td>
        <td width="276" valign="baseline" class="size9grey"><input name="s_client_password" type="text" size="15" value="<cfoutput>#userinfo.s_client_password#</cfoutput>">
&nbsp;your teamspeak password </td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey">EMAIL</td>
        <td width="276" valign="baseline" class="size9grey"><input name="email" type="text" size="30" value="<cfoutput>#userinfo.email#</cfoutput>">
&nbsp;</td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey"><!--DWLayoutEmptyCell-->&nbsp;</td>
        <td width="276" valign="baseline" class="size9grey"><input type="submit" name="Submit" value="Update Information"></td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey"><!--DWLayoutEmptyCell-->&nbsp;</td>
        <td width="276" valign="baseline" class="size9grey">&nbsp;</td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey">CREATED BY: </td>
        <td width="276" valign="baseline" class="size9grey">&nbsp;<cfoutput>#userinfo.creator#</cfoutput></td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey">CREATED:</td>
        <td width="276" valign="baseline" class="size9grey">&nbsp;<cfoutput>#DateFormat(userinfo.timestamp,"mm/dd/yy")#</cfoutput></td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey">PARENT:</td>
        <td width="276" valign="baseline" class="size9grey"><cfoutput>#parentinfo.group_name#</cfoutput></td>
      </tr>
      <tr>
        <td width="109" height="22" valign="baseline" class="size9grey">GROUP:</td>
        <td width="276" valign="baseline" class="size9grey"><cfoutput>#groupinfo.group_name#</cfoutput></td>
      </tr>
    </table>
  </cfform>
  </body>
  </html>
</cfif>
