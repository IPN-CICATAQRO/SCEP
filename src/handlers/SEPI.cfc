<!---
* =========================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Posgrado
* Sub modulo: SEPI
* Fecha: 19 de Marzo de 2014
* Descripcion: Handler para el modulo SEPI
* =========================================================================
--->
<cfcomponent>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="index" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			prc.claveUr			= claveUr;
			prc.qAlumnos	= objDataStore.obtenerAlumnos( claveUr);
			prc.qProgramas = objDataStore.obtenerProgramasEscuela(claveUr);
			Event.setLayout("sepi");
			Event.setView("sepi/Registro");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Daniel Gutierrez M
	--->
	<cffunction name="actas_grupales" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			Request.qAlumnos	= objDataStore.obtenerAlumnos( claveUr);
			event.setLayout("sepi");
			event.setView("sepi/actas_grupales");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Daniel Gutierrez M
	--->
	<cffunction name="administracion_convocatorias" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			Request.qAlumnos	= objDataStore.obtenerAlumnos( claveUr);
			event.setLayout("sepi");
			event.setView("sepi/administracion_convocatorias");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Daniel Gutierrez M
	--->
	<cffunction name="baja_alumno" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			event.setLayout("sepi");
			event.setView("sepi/baja_alumno");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Daniel Gutierrez M
	--->
	<cffunction name="detalle_inscripcion" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			event.setLayout("sepi");
			event.setView("sepi/detalle_inscripcion");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="programas" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			event.setLayout("sepi");
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			prc.claveUr			= claveUr;
			prc.qProgramas = objDataStore.obtenerProgramasEscuela(claveUr);
			prc.qCatPeriodos = objDataStore.obtenerCatPeriodos();
			prc.qCatCoordinador = objDataStore.obtenerCatCoordinador(claveUr);
			event.setView("sepi/Programas");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="registro" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			event.setLayout("sepi");
			event.setView("sepi/Registro");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="recalendarizacion" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			prc.qAlumnos	= objDataStore.obtenerAlumnos( claveUr);
			prc.qProgramas = objDataStore.obtenerProgramasEscuela(claveUr);
			event.setLayout("sepi");
			event.setView("sepi/Recalendarizacion");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Daniel Gutierrez M
	--->
	<cffunction name="registro_asignaturas" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var rc	=	Event.getCollection();
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;

			prc.qCatCoordinador = objDataStore.obtenerCatCoordinador(claveUr);
			prc.qCatTipoAsignatura = objDataStore.obtenerCatTipoAsignatura();

			if(isDefined('rc.pkAsignatura')){
				prc.qAsignaturaInfo = objDataStore.obtenerAsignaturaInfo(rc.pkAsignatura);
				prc.qParticipantes = objDataStore.obtenerParticipantes(claveUr,rc.pkAsignatura);
			}

			prc.pkPrograma = rc.pkPrograma;
			prc.pkAsignatura = rc.pkAsignatura;

			event.setLayout("sepi");
			event.setView("sepi/registro_asignaturas");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Daniel Gutierrez M
	--->
	<cffunction name="registro_comite_evaluador" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			event.setLayout("sepi");
			event.setView("sepi/registro_comite_evaluador");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Daniel Gutierrez M
	--->
	<cffunction name="validacion_reinscripcion" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			event.setLayout("sepi");
			event.setView("sepi/reinscripcion_validacion");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="validacion_aspirantes" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			Request.qAlumnos	= objDataStore.obtenerAlumnos( claveUr);
			event.setLayout("sepi");
			event.setView("sepi/validacion_aspirantes");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="validacion_condicionados" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			Request.qAlumnos	= objDataStore.obtenerAlumnos( claveUr);
			event.setLayout("sepi");
			event.setView("sepi/validacion_condicionados");
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author David M
	--->
	<cffunction name="validacion_especiales" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			Request.qAlumnos	= objDataStore.obtenerAlumnos( claveUr);
			event.setLayout("sepi");
			event.setView("sepi/validacion_especiales");
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
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;

			prc.qAlumno			= objDataStore.obtenerInformacionAlumno(rc.pkAlumno);
			prc.sEstudios		= objDataStore.obtenerEstudios(rc.pkAlumno);
			prc.sExperiencia	= objDataStore.obtenerExperiencia(rc.pkAlumno);
			prc.catAdmision		= objDataStore.obtenerCatAdmision();
			prc.pkAlumno		= rc.pkAlumno;
			prc.qCatCoordinador = objDataStore.obtenerCatCoordinador(claveUr);

			event.setLayout("sepi");
			event.setView("sepi/detalle_alumno");
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionGlobal(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionInformacionPersonal(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionEstudiosProf(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionEstudiosPostProf(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionIdiomas(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionResultadosEvaluacion(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionConsejero(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionDocumentos(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionDocumentoIndividual(rc.pkAlumno,rc.pkArchivo);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionExperienciaProf(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionTrabajosInv(rc.pkAlumno);
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.validacionLaborDocente(rc.pkAlumno);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="programa_asignatura" returntype="void" output="false">
		<cfargument name="event">
		<cfscript>
			var cnSepi			= getModel("sepi.CN_Sepi");
			event.setLayout("sepi");
			var rc = Event.getCollection();
			prc.pkPrograma				= rc.pkPrograma;
			prc.qInfoPrograma			= cnSepi.obtenerInfoPrograma(rc.pkPrograma);
			prc.qAsignaturasPrograma	= cnSepi.obtenerAsignaturasPrograma(rc.pkPrograma);
			event.setView("sepi/programas_asignatura");
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
			var cnSepi			= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			var resultado		= cnSepi.cambiarEstadoPrograma(claveUr,rc.pkPrograma,rc.estado,rc.estadoAccion);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="importarPrograma" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnSepi			= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			var pkUsuario		= sessionUsuario.PK_USUARIO;
			var resultado		= cnSepi.importarPrograma(claveUr,pkUsuario,rc.nombrePrograma,rc.duracion,rc.selectPeriodo,rc.selectCoordinador);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="cambiarEstadoAsignatura" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnSepi			= getModel("sepi.CN_Sepi");
			var resultado		= cnSepi.cambiarEstadoAsignatura(rc.pkAsignatura,rc.estado,rc.estadoAccion);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>
    
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarInformacion" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnSepi			= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var pkUsuario		= sessionUsuario.PK_USUARIO;

			var resultado = cnSepi.guardarInformacion(pkUsuario,rc.pkPrograma,rc.pkAsignatura,rc.nombreDeAsignatura,
							rc.tipoAsignatura,rc.numeroDeHorasTeoria,rc.numeroDeHorasPracticas,rc.numeroDeHorasTericoPracticas,
							rc.unidadesDeCredito,rc.numeroSessionAcuerdo,rc.selectCoordinador,rc.objetivoGeneral,rc.bibliografiaUtilizada,
							rc.procedimientoEvaluacion,rc.listParticipantes);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
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
			var objDataStore	= getModel("sepi.CN_Sepi");
			var sessionUsuario	= getPlugin('SessionStorage').getVar('usuario');
			var claveUr			= sessionUsuario.PK_UR;
			var resultado	= objDataStore.obtenerAlumnos(claveUr,rc.selectPrograma);
			return SerializeJSON(resultado);
		</cfscript>
	</cffunction>
</cfcomponent>