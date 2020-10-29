<!--- This file will be run once every night
Designed to purge old/expired accounts --->
<cfinclude template="/okwadmin/inc/functions.cfm">
<cfquery name="Inactive_users" datasource="OKWTS">
	SELECT *
	FROM ts2_clients
</cfquery>
<cfloop query="Inactive_users">
	<cfset lastonline = tsdate(dt_client_lastonline)>
	<cfif lastonline EQ "never">
		<cfif #DateDiff("d", dt_client_created, Now() )# GT 90>
		<!--- Account created 90 days ago and never used. --->
			<cfoutput><b>#Inactive_users.s_client_name#</b></cfoutput>
		</cfif>
	<cfelseif #DateDiff("d", lastonline, Now() )# GT 90>
		<!--- Account not used in 90 days. --->
		<!--- 	Insert these functions
				set groupadminlevel -1 
				set group_key GUEST
				remove their entry from the live TS database (while keeping it in our custom db) 
				--->
		<cfoutput>#Inactive_users.s_client_name#</cfoutput>
	</cfif>		
</cfloop>
<cfquery name="expireusers" datasource="OKWTS">
	SELECT *
	FROM ts2_tsman_users
</cfquery>
<cfloop query="expireusers">
	<cfif expire GT 0 >
		<cfif expire LT Now()>
			<!--- User's account has passed its specified expiration date --->
			<cfoutput><b>#s_client_name#</b></cfoutput>
				<!---
					set groupadminlevel -01
					remove their entry from the live TS database (while keeping it in our custom db) --->
		</cfif>
	</cfif>	
</cfloop>

