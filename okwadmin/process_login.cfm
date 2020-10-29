<!--- Form validation --->
<cfif s_client_username NEQ "" AND s_client_password NEQ "">
	<cfquery name="qVerify" datasource="OKWTS">
		SELECT             id, s_client_name, s_client_password
		FROM                ts2_tsman_users
		WHERE              s_client_name = '#s_client_username#'
						 AND s_client_password = '#s_client_password#'
	</cfquery>
	<cfif qVerify.RecordCount>
		<cfset session.allow = "true">
		<cfset session.id = qVerify.id>
		<cfset session.user = '#qVerify.s_client_name#'>
		<script>
			 self.location="http://okw.wwiiol.net:8500/okwadmin/index.cfm?page=/post/info.php?detail=70.84.51.13&detailport=33000";
		</script>
	</cfif>
</cfif>
<script>
	self.location="http://okw.wwiiol.net";
</script>

