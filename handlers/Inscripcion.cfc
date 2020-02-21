<!---
* =========================================================================
* IPN - CICATA
* Sistema: SCEP
* Modulo: Posgrado
* Sub modulo: Inscripcion
* Fecha: 19 Febrero 2020
* Descripcion: Handler para crear cuenta
* =========================================================================
--->

<cfcomponent>

	<cffunction name="index" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var cnCatalogos		= getModel("catalogos.CN_Catalogos");
			var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');

			Session.Usuario.ROLES = "";
			var pkPersona = 0;
			prc.estadoCivil = cnCatalogos.getEstadoCivil();
			Event.setLayout("cuenta");
			Event.setView("cuenta/registro");
			//Event.setLayout("inscripcion");
			//Event.setView("inscripcion/datosGenerales");
		</cfscript>
	</cffunction>
	
	<cffunction name="creaCuenta" access="public" output="false" returntype="string" hint="Crea la cuenta del aspirante">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			prc.creaCuenta = cnInscripcion.creaCuenta(rc.nombre, rc.apellidoPat, rc.apellidoMat, rc.rfc, rc.curp, /*rc.sexo,*/
								 rc.fechaNac, rc.estadoCivil, rc.telefono, rc.correo, rc.telefono_oficina, rc.extension);
		   event.renderData(type="json", data = prc.creaCuenta);
		</cfscript>
	</cffunction>

	<cffunction name="confirmarCuenta" access="public" output="false" returntype="string" hint="Confirma la cuenta de la persona">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			prc.creaCuenta = cnInscripcion.creaCuenta(rc.nombre, rc.apellidoPat, rc.apellidoMat, rc.rfc, rc.curp, /*rc.sexo,*/
								 rc.fechaNac, rc.estadoCivil, rc.telefono, rc.correo, rc.telefono_oficina, rc.extension);
		   event.renderData(type="json", data = prc.creaCuenta);
		</cfscript>
	</cffunction>


	<cffunction name="infoAcademica" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var cnCatalogos		= getModel("catalogos.CN_Catalogos");
			var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');

			Session.Usuario.ROLES = "";
			var pkPersona = 0;
			prc.estadoCivil = cnCatalogos.getEstadoCivil();
			Event.setLayout("inscripcion");
			Event.setView("inscripcion/infoAcademica");
		</cfscript>
	</cffunction>

	<cffunction name="experienciaProfesional" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var cnCatalogos		= getModel("catalogos.CN_Catalogos");
			var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');

			Session.Usuario.ROLES = "";
			var pkPersona = 0;
			prc.estadoCivil = cnCatalogos.getEstadoCivil();
			Event.setLayout("inscripcion");
			Event.setView("inscripcion/experienciaProfesional");
		</cfscript>
	</cffunction>

	<cffunction name="laborDocente" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var cnCatalogos		= getModel("catalogos.CN_Catalogos");
			var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');

			Session.Usuario.ROLES = "";
			var pkPersona = 0;
			prc.estadoCivil = cnCatalogos.getEstadoCivil();
			Event.setLayout("inscripcion");
			Event.setView("inscripcion/laborDocente");
		</cfscript>
	</cffunction>

	<cffunction name="trabajosInvestigacion" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var cnCatalogos		= getModel("catalogos.CN_Catalogos");
			var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');

			Session.Usuario.ROLES = "";
			var pkPersona = 0;
			prc.estadoCivil = cnCatalogos.getEstadoCivil();
			Event.setLayout("inscripcion");
			Event.setView("inscripcion/trabajosInvestigacion");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="indexRespaldo" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var cnInscripcion		= getModel("inscripcion.CN_Inscripcion");
			var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');

			Session.Usuario.ROLES = "";
			var pkPersona = 0;//sessionUsuario.PK_PERSONA;

			prc.infoUsuario		= cnInscripcion.obtenerInfoAlumno(pkPersona);
			//prc.infoAcademica   = cnInscripcion.obtenerInfoAcademica(0, 0);
			//prc.infoProfesional = cnInscripcion.obtenerInfoProfesional(0,0);
			//prc.infoDocente = cnInscripcion.obtenerInfoDocente(0,0);
			//prc.infoInvestigacion= cnInscripcion.obtenerInfoInvestigacion(0,0);

			//WriteDump(sessionUsuario);
			//abort;
		 //var sessionUsuario		= Session.usuario;
			//Se revisa que exista el PK_ALUMNO en SESSION
			//writedump("entra a INDEX Inscripción");
			//abort;
			/*var cnInscripcion		= getModel("inscripcion.CN_Inscripcion");
			var pkPersona = sessionUsuario.PK_PERSONA;
			prc.infoUsuario		= cnInscripcion.obtenerInfoAlumno(pkPersona);

			//prc.infoAcademica   = cnInscripcion.obtenerInfoAcademica(sessionUsuario.PKALUMNO, sessionUsuario.PK_ASPIRANTE);
			prc.infoAcademica   = cnInscripcion.obtenerInfoAcademica(Session.Usuario.PK_ALUMNO, Session.Usuario.PKUSUARIO);
			prc.infoProfesional = cnInscripcion.obtenerInfoProfesional(Session.Usuario.PK_ALUMNO,Session.Usuario.PKUSUARIO);
			prc.infoDocente = cnInscripcion.obtenerInfoDocente(Session.Usuario.PK_ALUMNO,Session.Usuario.PKUSUARIO);
			prc.infoInvestigacion= cnInscripcion.obtenerInfoInvestigacion(Session.Usuario.PK_ALUMNO,Session.Usuario.PKUSUARIO);

			*/

			Event.setLayout("inscripcion");
			Event.setView("inscripcion/Registro");
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerProyectosInv" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			writedump(rc);
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.ProyectosInv = cnCatalogos.getCatalogoProyectosInv (rc.anio, rc.titulo);
			event.renderData(type="json", data = prc.ProyectosInv);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerInfoAcademica" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			writedump(rc);
			//abort;
			var cnInscripcion		= getModel("inscripcion.CN_Inscripcion");
			prc.infoAcademica = cnInscripcion.obtenerInfoAcademica(rc.alumno, rc.aspirante);
			event.renderData(type="json", data = prc.infoAcademica);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Peña Alba
	--->
	<cffunction name="cambiaEstadoRegistro" access="public" output="false" returntype="string" hint="Cambia el estado del registro">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			var cnInscripcion		= getModel("inscripcion.CN_Inscripcion");
			prc.resultado = cnInscripcion.cambiaEstadoRegistro(rc.pkRegistro, rc.estado);
			prc.infoAcademica = cnInscripcion.obtenerInfoAcademica(rc.fkAlumno, 0);
			event.renderData(type="json", data = prc.infoAcademica);
		</cfscript>
	</cffunction>


	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Peña Alba
	--->
	<cffunction name="obtenerInfoDocente" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			writedump(rc);
			//abort;
			var cnInscripcion		= getModel("inscripcion.CN_Inscripcion");
			prc.infoDocente = cnInscripcion.obtenerInfoDocente(rc.alumno, rc.aspirante);
			event.renderData(type="json", data = prc.infoDocente);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerInfoProfesional" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			writedump(rc);
			//abort;
			var cnInscripcion		= getModel("inscripcion.CN_Inscripcion");
			prc.infoProfesional = cnInscripcion.obtenerInfoProfesional(rc.alumno, rc.aspirante);
			event.renderData(type="json", data = prc.infoProfesional);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerInfoInvestigacion" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			writedump(rc);
			//abort;
			var cnInscripcion		= getModel("inscripcion.CN_Inscripcion");
			prc.infoInvestigacion = cnInscripcion.obtenerInfoInvestigacion(rc.alumno, rc.aspirante);
			event.renderData(type="json", data = prc.infoInvestigacion);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerDireccion" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			writedump(rc);
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.Direccion = cnCatalogos.getInfoCP(rc.PKCP);
			event.renderData(type="json", data = prc.Direccion);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerNiveles" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			//writedump(rc);

			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.Niveles = cnCatalogos.getCatalogoNiveles();
			//WriteDump(prc.Niveles);
			//abort;
			event.renderData(type="json", data = prc.Niveles);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerPaises" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			//writedump(rc);
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.Paises = cnCatalogos.getPaises(pkPais);
			WriteDump(prc.Paises);
			//abort;
			event.renderData(type="json", data = prc.Paises);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerEstados" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			//writedump(rc);
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.Estados = cnCatalogos.getEstado();
			WriteDump(prc.Estados);
			//abort;
			event.renderData(type="json", data = prc.Estados);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerInstituciones" access="public" output="false" >
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.Instituciones = cnCatalogos.getInfoInstitucion(rc.tipoInst, rc.pais);
			event.renderData(type="json", data = prc.Instituciones);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerDependencias" access="public" output="false" >
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.Dependencia = cnCatalogos.getDependenciasByInstitucion(rc.pkInstitucion);
			event.renderData(type="json", data = prc.Dependencia);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerCarreras" access="public" output="false" >
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.Carreras = cnCatalogos.getCarreras(rc.pkDependencia,pkNivel);
			WriteDump(prc.Carreras);
			abort;
			event.renderData(type="json", data = prc.Carreras );
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="guardarDatosGenerales" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			//rc.fechaNac = DateFormat(rc.fechaNac , "DD/MM/YYYY");
			//WriteDump(rc.fechaNac);
			//WriteDump(rc);
			//abort;
			prc.DatosGenerales = cnInscripcion.guardarDatosGenerales(rc.numReg, rc.estatus, rc.Ur, rc.nombre, rc.apellidoPat, rc.apellidoMat, rc.rfc, rc.curp, rc.sexo,
								 rc.fechaNac, rc.estadoNac, rc.paisNac, rc.estadoCivil, rc.calle, rc.numExt, rc.colonia, rc.delomncp, rc.cp, rc.estado, rc.pais, rc.telefono,
								 rc.telefono_oficina, rc.telefono_movil, rc.extension, rc.correo_Inst, rc.correo_Alt);
		   event.renderData(type="json", data = prc.DatosGenerales);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="guardarDatosAcademicos" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			prc.DatosAcademicos = cnInscripcion.guardarDatosAcademicos(rc.alumno, rc.aspirante, rc.nivel, rc.tipo, rc.pais, rc.institucion, rc.dependencia, rc.carrera, rc.fechaInicio,
																	rc.fechaFin,rc.titulo, rc.cedula, rc.fechaTitulo);
		   event.renderData(type="json", data = prc.DatosAcademicos);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerTipoParticipacion" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.TipoParticipacion = cnCatalogos.getTipoParticipacion();
		   event.renderData(type="json", data = prc.TipoParticipacion);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="obtenerTipoProyecto" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.TipoProyecto = cnCatalogos.getTipoProyecto();
		   event.renderData(type="json", data = prc.TipoProyecto);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="guardarDatosProfesionales" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			//WriteDump(rc);
			//abort;
			prc.DatosProfesionales = cnInscripcion.guardarDatosProfesionales(rc.alumno, rc.aspirante, rc.institucion, rc.tipoInstitucion, rc.puesto, rc.fechaInicio, rc.fechaTermino, rc.actividades);
		   event.renderData(type="json", data = prc.DatosProfesionales);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="guardarDatosInvestigacion" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			//WriteDump(rc);
			//abort;
			prc.DatosInvestigacion = cnInscripcion.guardarDatosInvestigacion(rc.alumno, rc.aspirante, rc.tipo_proy, rc.tipo_part, rc.nombre_profesor, rc.fechaInicio, rc.fechaTermino, rc.clave_proy);
		   event.renderData(type="json", data = prc.DatosInvestigacion);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="guardarDatosDocente" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
		 	var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			//WriteDump(rc);
			//abort;
			prc.DatosDocente = cnInscripcion.guardarDatosDocente(rc.alumno, rc.aspirante, rc.institucion, rc.dependencia, rc.materia ,rc.fechaInicio, rc.fechaTermino);
		   event.renderData(type="json", data = prc.DatosDocente);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="generarUsuario" access="public" hint="Guarda la informacion personal y genera un usario">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= cnInscripcion.generarUsuario(rc.apaterno, rc.amaterno, rc.nombre, rc.fechaNac, rc.lugarNac, rc.rfc,
															   rc.curp, rc.email, rc.nacionalidad, rc.edoCivil, rc.genero,
															   //Info Residencia
															   rc.colonia,rc.calle,rc.noExterior,rc.noInterior,
															   rc.cp,rc.estado,rc.delMunicipio,rc.telefono,rc.paisinfo,
															   //Info Laboral
															   rc.empresa,rc.coloniaemp,rc.calleemp,rc.noemp,
															   rc.cpemp,rc.estadoemp,rc.delmunicipioemp,rc.telefonoemp,rc.cargoemp);
			if (pkAlumno GT 0) {
				//se construye la estructura de la session
				strUsuario			= structNew();
				strUsuario.pkAlumno	= pkAlumno;
				//Se agrega la estructura de usuario al "Session"
				getPlugin("SessionStorage").setVar("usuario",strUsuario);
				//Se redirecciona hacia la vista ya con los datos en el Session
				setNextEvent("Inscripcion.index");
			} else {
				//Si hay un error se redirecciona a la vista del Login
				setNextEvent("Main.index");
			}
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 2, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="logout" access="public" hint="Limpia la sesion y redirecciona al usuario a la vista del Login">
		<cfargument name="Event" type="any">
		<cfscript>
			getPlugin("SessionStorage").removeStorage();
			setNextEvent("Main.index");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="actualizarInformacionPersonal" access="public" output="false" returntype="string" hint="Actualiza la informacion personal">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.actualizarInformacionPersonal(pkAlumno,rc.apaterno, rc.amaterno, rc.nombre, rc.fechaNac, rc.lugarNac,
																			  rc.rfc, rc.curp, rc.email, rc.nacionalidad, rc.edoCivil, rc.genero,
																			  //Info Residencia
																			  rc.colonia,rc.calle,rc.noExterior,rc.noInterior,
																			  rc.cp,rc.estado,rc.delMunicipio,rc.telefono,rc.paisinfo,
																			  //Info Laboral
																			  rc.empresa,rc.coloniaemp,rc.calleemp,rc.noemp,
																			  rc.cpemp,rc.estadoemp,rc.delmunicipioemp,rc.telefonoemp,rc.cargoemp);
			strResult.resultado	= resultado;
			//Se regresa el resultado en formato JSON
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 28, 2014
	* @author Antonio Alvarez
	--->
	<!---<cffunction name="actualizarInformacionDeResidencia" access="public" output="false" returntype="string" hint="Actualiza la informacion de residencia">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.actualizarInformacionDeResidencia(pkAlumno,rc.colonia,rc.calle,rc.noExterior,rc.noInterior,
																				  rc.cp,rc.estado,rc.delMunicipio,rc.telefono,rc.paisinfo);
			strResult.resultado	= resultado;
			//Se regresa el resultado en formato JSON
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>--->

	<!---
	* Fecha creacion: Marzo 28, 2014
	* @author Antonio Alvarez
	--->
	<!---<cffunction name="actualizarInformacionLaboral" access="public" output="false" returntype="string" hint="Actualiza la informacion laboral">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.actualizarInformacionLaboral(pkAlumno,rc.empresa,rc.coloniaemp,rc.calleemp,rc.noemp,
																			 rc.cpemp,rc.estadoemp,rc.delmunicipioemp,rc.telefonoemp,rc.cargoemp);
			strResult.resultado	= resultado;
			//Se regresa el resultado en formato JSON
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>--->

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarTrabajoInvestigacion" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.guardarTrabajoInvestigacion(pkAlumno,rc.trabajoInv,rc.fechaIniDuracionTrab,
								rc.fechaFinDuracionTrab,rc.publicado,rc.referenciasTrabInv,rc.objetivosTrabInv,rc.resultadosTrabInv,rc.clasificacionTI,rc.estadoTI);
			return SerializeJSON(resultado);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 25, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="eliminarTrabajoInv" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var resultado		= cnInscripcion.eliminarTrabajoInv(rc.pkTrabajoInv);
			if (resultado GT 0) {
				return rc.pkTrabajoInv;
			} else {
				return 0;
			}
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarLaborDocente" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.guardarLaborDocente(pkAlumno,rc.escuelaLD,rc.institucionLD,
								rc.fechaIniLaborLD,rc.fechaFinLaborLD,rc.asignaturaImpartidaLD);
			return SerializeJSON(resultado);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 25, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="eliminarLaborDocente" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var resultado		= cnInscripcion.eliminarLaborDocente(rc.pkLaborDocente);
			if (resultado GT 0) {
				return rc.pkLaborDocente;
			} else {
				return 0;
			}
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarExperiencia" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.guardarExperiencia(pkAlumno,rc.organismoExp,rc.puestoExp,rc.fechaIniPeriodoExp,rc.fechaFinPeriodoExp,rc.actividadesExp,rc.clasificacionExp);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 25, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="eliminarExperiencia" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var resultado		= cnInscripcion.eliminarExperiencia(rc.pkExperiencia);
			if (resultado GT 0) {
				return rc.pkExperiencia;
			} else {
				return 0;
			}
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarInformacionEstudios" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.guardarInformacionEstudios(pkAlumno,rc.noCedulaEstu,rc.tituloProfesionalEstu,rc.fechaEstu
									,rc.tesisEstu,rc.carreraEstu,rc.estudiosFechaIni,rc.estudiosFechaFin,rc.paisEstu,rc.incorporadaEstu,rc.institucionEstu,rc.flagTipo);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarInformacionEstudiosPost" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.guardarInformacionEstudiosPost(pkAlumno,rc.institucionPost,rc.dependientePost,rc.tesisGradoPost,rc.paisPost
									,rc.carreraPost,estudiosPostFechaIni,rc.estudiosPostFechaFin,rc.fechaExamPost,rc.gradoAcademicoPost,rc.becaEstudiosPost
									,rc.institucionOtorgaPost,rc.flagTipo);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
	<cffunction name="guardarIdioma" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.guardarIdioma(pkAlumno,rc.idioma,rc.conocimientoIdioma);
			strResult.resultado	= resultado;
			return SerializeJSON(strResult);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 11, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="eliminarIdioma" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var strResult		= structNew();
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var resultado		= cnInscripcion.eliminarIdioma(rc.pkIdioma);
			if (resultado GT 0) {
				return rc.pkIdioma;
			} else {
				return 0;
			}
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 28, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="actualizarMotivos" access="public" output="false" returntype="string" hint="Actualiza la exposicion de motivos">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.actualizarMotivos(pkAlumno,rc.motivos);
			return SerializeJSON(resultado);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 29, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="cargarProgramasPorEscuela" access="public" output="false" returntype="string" hint="Carga los programas por escuela">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var programas		= cnInscripcion.cargarProgramasPorEscuela(rc.pkUR);
			//Se regresa el resultado en formato JSON
			return SerializeJSON(programas);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Abril 29, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="finalizarRegistro" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resultado		= cnInscripcion.finalizarRegistro(pkAlumno, rc.programa);
			//Se redirecciona al modulo de "Alumno"
			setNextEvent("Alumno.index");
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Abril 30, 2014
	* @author: Antonio Alvarez
	* --->
	<cffunction name="cargarArchivo" access="public" output="false" returntype="string" hint="Carga un archivo al FTP">
		<cfargument name="Event" type="any">
		<cfscript>
			/*var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var fileMngr		= getModel("utils.fileTransfer.FileManager");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var resFileBD		= "";
			var resultado		= "";
			var qqfile			= rc.FILES;
			var subdirectorio	= cnInscripcion.getDirectorioDocumento(rc.tipoDocumento);
			try {
				resultado = fileMngr.attachFile(qqfile,'siiip','posgrado\'&pkAlumno&'\'&subdirectorio&'\'');//Carpeta Raiz del FTP, Subcarpeta
			} catch (Any Excepcion) {
				var resultado = StructNew();
				resultado.SUCCESS = false;
			}
			if (resultado.SUCCESS){
				//direccion para descargar, esta se puede guardar en la BD concatenada a filename
				var ftpPath = resultado.FTPPATH;
				//Nombre del archivo en el FTP
				var filename = resultado.FILENAME;
				//Nombre original del archivo antes de comprimir
				var originalName = resultado.ORIGINALNAME;
				//Guardar en Base de Datos
				resFileBD = cnInscripcion.insertarDocumento(pkAlumno, rc.tipoDocumento, filename, originalName);
				resultado.pkAlumno = pkAlumno;
				//resultado.thumbnailUrl = "";
				resultado.url = "descargarArchivo?filename=" & filename & "&tipoDocumento=" & rc.tipoDocumento;
				resultado.name = originalName;
				//resultado.size = "";
				resultado.deleteUrl = "borrarArchivo?filename=" & filename & "&tipoDocumento=" & rc.tipoDocumento;
				resultado.deleteType = "DELETE";
				//resultado.deleteWithCredentials = "";

				//Se borran las variables, ya que se regresan por ajax
				resultado.FTPPATH	= "";
				resultado.FILENAME	= "";
				resultado.QQFILE	= qqfile;
			} else {
				resultado.ERROR		= "Error al subir el archivo";
			}

			res = arrayNew(1);
			ArrayAppend(res,resultado);

			final = structNew();
			final.files = res;

			return SerializeJSON(final);*/
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Mayo 07, 2014
	* @author: Antonio Alvarez
	* --->
	<cffunction name="descargarArchivo" access="public" output="false" returntype="void" hint="Descarga un archivo del FTP">
		<cfargument name="Event" type="any">
		<cfscript>
		/*	var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var fileMngr		= getModel("utils.fileTransfer.FileManager");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var fileExtension	= "";
			var subdirectorio	= cnInscripcion.getDirectorioDocumento(rc.tipoDocumento);
			try {
				resultado = fileMngr.downloadFile(rc.filename,'siiip','posgrado\'&pkAlumno&'\'&subdirectorio&'\'');//Carpeta Raiz del FTP, Subcarpeta
				fileExtension=resultado.FILENAME;
				fileExtension=fileExtension.substring(fileExtension.lastIndexOf(".")+1);
				fileExtension= fileExtension.toLowerCase();
			} catch (Any Excepcion) {
				var resultado = StructNew();
				resultado['success'] = false;
			}
			if(resultado.SUCCESS){
				context = GetPageContext();
				context.setFlushOutput(false);
				response = context.getFusionContext().getResponse().getResponse();
				out = response.getOutputStream();
				//ENVIO DEL ARCHIVO AL CLIENTE
				response.setContentLength(resultado.FILESIZE);
				response.setHeader("Content-disposition","attachment; filename=" & replace(resultado.FILENAME," ","_","ALL"));
				switch(fileExtension){
					case "pdf":
						response.setHeader("Content-Type","application/pdf");
					break;
					case "docx":
						response.setHeader("Content-Type","application/msword");
					break;
					case "doc":
						response.setHeader("Content-Type","application/msword");
					break;
				}
				out.write(resultado.FILE.toByteArray());
				out.flush();
				out.close();
			}
			return;*/
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Mayo 07, 2014
	* @author: Antonio Alvarez
	* --->
	<cffunction name="borrarArchivo" access="public" output="false" returntype="string" hint="Elimina un archivo del FTP">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var fileMngr		= getModel("utils.fileTransfer.FileManager");
			var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").pkAlumno;
			var fileExtension	= "";
			var subdirectorio	= cnInscripcion.getDirectorioDocumento(rc.tipoDocumento);
			//No se borra el archivo del FTP, solamente de la Base de Datos
			cnInscripcion.borrarDocumento(pkAlumno, rc.tipoDocumento);
			resultado = structNew();
			resultado['success'] = true;
			return SerializeJSON(resultado);
		</cfscript>
	</cffunction> --->


	<!---
	* Fecha creacion: Noviembre 12, 2015
	* @author Olguin Gallegos Claudia
	--->
	<cffunction name="getAreaConocimiento" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
			<cfscript>
				var rc = Event.getCollection();
				var cnCatalogos = getModel("catalogos.CN_Catalogos");
				prc.AreaConocimiento = cnCatalogos.getAreaConocimiento();
				event.renderData(type="json", data = prc.AreaConocimiento);
			</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Noviembre 12, 2015
	* @author Olguin Gallegos Claudia
	--->
	<cffunction name="getProgramaAcademico" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.PAcademicos = cnCatalogos.getProgramaAcademico(Session.usuario.CVE_DEP,areaConocimiento);
			event.renderData(type="json", data = prc.PAcademicos);
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Noviembre 12, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="getCargaAcademica" access="public" output="false" returntype="string">
	<cfargument name="Event" type="any">
	<cfscript>
		var rc = Event.getCollection();
		var cnCatalogos = getModel("catalogos.CN_Catalogos");
		prc.cargaAcademica = cnCatalogos.getCargaAcademica(programaAcademico);
		event.renderData(type="json", data = prc.cargaAcademica);
	</cfscript>
	</cffunction>

	<!---
	* Fecha: Noviembre 17, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getProgramaIndividual" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.programaIndividual = cnCatalogos.getProgramaIndividual(Session.usuario.CVE_DEP);
			event.renderData(type="json", data=prc.programaIndividual);
		</cfscript>
	</cffunction>

	<!---
	* Fecha: Noviembre 18, 2015
	* @author: Claudia Olguin Gallegos
	--->
	<cffunction name="getTablaPrograma" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
			var cnCatalogos = getModel("catalogos.CN_Catalogos");
			prc.programaIndividual = cnCatalogos.getTablaPrograma(Session.usuario.CVE_DEP,areaConocimiento,programaAcademico);
			event.renderData(type="json", data=prc.programaIndividual);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Noviembre 18, 2015
	* @author Olguin Gallegos Claudia
	--->
	<cffunction name="getDirectorTesis" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
			<cfscript>
				var rc = Event.getCollection();
				var cnCatalogos = getModel("catalogos.CN_Catalogos");
				prc.DirectorTesis = cnCatalogos.getDirectorTesis();
				event.renderData(type="json", data = prc.DirectorTesis);
			</cfscript>
	</cffunction>
		<!---
	* Fecha creacion: Noviembre 26, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="saveProgramaIndividual" access="public" output="false" returntype="string">
		<cfargument name="event" type="any">
		<cfscript>
			var rc = Event.getCollection();
			var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			prc.ProgramaIndividual = cnInscripcion.saveProgramaIndividual(rc.directorTesis,rc.areaConocimiento,rc.programaAcademico,Session.usuario.PKALUMNO,rc.tiempo);
			event.renderData(type="json", data = prc.ProgramaIndividual);
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Diciembre 02, 2015
	* @author: Olguin Gallegos Claudia
	--->
	<cffunction name="saveCargaAcademica" access="public" output="false" returntype="string">
		<cfargument name="event" type="any">
		<cfscript>
			var rc = Event.getCollection();
			var cnInscripcion = getModel("inscripcion.CN_Inscripcion");
			prc.CargaAcademica = cnInscripcion.saveCargaAcademica(rc.pkAsignatura,rc.pkSemestre,Session.usuario.PK_ALUMNO,rc.area_conocimiento,rc.programa_academico,rc.asignacionProfesor);
			event.renderData(type="json", data = prc.CargaAcademica);
		</cfscript>
	</cffunction>

		<!---
	* Fecha creacion : Noviembre 26,2015
	* @author Aaron Quintana Gomez
	* Descripcion : Guarda la Exposicion de motivos
	--->
   <cffunction name="guardarMotivos" access="public" output="false" returntype="string" hint="Actualiza la exposicion de motivos">
	<cfargument name="Event" type="any">
	   <cfscript>
			var rc				= Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var resultado		= cnInscripcion.guardarMotivos(rc.pkAlumno,rc.programaPosgrado,rc.expMotivos);
			return SerializeJSON(resultado);
		</cfscript>
	</cffunction>
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Aldo Pe�a Alba
	--->
	<cffunction name="conectarFTP" access="public" output="false" returntype="string">
		<cfargument name="Event" type="any">
		<cfscript>
		 	var rc = Event.getCollection();
			var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
			var fm = getModel("utils.fileTransfer.FileManager");
			fm.init();
			attachResult  = fm.attachFile("FILE_DATA", "capitalhumano" , "");
			if( attachResult.SUCCESS eq true ){
				event.renderData(type="json", data = attachResult);
				prc.pkDoc = cnInscripcion.guardarDocumentosAlumno(Session.usuario.PK_ALUMNO, rc.tipoDoc, attachResult.FILENAME);
			}
		</cfscript>
	</cffunction>
</cfcomponent>
