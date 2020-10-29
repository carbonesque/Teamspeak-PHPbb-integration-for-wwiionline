<cfinclude template="inc/conf.cfm">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>OKW TS ADMIN</title>
<link href="<cfoutput>#root#</cfoutput>/inc/ts.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#888888">
<cfform action="process_login.cfm" method="post">
<table align="center" bgcolor="#888888">
  <tr>
    <td background="<cfoutput>#root#</cfoutput>/images/main_head.jpg" align="left" valign="top" width="704" height="85">&nbsp;</td>
  </tr>
</table>
<table align="center" valign="middle" width="700" border="0" cellpadding="2" cellspacing="0" bgcolor="#000000">
  <tr>
    <td width="700"><table bgcolor="#dddddd">
        <!--DWLayoutTable-->
        <tr>
          <td height="21" colspan="3" valign="top" bgcolor="#dddddd">&nbsp;</td>
          <td></td>
        </tr>
        <tr>
          <td width="37" height="24" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td width="73" valign="baseline" class="size11grey">username</td>
          <td class="size9grey" colspan="2" valign="baseline"><cfinput type="text" name="s_client_username" size="15" maxlength="8" required="yes" message="You must enter a login name.">
&nbsp;&nbsp;this should be the same as your wwiiol game name </td>
        </tr>
        <tr>
          <td class="size9grey" width="37" height="24" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td width="73" valign="baseline" class="size11grey">password</td>
          <td class="size9grey" colspan="2" valign="baseline"><cfinput type="password" name="s_client_password" size="15" maxlength="8" required="yes" message="You must enter a password.">
&nbsp;&nbsp;your teamspeak password </td>
        </tr>
        <tr>
          <td class="size9grey" width="37" height="24" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td width="73" valign="baseline" class="size11grey"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td class="size9grey" colspan="2" valign="baseline"><input type="submit" name="Submit" value="LOGIN"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td width="700">&nbsp;</td>
          <td></td>
        </tr>
      </table></td>
  </tr>
</table>
</cfform>
</body>
</html>
