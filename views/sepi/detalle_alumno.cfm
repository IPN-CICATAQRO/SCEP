<section class="vbox">
  <section class="scrollable wrapper">
    <div class="row">
    <div class="col-lg-12">
      <section class="panel panel-default">
        <header class="panel-heading lt no-border"> 
          <div class="row">
            <div class="col-sm-12"> 
              <a href="#" class="pull-left thumb avatar b-3x m-r"> 
                <img src="/posgrado/includes/images/avatar.jpg" class="img-circle"> 
              </a> 
              <div class="clear"> 
                <div class="h3 m-t-xs m-b-xs " style="font-size: 30px;"> 
                  <cfoutput>#prc.qAlumno.NOMBRE[1]# #prc.qAlumno.APELLIDO_PATERNO[1]# #prc.qAlumno.APELLIDO_MATERNO[1]#</cfoutput>
                  <cfif prc.qAlumno.FK_ESTADO_AVANCE[1] lt 3>
                     &nbsp;&nbsp;<a href="#"><i class="fa fa-unlock" onclick="validacionGlobal();"></i></a>
                  <cfelse>
                     &nbsp;&nbsp;<a href="#"><i class="fa fa-lock"></i></a>
                  </cfif>
                </div> 
                <small style="font-size: 20px;">Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Telecomunicaciones</small>
              </div> 
            </div>
            <div class="col-sm-12" style="padding-top: 29px;"> 
              <ul class="nav nav-tabs pull-left">
                <li class="active"><a href="#informacion-general" data-toggle="tab"><i class="fa fa-user text-default"></i> Informaci&oacute;n General</a></li>
                <li><a href="#informacion-academica" data-toggle="tab"><i class="fa fa-comments text-default"></i> Informaci&oacute;n Acad&eacute;mica</a></li>
                <li><a href="#documentos-comprobatorios" data-toggle="tab"><i class="fa fa-comments text-default"></i> Comprobantes Oficiales</a></li>
                <li><a href="#experiencia-profesional" data-toggle="tab"><i class="fa fa-comments text-default"></i> Experiencia Laboral y Profesional</a></li>
              </ul>
            </div>
          </div>
        </header>
        <form data-validate="parsley" action="#cgi.SCRIPT_NAME#" method="post" id="formStep1">
          <input type="hidden" name="event" id="eventStep1" value="">
          <input type="hidden" name="event" id="pkAlumno" value="<cfoutput>#prc.pkAlumno#</cfoutput>">
        </form>
        <div class="panel-body">
          <div class="tab-content">
            <div class="tab-pane fade active in" id="informacion-general">
              <cfoutput>
              <div class="col-sm-12">
                <section class="panel panel-default">
                    <div class="col-sm-1">
                        <cfif prc.qAlumno.FK_ESTATUS[1] eq 1>
                            <a style="font-size:25px" href="##"><i onclick="validacionInformacionPersonal();" class="fa fa-unlock"></i></a>
                        <cfelseif prc.qAlumno.FK_ESTATUS[1] eq 2>
                            <a style="font-size:25px" href="##"><i class="fa fa-lock"></i></a>
                        </cfif>
                      </div>
                    <header class="panel-heading  font-bold">INFORMACI&Oacute;N PERSONAL</header>
                    <div class="panel-body">
                    <form class="bs-example form-horizontal">
                      <div class="form-group">
                        <label class="col-sm-4 control-label"><strong>Sexo</strong></label>
                        <div class="col-sm-8">
                          <p class="form-control-static"> #prc.qAlumno.FK_GENERO[1]# </p>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">Fecha de Nacimiento</label>
                        <div class="col-sm-8">
                          <p class="form-control-static"> #dateFormat(prc.qAlumno.FECHA_NACIMIENTO[1],'dd/mm/yyyy')# </p>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">Lugar Nacimiento</label>
                        <div class="col-sm-8">
                          <p class="form-control-static"> #prc.qAlumno.LUGAR_NACIMIENTO[1]# </p>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">RFC</label>
                        <div class="col-sm-8">
                          <p class="form-control-static"> #prc.qAlumno.RFC[1]# </p>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">CURP</label>
                        <div class="col-sm-8">
                          <p class="form-control-static"> #prc.qAlumno.CURP[1]# </p>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">Nacionalidad</label>
                        <div class="col-sm-8">
                          <p class="form-control-static"> #prc.qAlumno.FK_NACIONALIDAD[1]# </p>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">Estado Civil</label>
                       <div class="col-sm-8">
                          <p class="form-control-static"> #prc.qAlumno.FK_EDOCIVIL[1]# </p>
                        </div>
                      </div>
                    </form>
                    </div>
                 </section>
              </div>
              <div class="col-sm-6">
                <section class="panel panel-default">
                    <header class="panel-heading font-bold">INFORMACI&Oacute;N DE RESIDENCIA</header>
                    <div class="panel-body">
                      <form class="bs-example form-horizontal">
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Colonia</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.COLONIA[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">No Exterior</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.NUMEROEXT[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">No Interior</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.NUMEROINT[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Estado</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.ESTADO[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Tel&eacute;fono</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.TELEFONO[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Calle</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.CALLE[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">C.P.</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.CP[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Delegaci&oacute;n o Municipio</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.MUNICIPIO[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Pa&iacute;s</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.FK_PAIS[1]# </p>
                          </div>
                        </div>
                      </form>
                    </div>
                 </section>
              </div>
              <div class="col-sm-6">
                <section class="panel panel-default">
                    <header class="panel-heading font-bold">INFORMACI&Oacute;N LABORAL</header>
                    <div class="panel-body">
                      <form class="bs-example form-horizontal">
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Nombre de Empresa</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.EMPRESA[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Colonia</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.COLONIA_EMP[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Calle</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.CALLE_EMMP[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">N&uacute;mero</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.NUMERO_EMP[1]# </p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">C.P.</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.CP_EMP[1]#</p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Estado</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.ESTADO_EMP[1]#</p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Delegaci&oacute;n o Municipio</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.MUNICIPIO_EMP[1]#</p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Tel&eacute;fono</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.TELEFONO_EMP[1]#</p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label font-bold">Cargo</label>
                          <div class="col-sm-8">
                            <p class="form-control-static"> #prc.qAlumno.CARGO[1]#</p>
                          </div>
                        </div>
                      </form>
                    </div>
                 </section>
              </div>
            </div>
            <div class="tab-pane fade" id="informacion-academica">
              <!-- PROCEDENCIA EDUCATIVA -->
              <div class="col-sm-6">
              <div class="col-sm-2">
                <cfif prc.sEstudios.EstudiosProfesionales.FK_ESTATUS[1] eq 1>
                    <a style="font-size:25px" href="##"><i onclick="validacionEstudiosProf();" class="fa fa-unlock"></i></a>
                <cfelseif prc.sEstudios.EstudiosProfesionales.FK_ESTATUS[1] eq 2>
                    <a style="font-size:25px" href="##"><i class="fa fa-lock"></i></a>
                </cfif>
              </div>
              <section class="panel panel-default"><header class="panel-heading font-bold">ESTUDIOS PROFESIONALES</header>
                <div class="panel-body">
                  <form class="bs-example form-horizontal">
                    <div class="form-group">
                      <label class="col-sm-2 control-label font-bold text-right">Nombre Instituci&oacute;n</label>
                      <div class="col-sm-10">
                        <p class="form-control-static">#prc.sEstudios.EstudiosProfesionales.INSTITUCION[1]#</p>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label font-bold">Especialidad</label>
                      <div class="col-sm-10">
                        <p class="form-control-static">#prc.sEstudios.EstudiosProfesionales.CARRERA[1]#</p>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label font-bold">Lugar</label>
                      <div class="col-sm-10">
                        <p class="form-control-static"> #prc.sEstudios.EstudiosProfesionales.NOM_PAIS[1]#</p>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-2 control-label font-bold">Periodo</label>
                      <div class="col-sm-10">
                        <p class="form-control-static"> #prc.sEstudios.EstudiosProfesionales.FECHA_INI[1]# - #prc.sEstudios.EstudiosProfesionales.FECHA_FIN[1]#</p>
                      </div>
                    </div>
                  </form>
                </div>
              </section>
            </div>
              <div class="col-sm-6">
                <section class="panel panel-default">
                    <div class="col-sm-2">
                    <cfif prc.sEstudios.EstudiosPostProfesionales.FK_ESTATUS[1] eq 1>
                      <a style="font-size:25px" href="##"><i onclick="validacionEstudiosPostProf();" class="fa fa-unlock"></i></a>
                    <cfelseif prc.sEstudios.EstudiosPostProfesionales.FK_ESTATUS[1] eq 2>
                        <a style="font-size:25px" href="##"><i class="fa fa-lock"></i></a>
                    </cfif>
                    </div>
                    <header class="panel-heading font-bold">ESTUDIOS POST PROFESIONALES</header>
                    <div class="panel-body">
                      <form class="bs-example form-horizontal">
                        <div class="form-group">
                          <label class="col-sm-2 control-label font-bold">Nombre Instituci&oacute;n</label>
                          <div class="col-sm-10">
                            <p class="form-control-static"> #prc.sEstudios.EstudiosPostProfesionales.INSTITUCION[1]#</p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label font-bold">Especialidad</label>
                          <div class="col-sm-10">
                            <p class="form-control-static"> #prc.sEstudios.EstudiosPostProfesionales.CARRERA[1]#</p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label font-bold">Lugar</label>
                          <div class="col-sm-10">
                            <p class="form-control-static"> #prc.sEstudios.EstudiosPostProfesionales.NOM_PAIS[1]#</p>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label font-bold">Periodo</label>
                          <div class="col-sm-10">
                            <p class="form-control-static"> #prc.sEstudios.EstudiosPostProfesionales.FECHA_INI[1]# - #prc.sEstudios.EstudiosPostProfesionales.FECHA_FIN[1]#</p>
                          </div>
                        </div>
                      </form>
                    </div>
                </section>
              </div>
			  </cfoutput>
              <div class="col-sm-12">
                <section class="panel panel-default">
                <div class="col-sm-1">
					<cfif prc.sEstudios.Idiomas.FK_ESTATUS[1] eq 1>
                    <a style="font-size:25px" href="##"><i onclick="validacionIdiomas();" class="fa fa-unlock"></i></a>
                    <cfelseif prc.sEstudios.Idiomas.FK_ESTATUS[1] eq 2>
                        <a style="font-size:25px" href="##"><i class="fa fa-lock"></i></a>
                    </cfif>
                  </div>
                  <header class="panel-heading font-bold">
                    IDIOMAS
                  </header>
                  <div class="table-responsive">
                    <table class="table table-striped b-t b-light">
                      <thead>
                        <tr>
                          <th>
                            Nombre del Idioma
                          </th>
                          <th>Nivel de conocimiento</th>
                        </tr>
                      </thead>
                      <tbody>
                      <cfoutput query="prc.sEstudios.Idiomas">
                        <tr>
                          <td>#prc.sEstudios.Idiomas.NOM_IDIOMA#</td>
                          <td>#prc.sEstudios.Idiomas.NOM_DOMINIO#</td>
                        </tr>
                      </cfoutput>
                      </tbody>
                    </table>
                  </div>
                </section>
              </div>
            </div>
            <div class="tab-pane fade" id="documentos-comprobatorios">
              <section class="panel panel-default">
              <div class="col-sm-1">
                <a style="font-size:25px" href="##"><i onclick="validacionResultadosEvaluacion();" class="fa fa-unlock"></i></a>
              </div>
              <header class="panel-heading font-bold">RESULTADOS DE EVALUACI&Oacute;N</header>
                <div class="panel-body">
                  <div class="row">
                    <div class="col-sm-6">
                      <form class="form-horizontal" method="get">
                        <div class="form-group">
                          <label class="col-sm-4 control-label">Estado de Admisi&oacute;n</label>
                          <div class="col-sm-7">
                            <select name="estadoAdmision" id="estadoAdmision" class="form-control m-b">
                                <option value="0">Seleccione una opci&oacute;n</option>
                                <cfoutput query="prc.catAdmision">
                                    <option value="#prc.catAdmision.PK_ESTADO_ADMISION#">#prc.catAdmision.ESTADO_ADMISION#</option>
                                </cfoutput>
                            </select>
                          </div>
                        </div>
                      </form>
                    </div>
                    <div class="col-sm-6">
                      <form class="form-horizontal" method="get">
                        <div class="form-group">
                          <label class="col-sm-4 control-label">Calificaci&oacute;n Examen de Ingl&eacute;s</label>
                          <div class="col-sm-3">
                            <input id="calificacionIngles" type="number" class="form-control" min="8" max="10" step="0.01" onKeyPress="return verificarNumero(event,this);">
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </section>
              <section class="panel panel-default">
              <div class="col-sm-1">
                <a style="font-size:25px" href="##"><i onclick="validacionConsejero();" class="fa fa-unlock"></i></a>
              </div>
              <header class="panel-heading font-bold">PROFESOR CONSEJERO</header>
                <div class="panel-body">
                  <div class="row">
                    <div class="col-sm-12">
                      <form class="form-horizontal" method="get">
                          <div class="form-group">
                            <label class="col-sm-2 control-label">Coordinador</label>
                            <div class="col-sm-5">
                                <select id="selectConsejero" name="selectConsejero" class="form-control"> 
                                <option value="0">Seleccione una opci&oacute;n</option>
                                <cfoutput query="prc.qCatCoordinador">
                                    <option value="#prc.qCatCoordinador.PK_PERSONA#">#prc.qCatCoordinador.NOMBRE# #prc.qCatCoordinador.APELLIDO_PATERNO# #prc.qCatCoordinador.APELLIDO_MATERNO#</option>
                                </cfoutput>
                                </select>
                            </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </section>
              <div class="col-sm-8 col-md-offset-2">
                    <section class="panel panel-default">
                      <div class="col-sm-2">
                        <a style="font-size:25px" href="##"><i onclick="validacionDocumentos();" class="fa fa-unlock"></i></a>
                      </div>
                      <header class="panel-heading font-bold">
                        DOCUMENTOS COMPROBATORIOS
                      </header>
                      <div class="table-responsive">
                        <table class="table table-striped b-t b-light">
                          <thead>
                            <tr>
                              <th>
                                Nombre del documento
                              </th>
                              <th>Acciones</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td align="right">ACTA DE NACIMIENTO</td>
                              <td align="center">
                                <a style="font-size:18px" href="#"><i onclick="validacionDocumentoIndividual();" class="fa fa-unlock"></i></a>&nbsp;
                                <a data-toggle="modal" style="font-size:18px" href="#modal-acta-nacimiento"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">TITULO o CEDULA PROFESIONAL</td>
                              <td align="center">
                                <a style="font-size:18px" href="#"><i onclick="validacionDocumentoIndividual();" class="fa fa-unlock"></i></a>&nbsp;
                                <a data-toggle="modal" style="font-size:18px" href="#modal-cedula-profesional"><i onclick="validacionDocumentoIndividual();" class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">CERTIFICADO DE TERMINACI&Oacute;N DE ESTUDIOS DE LICENCIATURA</td>
                              <td align="center">
                                <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a data-toggle="modal" style="font-size:18px" href="#modal-terminacion-estudios"><i onclick="validacionDocumentoIndividual();" class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">COMPROBANTE DE CONOCIMIENTO DE INGLES</td>
                              <td align="center">
                                <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a data-toggle="modal" style="font-size:18px" href="#modal-conocimiento-ingles"><i onclick="validacionDocumentoIndividual();" class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <!-- OTROS CASOS -->
                            <!-- SOLO ASPIRANTES A DOCTORADO -->
                            <tr>
                              <td align="right">COMPROBANTE DE GRADO DE MAESTRIA O CEDULA</td>
                              <td align="center">
                                <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a data-toggle="modal" style="font-size:18px" href="#modal-grado-maestria"><i onclick="validacionDocumentoIndividual();" class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">COPIA DEL ACTA DE EXAMEN DE GRADO DE MAESTR&Iacute;A Y GRADO DE MAESTR&Iacute;A</td>
                              <td align="center">
                                <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <!-- ASPIRANTES EXTRANGEROS -->
                            <tr>
                              <td align="right">FORMA MIGRATORIA (CON VIGENCIA HASTA QUE TERMINE EL CICLO ESCOLAR)</td>
                              <td align="center">
                                <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a data-toggle="modal" style="font-size:18px" href="#modal-forma-migratoria"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">CARTA PROTESTA (SIP 9)</td>
                              <td align="center">
                                <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">LEGALIZACION DE ACTA DE NACIMIENTO</td> 
                              <td align="center">
                              <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">CERTIFICADO DE CALIFICACIONES</td>
                              <td align="center">
                              <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">TITULO DE LICENCIATURA</td>
                              <td align="center">
                              <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">LEGALIZACI&Oacute;N DEL GRADO DE MAESTR&Iacute;A PARA ASPIRANTES A DOCTORADO Y QUE SEAN ACOMPAÑADOS DE LA EQUIVALENCIA DE LOS ESTUDIOS RESPECTIVOS OTORGADA POR EL COLEGIO DE PROFESORES DE CADA UNIDAD</td>
                              <td align="center">
                              <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <!-- TRADUCCIONES AL IDIOMA ESPANIOL -->
                            <tr>
                              <td align="right">TRADUCCION A ESPA&Ntilde;OL -> ACTA DE NACIMIENTO</td>
                              <td align="center">
                              <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">TRADUCCION A ESPA&Ntilde;OL -> CERTIFICADO DE CALIFICACIONES</td>
                              <td align="center">
                              <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">TRADUCCION A ESPA&Ntilde;OL -> T&Iacute;TULO DE LICENCIATURA</td>
                              <td align="center">
                              <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">TRADUCCION A ESPA&Ntilde;OL -> LEGALIZACI&Oacute;N DEL GRADO DE MAESTR&Iacute;A PARA ASPIRANTES A DOCTORADO</td>
                              <td align="center">
                              <a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a>&nbsp;
                                <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </section>
                  </div>
            </div>
            <div class="tab-pane fade" id="experiencia-profesional">
            <div  class="col-sm-12">
              <section class="panel panel-default">
              <div class="col-sm-1">
                <cfif prc.sExperiencia.Experiencia.FK_ESTATUS[1] eq 1>
                    <a style="font-size:25px" href="##"><i onclick="validacionExperienciaProf();" class="fa fa-unlock"></i></a>
                <cfelseif prc.sExperiencia.Experiencia.FK_ESTATUS[1] eq 2>
                    <a style="font-size:25px" href="##"><i class="fa fa-lock"></i></a>
                </cfif>
              </div>
              <header class="panel-heading font-bold"> EXPERIENCIA PROFESIONAL</header>
              <div class="panel-body">
                <form class="form-horizontal" method="get">
                    <cfoutput query="prc.sExperiencia.Experiencia">
                      <div class="form-group">
                        <label class="col-sm-2 control-label font-bold">#prc.sExperiencia.Experiencia.FECHA_INI# - #prc.sExperiencia.Experiencia.FECHA_FIN#</label>
                        <div class="col-sm-10">
                          <div class="row">
                            <label class="col-sm-3 text-right">
                              <strong>Nombre del organismo</strong> 
                            </label>
                            <label class="col-sm-9">
                              #prc.sExperiencia.Experiencia.INSTITUCION#
                            </label>
                            <label class="col-sm-3 text-right">
                              <strong>Puesto desempe&ntilde;ado</strong>
                            </label>
                            <label class="col-sm-9">
                             #prc.sExperiencia.Experiencia.PUESTO#</label>
                            </label>
                            <label class="col-sm-3 text-right">
                              <strong>Sector</strong> 
                            </label>
                            <label class="col-sm-9">
                              #prc.sExperiencia.Experiencia.NOM_CLASIFICACION#</label>
                            <label class="col-sm-3 text-right">
                              <strong>Actividades Realizadas</strong> 
                            </label>
                            <label class="col-sm-9">
                              #prc.sExperiencia.Experiencia.ACTIVIDADES#</label>
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                    </cfoutput>
                </form>
              </div>
              </section>
              </div>
              <div  class="col-sm-12">
              <section class="panel panel-default">
                  <div class="col-sm-1">
                    <cfif prc.sExperiencia.TrabInvestigacion.FK_ESTATUS[1] eq 1>
                        <a style="font-size:25px" href="##"><i onclick="validacionTrabajosInv();" class="fa fa-unlock"></i></a>
                    <cfelseif prc.sExperiencia.TrabInvestigacion.FK_ESTATUS[1] eq 2>
                        <a style="font-size:25px" href="##"><i class="fa fa-lock"></i></a>
                    </cfif>
                  </div>
                <header class="panel-heading font-bold"> TRABAJOS DE INVESTIGACI&Oacute;N</header>
                <div class="panel-body">
                <form class="form-horizontal" method="get">
                    <cfoutput query="prc.sExperiencia.TrabInvestigacion">
                      <div class="form-group">
                        <div class="col-sm-12">
                          <div class="row">
                            <div class="table-responsive">
                              <table border="0" class="table">
                                <tr>
                                  <td align="right"><label class="font-bold">Nombre del trabajo </label></td>
                                  <td colspan="5">#prc.sExperiencia.TrabInvestigacion.TRABAJO#</td>
                                </tr>
                                <tr>
                                  <td align="right"><label class="font-bold">Clasificaci&oacute;n </label></td>
                                  <td colspan="2">#prc.sExperiencia.TrabInvestigacion.CLASIFICACION#</td>
                                  <td align="right"><label class="font-bold">Estado </label></td>
                                  <td colspan="2">#prc.sExperiencia.TrabInvestigacion.ESTADO#</td>
                                </tr>
                                <tr>
                                  <td align="right"><label class="font-bold">Publicado </label></td>
                                  <td>#prc.sExperiencia.TrabInvestigacion.PUBLICADO#</td>
                                  <td align="right"><label class="font-bold">Duraci&oacute;n del trabajo </label></td>
                                  <td>#prc.sExperiencia.TrabInvestigacion.DURACION#</td>
                                  <td align="right"><label class="font-bold">Periodo</label></td>
                                  <td>#prc.sExperiencia.TrabInvestigacion.FECHA_INI# - #prc.sExperiencia.TrabInvestigacion.FECHA_FIN#</td>
                                </tr>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                    </cfoutput>
                </form>
              </div>
              </section>
              </div>
              <div  class="col-sm-12">
              <section class="panel panel-default">
                 <div class="col-sm-1">
                    <cfif prc.sExperiencia.LaborDocente.FK_ESTATUS[1] eq 1>
                        <a style="font-size:25px" href="##"><i onclick="validacionLaborDocente();" class="fa fa-unlock"></i></a>
                    <cfelseif prc.sExperiencia.LaborDocente.FK_ESTATUS[1] eq 2>
                        <a style="font-size:25px" href="##"><i class="fa fa-lock"></i></a>
                    </cfif>
                  </div>
                <header class="panel-heading font-bold">LABOR DOCENTE</header>
                <div class="panel-body">
                      <div class="row">
                        <div class="table-responsive">
                            <cfoutput query="prc.sExperiencia.LaborDocente">
                              <table border="0" class="table">
                                <tr>
                                  <td align="right" class="font-bold" width="20%">Nombre de la instituci&oacute;n</td>
                                  <td colspan="3" width="80%">#prc.sExperiencia.LaborDocente.INSTITUCION#</td>
                                </tr>
                                <tr>
                                  <td align="right" class="font-bold">Asignatura o curso impartido</td>
                                  <td colspan="3">#prc.sExperiencia.LaborDocente.ASIGNATURA#</td>
                                </tr>
                                <tr>
                                  <td align="right" class="font-bold">Desde</td>
                                  <td>#prc.sExperiencia.LaborDocente.FECHA_INI#</td>
                                  <td align="right" class="font-bold">Hasta</td>
                                  <td>#prc.sExperiencia.LaborDocente.FECHA_FIN#</td>
                                </tr>
                              </table>
                              <div class="line line-dashed line-lg pull-in"></div>
                            </cfoutput>
                        </div>
                      </div>
                </div>
              </section>
              </div>
          </div>
        </div>
      </section>
      </div>
    </div>
  </section>
</section>
<a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
  <!-- 
  VENTANAS MODAL
  -->
  <div class="modal fade" id="modal-reinscripcion-condicionada">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Reinscripci&oacute;n Condicionada</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
                <p>
                  Debido a que en su inscripci&oacute;n no especifico documentos comprobatorios para su grado de estudios a nivel licenciatura se le ofrecen las siguientes opciones para poder realizar la petici&oacute;n de reinscripci&oacute;n
                </p>
                <select class="form-control">
                  <option>Pienso obtener la titulaci&oacute;n por cr&eacute;ditos de posgrado (Generar Carta Compromiso)</option>
                  <option>Pienso presentar evidencia documental del t&iacute;tulo antes de que termine el semestre</option>
                  <option>Cuento con el Acta de Examen Profesional</option>
                </select>
                <ol>
                  <li>Evidencia documental de la obtenci&oacute;n del t&iacute;tulo profesional antes de la terminaci&oacute;n del primer semestre de estudios</li>
                  <li>Aspirante con Acta de Examen Profesional: Adjuntar copia del acta de examen y comprobante del tr&aacute;mite para la expedici&oacute;n de t&iacute;tulo y c&eacute;dula profesional ante la Direcci&oacute;n General de Profesiones, de la SEP </li>
                </ol>
            </div>
          </div>          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Generar Carta Compromiso</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <div class="modal fade" id="modal-form">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">GENERAR CARTA COMPROMISO</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
                <p>
                  Debido a que en su inscripci&oacute;n no especifico documentos comprobatorios para su grado de estudios a nivel licenciatura es necesario que genere una carta compromiso
                  
                  <br><br>
                  M&eacute;xico, D.F 19 de Marzo de 2014

                  H. Colegio de Profesores

                  Por medio del presente me permito solicitar que se me exime del requisito de ingreso por motivos de titulación por créditos de posgrado, dando como fecha compromiso el pr&oacute;ximo 19/08/2014 como plazo compromiso para la entrega de mi documentaci&oacute;n faltante. Sin m&aacute;s por el momento agradezco su atenci&oacute;n.

                  #NOMBRE DEL ALUMNO AQUI#

                  <strong>Favor de seleccionar la unidad donde desea cursar el programa de posgrado</strong>
                </p>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Generar Carta Compromiso</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <!-- Ventanas Modal -->
  <div class="modal fade" id="modal-acta-nacimiento">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">ACTA DE NACIMIENTO</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
              <iframe src="http://148.204.77.87:8502/posgrado/includes/temporal/1_acta_nacimiento.pdf" width="560px" height="600px"></iframe>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <div class="modal fade" id="modal-cedula-profesional">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">CEDULA PROFESIONAL</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
              <iframe src="http://148.204.77.87:8502/posgrado/includes/temporal/cedula_profesional.pdf" width="560px" height="600px"></iframe>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <div class="modal fade" id="modal-terminacion-estudios">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">CERTIFICADO DE TERMINACI&Oacute;N DE ESTUDIOS DE LICENCIATURA</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
              <iframe src="http://148.204.77.87:8502/posgrado/includes/temporal/terminacion_estudios.pdf" width="560px" height="600px"></iframe>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <div class="modal fade" id="modal-conocimiento-ingles">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">COMPROBANTE DE CONOCIMIENTO DE INGLES</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
              <iframe src="http://148.204.77.87:8502/posgrado/includes/temporal/conocimiento_ingles.pdf" width="560px" height="600px"></iframe>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <div class="modal fade" id="modal-grado-maestria">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">GRADO DE MAESTRIA</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
              <iframe src="http://148.204.77.87:8502/posgrado/includes/temporal/certificado_grado_maestria.pdf" width="560px" height="600px"></iframe>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <div class="modal fade" id="modal-forma-migratoria">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">FORMA MIGRATORIA (FORMATO FM3)</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
              <iframe src="http://148.204.77.87:8502/posgrado/includes/temporal/forma_migratoria.pdf" width="560px" height="600px"></iframe>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
<script>
    <!---
    * Fecha creacion: 28 de Marzo de 2014
    * @author: David Monterrosas
    --->
    function validacionGlobal(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n del alumno?')){
            $.post( "validacionGlobal?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionInformacionPersonal(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionInformacionPersonal?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionEstudiosProf(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionEstudiosProf?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionEstudiosPostProf(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionEstudiosPostProf?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionIdiomas(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionIdiomas?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionResultadosEvaluacion(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionResultadosEvaluacion?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionConsejero(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionConsejero?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionDocumentos(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionDocumentos?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionDocumentoIndividual(pkArchivo){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionDocumentoIndividual?pkArchivo=" + pkArchivo + "&pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
				var JSONObject =  $.parseJSON(data);
				if (JSONObject.RESULTADO > 0) {
					alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionExperienciaProf(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionExperienciaProf?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionTrabajosInv(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionTrabajosInv?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
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
    function validacionLaborDocente(){
        if (confirm('\u00BFDesea validar la informaci\u00f3n seleccionada?')){
            $.post( "validacionLaborDocente?pkAlumno="+<cfoutput>#prc.pkAlumno#</cfoutput>, function( data ) {
                var JSONObject =  $.parseJSON(data);
                if (JSONObject.RESULTADO > 0) {
                    alert ("La informaci\u00f3n ha sido validada con \u00E9xito.");
					$('#eventStep1').val('SEPI.detalle_alumno');
					$('#formStep1').submit();
                } else {
                    alert ("Ocurri\u00f3 una interrupci\u00f3n en la conexi\u00f3n, favor de reintentar la operaci\u00f3n.");
                }
            });
        }
    }
	
	<!---
	* Fecha: 10 de Abril del 2014
	* @author: David Monterrosa
	--->
	function verificarNumero(evt,objeto){
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if( (charCode < 48 || charCode > 57) && charCode != 8 && charCode != 9 && charCode !=39 && charCode !=37 && charCode !=127 ){
			if((charCode == 46 && (objeto.value).indexOf(".") == -1)){
				return true;
			}else if(charCode == 46 && (objeto.value).indexOf(".") != -1){
				objeto.value='.';
				return false;
			}
			return true;
		}
	}
</script>