<!---
* =========================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Posgrado
* Sub modulo: SIP
* Fecha: 19 de Marzo de 2014
* Descripcion: Handler para el modulo SIP
* =========================================================================
--->

<cfcomponent>

	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="index" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="event" type="any">
		<cfscript>
			var objDataStore	= getModel("sip.CN_Sip");
			prc.qAlumnos		= objDataStore.obtenerAlumnos();
			prc.niveles			= objDataStore.cargaNivelesByFecha(now());
			event.setLayout("sip");
			event.setView("sip/Registro");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="registro" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sip.CN_Sip");
			prc.qAlumnos	= objDataStore.obtenerAlumnos();
			prc.niveles			= objDataStore.cargaNivelesByFecha(now());
			event.setLayout("sip");
			event.setView("sip/Registro");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="programas" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sip.CN_Sip");
			prc.claveUr = 'O2K000'; 
			prc.qProgramas = objDataStore.obtenerProgramasEscuela('O2K000');
			event.setLayout("sip");
			event.setView("sip/Programas");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="baja_alumno" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sip.CN_Sip");
			prc.niveles			= objDataStore.cargaNivelesByFecha(now());
			Request.qAlumnos	= objDataStore.obtenerAlumnos();
			event.setLayout("sip");
			event.setView("sip/baja_cancelacion_alumno");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="apertura_proceso_admision" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			event.setLayout("sip");
			event.setView("sip/apertura_proceso_admision");
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="validacion_aspirantes" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sip.CN_Sip");
			prc.niveles			= objDataStore.cargaNivelesByFecha(now());
			Request.qAlumnos	= objDataStore.obtenerAlumnos();
			event.setLayout("SIP");
			event.setView("sip/validacion_aspirantes");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="validacion_condicionados" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sip.CN_Sip");
			prc.niveles			= objDataStore.cargaNivelesByFecha(now());
			Request.qAlumnos	= objDataStore.obtenerAlumnos();
			event.setLayout("SIP");
			event.setView("sip/validacion_condicionados");
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="validacion_especiales" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sip.CN_Sip");
			prc.niveles			= objDataStore.cargaNivelesByFecha(now());
			Request.qAlumnos	= objDataStore.obtenerAlumnos();
			event.setLayout("SIP");
			event.setView("sip/validacion_especiales");
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 02 de Abril del 2014
	* @author David Monterrosas
	--->
	<cffunction name="detalle_alumno" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var rc	=	Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			
			prc.qAlumno			= objDataStore.obtenerInformacionAlumno(rc.pkAlumno);
			prc.sEstudios		= objDataStore.obtenerEstudios(rc.pkAlumno);
			prc.sExperiencia	= objDataStore.obtenerExperiencia(rc.pkAlumno);
			prc.catAdmision		= objDataStore.obtenerCatAdmision();
			prc.pkAlumno		= rc.pkAlumno;
			event.setLayout("sip");
			event.setView("sip/detalle_alumno");
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionGlobal" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionGlobal(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionInformacionPersonal" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionInformacionPersonal(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionEstudiosProf" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionEstudiosProf(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionEstudiosPostProf" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionEstudiosPostProf(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionIdiomas" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionIdiomas(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionResultadosEvaluacion" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionResultadosEvaluacion(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionConsejero" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionConsejero(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionDocumentos" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionDocumentos(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionDocumentoIndividual" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionDocumentoIndividual(rc.pkAlumno,rc.pkArchivo);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionExperienciaProf" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionExperienciaProf(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionTrabajosInv" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionTrabajosInv(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="validacionLaborDocente" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.validacionLaborDocente(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="cambiarEstadoPrograma" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado		= objDataStore.cambiarEstadoPrograma(rc.claveUR,rc.pkPrograma,rc.estado,rc.estadoAccion);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: Abril 23, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="cargaDependencias" access="public" output="false" returntype="string" hint="Carga las dependencias por clasificacion">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var dependencias	= objDataStore.cargaDependenciasByClase(now(),rc.nivel);
			return SerializeJSON(dependencias);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerProgramasEscuela" access="public" output="false" returntype="string" hint="Carga las dependencias por clasificacion">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var programas	= objDataStore.obtenerProgramasEscuela(rc.claveUr);
			return SerializeJSON(programas);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="actualizaTabla" access="public" output="false" returntype="string" hint="Carga las dependencias por clasificacion">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
			var objDataStore	= getModel("sip.CN_Sip");
			var resultado	= objDataStore.obtenerAlumnos(rc.clasificacion,rc.dependencia,rc.selectPrograma);
			return SerializeJSON(resultado);
		</cfscript>
	</cffunction>
</cfcomponent>