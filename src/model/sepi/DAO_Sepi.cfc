<!---
* ==================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Sepi Posgrado
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
		<cfargument name="dependencia" type="string" required="no" default="0">
		<cfargument name="pkPrograma" type="numeric" required="no" default="0">
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
                   AND TA.TAL_FK_ESTADO_AVANCE >= 2
                   AND TSI.FK_ESTADO(+) > 0
                   AND TSI.FK_ALUMNO(+) = TA.TAL_PK_ALUMNO
                   AND TSI.FK_PROGRAMA_POSGRADO = TPP.PK_PROGRAMA_POSGRADO(+)
                   AND TPP.FK_ESTADO(+) > 0
                   AND TPP.FK_UR = TURIPN.TUR_PK_UR(+)
                   AND TPP.FK_UR = '#dependencia#'
                   <cfif pkPrograma gt 0>
                       AND TSI.FK_PROGRAMA_POSGRADO = #pkPrograma#
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
               SET TAL_FK_ESTADO_AVANCE = 3
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
               SET TAL_FK_ESTATUS = 2
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
               SET TEP_FK_ESTATUS = 2
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
               SET TEPP_FK_ESTATUS = 2
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
               SET TI_FK_ESTATUS = 2
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
               SET FK_ESTATUS_CALIFICACION_INGLES = 2,
                   FK_ESTATUS_ESTADO_ADMISION = 2
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
               SET TAC_FK_ESTATUS = 2
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
               SET TSA_FK_ESTATUS = 2
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
               SET TSA_FK_ESTATUS = 2
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
               SET TEP_FK_ESTATUS = 2
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
               SET TI_FK_ESTATUS = 2
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
               SET TLD_FK_ESTATUS = 2
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
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerCatPeriodos" access="public">
    	<cfquery name="query" datasource="DS_SIIIP">
              SELECT TP_PK_PERIODOS, TP_ANIO, TP_CLASIFICACION
                FROM SIIIP.SP_TPERIODOS
               WHERE TP_FK_ESTATUS > 0
            ORDER BY TP_PK_PERIODOS desc
        </cfquery>
        <cfreturn query>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerCatCoordinador" access="public">
		<cfargument name="claveUr" type="string" required="yes">
    	<cfquery name="query" datasource="DS_SIIIP">
              SELECT PK_PERSONA,
                     NOMBRE,
                     APELLIDO_PATERNO,
                     APELLIDO_MATERNO,
                     CURP
                FROM SIIIP.SP_CPERSONA_PARTICIPANTE
                WHERE FK_UR = '#claveUr#'
            ORDER BY NOMBRE
        </cfquery>
        <cfreturn query>
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
    	<cfquery name="query" datasource="DS_SIIIP">
            INSERT INTO SIIIP.SP_TPROGRAMA_POSGRADO (FK_COORDINADOR,
                                                     DURACION_SEMESTRES,
                                                     FECHA_REGISTRO,
                                                     FK_UR,
                                                     FK_ESTADO,
                                                     NOMBRE_PROGRAMA,
                                                     FK_PERIODO_ESCOLAR,
                                                     FK_TIME_INI,
                                                     FK_USUARIO_REGISTRO)
                 VALUES (#selectCoordinador#,
                         #duracion#,
                         SYSDATE,
                         '#claveUr#',
                         1,
                         '#nombrePrograma#',
                         #selectPeriodo#,
                         1,
                         #pkUsuario#)
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerInfoPrograma" access="public">
    	<cfargument name="pkPrograma" type="numeric" required="yes">
    	<cfquery name="query" datasource="DS_SIIIP">
              SELECT PK_PROGRAMA_POSGRADO,
                     DURACION_SEMESTRES,
                     NOMBRE_PROGRAMA,
                     NOMBRE,
                     APELLIDO_PATERNO,
                     APELLIDO_MATERNO
                FROM SIIIP.SP_TPROGRAMA_POSGRADO,
                     SIIIP.SP_TPERIODOS,
                     SIIIP.SP_CPERSONA_PARTICIPANTE
               WHERE     FK_ESTADO > 0
                     AND PK_PROGRAMA_POSGRADO = #pkPrograma#
                     AND TP_PK_PERIODOS = FK_PERIODO_ESCOLAR
                     AND TP_FK_ESTATUS > 0
                     AND PK_PERSONA = FK_COORDINADOR
            ORDER BY PK_PROGRAMA_POSGRADO
        </cfquery>
        <cfreturn query>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerAsignaturasPrograma" access="public">
    	<cfargument name="pkPrograma" type="numeric" required="yes">
    	<cfquery name="query" datasource="DS_SIIIP">
             SELECT TA.PK_ASIGNATURA,
               TA.NOMBRE,
               CTA.DESCRIPCION,
               TA.HORAS_TEORIA,
               TA.HORAS_PRACTICA,
               TA.HORAS_TP,
               TA.UNIDADES_DE_CREDITO,
               TA.FK_ESTADO
          FROM SIIIP.SP_TASIGNATURA TA,
               SIIIP.SP_TPROGRAMA_ASIGNATURAS TPAS,
               SIIIP.SP_CTIPO_ASIGNATURA CTA
         WHERE     TPAS.FK_PROGRAMA_POSGRADO = #pkPrograma#
               AND TA.FK_PROGRAMA_POSGRADO = TPAS.FK_PROGRAMA_POSGRADO
               AND TPAS.FK_ASIGNATURA = TA.PK_ASIGNATURA
               AND CTA.PK_TIPO_ASIGNATURA = TA.FK_TIPO_ASIGNATURA
               AND TPAS.FK_ESTADO > 0
               AND TA.FK_ESTADO > 0
               AND CTA.FK_ESTADO > 0
        </cfquery>
        <cfreturn query>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerAsignaturaInfo" access="public">
    	<cfargument name="pkAsignatura" type="numeric" required="yes">
    	<cfquery name="query" datasource="DS_SIIIP">
            SELECT TA.PK_ASIGNATURA,
                   TA.NOMBRE,
                   CTA.PK_TIPO_ASIGNATURA,
                   TA.HORAS_TEORIA,
                   TA.HORAS_PRACTICA,
                   TA.HORAS_TP,
                   TA.UNIDADES_DE_CREDITO,
                   TA.NO_SESION_ACUERDO_COLEGIO,
                   TA.OBJETIVO_GENERAL,
                   TA.BIBLIOGRAFIA,
                   TA.PROCEDIMIENTOS_INSTRUMENTOS,
                   TA.FK_ESTADO,
                   CPP.PK_PERSONA
              FROM SIIIP.SP_TASIGNATURA TA,
                   SIIIP.SP_CTIPO_ASIGNATURA CTA,
                   SIIIP.SP_TCOORDINADOR_ASIGNATURA TCA,
                   SIIIP.SP_CPERSONA_PARTICIPANTE CPP
             WHERE TA.PK_ASIGNATURA = #pkAsignatura#
                   AND CTA.PK_TIPO_ASIGNATURA = TA.FK_TIPO_ASIGNATURA
                   AND TCA.FK_ASIGNATURA = CTA.PK_TIPO_ASIGNATURA
                   AND TCA.FK_COORDINADOR = CPP.PK_PERSONA
                   AND TA.FK_ESTADO > 0
                   AND CTA.FK_ESTADO > 0
                   AND TCA.FK_ESTADO > 0
        </cfquery>
        <cfreturn query>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="cambiarEstadoAsignatura" access="public">
		<cfargument name="pkAsignatura" type="numeric" required="yes">
		<cfargument name="estado" type="numeric" required="yes">
		<cfargument name="estadoAccion" type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TASIGNATURA
               SET FK_ESTADO = #estadoAccion#
             WHERE PK_ASIGNATURA = #pkAsignatura# AND FK_ESTADO = #estado#
        </cfquery>
        <!---COMMIT;
             
            UPDATE SIIIP.SP_TPROGRAMA_ASIGNATURAS 
               SET FK_ESTADO = #estadoAccion#
             WHERE FK_ASIGNATURA = #pkAsignatura# AND FK_ESTADO = #estado#--->
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerCatTipoAsignatura" access="public">
    	<cfquery name="query" datasource="DS_SIIIP">
            SELECT PK_TIPO_ASIGNATURA, DESCRIPCION
              FROM SIIIP.SP_CTIPO_ASIGNATURA
             WHERE FK_ESTADO > 0
          ORDER BY DESCRIPCION
        </cfquery>
        <cfreturn query>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerParticipantes" access="public">
		<cfargument name="claveUr" type="string" required="yes">
		<cfargument name="pkAsignatura" type="numeric" required="yes">
    	<cfquery name="query" datasource="DS_SIIIP">
            SELECT TPA.PK_PARTICIPANTE_ASIGNATURA,CPP.NOMBRE, CPP.APELLIDO_PATERNO, CPP.APELLIDO_MATERNO
              FROM SIIIP.SP_CPERSONA_PARTICIPANTE CPP,
                   SIIIP.SP_TPARTICIPANTE_ASIGNATURA TPA
             WHERE     CPP.FK_UR = '#claveUr#'
                   AND TPA.FK_ASIGNATURA = #pkAsignatura#
                   AND TPA.FK_PERSONA_PARTICIPANTE = CPP.PK_PERSONA
                   AND TPA.FK_ESTADO > 0
        </cfquery>
        <cfreturn query>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="insertInformacion" access="public">
        <cfargument name="pkUsuario"						type="numeric" required="yes">
        <cfargument name="pkPrograma"						type="numeric" required="yes">
        <cfargument name="nombreDeAsignatura"				type="string"  required="yes">
        <cfargument name="tipoAsignatura"					type="numeric" required="yes">
        <cfargument name="numeroDeHorasTeoria"				type="numeric" required="yes">
        <cfargument name="numeroDeHorasPracticas"			type="numeric" required="yes">
        <cfargument name="numeroDeHorasTericoPracticas"		type="numeric" required="yes">
        <cfargument name="unidadesDeCredito"				type="numeric" required="yes">
		<cfargument name="numeroSessionAcuerdo"				type="numeric" required="yes">
		<cfargument name="objetivoGeneral"					type="string"  required="yes">
		<cfargument name="bibliografiaUtilizada"			type="string"  required="yes">
		<cfargument name="procedimientoEvaluacion"			type="string"  required="yes">
		<cfstoredproc procedure="SIIIP.P_SP_SEPI.GUARDA_ASIGNATURA" datasource="DS_SIIIP">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkUsuario#"						type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkPrograma#"					type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#nombreDeAsignatura#"			type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#tipoAsignatura#"				type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#numeroDeHorasTeoria#"			type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#numeroDeHorasPracticas#"		type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#numeroDeHorasTericoPracticas#"	type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#unidadesDeCredito#"				type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#numeroSessionAcuerdo#"			type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#objetivoGeneral#"				type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#bibliografiaUtilizada#"			type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#procedimientoEvaluacion#"		type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	variable="resultado"					type="out">
		</cfstoredproc>
		<cfreturn resultado>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="actualizarInformacion" access="public">
        <cfargument name="pkUsuario"						type="numeric" required="yes">
        <cfargument name="pkPrograma"						type="numeric" required="yes">
        <cfargument name="pkAsignatura"						type="numeric" required="yes">
        <cfargument name="nombreDeAsignatura"				type="string"  required="yes">
        <cfargument name="tipoAsignatura"					type="numeric" required="yes">
        <cfargument name="numeroDeHorasTeoria"				type="numeric" required="yes">
        <cfargument name="numeroDeHorasPracticas"			type="numeric" required="yes">
        <cfargument name="numeroDeHorasTericoPracticas"		type="numeric" required="yes">
        <cfargument name="unidadesDeCredito"				type="numeric" required="yes">
		<cfargument name="numeroSessionAcuerdo"				type="numeric" required="yes">
		<cfargument name="objetivoGeneral"					type="string"  required="yes">
		<cfargument name="bibliografiaUtilizada"			type="string"  required="yes">
		<cfargument name="procedimientoEvaluacion"			type="string"  required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TASIGNATURA
               SET   NOMBRE = '#nombreDeAsignatura#',
                     FK_TIPO_ASIGNATURA = #tipoAsignatura#,
                     HORAS_TEORIA = #numeroDeHorasTeoria#,
                     HORAS_PRACTICA = #numeroDeHorasPracticas#,
                     HORAS_TP = #numeroDeHorasTericoPracticas#,
                     UNIDADES_DE_CREDITO = #unidadesDeCredito#,
                     NO_SESION_ACUERDO_COLEGIO = #numeroSessionAcuerdo#,
                     OBJETIVO_GENERAL = '#objetivoGeneral#',
                     BIBLIOGRAFIA = '#bibliografiaUtilizada#',
                     PROCEDIMIENTOS_INSTRUMENTOS = '#procedimientoEvaluacion#'
             WHERE PK_ASIGNATURA = #pkAsignatura#
                     AND FK_PROGRAMA_POSGRADO = #pkPrograma#
                     AND FK_USUARIO_REGISTRO = #pkUsuario#
                     AND FK_ESTADO > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="actualizaParticipantesAnt" access="public">
        <cfargument name="pkUsuario"		type="numeric" required="yes">
        <cfargument name="pkAsignatura"		type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TPARTICIPANTE_ASIGNATURA TPA
               SET TPA.FK_ESTADO = 0
             WHERE TPA.FK_USUARIO_REGISTRO = #pkUsuario#
                   AND TPA.FK_ASIGNATURA = #pkAsignatura#
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="actualizaParticipantes" access="public">
        <cfargument name="pkUsuario"		type="numeric" required="yes">
        <cfargument name="pkAsignatura"		type="numeric" required="yes">
        <cfargument name="pkParticipante"	type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            INSERT INTO SIIIP.SP_TPARTICIPANTE_ASIGNATURA TPA
                                                    (TPA.FK_USUARIO_REGISTRO,
                                                     TPA.FK_ASIGNATURA,
                                                     TPA.FK_PERSONA_PARTICIPANTE,
                                                     TPA.FK_ESTADO,
                                                     FECHA_INI)
                 VALUES (#pkUsuario#, #pkAsignatura#, #pkParticipante#, 1, 1)
        </cfquery>
        <cfreturn 1>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="insertCoordinador" access="public">
        <cfargument name="pkUsuario"		type="numeric" required="yes">
        <cfargument name="pkAsignatura"		type="numeric" required="yes">
        <cfargument name="pkCoordinador"	type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            INSERT INTO SIIIP.SP_TCOORDINADOR_ASIGNATURA
                                                    (FK_USUARIO_REGISTRO,
                                                     FK_ASIGNATURA,
                                                     FK_COORDINADOR,
                                                     FK_ESTADO,
                                                     FK_FECHA_INI)
                 VALUES (#pkUsuario#, #pkAsignatura#, #pkCoordinador#, 1,1)
        </cfquery>
        <cfreturn 1>
	</cffunction>
    
	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="actualizarCoordinador" access="public">
        <cfargument name="pkAsignatura"		type="numeric" required="yes">
        <cfargument name="pkCoordinador"	type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            UPDATE SIIIP.SP_TCOORDINADOR_ASIGNATURA
               SET FK_COORDINADOR = #pkCoordinador#
             WHERE FK_ASIGNATURA = #pkAsignatura#
                   AND FK_ESTADO > 0
        </cfquery>
        <cfreturn 1>
    </cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="inserProgAsignatura" access="public">
        <cfargument name="pkUsuario"		type="numeric" required="yes">
        <cfargument name="pkPrograma"		type="numeric" required="yes">
        <cfargument name="pkAsignatura"	type="numeric" required="yes">
    	<cfquery name="qAdmision" datasource="DS_SIIIP">
            INSERT INTO SIIIP.SP_TPROGRAMA_ASIGNATURAS
                                                    ( FK_PROGRAMA_POSGRADO,
                                                      FK_ASIGNATURA,
                                                      FK_ESTADO,
                                                      FECHA_REGISTRO,
                                                      FK_FECHA_INI,
                                                      FK_USUARIO_REGISTRO)
                 VALUES (#pkPrograma#, #pkAsignatura#, 1, SYSDATE, 1,#pkUsuario#)
        </cfquery>
        <cfreturn 1>
	</cffunction>
</cfcomponent>