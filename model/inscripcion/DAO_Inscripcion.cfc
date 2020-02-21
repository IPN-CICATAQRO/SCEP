<!---
* =========================================================================
* IPN - CICATA
* Sistema: SCEP
* Modulo: Posgrado
* Sub modulo: Inscripcion
* Fecha: 19 Febrero 2020
* Descripcion: Objeto de Acceso a Datos para el modulo
* =========================================================================
--->
<cfcomponent>

	<cffunction name="creaCuenta" access="public" hint="Crea la cuenta del aspirante">
		<cfargument name="nombre" type="string" required="yes">
		<cfargument name="apellidoPat" type="string" required="yes">
		<cfargument name="apellidoMat" type="string" required="yes">
		<cfargument name="rfc" type="string" required="yes">
		<cfargument name="curp" type="string" required="yes">
		<!--- <cfargument name="sexo" type="numeric" required="no"> --->
		<cfargument name="fechaNac" type="string" required="no">
		<cfargument name="estadoCivil" type="numeric" required="no">
		<cfargument name="telefono" type="string" required="no">
		<cfargument name="correo" type="string" required="no">
		<cfargument name="telefono_oficina" type="string" required="no">
		<cfargument name="extension" type="string" required="no">
		<cfargument name="pass" type="string" required="no">
		<cfstoredproc procedure="SYSTEM.P_POS_ALUMNO.CREA_CUENTA" datasource="DS_SIIIP" debug="yes" username="system" password="desCicata1$">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#nombre#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#apellidoPat#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#apellidoMat#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#rfc#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#curp#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#correo#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#pass#" type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	variable="resultado"  type="out">
		</cfstoredproc>
		<cfreturn resultado>
					<!--- <cfprocparam cfsqltype="cf_sql_numeric"	value="#sexo#" type="in"> --->
			<!--- <cfprocparam cfsqltype="cf_sql_date"	value="#fechaNac#" type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#estadoCivil#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#telefono#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#correo#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#telefono_oficina#" type="in">
			<cfprocparam cfsqltype="cf_sql_varchar"	value="#extension#" type="in"> --->
	</cffunction>

	<cffunction name="existePersona" access="public" hint="Obtiene el estado civil a partir de su PK">
		<cfargument name="rfc" type="string" required="yes">
		<cfargument name="curp" type="string" required="yes">
		<cfquery name="existePersona" datasource="DS_SIIIP">
				SELECT COUNT(*) AS REGISTROS
				FROM SYSTEM.POS_TUSUARIO TUS
				WHERE TUS.PTU_RFC = '#rfc#'
				        AND TUS.PTU_CURP = '#curp#'
				        AND TUS.PTU_FK_ESTATUS > 0
			</cfquery>
			<cfreturn existePersona>
	</cffunction>


	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoPersona" access="public" hint="Consulta la Informacion de un Alumno">
		<cfargument name="pkPersona" type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.OBTENER_DATOS_GENERALES" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkPersona#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>
	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoAlumno" access="public" hint="Consulta la Informacion de un Alumno">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.OBTENER_DATOS_GENERALES" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAlumno#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>
	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoAcademica" access="public" hint="Consulta la Informacion acedémica de un alumno o aspirante">
		<cfargument name="pkAlumno" 	type="numeric" required="yes">
		<cfargument name="pkAspirante"  type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.OBTENER_DATOS_ACADEMICOS" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAlumno#" type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAspirante#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>

	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="cambiaEstadoRegistro" access="public" hint="Consulta la Informacion acedémica de un alumno o aspirante">
		<cfargument name="pkRegistro"    type="numeric" required="yes" hint="Identificador del registro">
		<cfargument name="estado" type="numeric" required="yes" hint="Estado a actualizar">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.CAMBIA_ESTADO_REGISTRO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkRegistro#" type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#estado#" type="in">
		</cfstoredproc>
		<cfreturn true>
	</cffunction>

	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerNivelaEstudiar" access="public" hint="Consulta la Informacion acedémica de un alumno o aspirante">
		<cfargument name="pkAlumno"    type="numeric" required="yes" hint="Identificador del alumno">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.OBTENER_NIVEL_ESTUIANDO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAlumno#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>

	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoProfesional" access="public" hint="Consulta la Informacion profesional de un alumno o aspirante">
		<cfargument name="pkAlumno" 	type="numeric" required="yes">
		<cfargument name="pkAspirante"  type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.OBTENER_DATOS_PROFESIONALES" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAlumno#" type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAspirante#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>
	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoDocente" access="public" hint="Consulta la Informacion de labor docente de un alumno o aspirante">
		<cfargument name="pkAlumno" 	type="numeric" required="yes">
		<cfargument name="pkAspirante"  type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.OBTENER_DATOS_DOCENTE" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAlumno#" type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAspirante#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>
	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoInvestigacion" access="public" hint="Consulta la Informacion de labor docente de un alumno o aspirante">
		<cfargument name="pkAlumno" 	type="numeric" required="yes">
		<cfargument name="pkAspirante"  type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.OBTENER_DATOS_INVESTIGACION" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAlumno#" type="in">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkAspirante#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>
	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="guardarDatosGenerales" access="public" hint="Guarda los datos generales de un alumno">
		<cfargument name="numRegistro" type="numeric" required="yes">
		<cfargument name="estatus" type="numeric" required="yes">
		<cfargument name="Ur" type="string" required="yes">
		<cfargument name="nombre" type="string" required="yes">
		<cfargument name="apellidoPat" type="string" required="yes">
		<cfargument name="apellidoMat" type="string" required="yes">
		<cfargument name="rfc" type="string" required="yes">
		<cfargument name="curp" type="string" required="yes">
		<cfargument name="sexo" type="numeric" required="no">
		<cfargument name="fechaNac" type="string" required="no">
		<cfargument name="estadoNac" type="numeric" required="no">
		<cfargument name="paisNac" type="numeric" required="no">
		<cfargument name="estadoCivil" type="numeric" required="no">
		<cfargument name="calle" type="string" required="no">
		<cfargument name="numExt" type="numeric" required="no">
		<cfargument name="colonia" type="string" required="no">
		<cfargument name="delomncp" type="numeric" required="no">
		<cfargument name="cp" type="numeric" required="no">
        <cfargument name="estado" type="numeric" required="no">
		<cfargument name="pais" type="numeric" required="no">
		<cfargument name="telefono" type="string" required="no">
		<cfargument name="telefono_oficina" type="string" required="no">
		<cfargument name="telefono_movil" type="string" required="no">
		<cfargument name="extension" type="string" required="no">
		<cfargument name="correoInst" type="string" required="no">
		<cfargument name="correoAlt" type="string" required="no">
			<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GUARDAR_DATOS_GENERALES" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#numRegistro#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#estatus#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#Ur#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#nombre#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#apellidoPat#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#apellidoMat#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#rfc#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#curp#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#sexo#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaNac#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#estadoNac#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#paisNac#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#estadoCivil#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#calle#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#numExt#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#colonia#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#delomncp#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#cp#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#estado#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#pais#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#telefono#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#telefono_oficina#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#telefono_movil#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#extension#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#correoInst#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#correoAlt#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="resultado"  type="out">
			</cfstoredproc>
			<cfreturn resultado>
	</cffunction>
	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="guardarDatosAcademicos" access="public" hint="Guarda los datos académicos de un alumno">
		<cfargument name="alumno" type="numeric" required="yes">
		<cfargument name="aspirante" type="numeric" required="yes">
		<cfargument name="nivel" type="numeric" required="yes">
		<cfargument name="tipo" type="numeric" required="yes">
		<cfargument name="pais" type="numeric" required="yes">
		<cfargument name="institucion" type="numeric" required="yes">
		<cfargument name="dependencia" type="numeric" required="yes">
		<cfargument name="carrera" type="numeric" required="yes">
		<cfargument name="fechaInicio" type="date" required="yes">
		<cfargument name="fechaFin" type="date" required="yes">
		<cfargument name="titulo" type="string" required="yes">
		<cfargument name="cedula" type="numeric" required="yes">
		<cfargument name="fechaTitulo" type="date" required="yes">
			<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GUARDAR_DATOS_ACADEMICOS" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#alumno#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#aspirante#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#nivel#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#tipo#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#pais#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#institucion#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#dependencia#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#carrera#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaInicio#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaFin#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#titulo#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#cedula#" type="in">
			    <cfprocparam cfsqltype="cf_sql_date"	value="#fechaTitulo#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="resultado"  type="out">
			</cfstoredproc>
			<cfreturn resultado>
	</cffunction>
	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="guardarDatosProfesionales" access="public" hint="Guarda los datos de experiencia profesional de un alumno">
		<cfargument name="alumno" type="numeric" required="yes">
		<cfargument name="aspirante" type="numeric" required="yes">
		<cfargument name="institucion" type="string" required="yes">
		<cfargument name="tipoInstitucion" type="string" required="yes">
		<cfargument name="puesto" type="string" required="yes">
		<cfargument name="fechaInicio" type="string" required="yes">
		<cfargument name="fechaTermino" type="string" required="yes">
		<cfargument name="actividades" type="string" required="yes">
			<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GUARDAR_DATOS_PROFESIONALES" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#alumno#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#aspirante#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#institucion#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#tipoInstitucion#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#puesto#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaInicio#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaTermino#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#actividades#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="resultado"  type="out">
			</cfstoredproc>
			<cfreturn resultado>
	</cffunction>
	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="guardarDatosInvestigacion" access="public" hint="Guarda los datos de proyectos de investigación de un alumno">
		<cfargument name="alumno" type="numeric" required="yes">
		<cfargument name="aspirante" type="numeric" required="yes">
		<cfargument name="tipo_proy" type="numeric" required="yes">
		<cfargument name="tipo_part" type="numeric" required="yes">
		<cfargument name="nombre_profesor" type="string" required="yes">
		<cfargument name="fechaInicio" type="string" required="yes">
		<cfargument name="fechaTermino" type="string" required="yes">
		<cfargument name="clave_proy" type="string" required="yes">
			<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GUARDAR_DATOS_INVESTIGACION" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#alumno#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#aspirante#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#tipo_proy#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#tipo_part#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#nombre_profesor#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaInicio#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaTermino#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#clave_proy#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="resultado"  type="out">
			</cfstoredproc>
			<cfreturn resultado>
	</cffunction>
	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="guardarDatosDocente" access="public" hint="Guarda los datos del labor como docente de un alumno">
		<cfargument name="alumno" type="numeric" required="yes">
		<cfargument name="aspirante" type="numeric" required="yes">
		<cfargument name="institucion" type="numeric" required="yes">
		<cfargument name="dependencia" type="numeric" required="yes">
		<cfargument name="materia" type="string" required="yes">
		<cfargument name="fechaInicio" type="string" required="yes">
		<cfargument name="fechaTermino" type="string" required="yes">
			<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GUARDAR_DATOS_DOCENTE" datasource="DS_SIIIP" debug="yes">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#alumno#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#aspirante#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#institucion#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	value="#dependencia#" type="in">
				<cfprocparam cfsqltype="cf_sql_varchar"	value="#materia#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaInicio#" type="in">
				<cfprocparam cfsqltype="cf_sql_date"	value="#fechaTermino#" type="in">
				<cfprocparam cfsqltype="cf_sql_numeric"	variable="resultado"  type="out">
			</cfstoredproc>
			<cfreturn resultado>
	</cffunction>

	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerPais" access="public" hint="Obtiene el pais a partir de su PK">
		<cfargument name="pkPais" type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_CATALOGO.GETPAIS" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkPais#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>
	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerEstado" access="public" hint="Obtiene el estado a partir de su PK">
		<cfargument name="pkEstado" type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_CATALOGO.GETESTADO" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkEstado#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>
	<!---
	* Fecha:Octubre, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerDelomncp" access="public" hint="Obtiene el estado a partir de su PK">
		<cfargument name="pkDelomncp" type="numeric" required="yes">
		<cfstoredproc procedure="SIIIP.P_POS_CATALOGO.GETDELOMNCP" datasource="DS_SIIIP" debug="yes">
			<cfprocparam cfsqltype="cf_sql_numeric"	value="#pkDelomncp#" type="in">
			<cfprocresult name="cursor">
		</cfstoredproc>
		<cfreturn cursor>
	</cffunction>
	<!---
	* Fecha: Diciembre 02, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="saveCargaAcademica" access="public" hint="Guarda toda la carga academica de un alumno">
		<cfargument name="pkAsignatura" 							type="string" 	required="yes" 	hint="identificador de la asignatura">
		<cfargument name="pkSemestre" 								type="string" 	required="yes" 	hint="identificador del semestre">
		<cfargument name="pkAlumno" 									type="numeric" 	required="yes" 	hint="identificador del alumno">
		<cfargument name="area_conocimiento" 					type="numeric" 	required="yes" 	hint="identificador del area de conocimiento">
		<cfargument name="programa_academico" 				type="numeric" 	required="yes" 	hint="identificador del programa academico">
		<cfargument name="asignacionProfesor" 				type="string"  	required="yes" 	hint="identificador de la asignacion del profesor">
	<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.SAVE_CARGA_ACADEMICA" datasource="DS_SIIIP">
  	<cfprocparam cfsqltype="cf_sql_string"	 	 	value="#pkAsignatura#" 					type="in">
		<cfprocparam cfsqltype="cf_sql_string"		 	value="#pkSemestre#" 						type="in">
		<cfprocparam cfsqltype="cf_sql_numeric"			value="#pkAlumno#" 							type="in">
		<cfprocparam cfsqltype="cf_sql_numeric"			value="#area_conocimiento#" 		type="in">
		<cfprocparam cfsqltype="cf_sql_numeric"			value="#programa_academico#" 		type="in">
		<cfprocparam cfsqltype="cf_sql_string"			value="#asignacionProfesor#" 		type="in">
		<cfprocparam cfsqltype="cf_sql_numeric" 		variable="pkCargaAcademica" 		type="out">
	</cfstoredproc>
	<cfreturn pkCargaAcademica>

	</cffunction>
	<!---
	* Fecha: Diciembre 02, 2015
	* @author: Aldo Peña Alba
	--->
	<cffunction name="guardarDocumentosAlumno" access="public" hint="Guarda toda la carga academica de un alumno">
		<cfargument name="pkAlumno" 	type="numeric" 	required="yes" 	hint="identificador del alumno">
		<cfargument name="tipoDoc" 	    type="string" 	required="yes" 	hint="tipo de documento">
		<cfargument name="nombreDoc" 	type="string" 	required="yes" 	hint="nombre del documento">
	<cfstoredproc procedure="SIIIP.P_POS_ALUMNOS.GUARDAR_DOCUMENTOS_ALUMNO" datasource="DS_SIIIP">
		<cfprocparam cfsqltype="cf_sql_numeric"		value="#pkAlumno#" 			    type="in">
		<cfprocparam cfsqltype="cf_sql_string"		value="#tipoDoc#" 				type="in">
		<cfprocparam cfsqltype="cf_sql_string"		value="#nombreDoc#" 		    type="in">
		<cfprocparam cfsqltype="cf_sql_numeric" 	variable="pkDocumentoAlumno" 	type="out">
	</cfstoredproc>
	<cfreturn pkDocumentoAlumno>

	</cffunction>
</cfcomponent>
