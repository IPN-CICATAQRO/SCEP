<!---
* =========================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Principal
* Sub modulo: Login
* Fecha: 1 de Abril de 2014
* Descripcion: Objeto de Acceso a datos para el login de los usuarios a Posgrado
* =========================================================================
--->

<cfcomponent>

	<cffunction name="getRolesSession" access="public" returntype="query" hint="Obtiene los roles activos">
	<cfquery name="qRoles" datasource="DS_SIIIP">
				SELECT CR.PTR_ROL AS ROL,
								CR.PTR_PK_ROL AS PK_ROL
					FROM SYS.POS_CROLES CR
				 WHERE     CR.PTR_FK_ESTATUS = 2
		</cfquery>
		<cfreturn qRoles>
	</cffunction>


	<cffunction name="getRoles" access="public" returntype="query" hint="Obtiene los roles asignados al pk del usuario">
		<cfargument name="pkUsuario" type="numeric" required="yes">
		<cfquery name="qRoles" datasource="DS_SIIIP">
				SELECT CR.PTR_ROL AS CVE_ROL,
								TUR.PTR_FK_ROL AS PK_ROL
				FROM 	SYS.POS_TUSUARIO_ROL TUR,
							SYS.POS_CROLES CR
				WHERE CR.PTR_PK_ROL = TUR.PTR_FK_ROL
				AND TUR.PTR_FK_USUARIO = #pkUsuario#
				AND TUR.PTR_FK_ESTATUS = 2
			</cfquery>
			<cfreturn qRoles>
	</cffunction>

	<!---
	* Fecha creacion: Abril 01, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="getUsuario" access="public" returntype="query">
		<cfargument name="username" type="string" required="yes">
		<cfargument name="clave" type="string" required="yes">
		<cfquery name="qUsuario" datasource="DS_SIIIP">
					SELECT  TUS.PTU_PK_USUARIO AS PK_USUARIO,
					        TUS.PTU_FK_ALUMNO AS PK_ALUMNO,
					        TUS.PTU_NOMBRE AS NOMBRE,
					        TUS.PTU_AP_PATERNO AS APE_PAT,
					        TUS.PTU_AP_MATERNO AS APE_MAT,
					        TUS.PTU_FK_UR AS FK_UR,
					        TUS.PTU_FK_ESTATUS AS FK_ESTATUS,
									TUS.PTU_USUARIO AS USUARIO
					FROM SYS.POS_TUSUARIO TUS
					WHERE TUS.PTU_USUARIO = '#username#'
					AND TUS.PTU_CONTRASENA = '#clave#'
			</cfquery>
			<cfreturn qUsuario>
		<!--- <cfstoredproc procedure="SIIIP.P_ADM_USUARIO.GET_USUARIO" datasource="DS_SIIIP">
		    <cfprocparam cfsqltype="cf_sql_varchar" value="#arguments.username#">
		    <cfprocparam cfsqltype="cf_sql_varchar" value="#arguments.clave#">
		    <cfprocresult name="usuario">
		</cfstoredproc> --->
	</cffunction>



	<!---
	* Fecha creacion: Abril 01, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="getOperaciones" access="public" returntype="query">
		<cfargument name="pkUsuario" type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_ADM_USUARIO.GET_OPERACIONES" datasource="DS_SIIIP">
		    <cfprocparam cfsqltype="cf_sql_varchar" value="#arguments.pkUsuario#">
		    <cfprocresult name="operaciones">
		</cfstoredproc>
		<cfreturn operaciones>
	</cffunction>

</cfcomponent>
