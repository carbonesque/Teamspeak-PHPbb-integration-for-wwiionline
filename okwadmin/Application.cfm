<cfapplication name="okwADMIN" clientmanagement="Yes"
                    sessionmanagement="Yes"
                    sessiontimeout="#CreateTimeSpan(0,2,0,0)#"
                    applicationtimeout="#CreateTimeSpan(1,0,0,0)#">

<CFPARAM NAME="session.allow" DEFAULT="false">
<CFPARAM NAME="session.userid" DEFAULT="0">
<cfif session.allow neq "true">
      <cfif ListLast(CGI.SCRIPT_NAME, "/") EQ "login.cfm">
      <cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "process_login.cfm">
      <cfelse>
      <script>
              self.location="login.cfm";
      </script>
      </cfif>
</cfif>
