<!---
* ==================================================================
* IPN - CICATA QRO
* Sistema: SCEP
* Modulo: Alumno Posgrado
* Fecha:
* Descripcion: Objeto de Acceso a Datos para el modulo
* ==================================================================
--->
<cfcomponent>
	<cffunction name="getEstadoCivil" access="public" hint="Obtiene el catalogo del estado civil , completo o por identificador">
		<cfargument name="pkEstadoCivil" required="no" default="0" type="numeric" hint="Identificador del estado civil a consultar">
      <cfquery name="estadoCivil" datasource="DS_SIIIP">
					SELECT EC.CEC_PK_ESTADO_CIVIL AS PK_ESTADO_CIVIL,
									EC.CEC_ESATADO_CIVIL AS DESCRIPCION
					FROM SYSTEM.POS_CESTADO_CIVL EC
					WHERE EC.CEC_FK_ESTATUS = 2
					<cfif pkEstadoCivil GT 0>
						EC.CEC_PK_ESTADO_CIVIL = #pkEstadoCivil#
					</cfif>
				</cfquery>
		<!--- <cfstoredproc procedure="SIIIP.P_POS_CATALOGO.GETESTADO_CIVIL" datasource="DS_SIIIP" debug="yes">
		<cfprocparam cfsqltype="cf_sql_numeric" value="#pkEstadoCivil#"      type="in">
		<cfprocresult name="estadoCivil"> 
	</cfstoredproc>--->
	<cfreturn estadoCivil>
	</cffunction>


	<!---
  * Fecha:Octubre 20, 2015
  * @author:Jessica Gomez T.
  * --->
	<cffunction name="getPaises" access="public" hint="Obtiene el catalogo de paises, completo o por identificador">
    	<cfargument name="pkPais" required="no" default="0" type="numeric" hint="Identificador del pais a consultar">
    <cfstoredproc procedure="SIIIP.P_POS_CATALOGO.GETPAIS" datasource="DS_SIIIP" debug="yes">
      <cfprocparam cfsqltype="cf_sql_numeric" value="#pkPais#"      type="in">
      <cfprocresult name="paises">
    </cfstoredproc>
    <cfreturn paises>
	</cffunction>

  <!---
  * Fecha:Octubre 20, 2015
  * @author:Jessica Gomez T.
  * --->
  <cffunction name="getEstado" access="public" hint="Obtiene el catalogo de estados, completo o por identificador">
      <cfargument name="pkAEstado" required="no" default="0" type="numeric" hint="Identificador del estado a consultar">
    <cfstoredproc procedure="SIIIP.P_POS_CATALOGO.GETESTADO" datasource="DS_SIIIP" debug="yes">
      <cfprocparam cfsqltype="cf_sql_numeric" value="#pkAEstado#"      type="in">
      <cfprocresult name="estados">
    </cfstoredproc>
    <cfreturn estados>
  </cffunction>

   <!---
  * Fecha:Octubre 20, 2015
  * @author:Jessica Gomez T.
  * --->
  <cffunction name="getInfoCP" access="public" hint="Obtiene la informacion de la delegacion, estado y pais por codigo postal">
      <cfargument name="pkCP" required="no" default="0" type="numeric" hint="Identificador del estado a consultar">
    <cfstoredproc procedure="SIIIP.P_POS_CATALOGO.GETINFO_CP" datasource="DS_SIIIP" debug="yes">
      <cfprocparam cfsqltype="cf_sql_numeric" value="#pkCP#"      type="in">
      <cfprocresult name="infoCP">
    </cfstoredproc>
    <cfreturn infoCP>
  </cffunction>


  <!---
  * Fecha: Octubre 27, 2015
  * @author Jessica Gomez T.
  * --->
  <cffunction name="getCatalogoNiveles" access="public" returntype="any" hint="Obtener el catalogo de los niveles">
    <cfstoredproc procedure="SIGADGCH.CATALOGOS.SP_OBTEN_NIVEL" datasource="DS_SIGADGCH">
          <cfprocresult name="qCatalogoNiv">
    </cfstoredproc>
    <cfreturn qCatalogoNiv/>
  </cffunction>

  <!---
  * Fecha: Octubre 27, 2015
  * @author Jessica Gomez T.
  * --->
  <cffunction name="getCatalogoInstituciones" access="public" hint="Obtiene el catalogo de las instituciones segun los filtros especificados">
      <cfargument name="fkTipoInstitucion"    type="numeric"  required="yes">
      <cfargument name="fkPais"  type="numeric"  required="yes">
      <cfquery name="qCatInst" datasource="DS_SIGADGCH">
            SELECT CINST.CIN_PK_INSTITUCION AS INST_ID,
                   CINST.CIN_NOMBRE_INSTIT AS INST_NOMBRE,
                   CINST.CIN_FK_ESTATUS AS ESTATUS,
                   CINST.CIN_NACIONAL AS INST_ORIGEN,
                   CINST.CIN_FK_TIPO_INSTITUCION AS INST_TIPO,
                   CINST.CIN_FK_PAIS AS FK_PAIS
              FROM SIGADGCH.CINSTITUCION CINST
             WHERE CINST.CIN_FK_ESTATUS = 2
                 AND CINST.CIN_FK_PAIS IS NOT NULL
                   <cfif fkTipoInstitucion NEQ 0>
                AND CINST.CIN_FK_TIPO_INSTITUCION = #fkTipoInstitucion#
                   </cfif>
                   <cfif fkPais NEQ 0>
                    AND CINST.CIN_FK_PAIS = #fkPais#
                   </cfif>
          ORDER BY CINST.CIN_NOMBRE_INSTIT
      </cfquery>
      <cfreturn qCatInst/>
  </cffunction>
  <!---
  * Fecha: Octubre 27, 2015
  * @author Aldo Pe�a Alba.
  * --->
  <cffunction name="getInstitucion" access="public" hint="Obtiene la institucion a partir de su PK">
      <cfargument name="fkInstitucion"    type="numeric"  required="yes">
      <cfquery name="qInst" datasource="DS_SIGADGCH">
            SELECT CINST.CIN_PK_INSTITUCION AS INST_ID,
                   CINST.CIN_NOMBRE_INSTIT AS INST_NOMBRE
              FROM SIGADGCH.CINSTITUCION CINST
             WHERE CINST.CIN_FK_ESTATUS = 2
			 <cfif fkInstitucion NEQ 0>
                   AND CINST.CIN_PK_INSTITUCION = #fkInstitucion#
			</cfif>
          ORDER BY CINST.CIN_NOMBRE_INSTIT
      </cfquery>
      <cfreturn qInst/>
  </cffunction>
  <!---
  * Fecha: Octubre 27, 2015
  * @author Aldo Pe�a Alba.
  * --->
  <cffunction name="getDependencia" access="public" hint="Obtiene la dependencia a partir de su PK">
      <cfargument name="fkDependencia"    type="numeric"  required="yes">
      <cfquery name="qDepen" datasource="DS_SIGADGCH">
	  SELECT CDE_PK_DEPENDENCIA AS PK_DEPENDENCIA,
			CDE_DESCRIPCION AS DESCRIPCION
	  FROM SIGADGCH.CDEPENDENCIAS CATDEP
	  WHERE     CATDEP.CDE_ESTATUS = 2
		        AND CATDEP.CDE_PK_DEPENDENCIA = #fkDependencia#
      </cfquery>
      <cfreturn qDepen/>
  </cffunction>
  <!---
  * Fecha: Octubre 27, 2015
  * @author Aldo Pe�a Alba.
  * --->
  <cffunction name="getNivel" access="public" hint="Obtiene el nivel a partir de su PK">
      <cfargument name="fkNivel"    type="numeric"  required="yes">
      <cfquery name="qNivel" datasource="DS_SIGADGCH">
	  SELECT  NE.CNE_PK_NIVEL_ESTUDIO AS PK,
	  		  NE.CNE_DESCRIPCION AS DESCRIPCION
	  FROM    SIGADGCH.CNIVEL_ESTUDIOS NE
	  WHERE   NE.CNE_PK_NIVEL_ESTUDIO = #fkNivel#
      </cfquery>
      <cfreturn qNivel/>
  </cffunction>
  <!---
  * Fecha: Octubre 27, 2015
  * @author Jessica Gomez T.
  * --->
  <cffunction name="getDependenciasByInstitucion" access="public" hint="Obtiene las dependencias asociadas a la instituci�n">
      <cfargument name="pkInstitucion"  type="numeric"  required="yes"  hint="Pk de la instituci�n">
      <cfstoredproc procedure="SIGADGCH.CATALOGOS.SP_GETDEPENDENCIASBYINST" datasource="DS_SIGADGCH">
        <cfprocparam cfsqltype="cf_sql_numeric" value="#pkInstitucion#">
        <cfprocresult name="qSPCatDepResultado">
      </cfstoredproc>
      <cfreturn qSPCatDepResultado/>
  </cffunction>

  <!---
  * Fecha:Octubre 27, 2015
  * @author:Jessica Gomez T.
  * --->
    <cffunction name="getCarreras" access="public" hint="Obtiene las carrerar por dependencia y nivel de estudios">
      <cfargument name="fkDependencia" type="numeric" required="yes" hint="Identificador de la dependencia">
        <cfargument name="fkNivelEstudio" type="numeric" required="yes" hint="Idnetificador del nivel de estudios">
          <cfstoredproc procedure="SIGADGCH.CATALOGOS.SP_GET_CARRERADEPNI" datasource="DS_SIGADGCH">
          <cfprocparam cfsqltype="cf_sql_numeric" value="#fkDependencia#">
            <cfprocparam cfsqltype="cf_sql_numeric" value="#fkNivelEstudio#">
        <cfprocresult name="qObtenCarreras">
          </cfstoredproc>
      <cfreturn qObtenCarreras>
    </cffunction>


	<!---
	* Fecha: Noviembre 12, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getAreaConocimiento" access="public" hint="Obtiene todas las areas de conocimiento">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GET_AREA_CONOCIMIENTO" datasource="DS_SIIIP">
          <cfprocresult name="resultadoArea">
		</cfstoredproc>
		<cfreturn resultadoArea>
	</cffunction>

	<!---
	* Fecha: Noviembre 12, 2015
	* @author: Claudia Olguin Gallegos
	*--->
	<cffunction name="getProgramaAcademico" access="public" hint="Obtiene los programas academicos">
		<cfargument name="pkUr" type="string" required="yes" hint="Identificador de la dependencia">
		<cfargument name="areaConocimiento" type="numeric" required="yes" hint="Identificador del area de conocimiento">
			<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GET_PROGRAMA_ACADEMICO" datasource="DS_SIIIP">
				<cfprocparam cfsqltype="cf_sql_varchar" value="#pkur#">
				<cfprocparam cfsqltype="cf_sql_numeric" value="#areaConocimiento#">
				<cfprocresult name="resultadoPA">
			</cfstoredproc>
			<cfreturn resultadoPA>
    </cffunction>

	<!---
	* Fecha: Noviembre 12, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getCargaAcademica" access="public" hint="Obtiene la carga de un programa academico">
		<cfargument name="programaAcademico" type="numeric" required="yes" hint="Identificador del programa academico">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GET_CARGA_ACADEMICA" datasource="DS_SIIIP">
		<cfprocparam cfsqltype="cf_sql_numeric" value="#programaAcademico#">
		<cfprocresult name="resultadoCA">
		</cfstoredproc>
		<cfreturn resultadoCA>
	</cffunction>

	<!---
	* Fecha: Noviembre 17, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getProgramaIndividual" access="public" hint="Obtiene todos los programas individuales">
		<cfargument name="pkUR" type="string" required="yes" hint="identificador de la UR">
			<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GET_PROGRAMA_INDIVIDUAL" datasource="DS_SIIIP">
				<cfprocparam cfsqltype="cf-sql_varchar" value="#pkUR#">
				<cfprocresult name="resultadoPI">
			</cfstoredproc>
		<cfreturn resultadoPI>
	</cffunction>

	<!---
	* Fecha: Noviembre 18, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="getTablaPrograma" access="public" hint="Obtiene toda la informacion de la tabala programa academico">
		<cfargument name="pkUR" 				type="string" 	required="yes" hint="identificador de la UR">
		<cfargument name="areaConocimiento" 	type="numeric" 	required="yes" hint="identificador del area de conocimiento">
		<cfargument name="programaAcademico" 	type="numeric" 	required="yes" hint="identificador del programa academico">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GET_TABLA_PROGRAMA" datasource="DS_SIIIP">
		<cfprocparam cfsqltype="cf_sql_varchar" value="#pkUR#">
		<cfprocparam cfsqltype="cf_sql_numeric" value="#areaConocimiento#">
		<cfprocparam cfsqltype="cf_sql_numeric" value="#programaAcademico#">
		<cfprocresult name="resultadoPrograma">
		</cfstoredproc>
		<cfreturn resultadoPrograma>
	</cffunction>

	<!---
	* Fecha: Noviembre 18, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="getDirectorTesis" access="public" hint="Obtiene el nombre de todos los profesores">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GET_DIRECTOR_TESIS" datasource="DS_SIIIP">
          <cfprocresult name="resultadoDirector">
		</cfstoredproc>
		<cfreturn resultadoDirector>
	</cffunction>
	<!---
    * Fecha: Octubre 27, 2015
    * @author Aldo Pe�a Alba.
    * --->
    <cffunction name="getCatalogoProyectosInv" access="public" returntype="any" hint="Obtener el catalogo de los proyectos de investigaci�n">
		<cfargument name="anio" type="string" required="no" hint="Identificador del a�o">
		<cfargument name="titulo" type="string" required="no" hint="nombre o t�tulo del proyecto de investigaci�n">
	    	<cfstoredproc procedure="SIIIP.P_POS_CATALOGO.GET_PROYECTOS_INVESTIGACION" datasource="DS_SIIIP">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#anio#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#titulo#" type="in">
	        	<cfprocresult name="qCatalogoProyectosInv">
	      	</cfstoredproc>
      <cfreturn qCatalogoProyectosInv/>
    </cffunction>
	<!---
	* Fecha: Octubre 27, 2015
	* @author Aldo Pe�a Alba.
	* --->
	<cffunction name="getTipoParticipacion" access="public" hint="Obtiene el catalogo para el tipo de participacion en un trabajo de investigacion">
		<cfquery name="qTipoParticipacion" datasource="DS_SIIIP">
	 SELECT  CTP.CTP_PK_TIPO_PARTICIPACION AS PK,
			 CTP.CTP_TIPO_NOMBRE AS NOMBRE
	 FROM    SIIIP.EDI_CTIPOPARTICIPACION  CTP
		</cfquery>
		<cfreturn qTipoParticipacion/>
	</cffunction>
	<!---
	* Fecha: Octubre 27, 2015
	* @author Aldo Pe�a Alba.
	* --->
	<cffunction name="getTipoProyecto" access="public" hint="Obtiene el catalogo para el tipo de proyecto en un trabajo de investigacion">
		<cfquery name="qTipoProyecto" datasource="DS_SIIIP">
	 SELECT  CPI.CPI_PROYECTO_INV_PK AS PK,
			 CPI.CPI_NOMBRE AS NOMBRE
	 FROM    SIIIP.EDI_CTIPO_PROYECTO_INV  CPI
		</cfquery>
		<cfreturn qTipoProyecto/>
	</cffunction>



</cfcomponent>
