<!---
* ==================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Sip Posgrado
* Fecha: 
* Descripcion: Componente de Negocio para el modulo de Alumno
* ==================================================================
--->
<cfcomponent>
	<cfset dao = CreateObject('component','DAO_Sip')>
	
	<!--- 
	* Fecha: 
	* @author:
	* --->
	<cffunction name="obtenerAlumnos" access="public">
		<cfargument name="clasificacion" type="string" required="no" default="0">
		<cfargument name="dependencia" type="string" required="no" default="0">
		<cfargument name="selectPrograma" type="numeric" required="no" default="0">
		<cfscript>
			return dao.obtenerAlumnos(clasificacion,dependencia,selectPrograma);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerInformacionAlumno" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.obtenerInformacionAlumno(pkAlumno);
		</cfscript>
	</cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerEstudios" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			var sInfo = structNew();
				sInfo.EstudiosProfesionales = dao.obtenerEstudiosProfesionales(pkAlumno);
				sInfo.EstudiosPostProfesionales = dao.obtenerEstudiosPostProfesionales(pkAlumno);
				sInfo.Idiomas = dao.obtenerIdiomas(pkAlumno);
			return sInfo;
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerExperiencia" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			var sInfo = structNew();
				sInfo.Experiencia = dao.obtenerExperiencia(pkAlumno);
				sInfo.LaborDocente = dao.obtenerLaborDocente(pkAlumno);
				sInfo.TrabInvestigacion = dao.obtenerTrabInvestigacion(pkAlumno);
			return sInfo;
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerCatAdmision" access="public">
		<cfscript>
			return dao.obtenerCatAdmision();
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionGlobal" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			var informacionPersonal = dao.obtenerInformacionAlumno(pkAlumno);
			var estudiosProfesionales = dao.obtenerEstudiosProfesionales(pkAlumno);
			var estudiosPostProfesionales = dao.obtenerEstudiosPostProfesionales(pkAlumno);
			var idiomas = dao.obtenerIdiomas(pkAlumno);
			var experiencia = dao.obtenerExperiencia(pkAlumno);
			var laborDocente = dao.obtenerLaborDocente(pkAlumno);
			var trabInvestigacion = dao.obtenerTrabInvestigacion(pkAlumno);
		
			if(informacionPersonal.RecordCount gt 0)
				dao.validacionInformacionPersonal(pkAlumno);
			if(estudiosProfesionales.RecordCount gt 0)
				dao.validacionEstudiosProf(pkAlumno);
			if(estudiosPostProfesionales.RecordCount gt 0)
				dao.validacionEstudiosPostProf(pkAlumno);
			if(idiomas.RecordCount gt 0)
				dao.validacionIdiomas(pkAlumno);
			if(experiencia.RecordCount gt 0)
				dao.validacionExperienciaProf(pkAlumno);
			if(laborDocente.RecordCount gt 0)
				dao.validacionLaborDocente(pkAlumno);
			if(trabInvestigacion.RecordCount gt 0)
				dao.validacionTrabajosInv(pkAlumno);

			return dao.validacionGlobal(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionInformacionPersonal" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionInformacionPersonal(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionEstudiosProf" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionEstudiosProf(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionEstudiosPostProf" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionEstudiosPostProf(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionIdiomas" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionIdiomas(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionResultadosEvaluacion" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionResultadosEvaluacion(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionConsejero" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionConsejero(pkAlumno);
		</cfscript>
	</cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionDocumentos" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionDocumentos(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionDocumentoIndividual" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="pkArchivo" type="numeric" required="yes">
		<cfscript>
			return dao.validacionDocumentoIndividual(pkAlumno,pkArchivo);
		</cfscript>
	</cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionExperienciaProf" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionExperienciaProf(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionTrabajosInv" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionTrabajosInv(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionLaborDocente" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.validacionLaborDocente(pkAlumno);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerProgramasEscuela" access="public">
		<cfargument name="claveUr" type="string" required="yes">
		<cfscript>
			return dao.obtenerProgramasEscuela(claveUr);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="cambiarEstadoPrograma" access="public">
		<cfargument name="claveUr" type="string" required="yes">
		<cfargument name="pkPrograma" type="numeric" required="yes">
		<cfargument name="estado" type="numeric" required="yes">
		<cfargument name="estadoAccion" type="numeric" required="yes">
		<cfscript>
			return dao.cambiarEstadoPrograma(claveUr,pkPrograma,estado,estadoAccion);
		</cfscript>
	</cffunction>
    
    <cffunction name="cargaNivelesByFecha" access="public" returntype="query">
    	<cfargument name="fecha" type="date" required="yes">
        <cfscript>
			pkTime	= this.getDWTimeUR(fecha);
			return dao.cargaNivelesByFecha(pkTime);
		</cfscript>
    </cffunction>
    
    <cffunction name="cargaDependenciasByClase" access="public" returntype="query" hint="Obtiene las dependencias por clasificacion de dependencias">
		<cfargument name="fechaActiva" required="yes" type="date">
		<cfargument name="clase" required="yes" type="string">
		<cfscript>
			pkTime = this.getDWTimeUR(arguments.fechaActiva);
			return dao.cargaDependenciasByClase(pkTime,arguments.clase);
		</cfscript>
	</cffunction>
	
	<cffunction name="getDWTimeUR" access="public" hint="Obtiene el DW_PK_TIME de una fecha">
    	<cfargument name="fecha" required="yes" type="date">
        <cfscript>
			return dao.getDWTimeUR(arguments.fecha);
        </cfscript>
    </cffunction>
</cfcomponent>