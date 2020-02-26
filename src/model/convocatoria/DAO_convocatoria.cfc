<!---
* ==================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Convocatoria Posgrado
* Fecha: Octubre 12, 2015
* Descripcion: Objeto de Acceso a Datos para el modulo convocatoria
* ==================================================================
--->
<cfcomponent>



	 <!---
	  * Fecha creacion: Noviembre 11,2015
	  *@author Aaron Quintana Gomez
	  *Descripci�n: Carga Catalogo de Profesores.
	  --->
	   <cffunction name="obtenerCatalogoProfesores" access="public"  >
			<cfstoredproc    procedure="SIIIP.P_POS_PROFESORES.OBTENER_CATALOGO_PROFESORES"    debug="yes"		datasource="DS_SIIIP" >
				<cfprocresult name="cursorDatos">
			</cfstoredproc>
			<cfreturn cursorDatos>

	   </cffunction>

	   <!---
	  * Fecha creacion: Noviembre 11,2015
	  *@author Aaron Quintana Gomez
	  *Descripci�n: Carga Catalogo de Materias(Asignatura).
	  --->
	   <cffunction name="obtenerCatalogoAsignacion" access="public"  >
	   	<cfargument name="pkUr" 		type="any"  	required="yes" hint="Llave primaria POS_TUR , y Foranea POS_CPROGRAMA_ACADEMICO">

		<cfstoredproc    procedure="SIIIP.P_POS_PROFESORES.OBTENER_CATALOGO_ASIGNACION"    debug="yes"		datasource="DS_SIIIP" >
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#pkUr#"	type="in">
			<cfprocresult name="cursorDatos">
			</cfstoredproc>
			<cfreturn cursorDatos>

	   </cffunction>

	   <!---
	  * Fecha creacion: Noviembre 11,2015
	  *@author Aaron Quintana Gomez
	  *Descripci�n: Carga Catalogo de Semestres.
	  --->
	   <cffunction name="obtenerCatalogoSemestre" access="public"  >

			<cfstoredproc    procedure="SIIIP.P_POS_PROFESORES.OBTENER_CATALAGO_SEMESTRES"    debug="yes"		datasource="DS_SIIIP" >
				<cfprocresult name="cursorDatos">
			</cfstoredproc>
			<cfreturn cursorDatos>

	   </cffunction>

	   <!---
	  * Fecha creacion: Noviembre 11,2015
	  *@author Aaron Quintana Gomez
	  *Descripci�n: Carga Catalogo de Grupos.
	  --->
	   <cffunction name="obtenerCatalogoGrupos" access="public"  >

			<cfstoredproc    procedure="SIIIP.P_POS_PROFESORES.OBTENER_CATALOGO_GRUPOS"    debug="yes"		datasource="DS_SIIIP" >
				<cfprocresult name="cursorDatos">
			</cfstoredproc>
			<cfreturn cursorDatos>

	   </cffunction>

<!---
	  * Fecha creacion: Noviembre 11,2015
	  *@author Aaron Quintana Gomez
	  *Descripci�n: Carga Catalogo de turno.
	  --->
	   <cffunction name="obtenerCatalogoTurno" access="public"  >

			<cfstoredproc    procedure="SIIIP.P_POS_PROFESORES.OBTENER_CATALOGO_TURNO"    debug="yes"		datasource="DS_SIIIP" >
				<cfprocresult name="cursorDatos">
			</cfstoredproc>
			<cfreturn cursorDatos>

	   </cffunction>

	   <!---
	    *Fecha Creacion: Noviembre 11, 2015
	    *@author Aaron Quintana Gomez
	    *Descripcion: Funcion que obtiene los periodos
	    --->
	   <cffunction name="obtenerCatalogoPeriodo" access="public"  >

			<cfstoredproc    procedure="SIIIP.P_POS_PROFESORES.OBTENER_CATALOGO_PERIODO"    debug="yes"		datasource="DS_SIIIP" >
				<cfprocresult name="cursorDatos">
			</cfstoredproc>
			<cfreturn cursorDatos>

	   </cffunction>


 <!---
	  * Fecha creacion: Noviembre 11,2015
	  *@author Aaron Quintana Gomez
	  *Descripci�n: Funci�n que obtiene todas las de Asinaciones de profesores.
	  --->
	   <cffunction name="initTablaAsignacion" access="public"  >

			<cfstoredproc    procedure="SIIIP.P_POS_PROFESORES.INICIALIZAR_TABLA_ASIGNACION"    debug="yes"		datasource="DS_SIIIP" >
				<cfprocresult name="cursorDatos">
			</cfstoredproc>
			<cfreturn cursorDatos>

	   </cffunction>


<!---
	* Fecha: Noviembre 11, 2015
	* @author: Aaron Quintana Gomez
	* Descripcion : Busca una Asignacion por su Id
	--->
	<cffunction name="buscarAsignacionByID" access="public" hint=" Funcion que consulta una asignacion profesor por su id ">
		<cfargument name="pkAsignacion"		type="any"  	required="yes" hint="representa la  llave primaria de la tabla pos_asignacionProfesor">


		<cfstoredproc    procedure="SIIIP.P_POS_PROFESORES.BUSCAR_ASIGNACION_POR_ID"    debug="yes"		datasource="DS_SIIIP" >
			<cfprocparam 	cfsqltype="cf_sql_varchar" value="#pkAsignacion#"	type="in">
			<cfprocresult name="cursorDatos">
			</cfstoredproc>
			<cfreturn cursorDatos>
	</cffunction>

	<!---
	* Fecha: Noviembre 11, 2015
	* @author: Aaron Quintana Gomez
	* Descripcion : Asignaciones de Materias, Grupos, Semestres, Trunos a Profesores
	--->
	<cffunction name="guardarAsignacion" access="public" hint=" Funcion que guardaa en tabla ">
		<cfargument name="nombre" 						type="any"  	required="yes" hint="representa el nombre completo del profesor">
		<cfargument name="materia" 						type="any"  	required="yes" hint="representa la materia que sera impartida">
		<cfargument name="semestre" 					type="any"  	required="yes" hint="representa el semestre">
		<cfargument name="grupo" 						type="any"  	required="yes" hint="representa el grupo en que se dara la materia">
		<cfargument name="turno" 						type="any"  	required="yes" hint="represemta el turno">
		<cfargument name="periodo" 						type="any"  	required="yes" hint="represemta el periodo">
			<cfstoredproc procedure="SIIIP.P_POS_PROFESORES.GUARDAR_ASIGNACION_PROFESOR"		   debug="yes"		datasource="DS_SIIIP" >
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#nombre#"				type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#materia#"				type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#semestre#"				type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#grupo#"					type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#turno#"					type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#periodo#"				type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkResultado"			type="out">
			</cfstoredproc>
	   <cfreturn pkResultado>
	</cffunction>

	<!---
	* Fecha: Noviembre 11, 2015
	* @author: Aaron Quintana Gomez
	* Descripcion : Elimina Asignaciones de Materias, Grupos, Semestres, Trunos a Profesores
	--->
	    <cffunction name="eliminarAsignacion" access="public" hint=" Funcion que guardaa en tabla ">
		 <cfargument name="pkAsignacion" 				type="any"  	required="yes" hint="representa una llave unica para cada asignacion">


			<cfstoredproc procedure="SIIIP.P_POS_PROFESORES.ELIMINAR_ASIGNACION_PROFESOR"             debug="yes"		datasource="DS_SIIIP" >
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#pkAsignacion#"						type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkResultado"						type="out">
			</cfstoredproc>
			<cfreturn pkResultado>
	</cffunction>

	<!---
	* Fecha: Noviembre 11, 2015
	* @author: Aaron Quintana Gomez
	* Descripcion : Valida la asignacion activa poniendo en 2 el status, una vez hecho esto la informacion no podra modificarse


	--->
	    <cffunction name="validarAsignacion" access="public" hint=" Funcion que guardaa en tabla ">
		 <cfargument name="pkAsignacion" 				type="any"  	required="yes" hint="representa una llave unica para cada asignacion">


			<cfstoredproc procedure="SIIIP.P_POS_PROFESORES.VALIDAR_ASIGNACION_PROFESOR"            debug="yes"		datasource="DS_SIIIP" >
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#pkAsignacion#"						type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkResultado"						type="out">
			</cfstoredproc>
			<cfreturn pkResultado>
	</cffunction>
	<!---
	* Fecha: Noviembre 11, 2015
	* @author: Aaron Quintana Gomez
	* Descripcion : Editar Asignaciones de Materias, Grupos, Semestres, Trunos a Profesores
	--->
	    <cffunction name="editarAsignacion" access="public" hint=" Funcion que guardaa en tabla ">
		 <cfargument name="pkAsignacion" 				type="any"  	required="yes" hint="representa una llave unica para cada asignacion">
		 <cfargument name="nombre" 						type="any"  	required="yes" hint="representa el nombre completo del profesor">
		 <cfargument name="materia" 					type="any"  	required="yes" hint="representa la materia que sera impartida">
		 <cfargument name="semestre" 					type="any"  	required="yes" hint="representa el semestre">
		 <cfargument name="grupo" 						type="any"  	required="yes" hint="representa el grupo en que se dara la materia">
		 <cfargument name="turno" 						type="any"  	required="yes" hint="represemta el turno">
		 <cfargument name="periodo" 						type="any"  	required="yes" hint="represemta el periodo">
			<cfstoredproc procedure="SIIIP.P_POS_PROFESORES.EDITAR_ASIGNACION_PROFESOR"             debug="yes"		datasource="DS_SIIIP" >
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAsignacion#"						type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#nombre#"							type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#materia#"							type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#semestre#"							type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#grupo#"								type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#turno#"								type="in">
			    <cfprocparam cfsqltype="cf_sql_numeric"	value="#periodo#"							type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkResultado"						type="out">
			</cfstoredproc>
			<cfreturn pkResultado>
	</cffunction>





	<!---
	* Fecha: Octubre 15, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarDatosConvocatoria" access="public" hint="funcion que guarda los primeros datos de la convocatoria">
		<cfargument name="periodo" 						type="string"  	required="yes" hint="Guarda el periodo de la convocatoria">
		<cfargument name="objetivo" 					type="string"  	required="yes" hint="objetivo de la convocatoria">
		<cfargument name="perfil_ingreso" 				type="string"  	required="yes" hint="perfil de ingreso que se necesita para la convocatoria">
		<cfargument name="perfil_egreso" 				type="string"  	required="yes" hint="perfil de egreso de la convocatoria">
			<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_DATOS_GENERALES" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#periodo#"						type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#objetivo#"						type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#perfil_ingreso#"				type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#perfil_egreso#"					type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkResultado"					type="out">
			</cfstoredproc>
			<cfreturn pkResultado>
	</cffunction>

	 <!---
	 * Fecha: Octubre 26, 2015
	 * @author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarDatosPestana" access="public" hint="funcion que guarda los siguientes datos de la convocatoria">
		<cfargument name="pkConvocatoria" 		type="numeric" 	required="yes" hint="contiene el valor del pk de la convocatoria">
		<cfargument name="fechaResultados" 		type="date" 		required="yes" hint="fecha de los resultados de la convocatoria">
		<cfargument name="cupoMaximoAlumnos" 	type="numeric" 	required="yes" hint="cupo maximo de los alumnos permitidos para la convocatoria">
			<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_DATOS_PESTANA" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_numeric"	 value="#pkConvocatoria#"     	type="in">
				<cfprocparam cfsqltype="cf_sql_date"		 value="#fechaResultados#"			type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	 value="#cupoMaximoAlumnos#"		type="in">
			</cfstoredproc>
			<cfreturn true>
	</cffunction>

	<!---
	* Fecha: Octubre 26, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarUrl" access="public" hint="funcion que guarda la url de la pagina del programa academico">
	 <cfargument name="pkConvocatoria" 	type="numeric" 	required="yes" hint="contiene el valor del pk de la convocatoria">
	 <cfargument name="URLacademica" 		type="string" 	required="yes" hint="url del programa academico de la convocatoria">
		 <cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_URL" datasource="DS_SIIIP" debug="yes">
				 <cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#"    type="in">
				 <cfprocparam cfsqltype="cf_sql_string"		value="#URLacademica#"			type="in">
			</cfstoredproc>
			<cfreturn true>
	</cffunction>

	<!---
	* Fecha: Octubre 12, 2015
	* @author: Olguin Gallegos Claudia
	* --->
	<cffunction name="guardarDatosGenerales" access="public" hint="funcion que guarda los datos del responsable de la convocatoria">
		<cfargument name="pkConvocatoria" 			type="numeric" 	required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfargument name="nombre" 							type="string"  required="yes" hint="nombre del responsable de la convocatoria">
		<cfargument name="ap_paterno" 					type="string"  required="yes" hint="apellido paterno del responsable de la convocatoria">
		<cfargument name="ap_materno" 					type="string"  required="yes" hint="apellido materno del responsable de la convocatoria">
		<cfargument name="conmutador" 					type="numeric" required="yes" hint="numero de conmutador del responsable de la convocatoria">
		<cfargument name="extension" 						type="numeric" required="yes" hint="numero de extension del responsable de la convocatoria">
		<cfargument name="correo_institucional" type="string"  required="yes" hint="correo institucional del responsable de la convocatoria">
		<cfargument name="correo_alternativo" 	type="string"  required="yes" hint="correo alternativo del responsable de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_DATOS_RESPONSABLE" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#"    type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#nombre#"								type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#ap_paterno#"						type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#ap_materno#"						type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#conmutador#"						type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#extension#"							type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#correo_institucional#"	type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#correo_alternativo#"		type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkRespuesta"					type="out" >
		</cfstoredproc>
		<cfreturn pkRespuesta>
	</cffunction>

	<!---
	* Fecha: Octubre 20, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarRequisito" access="public" hint="funcion que guarda todos los requisitos necesarios para la convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" 	required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfargument name="requisito" 			type="string" 	required="yes" hint="requisitos necesarios para la publicacion de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_REQUISITO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#"	type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#requisito#"				type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkRequisito"		type="out">
		</cfstoredproc>
		<cfreturn pkRequisito>
	</cffunction>

	<!---
	* Fecha: Octubre 27, 2015
	* Author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarRevalidacion" access="public" hint="funcion que agrega todos los requisitos de revalidacion de la convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfargument name="revalidacion" 	type="string"  required="yes" hint="requisitos de revalidacion publicados en la convocatoria ">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_REVALIDACION" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#revalidacion#"				type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkRevalidacion"			type="out">
		</cfstoredproc>
		<cfreturn pkRevalidacion>
	</cffunction>

	<!---
	* Fecha: Octubre 27, 2015
	* Author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarDocumento" access="public" hint="funcion que guarda todos los requisitos para aspirantes extranjeros">
		<cfargument name="pkConvocatoria" type="numeric" 	required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfargument name="documento" 			type="string" 	required="yes" hint="requisitos de la convocatoria para aspirantes extranjeros">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_DOCUMENTO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#"	type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#documento#"				type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkDocumento"		type="out">
			</cfstoredproc>
			<cfreturn pkDocumento>
	</cffunction>

	<!---
	* Fecha: Octubre 27, 2015
	* Author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarProceso" access="public" hint="funcion que guarda las etapas del proceso de la convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfargument name="proceso" 				type="string"  required="yes" hint="etapas del proceso de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_PROCESO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#"	type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#proceso#"					type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkProceso"		type="out">
		</cfstoredproc>
		<cfreturn pkProceso>
	</cffunction>

	<!---
	* Fecha: Octubre 27, 2015
	* Author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarFormaResultados" access="public" hint="funcion que guarda las formas en que se publicaran los resultados de la convocatoria">
		<cfargument name="pkConvocatoria" type="numeric"  required="yes" hint="Contiene el valor del pk de la  convocatoria ">
		<cfargument name="formaResultado" type="string"   required="yes" hint="forma en que se publicaran los resultados de la convocatoria">
		<cfargument name="fechaResultado" type="string"      required="yes" hint="fecha de publicacion de cada forma">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_FORMA_RESULTADO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#"		type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#formaResultado#"		type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#fechaResultado#"		type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkForma"			type="out">
		</cfstoredproc>
		<cfreturn pkForma>
	</cffunction>

	<!---
	* Fecha: Octubre 27, 2015
	* Author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarGrado" access="public" hint="funcion que guarda los requisitos para la obtencion de grado">
		<cfargument name="pkConvocatoria" type="numeric" 	required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfargument name="grado" 					type="string" 	required="yes" hint="requisitos para la obtencion de grado">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_GRADO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"		value="#pkConvocatoria#"		type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"		value="#grado#"							type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="pkGrado"					type="out">
				</cfstoredproc>
				<cfreturn pkGrado>
	</cffunction>

	<!---
	* Fecha: Octubre 30, 2015
	* Author: Olguin Gallegos Claudia
	--->
	<cffunction name="getInformacionConvocatoria" access="public" hint="Trae la informacion para la tabla seguimiento">
		<cfargument name="fkUR" type="string" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_SEGUIMIENTO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam  cfsqltype="cf_sql_varchar"	value="#fkUR#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>

	<!---
	* Fecha: Noviembre 03, 2015
	* Author: Olguin Gallegos Claudia
	--->
	<cffunction name="getDatosGenerales" access="public" hint="Trae la informacion general de una convocartoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_GENERALES" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#" type="in">
			<cfprocresult name="cursorDatos">
		</cfstoredproc>
		<cfreturn cursorDatos>
	</cffunction>

	<!---
	* Fecha: Noviembre 03, 2015
	* Author: Aldo Peña Alba
	--->
	<cffunction name="getDatosResponsable" access="public" hint="Trae la informacion del responsable de una convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_RESPONSABLE" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#" type="in">
			<cfprocresult name="cursorResponsable">
		</cfstoredproc>
		<cfreturn cursorResponsable>
	</cffunction>
	<!---
	* Fecha: Noviembre 03, 2015
	* Author: Aldo Peña Alba
	--->
	<cffunction name="getDatosDocumentos" access="public" hint="Trae la informacion del responsable de una convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_DOCUMENTOS" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#" type="in">
			<cfprocresult name="cursorDocumentos">
		</cfstoredproc>
		<cfreturn cursorDocumentos>
	</cffunction>
	<!---
	* Fecha: Noviembre 03, 2015
	* Author: Aldo Peña Alba
	--->
	<cffunction name="getDatosProceso" access="public" hint="Trae la informacion de los procesos de una convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_PROCESO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#" type="in">
			<cfprocresult name="cursorProceso">
		</cfstoredproc>
		<cfreturn cursorProceso>
	</cffunction>
	<!---
	* Fecha: Noviembre 03, 2015
	* Author: Aldo Peña Alba
	--->
	<cffunction name="getDatosRequisitos" access="public" hint="Trae la informacion de los requisitos de una convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_REQUISITOS" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#" type="in">
			<cfprocresult name="cursorRequisitos">
		</cfstoredproc>
		<cfreturn cursorRequisitos>
	</cffunction>
	<!---
	* Fecha: Noviembre 03, 2015
	* Author: Aldo Peña Alba
	--->
	<cffunction name="getDatosRevalidacion" access="public" hint="Trae la informacion sobre la revalidacion de una convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_REVALIDACION" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#" type="in">
			<cfprocresult name="cursorRevalidacion">
		</cfstoredproc>
		<cfreturn cursorRevalidacion>
	</cffunction>
	<!---
	* Fecha: Noviembre 03, 2015
	* Author: Aldo Peña Alba
	--->
	<cffunction name="getDatosResultados" access="public" hint="Trae la informacion sobre publicacion de resultados de una convocatoria">
		<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_RESULTADOS" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#" type="in">
			<cfprocresult name="cursorResultados">
		</cfstoredproc>
		<cfreturn cursorResultados>
	</cffunction>
	<!---
	* Fecha: Noviembre 24, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="getDatosGrafica" access="public" hint="">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_GRAFICAS" datasource="DS_SIIIP" debug="yes">
			<cfprocresult name="datosGarficas">
		</cfstoredproc>
		<cfreturn datosGarficas>
	</cffunction>

	<!---
	* Fecha: Noviembre 25, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="getDatosMateriasArea" access="public" hint="">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.GET_DATOS_MATERIASPORAREA" datasource="DS_SIIIP" debug="yes">
			<cfprocresult name="datosMateriasArea">
		</cfstoredproc>
		<cfreturn datosMateriasArea>
	</cffunction>
	<!---
	* Fecha: Diciembre 07, 2015
	* Author: Olguin Gallegos Claudia
	--->
	<cffunction name="guardarDatosEditados" access="public" hint="funcion que agrega todos los requisitos de revalidacion de la convocatoria">
		<cfargument name="pkConvocatoria" 				type="numeric" required="yes" hint="">
		<cfargument name="periodo" 								type="varchar"  required="yes" hint="">
		<cfargument name="objetivo" 							type="varchar" required="yes" hint="">
		<cfargument name="perfil_ingreso" 				type="varchar"  required="yes" hint="">
		<cfargument name="perfil_egreso" 					type="varchar" required="yes" hint="">
		<cfargument name="fecha_resultado" 				type="varchar"  required="yes" hint="">
		<cfargument name="cupo_maximo" 						type="numeric" required="yes" hint="">
		<cfargument name="plan_academico" 				type="varchar"  required="yes" hint="">
		<cfargument name="requisito" 							type="varchar" required="yes" hint="">
		<cfargument name="proceso" 								type="varchar"  required="yes" hint="">
		<cfargument name="revalidacion" 					type="varchar" required="yes" hint="">
		<cfargument name="forma_resultado" 				type="varchar"  required="yes" hint="">
		<cfargument name="nombre" 								type="varchar" required="yes" hint="">
		<cfargument name="apellido_paterno" 			type="varchar"  required="yes" hint="">
		<cfargument name="conmutador" 						type="numeric" required="yes" hint="">
		<cfargument name="extension" 							type="numeric"  required="yes" hint="">
		<cfargument name="correo_alternativo" 		type="varchar" required="yes" hint="">
		<cfargument name="correo_institucional" 	type="varchar"  required="yes" hint="">
		<cfstoredproc procedure="SIIIP.P_POS_CONVOCATORIA.SAVE_DATOS_EDITADOS" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkConvocatoria#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#periodo#"				type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	variable="#objetivo#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#perfil_ingreso#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#perfil_egreso#"				type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	variable="#fecha_resultado#"			type="in">
				<cfprocparam cfsqltype="cf_sql_number"	value="#cupo_maximo#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#plan_academico#"				type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	variable="#requisito#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#proceso#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#revalidacion#"				type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	variable="#forma_resultado#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#nombre#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#apellido_paterno#"				type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	variable="#apellido_materno#"			type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#conmutador#"			type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#extension#"				type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	variable="#correo_alternativo#"			type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	variable="#correo_institucional#"			type="in">
		</cfstoredproc>
	</cffunction>



</cfcomponent>
