<cfcomponent output="false" singleton>

	<!--- Default Action --->
	<cffunction name="index" access="remote" returntype="void" output="false" hint="Evento que se ejecuta por default al iniciar la aplicacion">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
	<!---	<cfscript>
		setNextEvent("Convocatoria.index");
		abort;
			if(ListFind(Session.Usuario.ROLES,"POS_ASPIRANTE")){
				setNextEvent("Inscripcion.index");

			}else if(ListFind(Session.Usuario.ROLES,"POS_ALUMNO")){
				// Event.setLayout("alumno");
				// Event.setView("alumno/administrar_inscripcion");
				 //Event.setLayout("convocatoria");
				 //Event.setView("convocatoria/Crear");
				setNextEvent("Inscripcion.index");
			}else if(ListFind(Session.Usuario.ROLES,"POS_DIR_UR")){
				// Event.setLayout("alumno");
				// Event.setView("alumno/administrar_inscripcion");
				// Event.setLayout("convocatoria");
				// Event.setView("convocatoria/Crear");
				setNextEvent("Convocatoria.index");
			}else if(ListFind(Session.Usuario.ROLES,"POS_PROFESOR")){
				// Event.setLayout("alumno");
				// Event.setView("alumno/administrar_inscripcion");
				// Event.setLayout("convocatoria");
				// Event.setView("convocatoria/Crear");
				setNextEvent("profesor.index");
			}
			// 	Event.setLayout("profesor");
			// Event.setView("profesor/index");
			//else if(ListFind(Session.Usuario.ROLES,"POS_DIR_UR")){
			// Event.setLayout("sepi");
			// Event.setView("sepi/Registro");
			//}
			//else if(ListFind(Session.Usuario.ROLES,"POS_DIR_IPN")){
			// event.setLayout("sip");
			// event.setView("sip/Registro");
			//}
		</cfscript>--->
	  <!--- <cfset event.setLayout("Inscripcion").noLayout()>
		<cfset event.setView("Login").noLayout()> --->
		<cfscript>
		 event.setLayout("Main");
		event.setView("Login");
	</cfscript>
	</cffunction>

<!------------------------------------------- GLOBAL IMPLICIT EVENTS ONLY ------------------------------------------>
<!--- In order for these events to fire, you must declare them in the ColdBox.cfc --->

	<cffunction name="onAppInit" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

	</cffunction>

	<cffunction name="onRequestStart" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
	</cffunction>

	<cffunction name="onRequestEnd" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
	</cffunction>

	<cffunction name="onSessionStart" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
	</cffunction>

	<cffunction name="onSessionEnd" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfset var sessionScope = event.getValue("sessionReference")>
		<cfset var applicationScope = event.getValue("applicationReference")>

	</cffunction>

	<cffunction name="onException" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfscript>
			//Grab Exception From request collection, placed by ColdBox
			var exceptionBean = event.getValue("ExceptionBean");
			//Place exception handler below:

		</cfscript>
	</cffunction>

	<cffunction name="onMissingTemplate" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
		<cfscript>
			//Grab missingTemplate From request collection, placed by ColdBox
			var missingTemplate = event.getValue("missingTemplate");

		</cfscript>
	</cffunction>

</cfcomponent>
