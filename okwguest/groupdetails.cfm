<link href="http://okw.wwiiol.net/okwadmin/inc/ts.css" rel="stylesheet" type="text/css">
<cfinclude template="../okwadmin/inc/group_queries.cfm">
<table width="0" border="0" cellpadding="0" cellspacing="0" class="size10black">
  <tr>
    <td><span class="size14grey">Group Details - <cfoutput>#groupinfo.group_name#</cfoutput></span> <br>
Parent group: <span class="darkblue"><cfoutput>#parentinfo.group_name#</cfoutput></span>
<table width="550" border="0" cellpadding="4" cellspacing="2" class="size10black">
  <tr>
    <td colspan="2"><cfoutput>Squad Nights:<br>
            <span class="size9grey">#groupdetails.squadnights#</span></cfoutput></td>
    <td colspan="2"><cfoutput>Specialty:<br>
            <span class="size9grey">#groupdetails.specialty#</span></cfoutput></td>
  </tr>
  <tr>
    <td><cfoutput>Text Channels:<span class="size9grey"><br>
        #groupdetails.chat#</span><br>
    </cfoutput></td>
    <td><cfoutput>Squad CO:<br>
            <span class="size9grey">#groupdetails.co#</span></cfoutput></td>
    <td>Squad XO:<br>
        <cfoutput><span class="size9grey">#groupdetails.xo#</span></cfoutput></td>
    <td>Squad XXO:<br>
        <cfoutput><span class="size9grey">#groupdetails.xxo#</span></cfoutput></td>
  </tr>
  <tr>
    <td colspan="2">Website:<br>
        <cfoutput><span class="size9grey">#groupdetails.website#</span></cfoutput></td>
    <td>Primary Affiliation: <cfoutput><br>
            <span class="size9grey">#groupdetails.affiliation#</span></cfoutput></td>
    <td>Time Shift: <cfoutput><br>
            <span class="size9grey">#groupdetails.timezone#</span></cfoutput></td>
  </tr>
  <tr>
    <td colspan="4"><cfoutput>Additional Info:<br>
            <span class="size9grey">#groupdetails.info#</span></cfoutput></td>
  </tr>
</table></td>
  </tr>
</table>
