<!---
* ==================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Sepi Posgrado
* Fecha: 
* Descripcion: Componente de Negocio para el modulo de Alumno
* ==================================================================
--->
<cfcomponent>
	<cfset dao = CreateObject('component','DAO_Sepi')>
	
	<!--- 
	* Fecha: 
	* @author:
	* --->
	<cffunction name="obtenerAlumnos" access="public">
		<cfargument name="dependencia" type="string" required="yes">
		<cfargument name="pkPrograma" type="numeric" required="no" default="0">
		<cfscript>
			return dao.obtenerAlumnos(dependencia,pkPrograma);
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
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerCatPeriodos" access="public">
		<cfscript>
			return dao.obtenerCatPeriodos();
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerCatCoordinador" access="public">
		<cfargument name="claveUr" type="string" required="yes">
		<cfscript>
			return dao.obtenerCatCoordinador(claveUr);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="importarPrograma" access="public">
		<cfargument name="claveUr" type="string" required="yes">
		<cfargument name="pkUsuario" type="numeric" required="yes">
		<cfargument name="nombrePrograma" type="string" required="yes">
		<cfargument name="duracion" type="numeric" required="yes">
		<cfargument name="selectPeriodo" type="numeric" required="yes">
		<cfargument name="selectCoordinador" type="numeric" required="yes">
		<cfscript>
			return dao.importarPrograma(claveUr,pkUsuario,nombrePrograma,duracion,selectPeriodo,selectCoordinador);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerInfoPrograma" access="public">
		<cfargument name="pkPrograma" type="numeric" required="yes">
		<cfscript>
			return dao.obtenerInfoPrograma(pkPrograma);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerAsignaturasPrograma" access="public">
    	<cfargument name="pkPrograma" type="numeric" required="yes">
		<cfscript>
			return dao.obtenerAsignaturasPrograma(pkPrograma);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerAsignaturaInfo" access="public">
    	<cfargument name="pkAsignatura" type="numeric" required="yes">
		<cfscript>
			return dao.obtenerAsignaturaInfo(pkAsignatura);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="cambiarEstadoAsignatura" access="public">
		<cfargument name="pkAsignatura" type="numeric" required="yes">
		<cfargument name="estado" type="numeric" required="yes">
		<cfargument name="estadoAccion" type="numeric" required="yes">
		<cfscript>
			return dao.cambiarEstadoAsignatura(pkAsignatura,estado,estadoAccion);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerCatTipoAsignatura" access="public">
		<cfscript>
			return dao.obtenerCatTipoAsignatura();
		</cfscript>
	</cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerParticipantes" access="public">
		<cfargument name="claveUr" type="string" required="yes">
		<cfargument name="pkAsignatura" type="numeric" required="yes">
		<cfscript>
			return dao.obtenerParticipantes(claveUr,pkAsignatura);
		</cfscript>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="guardarInformacion" access="public">
        <cfargument name="pkUsuario"						type="numeric" required="yes">
        <cfargument name="pkPrograma"						type="numeric" required="yes">
        <cfargument name="pkAsignatura"						type="numeric" required="yes">
        <cfargument name="nombreDeAsignatura"				type="string"  required="yes">
        <cfargument name="tipoAsignatura"					type="numeric" required="yes">
        <cfargument name="numeroDeHorasTeoria"				type="numeric" required="yes">
        <cfargument name="numeroDeHorasPracticas"			type="numeric" required="yes">
        <cfargument name="numeroDeHorasTericoPracticas"		type="numeric" required="yes">
        <cfargument name="unidadesDeCredito"				type="numeric" required="yes">
		<cfargument name="numeroSessionAcuerdo"				type="numeric"  required="yes">
		<cfargument name="selectCoordinador"				type="numeric" required="yes">
		<cfargument name="objetivoGeneral"					type="string"  required="yes">
		<cfargument name="bibliografiaUtilizada"			type="string"  required="yes">
		<cfargument name="procedimientoEvaluacion"			type="string"  required="yes">
		<cfargument name="listParticipantes"				type="string"  required="yes">
		<cfscript>
			var resultado = 0;
			var pkAsignaturaTmp = 0;

			if(pkAsignatura eq 0){
				pkAsignaturaTmp = dao.insertInformacion(pkUsuario,pkPrograma,nombreDeAsignatura,tipoAsignatura,numeroDeHorasTeoria,numeroDeHorasPracticas,
						numeroDeHorasTericoPracticas,unidadesDeCredito,numeroSessionAcuerdo,objetivoGeneral,bibliografiaUtilizada,procedimientoEvaluacion);
				if(pkAsignaturaTmp gt 0){
					resultado = dao.insertCoordinador(pkUsuario,pkAsignaturaTmp,selectCoordinador);
					dao.inserProgAsignatura(pkUsuario,pkPrograma,pkAsignaturaTmp);
				}
			}else{
				resultado = dao.actualizarInformacion(pkUsuario,pkPrograma,pkAsignatura,nombreDeAsignatura,tipoAsignatura,numeroDeHorasTeoria,numeroDeHorasPracticas,
						numeroDeHorasTericoPracticas,unidadesDeCredito,numeroSessionAcuerdo,selectCoordinador,objetivoGeneral,bibliografiaUtilizada,procedimientoEvaluacion);
				dao.actualizarCoordinador(pkAsignatura,selectCoordinador);
				pkAsignaturaTmp = pkAsignatura;
			}

			if(resultado gt 0){
				dao.actualizaParticipantesAnt(pkUsuario,pkAsignaturaTmp);
				for(i=1 ; i lte listLen(listParticipantes) ; i++){
					dao.actualizaParticipantes(pkUsuario,pkAsignaturaTmp,listGetAt(listParticipantes, i));
				}
			}
			return resultado;
		</cfscript>
	</cffunction>
</cfcomponent>