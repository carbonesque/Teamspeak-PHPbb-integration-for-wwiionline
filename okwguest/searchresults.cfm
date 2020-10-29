<cfinclude template="/okwadmin/inc/functions.cfm">
<cfset CurrentPage=GetFileFromPath(GetTemplatePath())>
<cfparam name="PageNum_search" default="1">
<cffunction name="AlternateColor" access="public" output="false" returntype="string">
  <!--- Arguments --->
  <cfargument name="color1" type="string">
  <cfargument name="color2" type="string">
  <cfargument name="row" type="numeric">
  <!--- Alternate Colors --->
  <cfif arguments.row MOD 2>
    <cfset thiscolor = arguments.color1>
    <cfelse>
    <cfset thiscolor = arguments.color2>
  </cfif>
  <!--- Return The Color --->
  <cfreturn thiscolor>
</cffunction>

<cfquery name="search" datasource="OKWTS">
	SELECT * FROM ts2_tsman_users 
	WHERE #url.type# LIKE '%#url.search#%'
		ORDER BY group_key ASC, group_admin DESC, s_client_name ASC;
</cfquery>
<cfset MaxRows_search=20>
<cfset StartRow_search=Min((PageNum_search-1)*MaxRows_search+1,Max(search.RecordCount,1))>
<cfset EndRow_search=Min(StartRow_search+MaxRows_search-1,search.RecordCount)>
<cfset TotalPages_search=Ceiling(search.RecordCount/MaxRows_search)>
<cfset QueryString_search=Iif(CGI.QUERY_STRING NEQ "",DE("&"&XMLFormat(CGI.QUERY_STRING)),DE(""))>
<cfset tempPos=ListContainsNoCase(QueryString_search,"PageNum_search=","&")>
<cfif tempPos NEQ 0>
  <cfset QueryString_search=ListDeleteAt(QueryString_search,tempPos,"&")>
</cfif>
<cfoutput>
	<cfinclude template="_header.cfm">
	<table>
	  <tr>
		<td>
			<table border="0" width="400" align="center">
			<tr>
			  <td width="23%" align="center"><cfif PageNum_search GT 1>
				  <a href="#CurrentPage#?PageNum_search=1#QueryString_search#"><img src="http://okw.wwiiol.net/okwadmin/images/First.gif" border=0></a>
				</cfif>
			  </td>
			  <td width="31%" align="center"><cfif PageNum_search GT 1>
				  <a href="#CurrentPage#?PageNum_search=#Max(DecrementValue(PageNum_search),1)##QueryString_search#"><img src="http://okw.wwiiol.net/okwadmin/images/Previous.gif" border=0></a>
				</cfif>
			  </td>
			  <td width="23%" align="center"><cfif PageNum_search LT TotalPages_search>
				  <a href="#CurrentPage#?PageNum_search=#Min(IncrementValue(PageNum_search),TotalPages_search)##QueryString_search#"><img src="http://okw.wwiiol.net/okwadmin/images/Next.gif" border=0></a>
				</cfif>
			  </td>
			  <td width="23%" align="center"><cfif PageNum_search LT TotalPages_search>
				  <a href="#CurrentPage#?PageNum_search=#TotalPages_search##QueryString_search#"><img src="http://okw.wwiiol.net/okwadmin/images/Last.gif" border=0></a>
				</cfif>
			  </td>
			</tr>
		  </table></td>
	  </tr>
	  <tr>
		<td class="size9grey"><cfoutput>Records #StartRow_search# to #EndRow_search# of #search.RecordCount# </cfoutput> </td>
	  </tr>
	</table>
	<table class="size11grey" bgcolor="##555555" align="left" width="425" cellpadding="1">
	  <tr>
		<td width="60" bgcolor="##555555" class="size10white"><strong>NAME</strong></td>
		<td width="20" bgcolor="##555555" class="size10white"><strong>GA</strong></td>
		<td width="70" bgcolor="##555555" class="size10white"><strong>Last Online</strong></td>
		<td bgcolor="##555555" class="size10white"><strong>Group</strong></td>
	  </tr>
	  <cfloop query="search" startrow="#StartRow_search#" endrow="#EndRow_search#">
		<cfset color = AlternateColor(color1="##CCCCCC", color2="##BBBBBB", row=#search.CurrentRow#)>
		<cfquery name="groupinfo" datasource="OKWTS">
			SELECT group_name, group_rank 
			FROM ts2_tsman_groups 
			WHERE group_key = '#search.group_key#'
		</cfquery>
		<cfquery name="userdetails" datasource="OKWTS">
			SELECT dt_client_lastonline 
			FROM ts2_clients 
			WHERE s_client_name = '#search.s_client_name#'
		</cfquery>
		<tr>
		  <td width="60" align="left" bgcolor="#color#" class="size9grey"><strong>#search.s_client_name#</strong></td>
		  <td width="25" bgcolor="#color#" class="size9grey"><strong>#search.group_admin#</strong></td>
		  <td bgcolor="#color#" class="size9grey" align="left"><strong>#tsdate(userdetails.dt_client_lastonline)#</strong></td>
		  <td bgcolor="#color#" class="size9grey">
		  
  			<cfoutput>
			  <cfswitch expression="#groupinfo.group_rank#">
				  <cfcase value="9"><span class="squadorange">#groupinfo.group_name#</span></cfcase>
				  <cfcase value="10"><span class="darkblue">#groupinfo.group_name#</span></cfcase>
				  <cfdefaultcase><span class="size9grey"><strong>#groupinfo.group_name#</strong></span></cfdefaultcase> 
			  </cfswitch>
			</cfoutput>
		  </td>
		</tr>
	  </cfloop>
  </table>
  </body>
  </html>
</cfoutput>