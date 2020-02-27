<!---
* =========================================================================
* IPN - CSII
* Sistema: SIICENDI
* Modulo: Principal
* Sub modulo: Login
* Fecha: 1 de Abril de 2014
* Descripcion: Componente de Negocio para el login de los usuarios de posgrado
* =========================================================================
--->

<cfcomponent>

<cffunction name = "getRolesSession" returnType = "any" access = "public">
	<cfscript>
		dao 	= CreateObject('component', 'DAO_Login');
		roles	= dao.getRolesSession();
		return roles;
	</cfscript>
</cffunction>

	<!---
	* Fecha creacion: Abril 01, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="validarUsuario" access="public" returntype="struct">
		<cfargument name="usuario" type="string" required="yes">
		<cfargument name="pass" type="string" required="yes">
		<cfscript>
			result	= structNew();
			dao 	= CreateObject('component', 'DAO_Login');
			usuario	= dao.getUsuario(usuario,pass);
			if (usuario.RECORDCOUNT GT 0) {
				/*qOps		= dao.getOperaciones(usuario.PK_USUARIO);
				operaciones	= "";
				for (x=1 ; x LTE qOps.RECORDCOUNT ; x=x+1) {
				  if (x eq 1 ) {
					  operaciones = qOps.CLAVE[x];
				  } else {
					  operaciones = operaciones & "," & qOps.CLAVE[x];
				  }
				}*/

				qRoles	= dao.getRoles(usuario.PK_USUARIO);
				roles	= "";
				for (x=1 ; x LTE qRoles.RECORDCOUNT ; x=x+1) {
				  if (x eq 1 ) {
					  roles		= qRoles.CVE_ROL[x];
				  } else {
					  roles		= roles & "," & qRoles.CVE_ROL[x];
				  }
				}

				result.VALIDADO		= usuario.FK_ESTATUS;
				result.PK_USUARIO	= usuario.PK_USUARIO;
				result.PKALUMNO		= usuario.PK_ALUMNO;
				result.NOMBRE		= usuario.NOMBRE;
				result.APATERNO		= usuario.APE_PAT;
				result.AMATERNO		= usuario.APE_MAT;
				result.USERNAME		= usuario.USUARIO;
				result.PK_UR		= usuario.FK_UR;
				result.OPERACIONES	= "SIN OPERACIONES";//operaciones;
				result.ROLES		= roles;
			} else {
				result.VALIDADO		= 0;
			}
			return result;
		</cfscript>
	</cffunction>

</cfcomponent>
