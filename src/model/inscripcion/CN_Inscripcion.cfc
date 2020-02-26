<!---
* =========================================================================
* IPN - CICATA
* Sistema: SCEP
* Modulo: Posgrado
* Sub modulo: Inscripcion
* Fecha: 19 Febrero 2020
* Descripcion: Componente de Negocio para el modulo de Inscripcion
* =========================================================================
--->
<cfcomponent>

	<cfset dao = CreateObject('component','DAO_Inscripcion')>
	<!--- <cfset daoCatalogos = CreateObject('component','posgrado.model.catalogos.CN_Catalogos')> --->

	<cffunction name="creaCuenta" access="public" hint="Crea la cuenta del aspirante">
		<cfargument name="nombre" type="string" required="yes">
		<cfargument name="apaterno" type="string" required="yes">
		<cfargument name="amaterno" type="string" required="yes">
		<cfargument name="rfc" type="string" required="yes">
		<cfargument name="curp" type="string" required="yes">
		<!--- <cfargument name="sexo" type="numeric" required="yes"> --->
		<cfargument name="fechaNac" type="string" required="yes">
		<cfargument name="estadoCivil" type="numeric" required="yes">
		<cfargument name="telefono" type="numeric" required="yes">
		<cfargument name="correo" type="string" required="yes">
		<cfargument name="telefono_oficina" type="numeric" required="yes">
		<cfargument name="extension" type="numeric" required="yes">
		<cfscript>
			var pass = "123"; //generarRandomPassword();
			var pkInsertado = 0;
			confirmacion = this.correoConfirmacion(nombre, apaterno, amaterno,rfc, curp,correo);
			abort;
			/*var existe = this.existePersona(rfc, curp);
			if(existe.REGISTROS EQ 0){
				
				pkInsertado = dao.creaCuenta(nombre, apaterno, amaterno,
											rfc, curp, sexo,fechaNac, estadoCivil, 
											telefono, correo, telefono_oficina, extension,pass);

				confirmacion = this.correoConfirmacion(nombre, apaterno, amaterno,rfc, curp,correo);
			}*/
			return pkInsertado;
		</cfscript>
	</cffunction>

	<cffunction name="existePersona" access="public" hint="Valida si existe esa persona registrada">
		<cfargument name="rfc" type="string" required="yes">
		<cfargument name="curp" type="string" required="yes">
		<cfscript>
			var existencia = dao.existePersona(rfc, curp);
			return existencia;
		</cfscript>
	</cffunction>

	<cffunction name="correoConfirmacion" access="public" hint="Envia el correo para confirmar cuenta">
		<cfargument name="nombre" type="string" required="yes">
		<cfargument name="apaterno" type="string" required="yes">
		<cfargument name="amaterno" type="string" required="yes">
		<cfargument name="rfc" type="string" required="yes">
		<cfargument name="curp" type="string" required="yes">
		<cfargument name="correo" type="string" required="yes">
		<cfmail to="#correo#" from="scep.pro@gmail.com" subject="CORREO DE CONFIRMACION DE CUENTA">
			#nombre# #apaterno# #amaterno#
			Bienvenido al Sistema de Control Escolar de Posgrado
			Para confirmar tu cuenta, te pedimos des clic en el siguiente enlace:

				http://localhost:8501

				http://localhost:8501/Inscripcion/creaCuenta?folio=

			Instituto Polit#chr(233)#cnico Nacional
			Centro de Investigaci#chr(243)#n en Ciencia Aplicada y Tecnolog#chr(237)#a Avanzada - Quer#chr(233)#taro


			Si usted no solicito acceso al sistema, por favor omita este mensaje.
			Gracias.
		</cfmail>
		<!--- #nombre# #apaterno# #amaterno# con RFC: #rfc# y CURP: #curp# --->
		<cfreturn true>
	</cffunction>


		<cffunction name="obtenerInfoAlumno" access="public" hint="Consulta la Informacion de un Alumno">
			<cfargument name="apaterno" type="string" required="yes">
			<cfargument name="amaterno" type="string" required="yes">
			<cfargument name="nombre" type="string" required="yes">
			<cfargument name="fechaNac" type="string" required="yes">
			<cfargument name="rfc" type="string" required="yes">
			<cfargument name="curp" type="string" required="yes">
			<cfargument name="email" type="string" required="yes">
			<cfargument name="nacionalidad" type="numeric" required="yes">
			<cfargument name="estadoCivil" type="numeric" required="yes">
			<cfargument name="genero" type="numeric" required="yes">
			<cfscript>
				Respuesta = StructNew();

				var pkPersona  = 0;//Session.Usuario.PK_PERSONA;
				var pkAlumno   = 0;//Session.Usuario.PK_ALUMNO;
				var pkUsuario  = 0;//Session.Usuario.PKUSUARIO;

					Respuesta.Datos = 0;
				/*if(pkAlumno EQ 0){
					Respuesta.Datos = dao.obtenerInfoPersona(pkPersona);
				}else{
					Respuesta.Datos = dao.obtenerInfoAlumno(pkAlumno);
				}*/
				writedump(Respuesta.Datos);
				if(Respuesta.Datos GT 0){//(Respuesta.Datos.RECORDCOUNT GT 0){
				//if(Respuesta.Datos.PK_PAIS_NAC NEQ 0 AND Respuesta.Datos.PK_LUGAR_NAC NEQ 0){
					Respuesta.Pais_Nac = dao.obtenerPais(Respuesta.Datos.PK_PAIS_NAC);
					Respuesta.Estado_Nac = dao.obtenerEstado(Respuesta.Datos.PK_LUGAR_NAC);
					Respuesta.EstadoCivil = dao.obtenerEstadoCivil(0);
					return Respuesta;
				}
				else{
						writedump("entra");
					Respuesta.EstadoCivil = dao.obtenerEstadoCivil(0);
					return Respuesta;
				}
			</cfscript>
		</cffunction>

	<!---<!---
	* Fecha: Marzo 24, 2014
	* @author: Antonio Alvarez
	* --->
	<cffunction name="generarUsuario" access="public" hint="Crea el registro para 'SP_TDATOS_GENERALES' y genera el usuario">
		<cfargument name="apaterno" type="string" required="yes">
		<cfargument name="amaterno" type="string" required="yes">
		<cfargument name="nombre" type="string" required="yes">
		<cfargument name="fechaNac" type="string" required="yes">
		<cfargument name="lugarNac" type="string" required="yes">
		<cfargument name="rfc" type="string" required="yes">
		<cfargument name="curp" type="string" required="yes">
		<cfargument name="email" type="string" required="yes">
		<cfargument name="nacionalidad" type="numeric" required="yes">
		<cfargument name="estadoCivil" type="numeric" required="yes">
		<cfargument name="genero" type="numeric" required="yes">
		<!---RESIDENCIA--->
		<cfargument name="colonia" type="string" required="yes">
		<cfargument name="calle" type="string" required="yes">
		<cfargument name="noExterior" type="numeric" required="yes">
		<cfargument name="noInterior" type="numeric" required="yes">
		<cfargument name="cp" type="numeric" required="yes">
		<cfargument name="estado" type="string" required="yes">
		<cfargument name="delMunicipio" type="string" required="yes">
		<cfargument name="telefono" type="numeric" required="yes">
		<cfargument name="paisinfo" type="numeric" required="yes">
		<!---LABORAL--->
		<cfargument name="empresa" type="string" required="yes">
		<cfargument name="coloniaemp" type="string" required="yes">
		<cfargument name="calleemp" type="string" required="yes">
		<cfargument name="noemp" type="numeric" required="yes">
		<cfargument name="cpemp" type="numeric" required="yes">
		<cfargument name="estadoemp" type="string" required="yes">
		<cfargument name="delmunicipioemp" type="string" required="yes">
		<cfargument name="telefonoemp" type="numeric" required="yes">
		<cfargument name="cargoemp" type="string" required="yes">
		<cfscript>
			var pass = "123"; //generarRandomPassword();
			var pkInsertado = dao.generarUsuario(apaterno, amaterno, nombre, fechaNac, lugarNac, rfc,
												 curp, email, nacionalidad, estadoCivil, genero,
												 //Info Residencia
												 colonia,calle,noExterior,noInterior,
												 cp,estado,delMunicipio,telefono,paisinfo,
												 //Info Laboral
												 empresa,coloniaemp,calleemp,noemp,
												 cpemp,estadoemp,delmunicipioemp,telefonoemp,cargoemp,
												 pass);
			//enviarEmail(...);
			return pkInsertado;
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Marzo 24, 2014
	* @author: Antonio Alvarez
	* --->
	<cffunction name="actualizarInformacionPersonal" access="public" hint="Actualiza la informacion personal">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="apaterno" type="string" required="yes">
		<cfargument name="amaterno" type="string" required="yes">
		<cfargument name="nombre" type="string" required="yes">
		<cfargument name="fechaNac" type="string" required="yes">
		<cfargument name="lugarNac" type="string" required="yes">
		<cfargument name="rfc" type="string" required="yes">
		<cfargument name="curp" type="string" required="yes">
		<cfargument name="email" type="string" required="yes">
		<cfargument name="nacionalidad" type="numeric" required="yes">
		<cfargument name="estadoCivil" type="numeric" required="yes">
		<cfargument name="genero" type="numeric" required="yes">
		<!---RESIDENCIA--->
		<cfargument name="colonia" type="string" required="yes">
		<cfargument name="calle" type="string" required="yes">
		<cfargument name="noExterior" type="numeric" required="yes">
		<cfargument name="noInterior" type="numeric" required="yes">
		<cfargument name="cp" type="numeric" required="yes">
		<cfargument name="estado" type="string" required="yes">
		<cfargument name="delMunicipio" type="string" required="yes">
		<cfargument name="telefono" type="numeric" required="yes">
		<cfargument name="paisinfo" type="numeric" required="yes">
		<!---LABORAL--->
		<cfargument name="empresa" type="string" required="yes">
		<cfargument name="coloniaemp" type="string" required="yes">
		<cfargument name="calleemp" type="string" required="yes">
		<cfargument name="noemp" type="numeric" required="yes">
		<cfargument name="cpemp" type="numeric" required="yes">
		<cfargument name="estadoemp" type="string" required="yes">
		<cfargument name="delmunicipioemp" type="string" required="yes">
		<cfargument name="telefonoemp" type="numeric" required="yes">
		<cfargument name="cargoemp" type="string" required="yes">
		<cfscript>
			return dao.actualizarInformacionPersonal(pkAlumno, apaterno, amaterno, nombre, fechaNac, lugarNac, rfc,
													 curp, email, nacionalidad, estadoCivil, genero,
													 //Info Residencia
													 colonia,calle,noExterior,noInterior,
													 cp,estado,delMunicipio,telefono,paisinfo,
													 //Info Laboral
													 empresa,coloniaemp,calleemp,noemp,
													 cpemp,estadoemp,delmunicipioemp,telefonoemp,cargoemp);
		</cfscript>
	</cffunction> --->

	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoAcademica" access="public" hint="Consulta la Informacion academica de un alumno o aspirante">
		<cfargument name="pkAlumno"    type="numeric" required="yes">
		<cfargument name="pkAspirante" type="numeric" required="yes">
		<cfscript>
			Respuesta = StructNew();
			Respuesta = dao.obtenerInfoAcademica(pkAlumno, pkAspirante);
		    return Respuesta;
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="cambiaEstadoRegistro" access="public" hint="Consulta la Informacion academica de un alumno o aspirante">
		<cfargument name="pkRegistro"    type="numeric" required="yes" hint="Identificador del registro">
		<cfargument name="estado" type="numeric" required="yes" hint="Estado a actualizar">
		<cfscript>
			return  dao.cambiaEstadoRegistro(pkRegistro, estado);
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerNivelaEstudiar" access="public" hint="Obtiene el nivel que se encuentra estudiando el alumno">
		<cfargument name="pkAlumno"    type="numeric" required="yes" hint="Identificador del alumno">
		<cfscript>
			resultado = dao.obtenerNivelaEstudiar(pkAlumno);
		    return resultado;
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoProfesional" access="public" hint="Consulta la Informacion profesional de un alumno o aspirante">
		<cfargument name="pkAlumno"    type="numeric" required="yes">
		<cfargument name="pkAspirante" type="numeric" required="yes">
		<cfscript>
			Respuesta = StructNew();
			Respuesta = dao.obtenerInfoProfesional(pkAlumno, pkAspirante);
		    return Respuesta;
		</cfscript>
	</cffunction>
	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoDocente" access="public" hint="Consulta la Informacion de labor docente de un alumno o aspirante">
		<cfargument name="pkAlumno"    type="numeric" required="yes">
		<cfargument name="pkAspirante" type="numeric" required="yes">
		<cfscript>
			Respuesta = StructNew();
			Respuesta = dao.obtenerInfoDocente(pkAlumno, pkAspirante);
		    return Respuesta;
		</cfscript>
	</cffunction>
	<!---
	* Fecha: Octubre 5, 2015
	* @author: Peña Alba Aldo
	* --->
	<cffunction name="obtenerInfoInvestigacion" access="public" hint="Consulta la Informacion de labor docente de un alumno o aspirante">
		<cfargument name="pkAlumno"    type="numeric" required="yes">
		<cfargument name="pkAspirante" type="numeric" required="yes">
		<cfscript>
			Respuesta = StructNew();
			Respuesta = dao.obtenerInfoInvestigacion(pkAlumno, pkAspirante);
		    return Respuesta;
		</cfscript>
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
		<cfargument name="sexo" type="numeric" default="0"required="no">
		<cfargument name="fechaNac" type="string" required="no">
		<cfargument name="estadoNac" type="any" default="0" required="no">
		<cfargument name="paisNac" type="any" default="0" required="no">
		<cfargument name="estadoCivil" type="numeric" default="0" required="no">
		<cfargument name="calle" type="string" required="no">
		<cfargument name="numExt" type="numeric" default="0" required="no">
		<cfargument name="colonia" type="string" required="no">
		<cfargument name="delomncp" type="numeric" default="0" required="no">
		<cfargument name="cp" type="numeric" default="0" required="no">
        <cfargument name="estado" type="numeric" default="0" required="no">
		<cfargument name="pais" type="numeric" default="0" required="no">
		<cfargument name="telefono" type="string" required="no">
		<cfargument name="telefono_oficina" type="string" required="no">
		<cfargument name="telefono_movil" type="string" required="no">
		<cfargument name="extension" type="string" required="no">
		<cfargument name="correoInst" type="string" required="no">
		<cfargument name="correoAlt" type="string" required="no">
		<cfscript>
			Respuesta = StructNew();
			Respuesta.Guardar = dao.guardarDatosGenerales(numRegistro, estatus, Ur, nombre, apellidoPat, apellidoMat, rfc, curp, sexo, fechaNac, estadoNac, paisNac,estadoCivil, calle, numExt, colonia, delomncp, cp, estado, pais, telefono, telefono_oficina, telefono_movil, extension, correoInst, correoAlt);
			return Respuesta;
		</cfscript>
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
		<cfscript>
			Respuesta = StructNew();
			Respuesta.Guardar = dao.guardarDatosAcademicos(alumno, aspirante, nivel, tipo, pais, institucion, dependencia, carrera, fechaInicio, fechaFin, titulo, cedula, fechaTitulo);
			return Respuesta;
		</cfscript>
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
		<cfscript>
			Respuesta = StructNew();
			Respuesta.Guardar = dao.guardarDatosProfesionales(alumno, aspirante, institucion, tipoInstitucion, puesto, fechaInicio, fechaTermino, actividades);
			return Respuesta;
		</cfscript>
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
		<cfscript>
			Respuesta = StructNew();
			Respuesta.Guardar = dao.guardarDatosInvestigacion(alumno, aspirante, tipo_proy, tipo_part, nombre_profesor, fechaInicio, fechaTermino, clave_proy);
			return Respuesta;
		</cfscript>
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
		<cfscript>
			Respuesta = StructNew();
			Respuesta.Guardar = dao.guardarDatosDocente(alumno, aspirante, institucion, dependencia, materia, fechaInicio, fechaTermino);
			return Respuesta;
		</cfscript>
	</cffunction>
	<!---<!---
	* Fecha: Marzo 25, 2014
	* @author: Antonio Alvarez
	* --->
	<cffunction name="getInfoAlumno" access="public" hint="Consulta la Informacion de un Alumno">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.getInfoAlumno(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Marzo 29, 2014
	* @author: Antonio Alvarez
	* --->
	<cffunction name="getEstadoAvanceAlumno" access="public" hint="Consulta el estado de avance en la inscripcion de un Alumno">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.getEstadoAvanceAlumno(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Descripcion modificacion: Se complementa la funcion para regresar la estructura con la informacion insertada
	* Fecha modificacion: Abril 25, 2014
	* Autor modificacion: Antonio Alvarez
	*--------------------------------------
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarTrabajoInvestigacion" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="trabajoInv" type="string" required="yes">
		<cfargument name="fechaIniDuracionTrab" type="string" required="yes">
		<cfargument name="fechaFinDuracionTrab" type="string" required="yes">
		<cfargument name="publicado" type="numeric" required="yes">
		<cfargument name="referenciasTrabInv" type="string" required="yes">
		<cfargument name="objetivosTrabInv" type="string" required="yes">
		<cfargument name="resultadosTrabInv" type="string" required="yes">
		<cfargument name="clasificacionTI" type="numeric" required="yes">
		<cfargument name="estadoTI" type="numeric" required="yes">
		<cfscript>
			var strResult = structNew();
			var result = dao.guardarTrabajoInvestigacion(pkAlumno,trabajoInv,fechaIniDuracionTrab,fechaFinDuracionTrab,publicado,
													referenciasTrabInv,objetivosTrabInv,resultadosTrabInv,clasificacionTI,estadoTI);
			if (result.RECORDCOUNT GT 0) {
				strResult.pk				= result.PK_TRABAJO;
				strResult.trabajo			= result.TRABAJO;
				strResult.pkEstado			= result.FK_ESTADO;
				strResult.estado			= result.ESTADO;
				strResult.pkClasificacion	= result.FK_CLASIFICACION;
				strResult.clasificacion		= result.CLASIFICACION;
				strResult.publicado			= result.PUBLICADO;
				strResult.fechaIni			= result.FECHA_INI;
				strResult.fechaFin			= result.FECHA_FIN;
				strResult.referencias		= result.REFERENCIAS;
				strResult.objetivos			= result.OBJETIVOS;
				strResult.resultados		= result.RESULTADOS;
			} else {
				strResult.pk				= 0;
			}
			return strResult;
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 25, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="eliminarTrabajoInv" access="public" output="false" returntype="string">
		<cfargument name="pkTrabajoInv" type="numeric" required="yes">
		<cfscript>
			return dao.eliminarTrabajoInv(pkTrabajoInv);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerTrabajosInv" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.obtenerTrabajosInv(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerLaborDocente" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.obtenerLaborDocente(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Descripcion modificacion: Se complementa la funcion para regresar la estructura con la informacion insertada
	* Fecha modificacion: Abril 25, 2014
	* Autor modificacion: Antonio Alvarez
	*--------------------------------------
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarLaborDocente" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="escuelaLD" type="string" required="yes">
		<cfargument name="institucionLD" type="string" required="yes">
		<cfargument name="fechaIniLaborLD" type="string" required="yes">
		<cfargument name="fechaFinLaborLD" type="string" required="yes">
        <cfargument name="asignaturaImpartidaLD" type="string" required="yes">
        <cfscript>
			var strResult = structNew();
			var result = dao.guardarLaborDocente(pkAlumno,escuelaLD,institucionLD,fechaIniLaborLD,fechaFinLaborLD,asignaturaImpartidaLD);
			if (result.RECORDCOUNT GT 0) {
				strResult.pk			= result.PK;
				strResult.institucion	= result.INSTITUCION;
				strResult.fechaIni		= result.FECHA_INI;
				strResult.fechaFin		= result.FECHA_FIN;
				strResult.escuela		= result.ESCUELA;
				strResult.asignatura	= result.ASIGNATURA;
			} else {
				strResult.pk				= 0;
			}
			return strResult;
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 25, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="eliminarLaborDocente" access="public" output="false" returntype="string">
		<cfargument name="pkLaborDocente" type="numeric" required="yes">
		<cfscript>
			return dao.eliminarLaborDocente(pkLaborDocente);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerExperiencia" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.obtenerExperiencia(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Descripcion modificacion: Se complementa la funcion para regresar la estructura con la informacion insertada
	* Fecha modificacion: Abril 22, 2014
	* Autor modificacion: Antonio Alvarez
	*--------------------------------------
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarExperiencia" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="organismoExp" type="string" required="yes">
		<cfargument name="puestoExp" type="string" required="yes">
		<cfargument name="fechaIniPeriodoExp" type="string" required="yes">
		<cfargument name="fechaFinPeriodoExp" type="string" required="yes">
        <cfargument name="actividadesExp" type="string" required="yes">
		<cfargument name="clasificacionExp" type="numeric" required="yes">
        <cfscript>
			var strResult = structNew();
			var result = dao.guardarExperiencia(pkAlumno,organismoExp,puestoExp,fechaIniPeriodoExp,fechaFinPeriodoExp,actividadesExp,clasificacionExp);
			if (result.RECORDCOUNT GT 0) {
				strResult.pk				= result.PK;
				strResult.institucion		= result.INSTITUCION;
				strResult.puesto			= result.PUESTO;
				strResult.fechaini			= result.FECHA_INI;
				strResult.fechafin			= result.FECHA_FIN;
				strResult.pkclasificacion	= result.PK_CLASIFICACION;
				strResult.clasificacion		= result.CLASIFICACION;
				strResult.actividades		= result.ACTIVIDADES;
			} else {
				strResult.pk				= 0;
			}
			return strResult;
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 25, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="eliminarExperiencia" access="public" output="false" returntype="string">
		<cfargument name="pkExperiencia" type="numeric" required="yes">
		<cfscript>
			return dao.eliminarExperiencia(pkExperiencia);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerEstudios" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
        <cfscript>
			return dao.obtenerEstudios(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarInformacionEstudios" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="noCedulaEstu" type="string" required="yes">
		<cfargument name="tituloProfesionalEstu" type="string" required="yes">
		<cfargument name="fechaEstu" type="string" required="yes">
		<cfargument name="tesisEstu" type="string" required="yes">
        <cfargument name="carreraEstu" type="string" required="yes">
        <cfargument name="estudiosFechaIni" type="string" required="yes">
        <cfargument name="estudiosFechaFin" type="string" required="yes">
		<cfargument name="paisEstu" type="numeric" required="yes">
        <cfargument name="incorporadaEstu" type="string" required="yes">
        <cfargument name="institucionEstu" type="string" required="yes">
        <cfargument name="flagTipo" type="numeric" required="yes">
        <cfscript>
			if(flagTipo eq 1)
				return dao.guardarInformacionEstudios(pkAlumno,noCedulaEstu,tituloProfesionalEstu,fechaEstu,tesisEstu,carreraEstu,estudiosFechaIni
													,estudiosFechaFin,paisEstu,incorporadaEstu,institucionEstu);
			else if(flagTipo eq 2)
				return dao.actualizarInformacionEstudios(pkAlumno,noCedulaEstu,tituloProfesionalEstu,fechaEstu,tesisEstu,carreraEstu,estudiosFechaIni
													,estudiosFechaFin,paisEstu,incorporadaEstu,institucionEstu);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarInformacionEstudiosPost" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="institucionPost" type="string" required="yes">
		<cfargument name="dependientePost" type="string" required="yes">
		<cfargument name="tesisGradoPost" type="string" required="yes">
		<cfargument name="paisPost" type="numeric" required="yes">
        <cfargument name="carreraPost" type="string" required="yes">
		<cfargument name="estudiosPostFechaIni" type="string" required="yes">
		<cfargument name="estudiosPostFechaFin" type="string" required="yes">
		<cfargument name="fechaExamPost" type="string" required="yes">
        <cfargument name="gradoAcademicoPost" type="string" required="yes">
        <cfargument name="becaEstudiosPost" type="string" required="yes">
        <cfargument name="institucionOtorgaPost" type="string" required="yes">
        <cfargument name="flagTipo" type="numeric" required="yes">
        <cfscript>
			if(flagTipo eq 1)
				return dao.guardarInformacionEstudiosPost(pkAlumno,institucionPost,dependientePost,tesisGradoPost, paisPost, carreraPost, estudiosPostFechaIni,
											estudiosPostFechaFin, fechaExamPost, gradoAcademicoPost, becaEstudiosPost, institucionOtorgaPost);
			else if(flagTipo eq 2)
				return dao.actualizarInformacionEstudiosPost(pkAlumno, institucionPost, dependientePost, tesisGradoPost, paisPost, carreraPost, estudiosPostFechaIni,
											estudiosPostFechaFin, fechaExamPost, gradoAcademicoPost, becaEstudiosPost, institucionOtorgaPost);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerEstudiosPost" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
        <cfscript>
			return dao.obtenerEstudiosPost(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerIdiomas" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
        <cfscript>
			return dao.obtenerIdiomas(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarIdioma" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="idioma" type="numeric" required="yes">
		<cfargument name="conocimientoIdioma" type="numeric" required="yes">
        <cfscript>
			var strResult = structNew();
			var result = dao.guardarIdioma(pkAlumno,idioma,conocimientoIdioma);
			if (result.RECORDCOUNT GT 0) {
				strResult.pk = result.PK;
				strResult.idioma = result.DSIDIOMA;
				strResult.dominio = result.DSDOMINIO;
			} else {
				strResult.pk = 0;
			}
			return strResult;
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 11, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="eliminarIdioma" access="public" output="false" returntype="string">
		<cfargument name="pkIdioma" type="numeric" required="yes">
		<cfscript>
			return dao.eliminarIdioma(pkIdioma);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 28, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="actualizarMotivos" access="public" output="false" hint="Actualiza la exposicion de motivos">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="motivos" type="string" required="yes">
		<cfscript>
			return dao.actualizarMotivos(pkAlumno, motivos);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatNacionalidad" access="public">
        <cfscript>
			return dao.obtenerCatNacionalidad();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatEdoCivil" access="public">
        <cfscript>
			return dao.obtenerCatEdoCivil();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatGenero" access="public">
        <cfscript>
			return dao.obtenerCatGenero();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatPais" access="public">
        <cfscript>
			return dao.obtenerCatPais();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatIdioma" access="public">
        <cfscript>
			return dao.obtenerCatIdioma();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatConocimientoIdioma" access="public">
        <cfscript>
			return dao.obtenerCatConocimientoIdioma();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatClasfExperiencia" access="public">
        <cfscript>
			return dao.obtenerCatClasfExperiencia();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatClasfTrabajoInv" access="public">
        <cfscript>
			return dao.obtenerCatClasfTrabajoInv();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatEstadoTrabajoInv" access="public">
        <cfscript>
			return dao.obtenerCatEstadoTrabajoInv();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="obtenerCatTipoAspirante" access="public">
        <cfscript>
			return dao.obtenerCatTipoAspirante();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 28, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="obtenerCatEscuelas" access="public">
		<cfscript>
			return dao.obtenerCatEscuelas();
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 29, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="cargarProgramasPorEscuela" access="public">
		<cfargument name="pkUR" type="string" required="yes">
		<cfscript>
			return dao.cargarProgramasPorEscuela(pkUR);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 29, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="finalizarRegistro" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="pkPrograma" type="numeric" required="yes">
		<cfscript>
			return dao.finalizarRegistro(pkAlumno, pkPrograma);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Mayo 07, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="getDocumentosAlumno" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfscript>
			return dao.getDocumentosAlumno(pkAlumno);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Mayo 07, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="insertarDocumento" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="pkTipoDocumento" type="numeric" required="yes">
		<cfargument name="nombreDocumento" type="string" required="yes">
		<cfargument name="nombreOriginal" type="string" required="yes">
		<cfscript>
			return dao.insertarDocumento(pkAlumno, pkTipoDocumento, nombreDocumento, nombreOriginal);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Mayo 07, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="borrarDocumento" access="public">
		<cfargument name="pkAlumno" type="numeric" required="yes">
		<cfargument name="pkTipoDocumento" type="numeric" required="yes">
		<cfscript>
			return dao.borrarDocumento(pkAlumno, pkTipoDocumento);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Mayo 07, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="getDirectorioDocumento" access="public">
		<cfargument name="pkTipoDocumento" type="numeric" required="yes">
		<cfscript>
			return dao.getDirectorioDocumento(pkTipoDocumento);
		</cfscript>
	</cffunction> --->

	<!---
	* Fecha: Novimbre 26, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="saveProgramaIndividual" access="public" hint="Guarda el programa individual">
		<cfargument name="directorTesis" 		type="numeric" required="yes" hint="identificador del direcot de tesis">
		<cfargument name="areaConocimiento" 	type="numeric" required="yes" hint="identificador del area de conocimiento">
		<cfargument name="programaAcademico" 	type="numeric" required="yes" hint="identificador del programa individual">
		<cfargument name="alumno" 				type="numeric" required="yes" hint="identificador del alumno">
		<cfargument name="tiempo" 				type="numeric" required="yes" hint="identificador del modo de cursar">
		<cfscript>
		var pkProgramaIndiviudual = dao.saveProgramaIndividual(directorTesis,areaConocimiento,programaAcademico,alumno,tiempo);
			return pkProgramaIndiviudual;
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Diciembre 02, 2015
	* @author: Olguin Gallegos Claudia
	--->

	<cffunction name="saveCargaAcademica" access="public" hint="Guarda toda la carga academica de un alumno">
		<cfargument name="pkAsignatura" 							type="string" required="yes" hint="identificador del pk de la asignatura">
		<cfargument name="pkSemestre" 								type="string" required="yes" hint="identificador del semestre">
		<cfargument name="pkAlumno" 									type="numeric" required="yes" hint="identificador del pk del alumno">
		<cfargument name="area_conocimiento" 					type="numeric" required="yes" hint="identificador del area de conocimiento">
		<cfargument name="programa_academico" 				type="numeric" required="yes" hint="identificador del programa academico">
		<cfargument name="asignacionProfesor" 				type="string" required="yes" hint="identificador de la asignacion del profesor">
		<cfscript>
		var pkProgramaIndiviudual = dao.saveCargaAcademica(pkAsignatura,pkSemestre,pkAlumno,area_conocimiento,programa_academico,asignacionProfesor);
		return pkProgramaIndiviudual;
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Noviembre 26, 2014
	* @author Aaron Quintana Gomez
	* Descripcion: Guarda la exposicion de motivos
	--->
	<cffunction name="guardarMotivos" access="public" output="false" hint="Guarda la exposicion de motivos">
		<cfargument name="pkAlumno"          type="any" required="yes">
		<cfargument name="programaPosgrado"  type="any" required="yes">
		<cfargument name="expMotivos"        type="any" required="yes">
		<cfscript>
			return dao.guardarMotivos(pkAlumno,programaPosgrado,expMotivos);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Noviembre 26, 2014
	* @author Aldo Peña Alba
	* Descripcion: Guarda los documentos comprabatorios de un alumno
	--->
	<cffunction name="guardarDocumentosAlumno" access="public" output="false" hint="Guarda la exposicion de motivos">
		<cfargument name="pkAlumno" 	type="numeric" 	required="yes" 	hint="identificador del alumno">
		<cfargument name="tipoDoc" 	    type="string" 	required="yes" 	hint="tipo de documento">
		<cfargument name="nombreDoc" 	type="string" 	required="yes" 	hint="nombre del documento">
		<cfscript>
			return dao.guardarDocumentosAlumno(pkAlumno,tipoDoc, nombreDoc);
		</cfscript>
	</cffunction>

</cfcomponent>
