<!--- This file is intended as an include for groups to find the chain of command of officers --->

<cffunction name="findcoc">
	<cfargument name="parentid">
	<cfset var grouptrace = "">
	<cfquery name="cocfind" datasource="OKWTS">
		SELECT * FROM ts2_tsman_groups 
		WHERE group_id = '#parentid#'
	</cfquery>
	<cfset grouptrace = #cocfind#>
	<cfif cocfind.group_rank LT 16>	<!--- Find all parent groups and print them first--->
		<cfoutput>#findcoc(cocfind.group_parent_id)#</cfoutput>
		<cfoutput>
		  <tr><td width="241" class="size10black"><strong>#grouptrace.group_name#</strong></td></tr>
		</cfoutput>
	</cfif>
	<cfquery name="findco" datasource="OKWTS">	<!--- After printing group name, print the COs of that group --->
			SELECT * FROM ts2_tsman_users
			WHERE group_key = '#grouptrace.group_key#'
			AND group_admin > 0
	</cfquery>
	<cfoutput query="findco">
		<tr><td>&nbsp;</td><td>#findco.s_client_name# &nbsp;&nbsp;</td></tr>
	</cfoutput>
</cffunction>

<table class="size9grey" style="font-weight: bold" width="500" border="0" cellspacing="0" cellpadding="0" summary="All officers in the chain of command of this group.">
  <caption>
	  Group Chain of Command
  </caption>
  <cfoutput>#findcoc(groupinfo.group_parent_id)#</cfoutput>
</table>
