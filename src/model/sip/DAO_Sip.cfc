<!---
* ==================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Sip Posgrado
* Fecha: 
* Descripcion: Objeto de Acceso a Datos para el modulo
* ==================================================================
--->
<cfcomponent>
	
	<!--- 
	* Fecha: 
	* @author:  
	* --->
	<cffunction name="obtenerAlumnos" access="public">
		<cfargument name="clasificacion" type="string" required="yes">
		<cfargument name="dependencia" type="string" required="yes">
		<cfargument name="selectPrograma" type="numeric" required="yes">
    	<cfquery name="qAlumnos" datasource="DS_SIIIP">
            SELECT TAL_PK_ALUMNO PK_ALUMNO,
                   TAL_FOLIO FOLIO,
                   TAL_FK_ESTADO_AVANCE FK_ESTADO_AVANCE,
                   TAL_FK_PERIODO FK_PERIODO,
                   TAL_MOTIVOS MOTIVOS,
                   TAL_APELLIDO_PATERNO APELLIDO_PATERNO,
                   TAL_APELLIDO_MATERNO APELLIDO_MATERNO,
                   TAL_NOMBRE NOMBRE,
                   TAL_FECHA_NACIMIENTO FECHA_NACIMIENTO,
                   TAL_LUGAR_NACIMIENTO LUGAR_NACIMIENTO,
                   TAL_RFC RFC,
                   TAL_CURP CURP,
                   TAL_CALLE CALLE,
                   TAL_NUMEROEXT NUMEROEXT,
                   TAL_NUMEROINT NUMEROINT,
                   TAL_COLONIA COLONIA,
                   TAL_ESTADO ESTADO,
                   TAL_MUNICIPIO MUNICIPIO,
                   TAL_CP CP,
                   TAL_TELEFONO TELEFONO,
                   TAL_MAIL MAIL,
                   TAL_EMPRESA EMPRESA,
                   TAL_CALLE_EMP CALLE_EMMP,
                   TAL_NUMERO_EMP NUMERO_EMP,
                   TAL_COLONIA_EMP COLONIA_EMP,
                   TAL_ESTADO_EMP ESTADO_EMP,
                   TAL_MUNICIPIO_EMP MUNICIPIO_EMP,
                   TAL_CP_EMP CP_EMP,
                   TAL_TELEFONO_EMP TELEFONO_EMP,
                   TAL_CARGO CARGO,
                   TAL_FK_NACIONALIDAD FK_NACIONALIDAD,
                   TAL_FK_EDOCIVIL FK_EDOCIVIL,
                   TAL_FK_PAIS FK_PAIS,
                   TAL_FK_GENERO FK_GENERO,
                   TAL_FK_ESTATUS FK_ESTATUS
              FROM SIIIP.SP_TALUMNOS TA,
                   SIIIP.SP_TSOLICITUD_INSCRIPCION TSI,
                   UR.TURIPN TURIPN,
                   SIIIP.SP_TPROGRAMA_POSGRADO TPP
             WHERE     TA.TAL_FK_ESTATUS > 0
                   AND TA.TAL_FK_ESTADO_AVANCE >= 3
                   AND TSI.FK_ESTADO(+) > 0
                   AND TSI.FK_ALUMNO(+) = TA.TAL_PK_ALUMNO
                   AND TSI.FK_PROGRAMA_POSGRADO = TPP.PK_PROGRAMA_POSGRADO(+)
                   AND TPP.FK_ESTADO(+) > 0
                   AND TPP.FK_UR = TURIPN.TUR_PK_UR(+)
                   <cfif clasificacion neq '0'>
                       AND TURIPN.CLASE = '#clasificacion#'
                   </cfif>
                   <cfif dependencia neq '0'>
                       AND TPP.FK_UR = '#dependencia#'
                   </cfif>
                   <cfif selectPrograma gt 0>
                       AND TSI.FK_PROGRAMA_POSGRADO = #selectPrograma#
                   </cfif>
        </cfquery>
        <cfreturn qAlumnos>
	</cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerInformacionAlumno" access="public">
    	<cfargument name="pkAlumno" required="yes" type="numeric">
    	<cfquery name="qAlumno" datasource="DS_SIIIP">
            SELECT TAL_PK_ALUMNO PK_ALUMNO,
                   TAL_FOLIO FOLIO,
                   TAL_FK_ESTADO_AVANCE FK_ESTADO_AVANCE,
                   TAL_FK_PERIODO FK_PERIODO,
                   TAL_MOTIVOS MOTIVOS,
                   TAL_APELLIDO_PATERNO APELLIDO_PATERNO,
                   TAL_APELLIDO_MATERNO APELLIDO_MATERNO,
                   TAL_NOMBRE NOMBRE,
                   TAL_FECHA_NACIMIENTO FECHA_NACIMIENTO,
                   TAL_LUGAR_NACIMIENTO LUGAR_NACIMIENTO,
                   TAL_RFC RFC,
                   TAL_CURP CURP,
                   TAL_CALLE CALLE,
                   TAL_NUMEROEXT NUMEROEXT,
                   TAL_NUMEROINT NUMEROINT,
                   TAL_COLONIA COLONIA,
                   TAL_ESTADO ESTADO,
                   TAL_MUNICIPIO MUNICIPIO,
                   TAL_CP CP,
                   TAL_TELEFONO TELEFONO,
                   TAL_MAIL MAIL,
                   TAL_EMPRESA EMPRESA,
                   TAL_CALLE_EMP CALLE_EMMP,
                   TAL_NUMERO_EMP NUMERO_EMP,
                   TAL_COLONIA_EMP COLONIA_EMP,
                   TAL_ESTADO_EMP ESTADO_EMP,
                   TAL_MUNICIPIO_EMP MUNICIPIO_EMP,
                   TAL_CP_EMP CP_EMP,
                   TAL_TELEFONO_EMP TELEFONO_EMP,
                   TAL_CARGO CARGO,
                   TAL_FK_NACIONALIDAD FK_NACIONALIDAD,
                   TAL_FK_EDOCIVIL FK_EDOCIVIL,
                   TAL_FK_PAIS FK_PAIS,
                   TAL_FK_GENERO FK_GENERO,
                   TAL_FK_ESTATUS FK_ESTATUS
              FROM SIIIP.SP_TALUMNOS
             WHERE TAL_PK_ALUMNO = #pkAlumno#
                   AND TAL_FK_ESTATUS > 0
        </cfquery>
    	<cfreturn qAlumno>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerEstudiosProfesionales" access="public">
    	<cfargument name="pkAlumno" required="yes" type="numeric">
    	<cfquery name="qEstudios" datasource="DS_SIIIP">
            SELECT TEP_PK_ESTUDIOSPROF PK_ESTUDIOSPROF,
                   TEP_INSTITUCION INSTITUCION,
                   TEP_INCORPORADA INCORPORADA,
                   TO_CHAR (TEP_FECHA_INI, 'DD/MM/YYYY') FECHA_INI,
                   TO_CHAR (TEP_FECHA_FIN, 'DD/MM/YYYY') FECHA_FIN,
                   TEP_FK_PAIS FK_PAIS,
                   PAIS.CPA_NOM_PAIS NOM_PAIS,
                   TEP_CARRERA CARRERA,
                   TEP_TESIS TESIS,
                   TO_CHAR (TEP_FK_FECHA_EXAMEN, 'DD/MM/YYYY') FECHA_EXAMEN,
                   TEP_TITULO TITULO,
                   TEP_CEDULA CEDULA,
                   TEP_FK_ESTATUS FK_ESTATUS
              FROM SIIIP.SP_TESTUDIOS_PROF, SIIIP.EDI_CPAIS PAIS
             WHERE     PAIS.CPA_PK_PAIS = SP_TESTUDIOS_PROF.TEP_FK_PAIS
                   AND SP_TESTUDIOS_PROF.TEP_FK_ALUMNO = #pkAlumno#
                   AND TEP_FK_ESTATUS <> 0
		</cfquery>
        <cfreturn qEstudios>
	</cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerEstudiosPostProfesionales" access="public">
    	<cfargument name="pkAlumno" required="yes" type="numeric">
    	<cfquery name="qEstudios" datasource="DS_SIIIP">
            SELECT TEPP_PK_ESTUDIOSPOSTPROF PK_ESTUDIOSPOSTPROF,
                   TEPP_INSTITUCION INSTITUCION,
                   TEPP_INCORPORADA INCORPORADA,
                   TO_CHAR (TEPP_FECHA_INI, 'DD/MM/YYYY') FECHA_INI,
                   TO_CHAR (TEPP_FECHA_FIN, 'DD/MM/YYYY') FECHA_FIN,
                   TEPP_FK_PAIS FK_PAIS,
                   PAIS.CPA_NOM_PAIS NOM_PAIS,
                   TEPP_CARRERA CARRERA,
                   TEPP_TESIS TESIS,
                   TO_CHAR (TEPP_FK_FECHA_EXAMEN, 'DD/MM/YYYY') FECHA_EXAMEN,
                   TEPP_GRADO GRADO,
                   TEPP_BECA BECA,
                   TEPP_INSTITUCION_BECA INSTITUCION_BECA,
                   TEPP_FK_ESTATUS FK_ESTATUS
              FROM SIIIP.SP_TESTUDIOS_POST_PROF, SIIIP.EDI_CPAIS PAIS
             WHERE     SP_TESTUDIOS_POST_PROF.TEPP_FK_ALUMNO = #pkAlumno#
                   AND PAIS.CPA_PK_PAIS = SP_TESTUDIOS_POST_PROF.TEPP_FK_PAIS
                   AND TEPP_FK_ESTATUS <> 0
		</cfquery>
        <cfreturn qEstudios>
	</cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerIdiomas" access="public">
    	<cfargument name="pkAlumno" required="yes" type="numeric">
    	<cfquery name="qIdiomas" datasource="DS_SIIIP">
            SELECT
                TID.TI_PK_IDIOMA PK_IDIOMA,
                TID.TI_FK_IDIOMA FK_IDIOMA,
                CIDI.CID_NOMBRE_IDIOMA NOM_IDIOMA,
                TID.TI_FK_DOMINIO FK_DOMINIO,
                CDOM.CDI_DESCRIPCION AS NOM_DOMINIO,
                TI_FK_ESTATUS FK_ESTATUS
            FROM
                SIIIP.SP_TIDIOMAS TID,
                SIIIP.SP_CIDIOMAS CIDI,
                SIIIP.SP_CDOMINIO_IDIOMA CDOM 
            WHERE
                TID.TI_FK_ALUMNO = #pkAlumno#
                AND TID.TI_FK_IDIOMA = CIDI.CID_PK_IDIOMA
                AND TID.TI_FK_DOMINIO = CDOM.CDI_PK_DOMINIO
                AND TID.TI_FK_ESTATUS <> 0
        </cfquery>
        <cfreturn qIdiomas>
    </cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerExperiencia" access="public">
    	<cfargument name="pkAlumno" required="yes" type="numeric">
    	<cfquery name="qExperiencia" datasource="DS_SIIIP">
            SELECT
                TEP.TEP_PK_EXPERIENCIAPROF PK_EXPERIENCIAPROF,
                TO_CHAR(TEP.TEP_FK_FECHA_INI ,'DD/MM/YYYY') FECHA_INI,
                TO_CHAR(TEP.TEP_FK_FECHA_FIN,'DD/MM/YYYY') FECHA_FIN,
                TEP.TEP_FK_CLASIFICACION PK_CLASIFICACION,
                CCL.CCL_DESCRIPCION NOM_CLASIFICACION,
                TEP.TEP_ACTIVIDADES ACTIVIDADES,
                TEP_INSTITUCION INSTITUCION,
                TEP_PUESTO PUESTO,
                TEP_FK_ESTATUS FK_ESTATUS
            FROM
                SIIIP.SP_TEXPERIENCIA_PROF TEP,
                SIIIP.SP_CCLASIFICACION CCL
            WHERE
                TEP_FK_ALUMNO = #pkAlumno#
                AND CCL.CCL_PK_CLASIFICACION = TEP.TEP_FK_CLASIFICACION
                AND TEP.TEP_FK_ESTATUS <> 0
        </cfquery>
        <cfreturn qExperiencia>
    </cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerLaborDocente" access="public">
    	<cfargument name="pkAlumno" required="yes" type="numeric">
    	<cfquery name="qDocente" datasource="DS_SIIIP">
            SELECT TLD_PK_LABORDOCENTE PK_LABORDOCENTE,
                   TLD_INSTITUCION INSTITUCION,
                   TO_CHAR (TLD.TLD_FK_FECHA_INI, 'DD/MM/YYYY') FECHA_INI,
                   TO_CHAR (TLD.TLD_FK_FECHA_FIN, 'DD/MM/YYYY') FECHA_FIN,
                   TLD_FK_ESCUELA ESCUELA,
                   TLD_ASIGNATURA ASIGNATURA,
                   TLD_FK_ESTATUS FK_ESTATUS
              FROM SIIIP.SP_TLABOR_DOCENTE TLD
             WHERE TLD_FK_ALUMNO = #pkAlumno#
                   AND TLD.TLD_FK_ESTATUS > 0
        </cfquery>
        <cfreturn qDocente>
    </cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerTrabInvestigacion" access="public">
    	<cfargument name="pkAlumno" required="yes" type="numeric">
    	<cfquery name="qTrabajos" datasource="DS_SIIIP">
            SELECT
                TI_PK_TRABAJOI PK_TRABAJOI,
                TI_TRABAJO TRABAJO,
                ETI.CET_DESCRIPCION ESTADO,
                CTI.CTI_DESCRIPCION CLASIFICACION,
                TI_PUBLICADO PUBLICADO,
                TO_CHAR(TI_FECHA_INI , 'DD/MM/YYYY') FECHA_INI,
                TO_CHAR(TI_FECHA_FIN, 'DD/MM/YYYY') FECHA_FIN,
                TI_DURACION DURACION,
                TI_FK_ESTATUS FK_ESTATUS
            FROM
                SIIIP.SP_TTRABAJOS_INV TIN,
                SIIIP.SP_CESTADO_TI ETI,
                SIIIP.SP_CCLASIFICACION_TI CTI
            WHERE
                TIN.TI_FK_ALUMNO = #pkAlumno#
                AND TIN.TI_FK_ESTADO = ETI.CET_PK_ESTADO
                AND TIN.TI_FK_CLASIFICACION = CTI.CTI_PK_CLASIFICACION
                AND TIN.TI_FK_ESTATUS <> 0
        </cfquery>
        <cfreturn qTrabajos>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerCatAdmision" access="public">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
              SELECT CTEA_PK_ESTADO_ADMISION PK_ESTADO_ADMISION,
                     CTEA_ESTADO_ADMISION ESTADO_ADMISION
                FROM SIIIP.SP_CTIPO_ESTADO_ADMISION
               WHERE CTEA_FK_ESTATUS > 0
            ORDER BY CTEA_PK_ESTADO_ADMISION,
                     CTEA_ESTADO_ADMISION
        </cfquery>
        <cfreturn qAdmision>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionGlobal" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TALUMNOS
               SET TAL_FK_ESTADO_AVANCE = 4
             WHERE TAL_PK_ALUMNO = #pkAlumno#
                   AND TAL_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionInformacionPersonal" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TALUMNOS
               SET TAL_FK_ESTATUS = 3
             WHERE TAL_PK_ALUMNO = #pkAlumno#
                   AND TAL_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionEstudiosProf" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TESTUDIOS_PROF
               SET TEP_FK_ESTATUS = 3
             WHERE TEP_FK_ALUMNO = #pkAlumno#
                   AND TEP_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionEstudiosPostProf" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TESTUDIOS_POST_PROF
               SET TEPP_FK_ESTATUS = 3
             WHERE TEPP_FK_ALUMNO = #pkAlumno#
                   AND TEPP_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionIdiomas" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TIDIOMAS
               SET TI_FK_ESTATUS = 3
             WHERE TI_FK_ALUMNO = #pkAlumno#
                   AND TI_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionResultadosEvaluacion" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TSOLICITUD_INSCRIPCION
               SET FK_ESTATUS_CALIFICACION_INGLES = 3,
                   FK_ESTATUS_ESTADO_ADMISION = 3
             WHERE FK_ALUMNO = #pkAlumno#
                   AND FK_ESTADO > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionConsejero" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TALUMNO_CONSEJERO
               SET TAC_FK_ESTATUS = 3
             WHERE TAC_FK_ALUMNO = #pkAlumno#
                   AND TAC_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionDocumentos" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TSOLICITUD_ARCHIVOS
               SET TSA_FK_ESTATUS = 3 
             WHERE TSA_FK_ALUMNO = #pkAlumno#
                   AND TSA_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionDocumentoIndividual" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="pkArchivo" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TSOLICITUD_ARCHIVOS
               SET TSA_FK_ESTATUS = 3
             WHERE TSA_FK_ALUMNO = #pkAlumno#
                   AND TSA_FK_ARCHIVO = #pkArchivo#
                   AND TSA_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionExperienciaProf" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="pkArchivo" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TEXPERIENCIA_PROF
               SET TEP_FK_ESTATUS = 3
             WHERE TEP_FK_ALUMNO = #pkAlumno#
                   AND TEP_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionTrabajosInv" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="pkArchivo" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TTRABAJOS_INV
               SET TI_FK_ESTATUS = 3
             WHERE TI_FK_ALUMNO = #pkAlumno#
                   AND TI_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="validacionLaborDocente" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="pkArchivo" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TLABOR_DOCENTE
               SET TLD_FK_ESTATUS = 3
             WHERE TLD_FK_ALUMNO = #pkAlumno#
                   AND TLD_FK_ESTATUS > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerProgramasEscuela" access="public">
		<cfargument name="claveUr" type="string" required="yes">
    	<cfquery name="query" datasource="DS_SIIIP">
              SELECT PK_PROGRAMA_POSGRADO,
                     NOMBRE_PROGRAMA,
                     CONCAT (TP_ANIO, CONCAT (' ', TP_CLASIFICACION)) AS PERIODO_ESCOLAR,
                     FK_ESTADO
                FROM SIIIP.SP_TPROGRAMA_POSGRADO, SIIIP.SP_TPERIODOS
               WHERE     FK_UR = '#claveUr#'
                     AND FK_ESTADO > 0
                     AND TP_PK_PERIODOS = FK_PERIODO_ESCOLAR
                     AND TP_FK_ESTATUS > 0
            ORDER BY PK_PROGRAMA_POSGRADO
        </cfquery>
        <cfreturn query>
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
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TPROGRAMA_POSGRADO
               SET FK_ESTADO = #estadoAccion#
             WHERE PK_PROGRAMA_POSGRADO = #pkPrograma# AND FK_UR = '#claveUr#' AND FK_ESTADO = #estado#
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<cffunction name="cargaNivelesByFecha" access="public" returntype="query" hint="Obtiene la clasificacion de las dependencias por corte de tiempo">
 		<cfargument name="pkTime" required="yes" type="numeric" hint="Pk para hacer le corte de tiempo">
        <cfquery name="qObtenNiveles" datasource="DS_UR">
              SELECT   T1.CLA_PK_CLASIFICACION AS CLASE,
                       T1.CLA_CLASIFICACION AS DESCRIPCION
                FROM   UR.CUR_CLASIFICACION T1,
                       UR.TUR_TURCLASIFICACION CLAS,
                       UR.TURIPN TURIPN
               WHERE       CLAS.TUC_FK_UR = TURIPN.TUR_PK_UR
                       AND CLAS.TUC_FK_CLASIFICACION = T1.CLA_PK_CLASIFICACION
               		   AND CLAS.TUC_FK_TIMEINICIOVIGENCIA <= #pkTime#
                       AND (CLAS.TUC_FK_TIMEFINVIGENCIA > #pkTime#
                            OR CLAS.TUC_FK_TIMEFINVIGENCIA IS NULL)
                       AND TURIPN.FK_DWINICIOVIGENCIA <= #pkTime#
                       AND (TURIPN.FK_DWFINVIGENCIA > #pkTime#
                            OR TURIPN.FK_DWFINVIGENCIA IS NULL)
            GROUP BY   T1.CLA_PK_CLASIFICACION, T1.CLA_CLASIFICACION
            ORDER BY   T1.CLA_CLASIFICACION
        </cfquery>
        <cfreturn qObtenNiveles>
	</cffunction>
    
	<cffunction name="cargaDependenciasByClase" access="public" returntype="query" 
    	hint="Obtiene las dependencias por clase pero especificas para los procesos de Capital Humano">
		<cfargument name="pkTime" required="yes" type="numeric" hint="Pk para hacer le corte de tiempo">
		<cfargument name="clase" required="yes" type="string" hint="Clasificacion de las dependencias">
		<cfquery name="qObtenDependencias" datasource="DS_UR">
              SELECT   TURIPN.TUR_PK_UR AS PK_UR,
                       TURIPN.TUR_NOMBRE AS NOMBRE_DEPENDENCIA,
                       TURIPN.TUR_SIGLA AS SIGLA,
                       TURIPN.SUBCLASE AS SUBCLASE
                FROM   UR.TURIPN TURIPN, UR.TUR_TURCLASIFICACION CLAS
               WHERE   CLAS.TUC_FK_UR = TURIPN.TUR_PK_UR
               		   AND CLAS.TUC_FK_CLASIFICACION = '#clase#'
                       AND TURIPN.FK_DWINICIOVIGENCIA <= #pkTime# 
                       AND (TURIPN.FK_DWFINVIGENCIA > #pkTime# 
                            OR TURIPN.FK_DWFINVIGENCIA IS NULL)
                       AND CLAS.TUC_FK_TIMEINICIOVIGENCIA <= #pkTime#
                       AND (CLAS.TUC_FK_TIMEFINVIGENCIA > #pkTime#
                            OR CLAS.TUC_FK_TIMEFINVIGENCIA IS NULL)
                       AND TURIPN.TUR_PK_UR NOT IN
                                ('JPF000','J10000', 'J20000', 'J30000', 'J40000',
                                 'T41000', 'T81000', 'T4M000', 'T5D000','T5M000',
                                 'T5X000','T6M000', 'T8M000', 'T80300')
            ORDER BY   TURIPN.TUR_NOMBRE
        </cfquery>
		<cfreturn qObtenDependencias>
	</cffunction>
	
	<cffunction name="getDWTimeUR" access="public" hint="Obtiene el DW_PK_TIME de una fecha para el corte de tiempo de las dependencias">
    	<cfargument name="fecha" required="yes" type="date" hint="Fecha para obtener el PKTIME en los cortes de tiempo">
        <cfstoredproc procedure="UR.UNIDADESRESPONSABLES.cargaIDTime" datasource="DS_UR">
        	<cfprocparam cfsqltype="cf_sql_date"	value="#fecha#"		type="in">
			<cfprocparam cfsqltype="cf_sql_numeric" variable="pkTime" 	type="out">
        </cfstoredproc>
        <cfreturn pkTime>
    </cffunction>
</cfcomponent>