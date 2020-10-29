<cfif IsDefined("form.submit") is "Yes">
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>OKW TS SERVER</title>
  <link href="http://okw.wwiiol.net/okwadmin/inc/ts.css" rel="stylesheet" type="text/css">
  </head>
  <body bgcolor="#888888">
  <table align="center" gcolor="#888888">
    <tr>
      <td background="http://okw.wwiiol.net/images/main_head.jpg" align="left" valign="top" width="704" height="85">&nbsp;</td>
    </tr>
  </table>
  <table align="center" valign="middle" width="700" height="50" border="0" cellpadding="2" cellspacing="0" bgcolor="#000000">
    <tr>
      <td width="700" height="50"><table bgcolor="#dddddd" cellpadding="5">
          <!--DWLayoutTable-->
          <tr>
            <td width="700" valign="top" class="size9grey"><p><span class="size14grey"><br>
                Lost Password ?? </span> <br>
                <br>
                <br>
                <cfquery name="userinfo" datasource="OKWTS">
                SELECT * FROM ts2_tsman_users WHERE s_client_name = '#form.name#'
                </cfquery>
                <cfif userinfo.recordcount EQ 1>
                  Email has been sent to <cfoutput><strong>#userinfo.email#</strong></cfoutput> <cfoutput>
<cfmail    
to = "#userinfo.email#"   
from = "grizwald@panzerlehr.com"     
subject = "OKW Teamspeak Information">
<cfmailparam name="MIME-Version" value="1.0">
----- DO NOT REPLY TO THIS ADDRESS -- AUTOMATED EMAIL ----- 

TS Server IP: okw.wwiiol.net
Login Name: #userinfo.s_client_name# 
Password: #userinfo.s_client_password#

EXAMPLE ---> http://okw.wwiiol.net/images/ts_example.gif

Don't forget you can also login with the information above at http://okw.wwiiol.net and keep your information updated.
</cfmail>
                  </cfoutput> <br>
                  <br>
                  <br>
                  <span class="size9grey"><a href="http://okw.wwiiol.net"><strong>RETURN TO HOME PAGE </strong></a></span>
                  <cfelse>
                  There are no records in the database for '<cfoutput><strong>#form.name#</strong></cfoutput>'<br>
                  <br>
                  <br>
                  <span class="size9grey"><a href="http://okw.wwiiol.net"><strong>RETURN TO HOME PAGE </strong></a></span>
                </cfif>
              </p></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table align="center" gcolor="#888888">
    <!--DWLayoutTable-->
    <tr>
      <td width="351" height="35" valign="top" class="size9grey"><p class="style1">&nbsp;</p></td>
      <td width="351" align="right" valign="top" class="size9grey"> created by: grizwald / fuZe </td>
    </tr>
  </table>
  </body>
  </html>
  <cfelse>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>OKW TS SERVER</title>
  <link href="http://okw.wwiiol.net/okwadmin/inc/ts.css" rel="stylesheet" type="text/css">
  </head>
  <body bgcolor="#888888">
  <table align="center" gcolor="#888888">
    <tr>
      <td background="http://okw.wwiiol.net/images/main_head.jpg" align="left" valign="top" width="704" height="85">&nbsp;</td>
    </tr>
  </table>
  <table align="center" valign="middle" width="700" height="50" border="0" cellpadding="2" cellspacing="0" bgcolor="#000000">
    <tr>
      <td width="700" height="50"><table bgcolor="#dddddd" cellpadding="5">
          <!--DWLayoutTable-->
          <tr>
            <td width="700" valign="top" class="size9grey"><p><span class="size14grey"><br>
                Lost Password ?? </span> <br>
                <br>
                <br>
                Enter you WWIIOL game name below and we will email your password to the email address on file in the database. If you do not receive your password check your spam filter. If you still do not receive your password, please contact your Chain of Command for assistance. <br>
                <br>
                <br>
              <form name="email" action="lost_password.cfm" method="post">
                <strong>wwiiol game name</strong>&nbsp;
                <input name="name" type="text" id="name">
&nbsp;
                <input type="submit" name="Submit" value="Retrieve Lost Password">
              </form>
              <br>
              <br>
              <br>
              </p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table align="center" gcolor="#888888">
    <!--DWLayoutTable-->
    <tr>
      <td width="351" height="35" valign="top" class="size9grey"><p class="style1">&nbsp;</p>
      </td>
      <td width="351" align="right" valign="top" class="size9grey"> created by: grizwald / fuZe </td>
    </tr>
  </table>
  </body>
  </html>
</cfif>
