<!---
* =========================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Posgrado
* Sub modulo: consejero
* Fecha: 24 de Marzo de 2014
* Descripcion: Handler para el modulo de Alumnos
* =========================================================================
--->

<cfcomponent>

	<!---
	* Fecha creacion: Marzo 21, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="index" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("consejero");
			Event.setView("consejero/index");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 21, 2014
	* @author David Monterrosas
	--->
	<cffunction name="revalidacion_estudios" access="public" returntype="void" output="false" >
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("consejero");
			Event.setView("consejero/revalidacion_estudios");
		</cfscript>
	</cffunction>
</cfcomponent>