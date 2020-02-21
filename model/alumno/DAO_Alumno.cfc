<!---
* ==================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Alumno Posgrado
* Fecha: 
* Descripcion: Objeto de Acceso a Datos para el modulo
* ==================================================================
--->
<cfcomponent>
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
                   TAL_FK_GENERO FK_GENERO
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
    	<cfquery name="qEstudios" datasource="DS_SIIIP">
            SELECT
                TEP_PK_ESTUDIOSPROF PK_ESTUDIOSPROF,
                SOL.TS_FOLIO FOLIO,
                TEP_INSTITUCION INSTITUCION,
                TEP_INCORPORADA INCORPORADA,
                TO_CHAR(TEP_FK_FECHA_INI, 'DD/MM/YYYY') FECHA_INI,
                TO_CHAR(TEP_FK_FECHA_FIN, 'DD/MM/YYYY') FECHA_FIN,
                TEP_FK_PAIS FK_PAIS,
                PAIS.CPA_NOM_PAIS NOM_PAIS,
                TEP_CARRERA CARRERA,
                TEP_TESIS TESIS,
                TO_CHAR(TEP_FK_FECHA_EXAMEN, 'DD/MM/YYYY') FECHA_EXAMEN,
                TEP_TITULO TITULO,
                TEP_CEDULA CEDULA
            FROM
                SIIIP.SP_TESTUDIOS_PROF,
                SIIIP.SP_TSOLICITANTE SOL,
                SIIIP.EDI_CPAIS PAIS
            WHERE
                PAIS.CPA_PK_PAIS = SP_TESTUDIOS_PROF.TEP_FK_PAIS
                AND SP_TESTUDIOS_PROF.TEP_FK_ALUMNO = SOL.TS_PK_SOLICITANTE
                AND TEP_FK_ESTATUS <> 0
		</cfquery>
        <cfreturn qEstudios>
	</cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerEstudiosPostProfesionales" access="public">
    	<cfquery name="qEstudios" datasource="DS_SIIIP">
            SELECT
                TEPP_PK_ESTUDIOSPOSTPROF PK_ESTUDIOSPOSTPROF,
                TEPP_INSTITUCION INSTITUCION,
                SOL.TS_FOLIO FOLIO,
                TEPP_INCORPORADA INCORPORADA,
                TO_CHAR(TEPP_FK_FECHA_INI, 'DD/MM/YYYY') FECHA_INI,
                TO_CHAR(TEPP_FK_FECHA_FIN, 'DD/MM/YYYY') FECHA_FIN,
                TEPP_FK_PAIS FK_PAIS,
                PAIS.CPA_NOM_PAIS NOM_PAIS,
                TEPP_CARRERA CARRERA,
                TEPP_TESIS TESIS,
                TO_CHAR(TEPP_FK_FECHA_EXAMEN, 'DD/MM/YYYY') FECHA_EXAMEN,
                TEPP_GRADO GRADO,
                TEPP_BECA BECA,
                TEPP_INSTITUCION_BECA INSTITUCION_BECA
            FROM
                SIIIP.SP_TESTUDIOS_POST_PROF,
                SIIIP.SP_TSOLICITANTE SOL,
                SIIIP.EDI_CPAIS PAIS
            WHERE
                SP_TESTUDIOS_POST_PROF.TEPP_FK_ALUMNO = SOL.TS_PK_SOLICITANTE
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
    	<cfquery name="qIdiomas" datasource="DS_SIIIP">
            SELECT
                TID.TI_PK_IDIOMA PK_IDIOMA,
                TID.TI_FK_IDIOMA FK_IDIOMA,
                CIDI.CID_NOMBRE_IDIOMA NOM_IDIOMA,
                TID.TI_FK_DOMINIO FK_DOMINIO,
                CDOM.CDI_DESCRIPCION AS NOM_DOMINIO
            FROM
                SIIIP.SP_TIDIOMAS TID,
                SIIIP.SP_CIDIOMAS CIDI,
                SIIIP.SP_CDOMINIO_IDIOMA CDOM 
            WHERE
                TID.TI_FK_ALUMNO = 1
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
    	<cfquery name="qExperiencia" datasource="DS_SIIIP">
            SELECT
                TEP.TEP_PK_EXPERIENCIAPROF PK_EXPERIENCIAPROF,
                TO_CHAR(TEP.TEP_FK_FECHA_INI ,'DD/MM/YYYY') FECHA_INI,
                TO_CHAR(TEP.TEP_FK_FECHA_FIN,'DD/MM/YYYY') FECHA_FIN,
                TEP.TEP_FK_CLASIFICACION PK_CLASIFICACION,
                CCL.CCL_DESCRIPCION NOM_CLASIFICACION,
                TEP.TEP_ACTIVIDADES ACTIVIDADES,
                TEP_INSTITUCION INSTITUCION,
                TEP_PUESTO PUESTO
            FROM
                SIIIP.SP_TEXPERIENCIA_PROF TEP,
                SIIIP.SP_CCLASIFICACION CCL
            WHERE
                TEP_FK_ALUMNO = 1
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
    	<cfquery name="qDocente" datasource="DS_SIIIP">
            SELECT TLD_PK_LABORDOCENTE PK_LABORDOCENTE,
                   TLD_INSTITUCION INSTITUCION,
                   TO_CHAR (TLD.TLD_FK_FECHA_INI, 'DD/MM/YYYY') FECHA_INI,
                   TO_CHAR (TLD.TLD_FK_FECHA_FIN, 'DD/MM/YYYY') FECHA_FIN,
                   TLD_FK_ESCUELA ESCUELA,
                   TLD_ASIGNATURA ASIGNATURA
              FROM SIIIP.SP_TLABOR_DOCENTE TLD
             WHERE TLD_FK_ALUMNO = 1
                   AND TLD.TLD_FK_ESTATUS > 0
        </cfquery>
        <cfreturn qDocente>
    </cffunction>

	<!--- 
	* Fecha:25/03/2014
	* @author:David Monterriosas
	* --->
	<cffunction name="obtenerTrabInvestigacion" access="public">
    	<cfquery name="qTrabajos" datasource="DS_SIIIP">
            SELECT
                TI_PK_TRABAJOI PK_TRABAJOI,
                TI_TRABAJO TRABAJO,
                ETI.CET_DESCRIPCION ESTADO,
                CTI.CTI_DESCRIPCION CLASIFICACION,
                TI_PUBLICADO PUBLICADO,
                TO_CHAR(TI_FECHA_INI , 'DD/MM/YYYY') FECHA_INI,
                TO_CHAR(TI_FECHA_FIN, 'DD/MM/YYYY') FECHA_FIN,
                TI_DURACION DURACION
            FROM
                SIIIP.SP_TTRABAJOS_INV TIN,
                SIIIP.SP_CESTADO_TI ETI,
                SIIIP.SP_CCLASIFICACION_TI CTI
            WHERE
                TIN.TI_FK_ALUMNO = 1
                AND TIN.TI_FK_ESTADO = ETI.CET_PK_ESTADO
                AND TIN.TI_FK_CLASIFICACION = CTI.CTI_PK_CLASIFICACION
                AND TIN.TI_FK_ESTATUS <> 0
        </cfquery>
        <cfreturn qTrabajos>
    </cffunction>
</cfcomponent>