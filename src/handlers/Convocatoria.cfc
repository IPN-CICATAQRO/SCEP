<!---
* =========================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Posgrado
* Sub modulo: Convocatoria
* Fecha: 31 de Julio de 2015
* Descripcion: Handler para el modulo de Convocatorias
* =========================================================================
--->

<cfcomponent >
    <!---
  	* Fecha creacion: Julio 31, 2015
  	* @author Peña Alba Aldo
    * Descripción: Funcion que inicia el modulo de convocatorias
  	--->
    <cffunction name="index" access="remote" returntype="void" output="false" hint="Redireccionamiento al layout de convocatorias">
		    <cfargument name="Event" type="any">
		        <cfscript>
                 var cnConvocatoria 	= getModel("convocatoria.CN_convocatoria");
                 var prc.infoUsuarioSession = getPlugin("SessionStorage").getVar("usuario");//Session.usuario;

                 writedump(prc.infoUsuarioSession);
                 //abort;
                 /*var prc.infoSeguimiento = cnConvocatoria.getInformacionConvocatoria('L30000');

                var prc.catalogoProfesores   = cnConvocatoria.obtenerCatalogoProfesores();
                var prc.catalogoAsignaturas = cnConvocatoria.obtenerCatalogoAsignacion(prc.infoUsuarioSession.PK_UR);
                var prc.catalogoSemestre = cnConvocatoria.obtenerCatalogoSemestre();
                var prc.catalogoGrupo =  cnConvocatoria.obtenerCatalogoGrupos();
                var prc.catalogoTurno =   cnConvocatoria.obtenerCatalogoTurno();
                var prc.catalogoPeriodo = cnConvocatoria.obtenerCatalogoPeriodo();
*/

              Event.setLayout("convocatoria");
			        Event.setView("convocatoria/Crear");
            </cfscript>
              <!---<cfdump var="#prc.infoUsuarioSession#">
              <cfabort>--->
    </cffunction>



  <!---
  * Fecha creacion: Noviembre 11,2015
  *@author Aaron Quintana Gomez
  *Descripción: Función que obtiene todas las de Asinaciones de profesores.
  --->
   <cffunction name="initTablaAsignacion" access="public" output="false" >
      <cfargument name="Event" type="any">
        <cfscript>
          var rc = Event.getCollection();
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.initTablaAsignacion();
              //writeDump(respuesta);
              //abort;
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>


  <!---
    * Fecha creacion: Noviembre 11,2015
    *@author Aaron Quintana Gomez
    *Descripción: obtiene los catalogos para la Asignacion Profesores .
  --->

<cffunction name="obtenerCatalogoAP" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var prc.catalogoProfesores   = cnConvocatoria.obtenerCatalogoProfesores();
              var prc.catalogoAsignaturas = cnConvocatoria.obtenerCatalogoAsignacion();
              var prc.catalogoSemestre = cnConvocatoria.obtenerCatalogoSemestre();
              var prc.catalogoGrupo =  cnConvocatoria.obtenerCatalogoGrupos();
              var prc.turno =   cnConvocatoria.obtenerCatalogoTurno();

              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>


  <!---
    * Fecha creacion: Noviembre 11,2015
    *@author Aaron Quintana Gomez
    *Descripción: obtiene los catalogos de profesores .
  --->

<cffunction name="obtenerCatalogoProfesores" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.obtenerCatalogoProfesores();
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>

  <!---
    * Fecha creacion: Noviembre 11,2015
    *@author Aaron Quintana Gomez
    *Descripción: obtiene los catalogos de las Asignaturas tambien llamadas materias .
  --->


     <cffunction name="obtenerCatalogoAsignacion" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.obtenerCatalogoAsignacion();
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>


  <!---
    * Fecha creacion: Noviembre 11,2015
    *@author Aaron Quintana Gomez
    *Descripción:  obtiene los catalogos de los semestres.
  --->

     <cffunction name="obtenerCatalogoSemestre" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.obtenerCatalogoSemestre();
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>


  <!---
    * Fecha creacion: Noviembre 11,2015
    *@author Aaron Quintana Gomez
    *Descripción:  obtiene los catalogos de los grupos.
  --->

     <cffunction name="obtenerCatalogoGrupos" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.obtenerCatalogoGrupos();
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>

  <!---
    * Fecha creacion: Noviembre 11,2015
    *@author Aaron Quintana Gomez
    *Descripción: obtiene los catalosos de los turnos.
  --->

    <cffunction name="obtenerCatalogoTurno" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.obtenerCatalogoTurno();
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>


   <!---
    * Fecha creacion: Noviembre 11,2015
    *@author Aaron Quintana Gomez
    *Descripción: obtiene los catalosos de Periodos para las asignaciones.
  --->
  <cffunction name="obtenerCatalogoPeriodo" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.obtenerCatalogoPeriodo();
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>


    <cffunction name="buscarAsignacionByID" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
              var rc = Event.getCollection();
              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.buscarAsignacionByID(rc.pkAsignacion);
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>


     <!---
  * Fecha creacion: Noviembre 11,2015
  *@author Aaron Quintana Gomez
  *Descripción: Función Crear Asignacion de grupos y materias a Profesores.
  --->
   <cffunction name="guardarAsignacion" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>

              var rc = Event.getCollection();

              var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");
              var respuesta   = cnConvocatoria.guardarAsignacion(rc.nombre,rc.materia,rc.semestre, rc.grupo, rc.turno,rc.periodo);
              event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>

  <!---
  * Fecha creacion: Noviembre 11,2015
  *@author Aaron Quintana Gomez
  *Descripción: Función Editar Asignacion de grupos y materias a Profesores.
  --->
   <cffunction name="editarAsignacion" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");


          var respuesta   = cnConvocatoria.editarAsignacion(rc.pkRegistroActivo, rc.nombre,rc.materia,rc.semestre, rc.grupo, rc.turno,rc.periodo);
            event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>

<!---
  * Fecha creacion: Noviembre 11,2015
  *@author Aaron Quintana Gomez
  *Descripción: Función pone en estatus de Eliminado una asignacion
  --->
   <cffunction name="eliminarAsignacion" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");


          var respuesta   = cnConvocatoria.eliminarAsignacion(rc.pkRegistroActivo);
            event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>

    <!---
  * Fecha creacion: Noviembre 11,2015
  *@author Aaron Quintana Gomez
  *Descripción: Función pone en estatus 2(la informacion es validada) una asignacion
  --->
   <cffunction name="validarAsignacion" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria  = getModel("convocatoria.CN_convocatoria");


           var respuesta   = cnConvocatoria.validarAsignacion(rc.pkAsignacion);
            event.renderData(type="json", data = respuesta);
        </cfscript>
    </cffunction>

    <!---
    * Fecha: Octubre 27, 2015
    * @author: Olguin Gallegos Claudia
    --->
    <cffunction name="guardarDatosConvocatoria" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
            var rc				= Event.getCollection();
            var cnConvocatoria 	= getModel("convocatoria.CN_convocatoria");
            var pkConvocatoria  = cnConvocatoria.guardarDatosConvocatoria(rc.periodo,rc.objetivo,rc.perfil_ingreso,
                                  rc.perfil_egreso);
            event.renderData(type="json", data = pkConvocatoria);
        </cfscript>
    </cffunction>

    <!---
    * Fecha: Octubre 27, 2015
    * @author: Olguin Gallegos Claudia
    --->
    <cffunction name="guardarDatosPestana" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria 	= getModel("convocatoria.CN_convocatoria");
            var pkResultadoPest       = cnConvocatoria.guardarDatosPestana(rc.pkConvocatoria,rc.fechaResultados,rc.cupoMaximoAlumnos);
            event.renderData(type="json", data = pkResultadoPest);
        </cfscript>
    </cffunction>

    <!---
    * Fecha: Octubre 27, 2015
    * @author: Olguin Gallegos Claudia
    --->
    <cffunction name="guardarURL" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
        <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria 	= getModel("convocatoria.CN_convocatoria");
            var pkUrl       = cnConvocatoria.guardarURL(rc.pkConvocatoria,rc.URLacademica);
            event.renderData(type="json", data = pkUrl);
        </cfscript>
    </cffunction>

    <!---
    * Fecha: Octubre 27, 2015
    * @author: Olguin Gallegos Claudia
    --->
  	<cffunction name="guardarDatosGenerales" access="public" output="false" returntype="string">
      <cfargument name="Event" type="any">
    		<cfscript>
      			var rc = Event.getCollection();
      			var cnConvocatoria 	= getModel("convocatoria.CN_convocatoria");
  				var respuesta		= cnConvocatoria.guardarDatosGenerales(rc.pkConvocatoria,rc.nombre,rc.aPaterno,rc.aMaterno,rc.conmutador,rc.extension,rc.correoI,rc.correoA);
      		  event.renderData(type="json", data = respuesta);
    		</cfscript>
  	</cffunction>

    <!---
    * Fecha: Octubre 27, 2015
    * @author: Olguin Gallegos Claudia
    --->
    <cffunction name="guardarRequisito" access="public" output="false" returntype="void" hint="funcion para guardar los requisitos de la convocatoria">
      <cfargument name="Event" type="any">
        <cfscript>
         var rc = Event.getCollection();
         var cnConvocatoria 	= getModel("convocatoria.CN_convocatoria");
         var requisito = cnConvocatoria.guardarRequisito(rc.pkConvocatoria,rc.addRequisito);
         event.renderData(type="json", data = requisito);
        </cfscript>
      </cffunction>

      <!---
			* Fecha: Octubre 27, 2015
			* @author: Olguin Gallegos Claudia
			--->
      <cffunction name="guardarRevalidacion" access="public" output="false" returntype="void" hint="funcion para guardar los requisitos para la revalidacion">
        <cfargument name="Event" type="any">
          <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
            var revalidacion = cnConvocatoria.guardarRevalidacion(rc.pkConvocatoria,rc.addRevalidacion);
            event.renderData(type="json", data = revalidacion);
          </cfscript>
      </cffunction>

      <!---
			* Fecha: Octubre 27, 2015
			* @author: Olguin Gallegos Claudia
			--->
      <cffunction name="guardarDocumento" access="public" output="false" returntype="void" hint="funcion para guardar los requisitos para los aspirantes extranjeros">
        <cfargument name="Event" type="any">
          <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
            var documento = cnConvocatoria.guardarDocumento(rc.pkConvocatoria,rc.addDocumento);
            event.renderData(type="json", data = documento);
          </cfscript>
      </cffunction>

      <!---
			* Fecha: Octubre 27, 2015
			* @author: Olguin Gallegos Claudia
			--->
      <cffunction name="guardarProceso" access="public" output="false" returntype="void" hint="funcion para guardar las estapa del proceso de la convocatoria">
        <cfargument name="Event" type="any">
          <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
            var proceso = cnConvocatoria.guardarProceso(rc.pkConvocatoria,rc.addProceso);
            event.renderData(type="json", data = proceso);
          </cfscript>
      </cffunction>

      <!---
			* Fecha: Octubre 27, 2015
			* @author: Olguin Gallegos Claudia
			--->
      <cffunction name="guardarFormaResultados" access="public" output="false" returntype="void" hint="funcion para guardar la forma de publicacion de resultados">
        <cfargument name="Event" type="any">
          <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
            var forma = cnConvocatoria.guardarFormaResultados(rc.pkConvocatoria, rc.addForma,addFechaForma);
            event.renderData(type="json", data = forma);
          </cfscript>
      </cffunction>

      <!---
			* Fecha: Octubre 27, 2015
			* @author: Olguin Gallegos Claudia
			--->
      <cffunction name="guardarGrado" access="public" output="false" returntype="void" hint="funcion para guardar los requisitos para la obtencion de grado">
        <cfargument name="Event" type="any">
          <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
            var grado = cnConvocatoria.guardarGrado(rc.pkConvocatoria, rc.addGrado);
            event.renderData(type="json", data = grado);
          </cfscript>
      </cffunction>

      <!---
	  * Fecha: Octubre 30, 2015
	  * @author: Olguin Gallegos Claudia
	  --->
      <cffunction name="getInformacionConvocatoria" access="public" output="false" returntype="void" hint="Nos trae la informacion para la tabla de seguimiento">
        <cfargument name="Event" type="any">
          <cfscript>
           // var rc = Event.getCollection();
            //WriteDump(rc);
            //abort;
            var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
           // var urDependencia = getPlugin('SessionStorage').getVar('usuario').PK_UR; //Tomamos la ur de la dependencia desde la session
            //prc.URdependencia = URdependencia;
            //prc.pkConvocatoria = rc.pkConvocatoria;
            return cnConvocatoria.getInformacionConvocatoria('L30000');//rc.pkConvocatoria);
            //writedump(prc.seguimiento);
            //abort;
            //event.renderData(type="json", data = prc.seguimiento);
          </cfscript>
      </cffunction>

      <!---
	  * Fecha: Noviembre 04, 2015
	  * @author: Olguin Gallegos Claudia
	  --->
      <cffunction name="getDatosCompletos" access="public" output="false" returntype="void" hint="Trae toda la informacion del formulario nueva convocatoria">
        <cfargument name="Event" type="any">
          <cfscript>
            var rc = Event.getCollection();
            var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
            // WriteDump(arguments);
            // abort;
            //prc.pkConvocatoria = rc.pkConvocatoria;
            prc.datosGenerales = cnConvocatoria.getDatosCompletos(rc.pkConvocatoria);
            event.renderData(type="json", data = prc.datosGenerales);
          </cfscript>
      </cffunction>

      <!---
      * Fecha: Noviembre 24, 2015
      * @author: Olguin Gallegos Claudia
      --->
      <cffunction name="getDatosGrafica" access="public" output="false" returntype="void" hint="">
          <cfargument name="Event" type="any">
              <cfscript>
                  var rc = Event.getCollection();
                  var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
                  prc.datosGrafica = cnConvocatoria.getDatosGrafica();
                  event.renderData(type="json", data = prc.datosGrafica);
              </cfscript>
      </cffunction>

      <!---
      * Fecha: Noviembre 25, 2015
      * @author: Olguin Gallegos Claudia
      --->
      <cffunction name="getDatosMateriasArea" access="public" output="false" returntype="void" hint="">
          <cfargument name="Event" type="any">
              <cfscript>
                  var rc = Event.getCollection();
                  var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
                  prc.datosMateriaArea = cnConvocatoria.getDatosMateriasArea();
                  event.renderData(type="json", data = prc.datosMateriaArea);
              </cfscript>
      </cffunction>
      <!---
      * Fecha: Diciembre 07, 2015
      * @author: Olguin Gallegos Claudia
      --->
      <cffunction name="guardarDatosEditados" access="public" output="false" returntype="void" hint="">
          <cfargument name="Event" type="any">
              <cfscript>
                  var rc = Event.getCollection();
                  var cnConvocatoria = getModel("convocatoria.CN_convocatoria");
                  prc.datosEditados = cnConvocatoria.guardarDatosEditados(rc.pkConvocatoria,rc.periodo,rc.objetivo,rc.perfil_ingreso,rc.perfil_egreso,rc.fecha_resultados,rc.cupo_maximo,rc.plan_academico,
                                                                          rc.requisito,rc.proceso,rc.revalidacion,rc.forma_resultado,rc.nombre,rc.apellido_paterno,rc.apellido_materno,
                                                                          rc.conmutador,rc.extension,rc.correo_alternativo,rc.correo_institucional);
                  event.renderData(type="json", data = prc.datosEditados);
              </cfscript>
      </cffunction>

</cfcomponent>
