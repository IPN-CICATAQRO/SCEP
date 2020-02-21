<!---
* =========================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Posgrado
* Sub modulo: Convocatoria
* Fecha: 31 de Julio de 2015
* Descripcion: Handler para el modulo de Convocatorias
* =========================================================================
--->

<cfcomponent >
    <!---
	* Fecha creacion: Julio 31, 2015
	* @author Peña Alba Aldo
    * Descripción: Funcion que inicia el modulo de convocatorias
	--->
    <cffunction name="index" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout de Prueba">
		<cfargument name="Event" type="any">
		<cfscript>
            var sessionUsuario		= Session.usuario;
            prc.infoUsuarioSession = sessionUsuario;
            //WriteDump(sessionUsuario);
            Event.setLayout("base");
			Event.setView("base/base");
        </cfscript>
    </cffunction>
</cfcomponent>
