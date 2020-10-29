<cffunction name="tsdate" output="true">
<!--- Strips the first eight digits from the TS database to make a date --->
	<cfargument name="textString" type="string"	requied="true" hint="numeric string to convert to a date object">
	<cfset var dateval	= arguments.textstring>
	<cfif dateval eq "">
		<cfreturn "never">
	</cfif>
	<cfset day = left(dateval,2)>
	<cfset dateval = right(dateval, 15)>
	<cfset month = left(dateval,2)>
	<cfset dateval = right(dateval, 13)>
	<cfset year = left(dateval,4)>
	<cfreturn dateformat(createDate(year,month,day), "mmm-dd-yy")>
</cffunction>