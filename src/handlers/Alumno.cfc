<!---
* =========================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Posgrado
* Sub modulo: Alumnos
* Fecha: 19 de Marzo de 2014
* Descripcion: Handler para el modulo de Alumnos
* =========================================================================
--->

<cfcomponent>
	<!---
	* Fecha creacion: Marzo 22, 2014
	* @author Daniel Gutierrez
	--->
	<cffunction name="administrar_inscripcion" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/administrar_inscripcion");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 21, 2014
	* @author Antonio Alvarez
	--->
	<cffunction name="index" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			var objDataStore		= getModel("alumno.CN_Alumno");
			Request.qAlumno			= objDataStore.obtenerInformacionAlumno(1);
			Request.sEstudios		= objDataStore.obtenerEstudios(1);
			Request.sExperiencia	= objDataStore.obtenerExperiencia(1);
			Event.setLayout("alumno");
			Event.setView("alumno/informacion");
		</cfscript>
	</cffunction>


	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Daniel Gutierrez
	--->
	<cffunction name="estado_de_inscripcion" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/estado_de_inscripcion");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Daniel Gutierrez
	--->
	<cffunction name="estado_registro_tema_tesis" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/estado_registro_tema_tesis");
		</cfscript>
	</cffunction>
	
	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Daniel Gutierrez
	--->
	<cffunction name="registro_tema_tesis" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/registro_tema_tesis");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 19, 2014
	* @author Daniel Gutierrez
	--->
	<cffunction name="informacion_academica" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/informacion_academica");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 21, 2014
	* @author Daniel Gutierrez
	--->
	<cffunction name="inscripcion_actual" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/inscripcion_actual");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 22, 2014
	* @author David Monterrosas
	--->
	<cffunction name="revalidacion_estudios" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/revalidacion_estudios");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 22, 2014
	* @author David Monterrosas
	--->
	<cffunction name="solicitud_receso" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/solicitud_receso");
		</cfscript>
	</cffunction>

	<!---
	* Fecha creacion: Marzo 22, 2014
	* @author David Monterrosas
	--->
	<cffunction name="solicitud_baja" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			Event.setLayout("alumno");
			Event.setView("alumno/solicitud_baja");
		</cfscript>
	</cffunction>

	<cffunction name="prueba_pdf" access="public" returntype="void" output="false" hint="Redireccionamiento al layout principal">
		<cfargument name="Event" type="any">
		<cfscript>
		gb = CreateObject("java","com.google.gson.GsonBuilder").init();	   	    	 	
    	Gson = gb.create();   	
    	/*  reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.LineamientosRequest").init();	
    	reporte.setTipoReporte(2);
    	lineamientos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.lista.revision.convocatoria.Lineamientos").init();
    	lineamientos.setFechaRevision("09/09/1990");
    	lineamientos.setEcus("un ecu");
    	variables.arNeverland = [];
    	variables.arNeverland[1] = 1;
    	variables.arNeverland[2] = 1;
    	variables.arNeverland[3] = 0;
    	variables.arNeverland[4] = 1;
    	variables.arNeverland[5] = 1;
    	variables.arNeverland[6] = 1;
    	variables.arNeverland[7] = 1;
    	variables.arNeverland[8] = 1;
    	variables.arNeverland[9] = 1;
    	variables.arNeverland[10] = 1;
    	variables.arNeverland[11] = 1;
    	lineamientos.setCumplimientos(variables.arNeverland);
    	reporte.setLineamientos(lineamientos);  */
    	/* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.ExamenAdmisionRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.administracion.programas.posgrado.DatosExamenAdmision").init();
    	datos.setCiudad("Mexico");
    	datos.setHora("19:00");
    	datos.setDia(9);
    	datos.setMes("septiembre");
    	datos.setAnio(1990);
    	datos.setColegio("Colegio supremo de algo");
    	datos.setNombreAspirante("Rulo Mora");
    	datos.setPrograma("MCC");
    	datos.setStatus(1);
    	reporte.setDatos(datos);   */
    	/*  reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.CartaExposicionMotivosRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.administracion.programas.posgrado.CartaExposicionMotivos").init();
    	datos.setCentroEstudios("CIC");
    	datos.setPrograma("MCC");
    	datos.setMotivos("Motivos personales");
    	datos.setMes("Noviembre");
    	datos.setDia(8);
    	datos.setAnio(2018);
    	reporte.setDatos(datos);  */
    	 /* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.SolicitudInscripcionRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.SolicitudInscripcion").init();
    	datos.setApPaterno("Mora");
    	datos.setApMaterno("Gallardo");
    	datos.setNombre("Rulo");
    	datos.setDomicilio("un domicilio");
    	datos.setColonia("una colonia");
    	datos.setTelefono("5567-1861");
    	datos.setCodigoPostal("07720");
    	datos.setCorreoElectronico("uncorreo@undominio.com");
    	datos.setSexo(1);
    	datos.setCentroEscolar("CIC");
    	datos.setPrograma("MCC");
    	procedencia1 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Procedencia").init();
    	procedencia1.setInstitucion("IPN");
    	procedencia1.setLugar("DF");
    	procedencia1.setPeriodo("2011-2013");
    	procedencia2 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Procedencia").init();
    	procedencia2.setInstitucion("IPN");
    	procedencia2.setLugar("DF");
    	procedencia2.setPeriodo("2010-2013");
    	datos.setStatus(1);
    	inputs = javaCast( "com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Procedencia[]", [procedencia1,procedencia2]);
    	datos.setProcedencias(inputs);
    	programa1 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ProgramaSemestral").init();
    	programa1.setClave("clave");
    	programa1.setActividadAcademica("master");
    	programa1.setProfesor("Professor X");
    	programa1.setLugar("Mexico");
    	programa2 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ProgramaSemestral").init();
    	programa2.setClave("clave");
    	programa2.setActividadAcademica("master");
    	programa2.setProfesor("Professor X");
    	programa2.setLugar("Mexico");
    	programa3 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ProgramaSemestral").init();
    	programa3.setClave("clave");
    	programa3.setActividadAcademica("master");
    	programa3.setProfesor("Professor X");
    	programa3.setLugar("Mexico");
    	programa4 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ProgramaSemestral").init();
    	programa4.setClave("clave");
    	programa4.setActividadAcademica("master");
    	programa4.setProfesor("Professor X");
    	programa4.setLugar("Mexico");
    	inputs2 = javaCast( "com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ProgramaSemestral[]", [programa1,programa2,programa3,programa4]);
    	datos.setProgramas(inputs2);
    	datos.setFecha("09/09/90"); */ 
    	/* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.ProgramaIndividualActividadesRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ProgramaIndividualActividades").init();
    	datos.setFechaDocumento("09/09/1990");
    	datos.setNumeroRegistro("0985632");
    	datos.setNombre("Rulo Mora");
    	datos.setStatus(1);
    	datos.setPrograma("MCC");
    	datos.setEscuela("Escuela");
    	datos.setConsejero("Un consejero");
    	datos.setCreditos(999);
    	datos.setFechaLimite("21/07/2015");
    	asignatura1 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
	   	asignatura2 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura3 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura4 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura5 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura6 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura7 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura8 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura9 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura10 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();
    	asignatura11 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura").init();

    	asignatura1.setClave("01al1");
		asignatura1.setAsignatura("pln");
		asignatura1.setCreditos(100);
		asignatura1.setLugar("gringolandia");
		asignatura2.setClave("01al1");
		asignatura2.setAsignatura("pln");
		asignatura2.setCreditos(100);
		asignatura2.setLugar("gringolandia");
		asignatura3.setClave("01al1");
		asignatura3.setAsignatura("pln");
		asignatura3.setCreditos(100);
		asignatura3.setLugar("gringolandia");
		asignatura4.setClave("01al1");
		asignatura4.setAsignatura("pln");
		asignatura4.setCreditos(100);
		asignatura4.setLugar("gringolandia");
		asignatura5.setClave("01al1");
		asignatura5.setAsignatura("pln");
		asignatura5.setCreditos(100);
		asignatura5.setLugar("gringolandia");
		asignatura6.setClave("01al1");
		asignatura6.setAsignatura("pln");
		asignatura6.setCreditos(100);
		asignatura6.setLugar("gringolandia");
		asignatura7.setClave("01al1");
		asignatura7.setAsignatura("pln");
		asignatura7.setCreditos(100);
		asignatura7.setLugar("gringolandia");
		asignatura8.setClave("01al1");
		asignatura8.setAsignatura("pln");
		asignatura8.setCreditos(100);
		asignatura8.setLugar("gringolandia");
		asignatura9.setClave("01al1");
		asignatura9.setAsignatura("pln");
		asignatura9.setCreditos(100);
		asignatura9.setLugar("gringolandia");
		asignatura10.setClave("01al1");
		asignatura10.setAsignatura("pln");
		asignatura10.setCreditos(100);
		asignatura10.setLugar("germany");
		asignatura11.setClave("01al1");
		asignatura11.setAsignatura("pln");
		asignatura11.setCreditos(100);
		asignatura11.setLugar("gringolandia");
	   	inputs2 = javaCast( "com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.Asignatura[]", [asignatura1,asignatura2,asignatura3,asignatura4,asignatura5,asignatura6,asignatura7,asignatura8,asignatura9,asignatura10,asignatura11]);
	   	datos.setAsignaturas(inputs2); */
	   	/* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.ActaDesignacionComiteTutorialRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ActaDesignacionComiteTutorial").init();
    	datos.setDia(9);
    	datos.setAnio(2015);
    	datos.setMes("septiembre");
    	datos.setColegio("un colegio");
    	datos.setSesion("ordinaria");
    	datos.setNumeroSesion(9);
    	datos.setDia(9);
    	datos.setMes("octubre");
    	datos.setAnio(1999);
    	datos.setNombre("Rulo Mora");
    	datos.setRegistro("9asjlk123");
    	datos.setPrograma("MCC"); */
    	 /*reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.SolicitudAltaBajaAsignaturaRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.SolicitudAltaBajaAsignatura").init();
    	datos.setNombre("Raul");
    	datos.setApPaterno("Mora");
    	datos.setApMaterno("Gallardo");
    	datos.setFecha("09/09/90");
    	datos.setNumeroRegistro("123456789");
    	datos.setNombrePrograma("pinche programa");    	
    	datos.setStatus(1);
    	programa1 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.AsignaturaAltaBaja").init();
    	programa2 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.AsignaturaAltaBaja").init();
    	programa3 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.AsignaturaAltaBaja").init();
    	programa4 = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.AsignaturaAltaBaja").init();
    	programa1.setClave("asdlk");
    	programa1.setActividad("master");
    	programa1.setProfesor("Charles Xavier");
    	programa1.setLugar("Mexicalpan");
    	programa2.setClave("asdlk");
    	programa2.setActividad("master");
    	programa2.setProfesor("Charles Xavier");
    	programa2.setLugar("Mexicalpan");
    	programa3.setClave("asdlk");
    	programa3.setActividad("master");
    	programa3.setProfesor("Charles Xavier");
    	programa3.setLugar("Mexicalpan");
    	programa4.setClave("asdlk");
    	programa4.setActividad("master");
    	programa4.setProfesor("Charles Xavier");
    	programa4.setLugar("Mexicalpan");
    	inputs2 = javaCast( "com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.AsignaturaAltaBaja[]", [programa1,programa2,programa3,programa4]);
    	datos.setAsignaturas(inputs2); */
    	/* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.CartaProtestaRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.CartaProtesta").init();
    	datos.setDia(9);
    	datos.setMes("septiembre");
    	datos.setYear(2015);
    	datos.setColegio("un colegio");
    	datos.setStatus(1);
    	datos.setPrograma("un programa");  */
    	/* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.SolicitudAlumnosRegularesRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.SolicitudAlumnosRegulares").init();
    	datos.setEscuela("CIC");
    	datos.setPrograma("MCC");
    	datos.setPeriodo("2015-01");
		alumnos = createObject("java", "java.util.ArrayList");
		alumno = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.AlumnoRegular").init();		
		alumno.setNombre("Raul Mora");
		alumno.setNacionalidad("mexico");
		alumno.setCurp("MOGR900909HDFRLL03");
		alumno.setAsignatura("Algoritmos");
		alumno.setProfesor("Morpheus");
		alumno.setMovilidad("total");
		alumno.setUnidadAcademica("CIC");
		alumnos.add(alumno);
		alumno = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.AlumnoRegular").init();
		alumno.setNombre("jOSE Raul Mora");
		alumno.setNacionalidad("mexico");
		alumno.setCurp("MOGR900909HDFRLL03");
		alumno.setAsignatura("Algoritmos");
		alumno.setProfesor("Morpheus");
		alumno.setMovilidad("total");
		alumno.setUnidadAcademica("CIC");
		alumnos.add(alumno);
		datos.setAlumnos(alumnos);  */
		 /* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.ProgramaIndividualActividadesBisRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ProgramaIndividualActividadesBis").init();
    	datos.setFechaDocumento("09/09/90");
    	datos.setNombre("Osito Panda");
    	datos.setRegistro("xjn29123v");
    	datos.setStatus(1);
    	datos.setPrograma("MCC");
    	datos.setEscuela("CIC");
    	datos.setFechaLimite("09/09/90");
    	asignaturas = createObject("java", "java.util.ArrayList").init();
    	datos.setAsignaturas(asignaturas);  */
    	/*   reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.SolicitudReinscripcionRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.SolicitudReinscripcion").init();
    	datos.setDomicilio("algo algo");
    	datos.setEscuela("ESCOM");
    	datos.setNombre("Raul Mora");
    	dateAdd("datepart", number, date)os.setTelefono("55551122");
    	datos.setColonia("una colonia");
    	datos.setCodigoPostal("01234");
    	datos.setCorreoElectronico("uncorreo@undominio.com");
    	datos.setSemestre("primero");
    	datos.setSemestreR(2);
    	datos.setNumeroRegistro("asdf1234");
    	datos.setStatus(1);
    	datos.setPrograma("MCC");
    	asignaturas = createObject("java", "java.util.ArrayList").init();
    	datos.setAsignaturas(asignaturas);   */
    	 /* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.ActaRegistroTesisRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ActaRegistroTesis").init();
    	datos.setDiaD(9);
    	datos.setMesD("septiembre");
    	datos.setAnioD(1990);
    	datos.setColegio("CIC");
    	datos.setSesion("ordinaria");
    	datos.setNumSesion(9);
    	datos.setDiaS(9);
    	datos.setMesS("septiembre");
    	datos.setNombre("Rulo Mora");
    	datos.setNumRegistro("jfgh75x1");
    	datos.setTemaTesis("pln");
    	datos.setTemaAspectos("aspecto 1");
    	datos.setDirectorTesis("un director");
    	datos.setLugarTesis("CIC");
    	reporte.setTipo(2);  */
    	/* reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.ActaGrupalEvaluacionCursosRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ActaGrupalEvaluacionCursos").init();
    	datos.setEscuela("CIC");
    	datos.setPrograma("MCC");
    	datos.setAsignatura("Matematicas bien locas");
    	datos.setClave("clave");
    	datos.setProfesor("Chiflado");
    	datos.setRegistro("registro");
    	datos.setSemestre("primero");
	   	asignaturas = createObject("java", "java.util.ArrayList").init();
	   	asignatura = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ActaGrupalEvaluacionCursosCalificacion").init();
	   	asignatura.setRegistro("xjn29123v");
	   	asignatura.setNombre("Jose Raul Mora Gallardo");
	   	asignatura.setCalificacion(9);
	   	asignatura.setCalificacionL("A");
	   	asignaturas.add(asignatura);
	   	datos.setCalificaciones(asignaturas); */
	   	reporte = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.service.request.ActaRevisionTesisRequest").init();
    	datos = CreateObject("java","com.csii.siiip.posgrado.reportes.dto.inscripcion.programas.posgrado.ActaRevisionTesis").init();
    	datos.setCiudad("Mexico");
    	datos.setHora("15:00");
    	datos.setDia(9);
    	datos.setMes("septiembre");
    	datos.setAnio(2105);
    	datos.setColegio("colegio de Professor");
    	datos.setTesis("una tesis bien loca");
    	datos.setNombre("rulo Mora");
    	datos.setRegistro("xjn29123v");
    	datos.setAspiranteDe("MCC");
    	reporte.setTipo(1);
    	 reporte.setDatos(datos); 
    	var obj = Gson.toJson(reporte);    	
    	Event.setLayout("ReportePDF");
			Event.setView("alumno/prueba_pdf");
    	</cfscript>
		<cfhttp url="http://localhost:9080/PosgradoReportes/rest/reporter/actaRevisionTesis" method="post" result="httpResp" timeout="60">
    		<cfhttpparam type="header" name="Content-Type" value="application/json" />
    		<cfhttpparam type="body" value="#obj#">
		</cfhttp>	
		<cfcontent type="application/pdf" variable="#httpResp.filecontent.toByteArray()#">	
	</cffunction>
</cfcomponent>