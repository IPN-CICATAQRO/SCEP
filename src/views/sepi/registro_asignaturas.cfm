  <section class="vbox">
    <form data-validate="parsley" action="#cgi.SCRIPT_NAME#" method="post" id="formStep1">
      <input type="hidden" name="event" id="eventStep1" value="">
      <input type="hidden" name="event" id="pkPrograma" value="<cfoutput>#prc.pkPrograma#</cfoutput>">
    </form>
    <section class="scrollable wrapper">
      <div class="row">
        <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">DATOS DEL PROGRAMA Y LA ASIGNATURA</header>
            <div class="panel-body">
            <cfoutput>
              <form class="bs-example form-horizontal">
                <div class="form-group">
                  <label class="col-lg-2 control-label">Nombre Del Programa</label>
                  <div class="col-lg-10">
                    Maestr&iacute;a en Ingenier&iacute;a de Telecomunicaciones
                  </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="nombreDeAsignatura">Nombre De La Asignatura</label>
                  <div class="col-lg-10">
                    <input type="text" class="form-control" id="nombreDeAsignatura" name="nombreDeAsignatura" value="<cfif isDefined('prc.qAsignaturaInfo')>#prc.qAsignaturaInfo.NOMBRE#</cfif>">
                  </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="tipoAsignatura">Tipo De Asignatura</label>
                  <div class="col-lg-10">
                    <select class="form-control" id="tipoAsignatura" name="tipoAsignatura">
                      <option value="0">Seleccionar una Opci&oacute;n</option>
                      <cfloop from="1" to="#prc.qCatTipoAsignatura.RecordCount#" index="i">
                          <cfif isDefined('prc.qAsignaturaInfo') AND prc.qAsignaturaInfo.PK_TIPO_ASIGNATURA eq prc.qCatTipoAsignatura.PK_TIPO_ASIGNATURA[i]>
                          		<option value="#prc.qCatTipoAsignatura.PK_TIPO_ASIGNATURA[i]#" selected="selected">#prc.qCatTipoAsignatura.DESCRIPCION[i]#</option>
                          <cfelse>
                            <option value="#prc.qCatTipoAsignatura.PK_TIPO_ASIGNATURA[i]#">#prc.qCatTipoAsignatura.DESCRIPCION[i]#</option>
                          </cfif>
                      </cfloop>
                    </select>
                  </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-lg-2 control-label" for="numeroDeHoras">Numero De Horas por Semana</label>
                    <div class="col-lg-10">
                      <div class="row">
                        <label class="col-lg-2 control-label" >Teoria</label>
                        <div class="col-lg-2">
                          <input type="number" class="form-control" id="numeroDeHorasTeoria" name="numeroDeHorasTeoria" value="<cfif isDefined('prc.qAsignaturaInfo')>#prc.qAsignaturaInfo.HORAS_TEORIA#</cfif>" onKeyPress="return onlyNumbers(event);">
                        </div>
                        <label class="col-lg-2 control-label">Practica</label>
                        <div class="col-lg-2">
                          <input type="number" class="form-control" id="numeroDeHorasPracticas" name="numeroDeHorasPracticas" value="<cfif isDefined('prc.qAsignaturaInfo')>#prc.qAsignaturaInfo.HORAS_PRACTICA#</cfif>" onKeyPress="return onlyNumbers(event);">
                        </div>
                        <label class="col-lg-2 control-label" >Teorico Practica</label>
                        <div class="col-lg-2">
                          <input type="number" class="form-control" id="numeroDeHorasTericoPracticas" name="numeroDeHorasTericoPracticas" value="<cfif isDefined('prc.qAsignaturaInfo')>#prc.qAsignaturaInfo.HORAS_TP#</cfif>" onKeyPress="return onlyNumbers(event);">
                        </div>
                      </div>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                  <label class="col-lg-2 control-label">Unidades De Cr&eacute;dito</label>
                  <div class="col-lg-10">
                    <input type="text" class="form-control" id="unidadesDeCredito" name="unidadesDeCredito" value="<cfif isDefined('prc.qAsignaturaInfo')>#prc.qAsignaturaInfo.UNIDADES_DE_CREDITO#</cfif>" onKeyPress="return onlyNumbers(event);">
                  </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                  <label class="col-lg-2 control-label">Sesi&oacute;n Del Colegio De Profesores En Que Se Acord&oacute; La Implantaci&oacute;n De La Asignatura</label>
                  <div class="col-lg-10">
                    <input type="text" class="form-control" id="numeroSessionAcuerdo" name="numeroSessionAcuerdo" value="<cfif isDefined('prc.qAsignaturaInfo')>#prc.qAsignaturaInfo.NO_SESION_ACUERDO_COLEGIO#</cfif>" onKeyPress="return onlyNumbers(event);">
                  </div>
                </div>
              </form>
              </cfoutput>
            </div>
          </section>
        </div>
        <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">DATOS DEL PROGRAMA Y LA ASIGNATURA</header>
            <div class="panel-body">
              <form class="bs-example form-horizontal">
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="idCoordinadorAsignatura">Coordinador De La Asignatura</label>
                  <div class="col-lg-10">
                    <select id="selectCoordinador" name="selectCoordinador" class="form-control"> 
                    <option value="0">Seleccione una opci&oacute;n</option>
                    <cfoutput query="prc.qCatCoordinador">
                       <cfif isDefined('prc.qAsignaturaInfo') AND prc.qAsignaturaInfo.PK_PERSONA eq prc.qCatCoordinador.PK_PERSONA>
						<option value="#prc.qCatCoordinador.PK_PERSONA#" selected="selected">#prc.qCatCoordinador.NOMBRE# #prc.qCatCoordinador.APELLIDO_PATERNO# #prc.qCatCoordinador.APELLIDO_MATERNO#</option>
                       <cfelse>
                        <option value="#prc.qCatCoordinador.PK_PERSONA#">
                        	#prc.qCatCoordinador.NOMBRE# #prc.qCatCoordinador.APELLIDO_PATERNO# #prc.qCatCoordinador.APELLIDO_MATERNO#
                        </option>
                       </cfif>
                    </cfoutput>
                    </select>
                  </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
              </form>
            </div>
          </section>
        </div>
        <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">INFORMACI&Oacute;N DE LOS PROFESORES PARTICIPANTES</header>
            <div class="panel-body">
              <form class="bs-example form-horizontal">
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="idProfesorParticipante">Profesores Participante</label>
                  <div class="col-lg-10">
                    <select id="selectParticipante" name="selectParticipante" class="form-control"> 
                    <option value="0">Seleccione una opci&oacute;n</option>
                    <cfoutput query="prc.qCatCoordinador">
                        <option value="#prc.qCatCoordinador.PK_PERSONA#">#prc.qCatCoordinador.NOMBRE# #prc.qCatCoordinador.APELLIDO_PATERNO# #prc.qCatCoordinador.APELLIDO_MATERNO#</option>
                    </cfoutput>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12" style="text-align:center">
                        <a href="#" id="agregarParticipantebtn" class="btn btn-success btn" onclick="agregarParticipante();">Agregar Participante</a>
                    </div>
                </div>
              </form>
              <div class="table-responsive">
                <table class="table table-striped m-b-none" id="t_participantes">
                  <thead>
                    <tr>
                      <th width="80%">Nombre del Profesor Participante</th>
                      <th width="20%">Quitar</th>
                    </tr>
                  </thead>
                  <tbody>
                  <script>
				     var arrParticipante = new Array();
				  </script>
                  <cfif isDefined('prc.qParticipantes')>
					  <cfoutput query="prc.qParticipantes">
                         <tr id="tr_#prc.qParticipantes.PK_PARTICIPANTE_ASIGNATURA#">
                              <td width="80%">#prc.qParticipantes.NOMBRE# #prc.qParticipantes.APELLIDO_PATERNO# #prc.qParticipantes.APELLIDO_MATERNO#</td>
                              <td width="20%">
                              <a href="##" onclick="quitarParticipante(#prc.qParticipantes.PK_PARTICIPANTE_ASIGNATURA#)" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                              </td>
                         </tr>
                        <script>
							arrParticipante.push(parseInt(#prc.qParticipantes.PK_PARTICIPANTE_ASIGNATURA#));
                        </script>
                      </cfoutput>
                  </cfif>
                  </tbody>
                </table>
              </div>
            </div>
          </section>
        </div>
        <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">DESCRIPCI&Oacute;N DEL CONTENIDO DEL PROGRAMA DE LA ASIGNATURA</header>
            <div class="panel-body">
              <form class="bs-example form-horizontal">
                <div class="form-group">
                  <label class="col-lg-2 control-label">Objetivo General</label>
                  <div class="col-lg-10">
                    <textarea class="form-control" id="objetivoGeneral" name="objetivoGeneral"><cfif isDefined('prc.qAsignaturaInfo')><cfoutput>#prc.qAsignaturaInfo.OBJETIVO_GENERAL#</cfoutput></cfif></textarea>
                  </div>
                </div>
              </form>
            </div>
          </section>
        </div>
       <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">DESCRIPCI&Oacute;N DEL CONTENIDO <a id="expander-contenido" href="#">EXPANDE MATERIAS</a></header>
            <div class="panel-body">
                <div class="row">
                  <div class="col-lg-8">
                      <label class="sr-only" >Agregar tema</label>
                      <input type="text" class="form-control" id="nombreNuevoTemaContenido" placeholder="Escriba el titulo del tema que desea agregar">
                  </div>
                  <div class="col-lg-4">
                    <a href="#" class="btn btn-default btn-block" onclick="agregarTemaAContenidos(this);"><i class="fa fa-plus-square pull-left"></i> Agregar a indice de contenidos</a>
                  </div>
                  <div class="col-lg-12">
                    <h2>INDICE DE CONTENIDOS</h2>
                  </div>
                  <div class="line line-dashed line-lg pull-in"></div>
                  <div class="col-lg-12">
                    <div class="dd" id="descripcion-contenido-asignatura">
                      <ol id="contenido-asignatura" class="dd-list">
                      </ol>
                    </div>
                  </div>
                  <div class="line line-dashed line-lg pull-in"></div>
                  <div class="col-lg-12">
                    <a href="#" class="btn btn-default btn-lg btn-block" onclick="barrerTemario(this);"><i class="fa fa-unlock pull-middle"></i> Registrar y completar</a>
                  </div>
                </div>
            </div>
          </section>
        </div>
        <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">BIBLIOGRAFIA UTILIZADA EN LA ASIGNATURA</header>
            <div class="panel-body">
              <form class="bs-example form-horizontal">
                <div class="form-group">
                  <label class="col-lg-2 control-label">Indique la bibliografia utilizada durante el desarrollo de la asignatura.</label>
                  <div class="col-lg-10">
                    <textarea class="form-control" id="bibliografiaUtilizada" name="bibliografiaUtilizada"><cfif isDefined('prc.qAsignaturaInfo')><cfoutput>#prc.qAsignaturaInfo.BIBLIOGRAFIA#</cfoutput></cfif></textarea>
                  </div>
                </div>
              </form>
            </div>
          </section>
        </div>
        <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">PROCEDIMIENTOS O INSTRUMENTOS DE EVALUACI&Oacute;N A UTILIZAR</header>
            <div class="panel-body">
              <form class="bs-example form-horizontal">
                <div class="form-group">
                  <label class="col-lg-2 control-label">Indique los procedimientos para la evaluaci&oacute;n</label>
                  <div class="col-lg-10">
                    <textarea class="form-control" id="procedimientoEvaluacion" name="procedimientoEvaluacion"><cfif isDefined('prc.qAsignaturaInfo')><cfoutput>#prc.qAsignaturaInfo.PROCEDIMIENTOS_INSTRUMENTOS#</cfoutput></cfif></textarea>
                  </div>
                </div>
                <!---<div class="form-group">
                  <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" class="btn btn-sm btn-default">Sign in</button>
                  </div>
                </div>--->
              </form>
            </div>
          </section>
        </div>
      </div>
        <div class="form-group">
            <div class="col-lg-5" style="text-align:center">
            <cfif isDefined('prc.qAsignaturaInfo')>
                <button class="btn btn-success btn-s-xl" onclick="guardarInformacion();">Guardar Cambios</button><br/><br/>
            <cfelse>
                <button class="btn btn-success btn-s-xl" onclick="guardarInformacion();">Guardar Asignatura</button><br/><br/>
             </cfif>
            </div>
        </div>
    </section>
  </section>

  <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
  <script>
		<!---
		* Fecha creacion: 28 de Marzo de 2014
		* @author: David Monterrosas
		--->
		function agregarParticipante(){
			if($('#selectParticipante option:selected').val() > 0){
				$('table#t_participantes tr:last').after('<tr id="tr_'+$('#selectParticipante option:selected').val()+'"><td width="80%">'+$('#selectParticipante option:selected').text()+'</td><td width="20%"><a href="##" onclick="quitarParticipante('+$('#selectParticipante option:selected').val()+')" style="font-size:18px"><i class="fa fa-trash-o"></i></a></td></tr>');
				arrParticipante.push($('#selectParticipante option:selected').val());
			}
		  return 0;
		}

		<!---
		* Fecha creacion: 28 de Marzo de 2014
		* @author: David Monterrosas
		--->
		function quitarParticipante(id_elemento){
			arrParticipante.splice(arrParticipante.indexOf(id_elemento), 1);
			$('#tr_'+id_elemento).remove();
		}
		
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
		function guardarInformacion(){
			if(! validaCamposInformacion())
				return;
			if (confirm('\u00BFDesea guardar la informaci\u00f3n capturada?')){
				var params = "";
				params += "?pkPrograma=" 					+ <cfoutput>#prc.pkPrograma#</cfoutput>;
				params += "&pkAsignatura=" 					+ <cfoutput>#prc.pkAsignatura#</cfoutput>;
				params += "&nombreDeAsignatura=" 			+ $("#nombreDeAsignatura").val();
				params += "&tipoAsignatura=" 				+ $("#tipoAsignatura option:selected").val();
				params += "&numeroDeHorasTeoria=" 			+ $("#numeroDeHorasTeoria").val();
				params += "&numeroDeHorasPracticas=" 		+ $('#numeroDeHorasPracticas').val();
				params += "&numeroDeHorasTericoPracticas="	+ $('#numeroDeHorasTericoPracticas').val();
				params += "&unidadesDeCredito="				+ $('#unidadesDeCredito').val();
				params += "&numeroSessionAcuerdo="			+ $('#numeroSessionAcuerdo').val();
				params += "&selectCoordinador="				+ $('#selectCoordinador option:selected').val();
				params += "&objetivoGeneral="				+ $('#objetivoGeneral').val();
				params += "&bibliografiaUtilizada="			+ $('#bibliografiaUtilizada').val();
				params += "&procedimientoEvaluacion="		+ $('#procedimientoEvaluacion').val();
				params += "&listParticipantes="				+ arrParticipante;
				$.post( "guardarInformacion" + params, function( data ) {
					var JSONObject =  $.parseJSON(data);
					if (JSONObject.RESULTADO > 0) {
						alert ("La informaci\u00f3n ha sido guardada con \u00E9xito.");
						$('#eventStep1').val('SEPI.programa_asignatura');
						$('#formStep1').submit();
					} else {
						alert ("Ocurri\u00f3 una interrupci\u00f3n en la conexi\u00f3n, favor de reintentar la operaci\u00f3n.");
					}
				});
			}
		}
		
	<!---
	* Fecha creacion: 28 de Marzo de 2014
	* @author: David Monterrosas
	--->
		function validaCamposInformacion(){
			if($('#nombreDeAsignatura').val() == ''){
				alert('Es necesario indicar el nombre de la asignatura, por favor verifique.');
				return false;
			}
			if($('#tipoAsignatura option:selected').val() == 0){
				alert('Es necesario indicar el tipo de asignatura, por favor verifique.');
				return false;
			}
			if($('#numeroDeHorasTeoria').val() == ''){
				alert('Es necesario indicar el numero de horas teoricas, por favor verifique.');
				return false;
			}
			if($('#numeroDeHorasPracticas').val() == ''){
				alert('Es necesario indicar el numero de horas practicas, por favor verifique.');
				return false;
			}
			if($('#numeroDeHorasTericoPracticas').val() == ''){
				alert('Es necesario indicar el numero de horas teorico practicas, por favor verifique.');
				return false;
			}
			if($('#unidadesDeCredito').val() == ''){
				alert('Es necesario indicar las unidades de credito, por favor verifique.');
				return false;
			}
			if($('#numeroSessionAcuerdo').val() == ''){
				alert('Es necesario indicar el numero de sesion de acuerdo, por favor verifique.');
				return false;
			}
			if($('#selectCoordinador option:selected').val() == 0){
				alert('Es necesario indicar el coordinador, por favor verifique.');
				return false;
			}
			if(arrParticipante.length == 0){
				alert('Es necesario indicar el profesor participante, por favor verifique.');
				return false;
			}
			if($('#objetivoGeneral').val() == ''){
				alert('Es necesario indicar el objetivo general, por favor verifique.');
				return false;
			}
			if($('#bibliografiaUtilizada').val() == ''){
				alert('Es necesario indicar la bibliografia utilizada, por favor verifique.');
				return false;
			}
			if($('#procedimientoEvaluacion').val() == ''){
				alert('Es necesario indicar el procedimiento de evaluacion, por favor verifique.');
				return false;
			}
			return true;
		}
		
		<!---
		* Fecha: 10 de Abril del 2014
		* @author: David Monterrosa
		--->
		function onlyNumbers (event){
			var key = (navigator.appName=="Microsoft Internet Explorer") ? event.keyCode : event.which ;	
			return ( key <= 13 || key == 32 || (key > 47 && key < 58) );
		}
  </script>