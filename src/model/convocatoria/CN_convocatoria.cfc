<!---
* ==================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Inscripcion Posgrado
* Fecha: Marzo 24, 2014
* Descripcion: Componente de Negocio para el modulo de Inscripcion
* ==================================================================
--->
<cfcomponent>

		<cfset dao = CreateObject('component','DAO_convocatoria')>



	  <!---
	  * Fecha creacion: Noviembre 11,2015
	  *@author Aaron Quintana Gomez
	  *Descripci�n: Funci�n que obtiene todas las de Asinaciones de profesores.
	  --->
	   <cffunction name="initTablaAsignacion" access="public"  >
	        	<cfscript>
					var respuesta = dao.initTablaAsignacion();
					return respuesta;

				</cfscript>
	    </cffunction>

	     <!---
		* Fecha: Noviembre 11, 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : Busca una Asignacion por ID
		--->
		<cffunction name="buscarAsignacionByID" access="public" hint="funcion que asigna un Grupo a un profesor">
		  <cfargument name="pkAsignacion" 		type="any"  	required="yes" hint="Llave primaria POS_ASIGNACION_PROFESOR">

				<cfscript>
					var query = dao.buscarAsignacionByID(pkAsignacion);
					return query;
				</cfscript>
		</cffunction>

 		<!---
		* Fecha: Noviembre 11, 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : Obtiene el Catalogo de los Nombres de Profesores
		--->
		<cffunction name="obtenerCatalogoProfesores" access="public" hint="funcion que asigna un Grupo a un profesor">


				<cfscript>
					var query = dao.obtenerCatalogoProfesores();
					return query;
				</cfscript>
		</cffunction>

 		<!---
		* Fecha: Noviembre 11, 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : Obtiene el Catalogo de Materias
		--->
		<cffunction name="obtenerCatalogoAsignacion" access="public" hint="funcion que asigna un Grupo a un profesor">
		<cfargument name="pkUr" 		type="any"  	required="yes" hint="Llave primaria POS_TUR , y Foranea POS_CPROGRAMA_ACADEMICO">

				<cfscript>
					var query = dao.obtenerCatalogoAsignacion(pkUr);
					return query;
				</cfscript>
		</cffunction>

 		<!---
		* Fecha: Noviembre 11, 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : obtiene el catalogo de semestres
		--->
		<cffunction name="obtenerCatalogoSemestre" access="public" hint="funcion que asigna un Grupo a un profesor">


				<cfscript>
					var query = dao.obtenerCatalogoSemestre();
					return query;
				</cfscript>
		</cffunction>

 		<!---
		* Fecha: Noviembre 11, 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : obtiene el catalogo de grupos
		--->
		<cffunction name="obtenerCatalogoGrupos" access="public" hint="funcion que asigna un Grupo a un profesor">


				<cfscript>
					var query = dao.obtenerCatalogoGrupos();
					return query;
				</cfscript>
		</cffunction>


	    <!---
		* Fecha: Noviembre 11, 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : obtiene el catalogo de Turno
		--->
		<cffunction name="obtenerCatalogoTurno" access="public" hint="funcion que asigna un Grupo a un profesor">
				<cfscript>
					var query = dao.obtenerCatalogoTurno();
					return query;
				</cfscript>
		</cffunction>

		<!---
		*Fecha Creacion: Noviembre 11, 2015
		* @author:Aaron Quintana Gomez
		*  Descripcion: obtener el catalogo de periodos
		--->
		<cffunction name="obtenerCatalogoPeriodo" access="public" hint="funcion que asigna un Grupo a un profesor">
				<cfscript>
					var query = dao.obtenerCatalogoPeriodo();
					return query;
				</cfscript>
		</cffunction>



		<!---
		* Fecha: Noviembre 11, 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : Asignaciones de Materias, Grupos, Semestres, Trunos a Profesores
		--->
		<cffunction name="guardarAsignacion" access="public" hint="funcion que asigna un Grupo a un profesor">
			<cfargument name="nombre" 				type="any"  	required="yes" hint="nombre completo del profesor">
			<cfargument name="materia" 				type="any"  	required="yes" hint="materia asignada al profesor">
			<cfargument name="semestre" 			type="any"  	required="yes" hint="semestre asignado al profesor">
			<cfargument name="grupo" 	    		type="any"  	required="yes" hint="grupo asignado al profesor">
			<cfargument name="turno" 	    		type="any"  	required="yes" hint="turno asignado al profesor">
			<cfargument name="periodo" 	    		type="any"  	required="yes" hint="periodo asignado al profesor">
				<cfscript>
					var pkConvocatoria = dao.guardarAsignacion(nombre,materia,semestre,grupo,turno,periodo);
					return pkConvocatoria;
				</cfscript>
		</cffunction>

          <!---
		* Fecha: Noviembre 11 , 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : Pone en estatus de eliminado una asignacion
		--->
		<cffunction name="eliminarAsignacion" access="public" hint="funcion que edita un grupo de un profesor">
			<cfargument name="pkAsignacion" 		type="any"  	required="yes" hint="primary key de la tabla POS_TASIGNACION_PROFESOR">

				<cfscript>
					var pkConvocatoria = dao.eliminarAsignacion(pkAsignacion);
					return pkConvocatoria;
				</cfscript>
		</cffunction>




          <!---
		* Fecha: Noviembre 11 , 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : Pone en estatus 2 cuando la informacion es validada
		--->
		<cffunction name="validarAsignacion" access="public" hint="funcion que edita un grupo de un profesor">
			<cfargument name="pkAsignacion" 		type="any"  	required="yes" hint="primary key de la tabla POS_TASIGNACION_PROFESOR">

				<cfscript>
					var pkConvocatoria = dao.validarAsignacion(pkAsignacion);
					return pkConvocatoria;
				</cfscript>
		</cffunction>


<!---
		* Fecha: Noviembre 11, 2015
		* @author: Aaron Quintana Gomez
		* Descripcion : Edicion de Materias, Grupos, Semestres, Trunos a Profesores
		--->
		<cffunction name="editarAsignacion" access="public" hint="funcion que edita un grupo de un profesor">
			<cfargument name="pkAsignacion" 		type="any"  	required="yes" hint="nombre completo del profesor">
			<cfargument name="nombre" 				type="any"  	required="yes" hint="nombre completo del profesor">
			<cfargument name="materia" 				type="any"  	required="yes" hint="materia asignada al profesor">
			<cfargument name="semestre" 			type="any"  	required="yes" hint="semestre asignado al profesor">
			<cfargument name="grupo" 	    		type="any"  	required="yes" hint="grupo asignado al profesor">
			<cfargument name="turno" 	    		type="any"  	required="yes" hint="turno asignado al profesor">
			<cfargument name="periodo" 	    		type="any"  	required="yes" hint="periodo asignado al profesor">
				<cfscript>
					var pkConvocatoria = dao.editarAsignacion(pkAsignacion,nombre,materia,semestre,grupo,turno,periodo);
					return pkConvocatoria;
				</cfscript>
		</cffunction>



		<!---
		* Fecha: Octubre 27, 2015
		* @author: Olguin Gallegos Claudia
		--->
		<cffunction name="guardarDatosConvocatoria" access="public" hint="funcion que guarda los primeros datos de la convocatoria">
			<cfargument name="periodo" 			type="string"  	required="yes" hint="Guarda el periodo de la convocatoria">
			<cfargument name="objetivo" 		type="string"  	required="yes" hint="objetivo de la convocatoria">
			<cfargument name="perfil_ingreso" 	type="string"  	required="yes" hint="perfil de ingreso que se necesita para la convocatoria">
			<cfargument name="perfil_egreso" 	type="string"  	required="yes" hint="perfil de egreso de la convocatoria">
				<cfscript>
					var pkConvocatoria = dao.guardarDatosConvocatoria(periodo,objetivo,perfil_ingreso,perfil_egreso);
					return pkConvocatoria;
				</cfscript>
		</cffunction>
			<!---
		  * Fecha: Octubre 26, 2015
		  * @author: Olguin Gallegos Claudia
			--->
		 	<cffunction name="guardarDatosPestana" access="public" hint="funcion que guarda los siguientes datos de la convocatoria">
			 	<cfargument name="pkConvocatoria" 		type="numeric" 	required="yes" 	hint="contiene el valor del pk de la convocatoria">
		 		<cfargument name="fechaResultados" 		type="date" 		required="yes" 	hint="fecha de los resultados de la convocatoria">
		 		<cfargument name="cupoMaximoAlumnos" 	type="numeric" 	required="yes" 	hint="cupo maximo de los alumnos permitidos para la convocatoria">
				 	<cfscript>
							var pkResultadoPest = dao.guardarDatosPestana(pkConvocatoria,DateFormat(fechaResultados , "DD/MM/YYYY"),cupoMaximoAlumnos);
							return pkResultadoPest;
					</cfscript>
			</cffunction>

			<!---
		  * Fecha: Octubre 26, 2015
		  * @author: Olguin Gallegos Claudia
			--->
		 	<cffunction name="guardarURL" access="public" hint="funcion que guarda la url de la pagina del programa academico">
				<cfargument name="pkConvocatoria" 	type="numeric" 	required="yes" hint="contiene el valor del pk de la convocatoria">
		 		<cfargument name="URLacademica" 		type="string" 	required="yes" hint="url del programa academico de la convocatoria">
		 			<cfscript>
						var pkUrl = dao.guardarUrl(pkConvocatoria,URLacademica);
						return pkUrl;
					</cfscript>
			</cffunction>

			<!---
			* Fecha: Octubre 27, 2015
			* @author: Olguin Gallegos Claudia
			--->
			<cffunction name="guardarDatosGenerales" access="public" hint="funcion que guarda los datos del responsable de la convocatoria">
				<cfargument name="pkConvocatoria" type="numeric" 	required="yes" hint="Contiene el valor del pk de la convocatoria">
				<cfargument name="nombre" 				type="string"  	required="yes" hint="nombre del responsable de la convocatoria">
				<cfargument name="aPaterno" 			type="string"  	required="yes" hint="apellido paterno del responsable de la convocatoria">
				<cfargument name="aMaterno" 			type="string"  	required="yes" hint="apellido materno del responsable de la convocatoria">
				<cfargument name="conmutador" 		type="numeric" 	required="yes" hint="numero de conmutador del responsable de la convocatoria">
				<cfargument name="extension" 			type="numeric" 	required="yes" hint="numero de extension del responsable de la convocatoria">
				<cfargument name="correoI" 				type="string"  	required="yes" hint="correo institucional del responsable de la convocatoria">
				<cfargument name="correoA" 				type="string"  	required="yes" hint="correo alternativo del responsable de la convocatoria">
					<cfscript>
						var respuesta = dao.guardarDatosGenerales(pkConvocatoria,nombre,aPaterno,aMaterno,conmutador,extension,correoI,correoA);
						return respuesta;
					</cfscript>
			</cffunction>

			<!---
			* Fecha: Octubre 26, 2015
			* @author: Olguin Gallegos Claudia
			--->
			<cffunction name="guardarRequisito" access="public" hint="funcion que guarda todos los requisitos necesarios para la convocatoria">
				<cfargument name="pkConvocatoria" 	type="numeric" 	required="yes" 	hint="Contiene el valor del pk de la convocatoria">
				<cfargument name="addRequisito" 		type="string" 	required="yes" 	hint="requisitos necesarios para la publicacion de la convocatoria">
					<cfscript>
						var requisito = dao.guardarRequisito(pkConvocatoria,addRequisito);
						return requisito;
					</cfscript>
				</cffunction>

				<!---
				* Fecha: Octubre 27, 2015
				* Author: Olguin Gallegos Claudia
				--->
				<cffunction name="guardarRevalidacion" access="public" hint="funcion que agrega todos los requisitos de revalidacion de la convocatoria">
					<cfargument name="pkConvocatoria" 	type="numeric" 	required="yes" 	hint="Contiene el valor del pk de la convocatoria">
					<cfargument name="addRevalidacion" 	type="string" 	required="yes" 	hint="requisitos de revalidacion publicados en la convocatoria ">
						<cfscript>
							var revalidacion = dao.guardarRevalidacion(pkConvocatoria,addRevalidacion);
							return revalidacion;
						</cfscript>
				</cffunction>

				<!---
				* Fecha: Octubre 27, 2015
				* Author: Olguin Gallegos Claudia
				--->
				<cffunction name="guardarDocumento" access="public" hint="funcion que guarda todos los requisitos para aspirantes extranjeros">
					<cfargument name="pkConvocatoria" 	type="numeric" 	required="yes" 	hint="Contiene el valor del pk de la convocatoria">
					<cfargument name="addDocumento" 		type="string" 	required="yes" 	hint="requisitos de la convocatoria para aspirantes extranjeros">
						<cfscript>
						var documento = dao.guardarDocumento(pkConvocatoria,addDocumento);
						return documento;
						</cfscript>
				</cffunction>

				<!---
				* Fecha: Octubre 27, 2015
				* Author: Olguin Gallegos Claudia
				--->
				<cffunction name="guardarProceso" access="public" hint="funcion que guarda las etapas del proceso de la convocatoria">
					<cfargument name="pkConvocatoria" type="numeric" 	required="yes" 	hint="Contiene el valor del pk de la convocatoria">
					<cfargument name="addProceso" 		type="string" 	required="yes" 	hint="etapas del proceso de la convocatoria">
						<cfscript>
						var proceso = dao.guardarProceso(pkConvocatoria,addProceso);
						return proceso;
						</cfscript>
				</cffunction>

				<!---
				* Fecha: Octubre 27, 2015
				* Author: Olguin Gallegos Claudia
				--->
				<cffunction name="guardarFormaResultados" access="public" hint="funcion que guarda las formas en que se publicaran los resultados de la convocatoria">
					<cfargument name="pkConvocatoria" 	type="numeric" 	required="yes" 	hint="Contiene el valor del pk de la  convocatoria ">
					<cfargument name="addForma" 				type="string" 	required="yes" 	hint="forma en que se publicaran los resultados de la convocatoria">
					<cfargument name="addFechaForma" 		type="string" 	required="yes" 	hint="fecha de publicacion de cada forma">
						<cfscript>
						//WriteDump(arguments);
						//abort;
						var forma = dao.guardarFormaResultados(pkConvocatoria,addForma,addFechaForma);
						return forma;
						</cfscript>
				</cffunction>

				<!---
				* Fecha: Octubre 27, 2015
				* Author: Olguin Gallegos Claudia
				--->
				<cffunction name="guardarGrado" access="public" hint="funcion que guarda los requisitos para la obtencion de grado">
					<cfargument name="pkConvocatoria" type="numeric" 	required="yes" hint="Contiene el valor del pk de la convocatoria">
					<cfargument name="addGrado" 			type="string" 	required="yes" hint="requisitos para la obtencion de grado">
						<cfscript>
						var proceso = dao.guardarGrado(pkConvocatoria,addGrado);
						return proceso;
						</cfscript>
				</cffunction>

				<!---
				* Fecha: Octubre 27, 2015
				* Author: Olguin Gallegos Claudia
				--->
				<cffunction name="getInformacionConvocatoria" access="public" hint="Trae la informacion para la tabla seguimiento">
					<cfargument name="fkUR" type="string" required="yes" hint="Contiene el valor del pk de la convocatoria">
					<cfscript>
						Seguimiento = StructNew();
						Seguimiento.Datos = dao.getInformacionConvocatoria(fkUR);
						//Seguimiento.numeroConvocatorias = Seguimiento.recordcount;
						return Seguimiento;
					</cfscript>
				</cffunction>

				<!---
				* Fecha: Noviembre 03, 2015
				* Author: Olguin Gallegos Claudia
				--->
				<cffunction name="getDatosCompletos" access="public" hint="Trae la informacion de todo el formularion de nueva convocatoria">
					<cfargument name="pkConvocatoria" type="numeric" required="yes" hint="Contiene el valor del pk de la convocatoria">
					<cfscript>
						Convocatoria= StructNew();
						Convocatoria.General = dao.getDatosGenerales(pkConvocatoria);
						Convocatoria.Responsable = dao.getDatosResponsable(pkConvocatoria);
						Convocatoria.Proceso = dao.getDatosProceso(pkConvocatoria);
						Convocatoria.Revalidacion = dao.getDatosRevalidacion(pkConvocatoria);
						Convocatoria.Resultados = dao.getDatosResultados(pkConvocatoria);
						Convocatoria.Requisitos = dao.getDatosRequisitos(pkConvocatoria);
						//datosGenerales.Datos = dao.getDatosGenerales(pkConvocatoria);
						return Convocatoria;
					</cfscript>
				</cffunction>

				<!---
				* Fecha: Noviembre 24, 2015
				* @author: Olguin Gallegos Claudia
				--->
				<cffunction name="getDatosGrafica" access="public" hint="">
						<cfscript>
							return dao.getDatosGrafica();
						</cfscript>
				</cffunction>

				<!---
				* Fecha: Noviembre 25, 2015
				* @author: Olguin Gallegos Claudia
				--->
				<cffunction name="getDatosMateriasArea" access="public" hint="">
						<cfscript>
							return dao.getDatosMateriasArea();
						</cfscript>
				</cffunction>
				<!---
				* Fecha: Diciembre 07, 2015
				* Author: Olguin Gallegos Claudia
				--->
				<cffunction name="guardarDatosEditados" access="public" hint="Trae la informacion de todo el formularion de nueva convocatoria">
					<cfargument name="pkConvocatoria" 				type="numeric" required="yes" hint="">
					<cfargument name="periodo" 						type="varchar"  required="yes" hint="">
					<cfargument name="objetivo" 					type="varchar" required="yes" hint="">
					<cfargument name="perfil_ingreso" 				type="varchar"  required="yes" hint="">
					<cfargument name="perfil_egreso" 				type="varchar" required="yes" hint="">
					<cfargument name="fecha_resultado" 				type="varchar"  required="yes" hint="">
					<cfargument name="cupo_maximo" 					type="numeric" required="yes" hint="">
					<cfargument name="plan_academico" 				type="varchar"  required="yes" hint="">
					<cfargument name="requisito" 					type="varchar" required="yes" hint="">
					<cfargument name="proceso" 						type="varchar"  required="yes" hint="">
					<cfargument name="revalidacion" 				type="varchar" required="yes" hint="">
					<cfargument name="forma_resultado" 				type="varchar"  required="yes" hint="">
					<cfargument name="nombre" 						type="varchar" required="yes" hint="">
					<cfargument name="apellido_paterno" 			type="varchar"  required="yes" hint="">
					<cfargument name="conmutador" 					type="numeric" required="yes" hint="">
					<cfargument name="extension" 					type="numeric"  required="yes" hint="">
					<cfargument name="correo_alternativo" 			type="varchar" required="yes" hint="">
					<cfargument name="correo_institucional" 		type="varchar"  required="yes" hint="">
					<cfscript>
						datosGeneralesEditados = dao.guardarDatosEditados(pkConvocatoria);
						return datosGeneralesEditados;
					</cfscript>
				</cffunction>
</cfcomponent>
