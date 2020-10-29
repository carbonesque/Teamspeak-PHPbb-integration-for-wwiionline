<!--- First check if variable is a groupid --->
<cfif IsDefined("URL.group_id")>
	<cfquery name="groupinfo" datasource="OKWTS">
		SELECT * 
		FROM ts2_tsman_groups 
		WHERE group_id = '#URL.group_id#'
	</cfquery>
<cfelse>
	<!--- Else Check if variable is a group key --->
	<cfif IsDefined("URL.group_key")>
		<cfquery name="groupinfo" datasource="OKWTS">
			SELECT * 
			FROM ts2_tsman_groups 
			WHERE group_key = '#URL.group_key#'
		</cfquery>
	<cfelse>
		<!--- No group_id or group_key was sent --->
		<cflocation url="/okwadmin/inc/error.cfm?id=No Group Selected">
	</cfif>	
</cfif>		
<cfif groupinfo.RecordCount EQ 0>
	<!--- Searched for the group, but didn't find it --->
	<cflocation url="/tsman/inc/error.cfm?id=Group not found">
<cfelse>
	<!--- Found a group, getting details table and parent group info --->
	<cfquery name="parentinfo" datasource="OKWTS">
		SELECT * 
		FROM ts2_tsman_groups 
		WHERE group_id = '#groupinfo.group_parent_id#'
	</cfquery>
	<cfquery name="groupdetails" datasource="OKWTS">
		SELECT * 
		FROM ts2_tsman_groupdetails 
		WHERE group_id = '#groupinfo.group_id#'
	</cfquery>
</cfif>
