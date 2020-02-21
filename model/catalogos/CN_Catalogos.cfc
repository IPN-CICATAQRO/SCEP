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
	<cfset dao = CreateObject('component','DAO_Catalogos')>
	
	<cffunction name="getEstadoCivil" access="public" hint="Obtiene el catalogo de estado civil, completo o por identificador">
		<cfargument name="pkEstadoCivil" type="numeric" required="no" default="0" hint="Identificador del estado civil a consultar">
		<cfscript>
			return dao.getEstadoCivil(pkEstadoCivil);
		</cfscript>
	</cffunction>


	
	<!--- 
	* Fecha:Octubre 20, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getPaises" access="public" hint="Obtiene el catalogo de paises, completo o por identificador">
		<cfargument name="pkPais" type="numeric" required="no" default="0" hint="Identificador del pais a consultar">
		<cfscript>
			return dao.getPaises(pkPais);
		</cfscript>
	</cffunction>

	<!--- 
	* Fecha:Octubre 20, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getEstado" access="public" hint="Obtiene el catalogo de estados, completo o por identificador">
		<cfargument name="pkEstado" type="numeric" required="no" default="0" hint="Identificador del estado a consultar">
		<cfscript>
			return dao.getEstado(pkEstado);
		</cfscript>
	</cffunction>

	<!--- 
	* Fecha:Octubre 20, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getInfoCP" access="public" hint="Obtiene el catalogo de estados, completo o por identificador">
		<cfargument name="pkCP" type="numeric" required="no" default="0" hint="Identificador del codigo postal a consultar">
		<cfscript>
			return dao.getInfoCP(pkCP);
		</cfscript>
	</cffunction>
	<!---
	* Fecha:Octubre 20, 2015
	* @author:Aldo Peña Alba.
	* --->
	

	<!---
	* Fecha:Octubre 27, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getCatalogoNiveles" access="public" hint="Obtiene el catalogo de los niveles educativos">
		<cfscript>
			return dao.getCatalogoNiveles();
		</cfscript>
	</cffunction>

	<!--- 
	* Fecha:Octubre 27, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getInfoInstitucion" access="public" hint="Obtiene el catalogo de las instituciones">
		<cfargument name="fkTipoInstitucion" type="numeric" required="no" default="0" hint="Indica el tipo de institucion, si es publica o privada">
		<cfargument name="fkPais" type="numeric" required="no" default="0" hint="Indica el identificador para el pais">
		<cfscript>
			return dao.getCatalogoInstituciones(fkTipoInstitucion,fkPais);
		</cfscript>
	</cffunction>
	<!---
	* Fecha:Octubre 27, 2015
	* @author:Aldo Peña Alba.
	* --->
	<cffunction name="getInstitucion" access="public" hint="Obtiene la institucion a partir de su PK">
		<cfargument name="fkInstitucion"    type="numeric"  required="yes">
		<cfscript>
			return dao.getInstitucion(fkInstitucion);
		</cfscript>
	</cffunction>
	<!---
	* Fecha:Octubre 27, 2015
	* @author:Aldo Peña Alba.
	* --->
	<cffunction name="getDependencia" access="public" hint="Obtiene la dependencia a partir de su PK">
		<cfargument name="fkDependencia"    type="numeric"  required="yes">
		<cfscript>
			return dao.getDependencia(fkDependencia);
		</cfscript>
	</cffunction>
	<!---
	* Fecha:Octubre 27, 2015
	* @author:Aldo Peña Alba.
	* --->
	<cffunction name="getNivel" access="public" hint="Obtiene el nivel a partir de su PK">
		<cfargument name="fkNivel"    type="numeric"  required="yes">
		<cfscript>
			return dao.getNivel(fkNivel);
		</cfscript>
	</cffunction>
	<!---
	* Fecha:Octubre 27, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getDependenciasByInstitucion" access="public" hint="Obtiene las dependencias a partir de una institucion">
		<cfargument name="fkInstitucion" type="numeric" required="no" default="0" hint="Indica el tipo de institucion, si es publica o privada">
		<cfscript>
			return dao.getDependenciasByInstitucion(fkInstitucion);
		</cfscript>
	</cffunction>

	<!--- 
	* Fecha:Octubre 27, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getCarreras" access="public" hint="Obtiene las dependencias a partir de una institucion">
		<cfargument name="fkDependencia" type="numeric" required="yes" hint="Identificador de la dependencia">
      	<cfargument name="fkNivelEstudio" type="numeric" required="yes" hint="Idnetificador del nivel de estudios">
		<cfscript>
			return dao.getCarreras(fkDependencia,fkNivelEstudio);
		</cfscript>
	</cffunction>
	
	
	<!---
	* Fecha: Noviembre 12, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getAreaConocimiento" access="public" hint="Obtiene todas las areas de conocimiento">
		<cfscript>
			return dao.getAreaConocimiento();
		</cfscript>
	</cffunction>
	
	<!--- 
	* Fecha: Noviembre 12, 2015
	* @author: Claudia Olguin Gallegos
	* --->
	<cffunction name="getProgramaAcademico" access="public" hint="Obtiene todos los programas academicos">
		<cfargument name="pkUr" type="string" required="yes" hint="Identificador de la dependencia">
		<cfargument name="areaConocimiento" type="numeric" required="yes" hint="Identificador del area de conocimiento">
		<cfscript>
			return dao.getProgramaAcademico(pkUR,areaConocimiento);
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha: Noviembre 12, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getCargaAcademica" access="public" hint="Obtiene toda la carga de un programa academico">
		<cfargument name="programaAcademico" type="numeric" required="yes" hint="Identificador del programa academico">
		<cfscript>
			return dao.getCargaAcademica(programaAcademico);
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha: Noviembre 17, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getProgramaIndividual" access="public" hint="Obtiene todos los programas individuales">
		<cfargument name="pkUR" type="string" required="yes" hint="indentificador del pk de la ur">
		<cfscript>
			return dao.getProgramaIndividual(pkUR);
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha: Noviembre 18, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getTablaPrograma" access="public" hint="Obtiene toda la informacion de la tabala programa academico">
		<cfargument name="pkUR" 				type="string" 	required="yes" hint="indentificador del pk de la UR">
		<cfargument name="areaConocimiento" 	type="numeric" 	required="yes" hint="identificador del area de conocimiento">
		<cfargument name="programaAcademico" 	type="numeric" 	required="yes" hint="identificador del programa academico">
		<cfscript>
			return dao.getTablaPrograma(pkUR,areaConocimiento,programaAcademico);
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha: Noviembre 18, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getDirectorTesis" access="public" hint="Obtiene todos los nombres de los profesores">
		<cfscript>
			return dao.getDirectorTesis();
		</cfscript>
	</cffunction>

<!---
	* Fecha:Octubre 20, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getCatalogoProyectosInv" access="public" returntype="any" hint="Obtener el catalogo de los proyectos de investigación">
		<cfargument name="anio" type="string" required="no" hint="Identificador del año">
		<cfargument name="titulo" type="string" required="no" hint="nombre o título del proyecto de investigación">
			<cfscript>
				return dao.getCatalogoProyectosInv(anio, titulo);
			</cfscript>
	</cffunction>
	<!---
	* Fecha:Octubre 20, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getTipoParticipacion" access="public" hint="Obtiene el catalogo para el tipo de participación en un trabajo de investigacion">
			<cfscript>
				return dao.getTipoParticipacion();
			</cfscript>
	</cffunction>
	<!---
	* Fecha:Octubre 20, 2015
	* @author:Jessica Gomez T.
	* --->
	<cffunction name="getTipoProyecto" access="public" hint="Obtiene el catalogo para el tipo de proyecto en un trabajo de investigacion">
			<cfscript>
				return dao.getTipoProyecto();
			</cfscript>
	</cffunction>
</cfcomponent>