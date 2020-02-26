<!---
* =========================================================================
* IPN - CICATA
* Sistema: SCEP
* Modulo: Posgrado
* Sub modulo: Inscripcion
* Fecha: 05 Febrero 2020
* Descripcion: Handler para crear cuenta
* =========================================================================
--->

<cfcomponent>

	<cffunction name="index" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var cnCatalogos		= getModel("catalogos.CN_Catalogos");
			var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');

			Session.Usuario.ROLES = "";
			var pkPersona = 0;
			prc.estadoCivil = cnCatalogos.getEstadoCivil();
			Event.setLayout("cuenta");
			Event.setView("cuenta/registro");
		</cfscript>
	</cffunction>

</cfcomponent>
