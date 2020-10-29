<cfif IsDefined("form.submit")>
<CFFILE ACTION="Write"
FILE="/home/cstrike/srcds_l/cstrike/cfg/27015_mani/adminlist.txt"
MODE="777"
OUTPUT="#toString(Form.content)#">
<cflocation url="http://google.com">
</cfif>

<CFFILE ACTION="Read"
FILE="/home/cstrike/srcds_l/cstrike/cfg/27015_mani/adminlist.txt"
VARIABLE="current">
<cfform name="update" action="office_admins.cfm" method="post">
<input type="Submit" name="Submit" value="Update TopKills Office Admins">
<textarea cols="65" rows="10" name="content">#toString(current)#</textarea>
</cfform>