<cfcomponent>

	<cfproperty name="connection"		type="any">
	<cfproperty name="server"		type="string">
	<cfproperty name="username"		type="string">
	<cfproperty name="password"		type="string">
	<cfproperty name="port"			type="string">

	<cffunction name="hasConnect" access="public" returntype="boolean" hint="Metodo Inicial que conecta a Coldfusion al Server FTP">
		<cfreturn isdefined("this.connection")>
	</cffunction>


	<cffunction name="connect" access="public" returntype="boolean" hint="Metodo Inicial que conecta a Coldfusion al Server FTP">
		<cfargument name="prefijo" default="" required="false">
		<cftry>
			<cfobject action="create" type="Java" class="edu.ipn.sectecnica.utils.Resources.Resources" name="resources">
			<cfscript>
			adminapi = createObject("component","cfide.adminapi.base");

				propertyServer		="";
				propertyUser		="";
				propertyPassword	="";
				propertyPort		="";
				resources.init();

				if(isDefined('prefijo') AND len(prefijo) gt 0){
					propertyServer=prefijo&".ftp.server";
					propertyUser=prefijo&".ftp.username";
					propertyPassword=prefijo&".ftp.password";
					propertyPort=prefijo&".ftp.port";

				}

				this.server   = resources.getProperty(propertyServer);
				this.username = resources.getProperty(propertyUser);
				this.password = resources.getProperty(propertyPassword);						
				logger('server::::  '&this.server);
			</cfscript>
			<cftry>
				<cfscript>
					this.port=resources.getProperty(propertyPort);
				</cfscript>
				<cfcatch type="any">
				<cfscript>
					this.port="21";
				</cfscript>
				</cfcatch>
			</cftry>
			<cfftp action="open" connection="this.connection" port="#this.port#" server="#this.server#" username="#this.username#" password="#this.password#">
			<cflog text="this.connection_original::  #this.connection#">
			<cflog text="FTP is Opened?: #CFFTP.Succeeded#">
			<cfcatch type="any">
				<cfreturn false>
			</cfcatch>
		</cftry>

		<cfreturn true>
	</cffunction>

	<cffunction name="changeToFolder" access="public" hint="Metodo que me cambia de carpeta en el servidor FTP">
		<cfargument name="path" type="string">
		<cfscript>
			dirs = ListToArray(path,'\');
			i=1;
			for(i=1;i lte arraylen(dirs) ; i = i +1){
				verifyFolder(dirs[i]);
			}
		</cfscript>
	</cffunction>

	<cffunction name="verifyFolder" access="public">
		<cfargument name="directory" type="string">
		<cfftp action="ExistsDir" connection="this.connection" directory="#directory#">
		<cfif cfftp.returnValue eq "NO">
			<cfftp action="createDir" connection="this.connection" directory="#directory#">
		</cfif>
		<cfftp action="changedir" connection="this.connection" directory="#directory#">
		<cfftp connection="this.connection" action="getCurrentDir">
	</cffunction>

	<cffunction name="uploadFile" access="public" returntype="string" hint="Sube el archivo a carpeta indicada en parametros">
		<cfargument name="localPath" type="string" hint="ruta donde se subira archivo en servidor ftp">
		<cfargument name="filename" type="string" hint="nombre del archivo (local)">
		<cfargument name="extension" type="string" hint="extension del archivo">
		<cfset counter = 0 >
		<cfset endFile = "" >
		<cfloop condition="true">

			<cflog text="this.connection:::::::::: #this.connection#">
			<cflog text="filename::::::::::::::::: #filename#">
			<cflog text="endFile:::::::::::::::::: #endFile#">
			<cflog text="extension:::::::::::::::: #extension#">
			<cfftp connection="this.connection" action="GetCurrentDir" stoponerror="yes">

			<cfftp action="existsFile" retrycount="5" connection="this.connection" remotefile="#filename##endFile#.#extension#" passive="yes">
			<cflog text="this.connectioninloop:::: #this.connection#">
			<cfif cfftp.ReturnValue eq false>
				<cfftp action="putFile" retrycount="5" connection="this.connection" localfile="#localPath##filename#.#extension#" remotefile="#filename##endFile#.#extension#" passive="yes">
				<cfbreak>
			<cfelse>
				<cfset  counter = counter + 1 >
				<cfset endFile = "(" & counter & ")" >
			</cfif>
		</cfloop>

		<cfreturn "#filename##endFile#.#extension#">
	</cffunction>

	<cffunction name="downloadFile" access="public">
		<cfargument name="remotefile" type="string">
		<cfargument name="localfile" type="string">
		<cftry>

			<cflog text="remotefile: #remotefile#">
			<cflog text="localfile: #localfile#">
			<cfftp action="getFile" connection="this.connection" remotefile="#remotefile#" localfile="#localfile#" retrycount="5" failIfExists="no" passive="yes">
			<cfcatch type="any">
				<cfreturn false>
			</cfcatch>
		</cftry>
		<cfreturn true>
	</cffunction>

	<cffunction name="deleteFile" access="public">
		<cfargument name="remotefile" type="string">

		<cfftp action="existsFile" retrycount="5" connection="this.connection" remotefile="#remotefile#">
		<cfif cfftp.ReturnValue eq false>
			<cfreturn false>
		<cfelse>
			<cfftp action="Remove" connection="this.connection" retrycount="5" item="#remotefile#" >
		</cfif>

		<cfreturn true>
	</cffunction>

	<cffunction name="delete" access="public" hint="">
		<cfargument name="fullPath" type="string" hint="">
		<cffile action = "delete" file="#fullPath#">
		<cfreturn true>
	</cffunction>

	<cffunction name="logger" access="remote">
	<cfargument name="text" required="yes">
	<cfset text="utilidades.fileTransfer.FTP::  "&text>
	<cflog text="#text#" type="information">
	</cffunction>

</cfcomponent>
