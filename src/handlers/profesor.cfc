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
			Event.setLayout("profesor");
			Event.setView("profesor/index");
		</cfscript>
	</cffunction>

	
	
</cfcomponent>