<!--- Find the users credentials --->
<cfif IsDefined("session.id")>
	<cfquery name="userinfo" datasource="OKWTS">
		SELECT * 
		FROM ts2_tsman_users
		WHERE id = '#session.id#'
	</cfquery>
	<cfif userinfo.RecordCount EQ 0>
		<!--- User Record doesnt exist --->
		<cfset #page# = "inc/error.cfm?id=Session invalid user not found">
	</cfif>	
	<!--- Found user, getting group info --->
	<cfquery name="groupinfo" datasource="OKWTS">
		SELECT * 
		FROM ts2_tsman_groups 
		WHERE group_key = '#userinfo.group_key#'
	</cfquery>
<cfelse>
	<!--- Not logged in --->
	<cflocation url="/login.cfm">
</cfif>