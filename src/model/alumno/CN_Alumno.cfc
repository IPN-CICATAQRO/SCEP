<!---
* ==================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Alumno Posgrado
* Fecha: 
* Descripcion: Componente de Negocio para el modulo de Alumno
* ==================================================================
--->
<cfcomponent>
	<cfset dao = CreateObject('component','DAO_Alumno')>
	
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
</cfcomponent>