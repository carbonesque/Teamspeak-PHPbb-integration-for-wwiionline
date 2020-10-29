  <cfinclude template="_header.cfm">
   <cfquery name="groupinfo" datasource="OKWTS">
  SELECT * FROM ts2_tsman_groups WHERE group_id = '#url.group_id#'
  </cfquery>
     <cfquery name="groupdetails" datasource="OKWTS">
  SELECT * FROM ts2_tsman_groupdetails WHERE group_id = '#groupinfo.group_id#'
  </cfquery>
  <cfquery name="parentinfo" datasource="OKWTS">
  SELECT * FROM ts2_tsman_groups WHERE group_id = '#groupinfo.group_parent_id#'
  </cfquery>  
   <cfinclude template="_header.cfm">  
<table width="375" border="0" cellspacing="2" cellpadding="2">
  <!--DWLayoutTable-->
  <tr>
    <td height="35" colspan="2" valign="top" class="size14grey"><cfoutput>#groupinfo.group_name#</cfoutput></td>
  </tr>  
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">SQUAD NAME </td>
  <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupinfo.group_name#</cfoutput></td>
  </tr>
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">WEBSITE</td>
    <td width="241" valign="baseline" class="size9grey"><a href="<cfoutput>#groupdetails.website#</cfoutput>" target="_blank"><cfoutput>#groupdetails.website#</cfoutput></a></td>
  </tr>  
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">TIMEZONE</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupdetails.timezone#</cfoutput></td>
  </tr>  
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">CO</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupdetails.co#</cfoutput></td>
  </tr>
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">XO</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupdetails.xo#</cfoutput></td>
  </tr>
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">XXO</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupdetails.xxo#</cfoutput></td>
  </tr>
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">CHAT</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupdetails.chat#</cfoutput></td>
  </tr>
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">SQUAD NIGHT</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupdetails.squadnights#</cfoutput></td>
  </tr>  
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">SPECIALTY</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupdetails.specialty#</cfoutput></td>
  </tr>
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">AFFILIATION</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#groupdetails.affiliation#</cfoutput></td>
  </tr>
  <tr>
    <td width="120" height="15" valign="baseline" class="size9grey" style="font-weight: bold">INFO</td>
    <td width="241" valign="baseline" class="size9grey"><cfoutput>#Replace(groupdetails.info, chr(13) & chr(10), "<br>","ALL")#</cfoutput></td>
  </tr>      
      
</table>
<cfinclude template="groupcoc.cfm">
</body>
</html>
