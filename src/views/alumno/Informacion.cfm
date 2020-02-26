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
                              <cfoutput>#Request.qAlumno.NOMBRE[1]# #Request.qAlumno.APELLIDO_PATERNO[1]# #Request.qAlumno.APELLIDO_MATERNO[1]#</cfoutput>
                            </div> 
                            <small style="font-size: 20px;">Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Telecomunicaciones</small>
                          </div> 
                        </div>
                        <div class="col-sm-12" style="padding-top: 29px;"> 
                          <ul class="nav nav-tabs pull-left">
                            <li class="active"><a href="#informacion-general" data-toggle="tab"><i class="fa fa-user text-default"></i> Informaci&oacute;n General</a></li>
                            <li><a href="#informacion-academica" data-toggle="tab"><i class="fa fa-comments text-default"></i> Historia Acad&eacute;mica</a></li>
                            <li><a href="#documentos-comprobatorios" data-toggle="tab"><i class="fa fa-comments text-default"></i> Comprobantes Oficiales</a></li>
                            <li><a href="#experiencia-profesional" data-toggle="tab"><i class="fa fa-comments text-default"></i> Experiencia Laboral y Profesional</a></li>
                          </ul>
                        </div>
                      </div>
                    </header>
                    <div class="panel-body">
                      <div class="tab-content">
                        <div class="tab-pane fade active in" id="informacion-general">
                          <cfoutput>
                          <div class="col-sm-6">
                            <section class="panel panel-default"><header class="panel-heading">Escuela De Licenciatura De Procedencia</header>
                            <div class="panel-body">
                              <form class="bs-example form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"><strong>Tipo de Aspirante</strong></label>
                                    <div class="col-sm-8">
                                      <p class="form-control-static">Posgrado</p>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="col-sm-4 control-label"><strong>Tipo de alumno</strong></label>
                                    <div class="col-sm-8">
                                      <p class="form-control-static">Tiempo Completo</p>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="col-sm-4 control-label"><strong>Centro donde se imparte</strong></label>
                                    <div class="col-sm-8">
                                      <p class="form-control-static">ESCOM</p>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="col-sm-4 control-label"><strong>Nombre del profesor consejero</strong></label>
                                    <div class="col-sm-8">
                                      <p class="form-control-static">Juan Jose Molina</p>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="col-sm-4 control-label"><strong>Tel&eacute;fono</strong></label>
                                    <div class="col-sm-8">
                                      <p class="form-control-static"> #Request.qAlumno.TELEFONO[1]# </p>
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label class="col-sm-4 control-label"><strong>Correo Electr&oacute;nico</strong></label>
                                    <div class="col-sm-8">
                                      <p class="form-control-static"><a href="mailto:prueba@siiip.mx?subject=SIP"> #Request.qAlumno.MAIL[1]# </a></p>
                                    </div>
                                  </div>
                              </form>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <section class="panel panel-default"><header class="panel-heading">Informaci&oacute;n Personal</header>
                            <div class="panel-body">
                            <form class="bs-example form-horizontal">
                              <div class="form-group">
                                <label class="col-sm-4 control-label"><strong>Sexo</strong></label>
                                <div class="col-sm-8">
                                  <p class="form-control-static"> #Request.qAlumno.GENERO[1]# </p>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-4 control-label font-bold">Fecha de Nacimiento</label>
                                <div class="col-sm-8">
                                  <p class="form-control-static"> #Request.qAlumno.FECHA_NACIMIENTO[1]# </p>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-4 control-label font-bold">Lugar Nacimiento</label>
                                <div class="col-sm-8">
                                  <p class="form-control-static"> #Request.qAlumno.LUGAR_NACIMIENTO[1]# </p>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-4 control-label font-bold">RFC</label>
                                <div class="col-sm-8">
                                  <p class="form-control-static"> #Request.qAlumno.RFC[1]# </p>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-4 control-label font-bold">CURP</label>
                                <div class="col-sm-8">
                                  <p class="form-control-static"> #Request.qAlumno.CURP[1]# </p>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-4 control-label font-bold">Nacionalidad</label>
                                <div class="col-sm-8">
                                  <p class="form-control-static"> #Request.qAlumno.FK_NACIONALIDAD[1]# </p>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-4 control-label font-bold">Estado Civil</label>
                               <div class="col-sm-8">
                                  <p class="form-control-static"> #Request.qAlumno.ESTADO_CIVIL[1]# </p>
                                </div>
                              </div>
                            </form>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <section class="panel panel-default"><header class="panel-heading">Informaci&oacute;n residencial</header>
                            <div class="panel-body">
                              <form class="bs-example form-horizontal">
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Colonia</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.COLONIA[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">No Exterior</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.NUMEROEXT[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">No Interior</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.NUMEROINT[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Estado</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.ESTADO[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Tel&eacute;fono</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.TELEFONO[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Calle</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.CALLE[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">C.P.</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.CP[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Delegaci&oacute;n o Municipio</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.MUNICIPIO[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Pa&iacute;s</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.FK_PAIS[1]# </p>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <section class="panel panel-default"><header class="panel-heading">Informaci&oacute;n Laboral</header>
                            <div class="panel-body">
                              <form class="bs-example form-horizontal">
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Nombre de Empresa</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.EMPRESA[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Colonia</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.COLONIA_EMP[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Calle</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.CALLE_EMMP[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">N&uacute;mero</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.NUMERO_EMP[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">C.P.</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.CP_EMP[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Estado</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.ESTADO_EMP[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Delegaci&oacute;n o Municipio</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.MUNICIPIO_EMP[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Tel&eacute;fono</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.TELEFONO_EMP[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-4 control-label font-bold">Cargo</label>
                                  <div class="col-sm-8">
                                    <p class="form-control-static"> #Request.qAlumno.CARGO[1]# </p>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </div>
                        </div>
                        <div class="tab-pane fade" id="informacion-academica">
                          <!-- PROCEDENCIA EDUCATIVA -->
                          <div class="col-sm-6">
                            <section class="panel panel-default"><header class="panel-heading">Escuela De Licenciatura De Procedencia</header>
                            <div class="panel-body">
                              <form class="bs-example form-horizontal">
                                <div class="form-group">
                                  <label class="col-sm-2 control-label font-bold text-right">Nombre Instituci&oacute;n</label>
                                  <div class="col-sm-10">
                                    <p class="form-control-static"> #Request.sEstudios.EstudiosProfesionales.INSTITUCION[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label font-bold">Especialidad</label>
                                  <div class="col-sm-10">
                                    <p class="form-control-static"> #Request.sEstudios.EstudiosProfesionales.CARRERA[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label font-bold">Lugar</label>
                                  <div class="col-sm-10">
                                    <p class="form-control-static"> #Request.sEstudios.EstudiosProfesionales.NOM_PAIS[1]# </p>
                                  </div>
                                </div>
                                
                                <div class="form-group">
                                  <label class="col-sm-2 control-label font-bold">Periodo</label>
                                  <div class="col-sm-10">
                                    <p class="form-control-static"> #Request.sEstudios.EstudiosProfesionales.FECHA_INI[1]# - #Request.sEstudios.EstudiosProfesionales.FECHA_FIN[1]# </p>
                                  </div>
                                </div>
                              </form>
                            </div>
                            </section>
                          </div>
                          <div class="col-sm-6">
                            <section class="panel panel-default"><header class="panel-heading">Escuela De Posgrado De Procedencia</header>
                            <div class="panel-body">
                              <form class="bs-example form-horizontal">
                                <div class="form-group">
                                  <label class="col-sm-2 control-label font-bold">Nombre Instituci&oacute;n</label>
                                  <div class="col-sm-10">
                                    <p class="form-control-static"> #Request.sEstudios.EstudiosPostProfesionales.INSTITUCION[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label font-bold">Especialidad</label>
                                  <div class="col-sm-10">
                                    <p class="form-control-static"> #Request.sEstudios.EstudiosPostProfesionales.CARRERA[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label font-bold">Lugar</label>
                                  <div class="col-sm-10">
                                    <p class="form-control-static"> #Request.sEstudios.EstudiosPostProfesionales.NOM_PAIS[1]# </p>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label font-bold">Periodo</label>
                                  <div class="col-sm-10">
                                    <p class="form-control-static">#Request.sEstudios.EstudiosPostProfesionales.FECHA_INI[1]# - #Request.sEstudios.EstudiosPostProfesionales.FECHA_FIN[1]#</p>
                                  </div>
                                </div>
                              </form>
                            </div>
                            </cfoutput>
                            </section>
                          </div>
                          <div class="col-sm-12">
                            <section class="panel panel-default">
                              <header class="panel-heading">
                                Idiomas
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
                                  <cfoutput query="Request.sEstudios.Idiomas">
                								    <tr>
                                      <td>#Request.sEstudios.Idiomas.NOM_IDIOMA#</td>
                                      <td>#Request.sEstudios.Idiomas.NOM_DOMINIO#</td>
                                    </tr>
                								  </cfoutput>
                                  </tbody>
                                </table>
                              </div>
                            </section>
                          </div>
                        </div>

                        <div class="tab-pane fade" id="documentos-comprobatorios">
                          <section class="panel panel-default"><header class="panel-heading font-bold">RESULTADOS DE EVALUACI&Oacute;N</header>
                            <div class="panel-body">
                              <div class="row">
                                <div class="col-sm-6">
                                  <form class="form-horizontal" method="get">
                                    <div class="form-group">
                                      <label class="col-sm-4 control-label">Calificaci&oacute;n Examen de Admisi&oacute;n</label>
                                      <div class="col-sm-8">
                                        <p class="form-control-static">8.5</p>
                                      </div>
                                    </div>
                                  </form>
                                </div>
                                <div class="col-sm-6">
                                  <form class="form-horizontal" method="get">
                                    <div class="form-group">
                                      <label class="col-sm-4 control-label">Calificaci&oacute;n Examen de Ingl&eacute;s</label>
                                      <div class="col-sm-8">
                                        <p class="form-control-static">8.5</p>
                                      </div>
                                    </div>
                                  </form>
                                </div>
                              </div>
                            </div>
                          </section>
                          <section class="panel panel-default"><header class="panel-heading font-bold">PROFESOR CONSEJERO</header>
                            <div class="panel-body">
                              <div class="row">
                                <div class="col-sm-12">
                                  <form class="form-horizontal" method="get">
                                    <div class="form-group">
                                      <label class="col-sm-3 control-label">Nombre del Profesor Consejero</label>
                                      <div class="col-sm-9">
                                        <p class="form-control-static">Juan Romero</p>
                                      </div>
                                    </div>
                                  </form>
                                </div>
                              </div>
                            </div>
                          </section>
                          <div class="col-sm-8 col-md-offset-2">
                                <section class="panel panel-default">
                                  <header class="panel-heading">
                                    Documentos Comprobatorios
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
                                            <a data-toggle="modal" style="font-size:18px" href="#modal-acta-nacimiento"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">TITULO o CEDULA PROFESIONAL</td>
                                          <td align="center">
                                            <a data-toggle="modal" style="font-size:18px" href="#modal-cedula-profesional"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">CERTIFICADO DE TERMINACI&Oacute;N DE ESTUDIOS DE LICENCIATURA</td>
                                          <td align="center">
                                            <a data-toggle="modal" style="font-size:18px" href="#modal-terminacion-estudios"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <!--
                                        <tr>
                                          <td align="right">ACTA DE EXAMEN DE ADMISION</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                      -->
                                        <tr>
                                          <td align="right">COMPROBANTE DE CONOCIMIENTO DE INGLES</td>
                                          <td align="center">
                                            <a data-toggle="modal" style="font-size:18px" href="#modal-conocimiento-ingles"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <!-- OTROS CASOS -->
                                        <!-- SOLO ASPIRANTES A DOCTORADO -->
                                        <tr>
                                          <td align="right">COMPROBANTE DE GRADO DE MAESTRIA O CEDULA</td>
                                          <td align="center">
                                            <a data-toggle="modal" style="font-size:18px" href="#modal-grado-maestria"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">COPIA DEL ACTA DE EXAMEN DE GRADO DE MAESTR&Iacute;A Y GRADO DE MAESTR&Iacute;A</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <!-- ASPIRANTES EXTRANGEROS -->
                                        <tr>
                                          <td align="right">FORMA MIGRATORIA (CON VIGENCIA HASTA QUE TERMINE EL CICLO ESCOLAR)</td>
                                          <td align="center">
                                            <a data-toggle="modal" style="font-size:18px" href="#modal-forma-migratoria"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">CARTA PROTESTA (SIP 9)</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">LEGALIZACION DE ACTA DE NACIMIENTO</td> 
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">CERTIFICADO DE CALIFICACIONES</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">TITULO DE LICENCIATURA</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">LEGALIZACI&Oacute;N DEL GRADO DE MAESTR&Iacute;A PARA ASPIRANTES A DOCTORADO Y QUE SEAN ACOMPAÑADOS DE LA EQUIVALENCIA DE LOS ESTUDIOS RESPECTIVOS OTORGADA POR EL COLEGIO DE PROFESORES DE CADA UNIDAD</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <!-- TRADUCCIONES AL IDIOMA ESPANIOL -->
                                        <tr>
                                          <td align="right">TRADUCCION A ESPA&Ntilde;OL -> ACTA DE NACIMIENTO</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">TRADUCCION A ESPA&Ntilde;OL -> CERTIFICADO DE CALIFICACIONES</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">TRADUCCION A ESPA&Ntilde;OL -> T&Iacute;TULO DE LICENCIATURA</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">TRADUCCION A ESPA&Ntilde;OL -> LEGALIZACI&Oacute;N DEL GRADO DE MAESTR&Iacute;A PARA ASPIRANTES A DOCTORADO</td>
                                          <td align="center">
                                            <a style="font-size:18px" href="#"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">SIP - 01</td>
                                          <td align="center">
                                            <a data-toggle="modal" style="font-size:18px" href="#modal-sip01"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td align="right">SIP - 18</td>
                                          <td align="center">
                                            <a data-toggle="modal" style="font-size:18px" href="#modal-sip18"><i class="fa fa-search-plus"></i></a>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                                </section>
                              </div>
                        </div>
                        <div class="tab-pane fade" id="experiencia-profesional">
                          <section class="panel panel-default"><header class="panel-heading font-bold"> EXPERIENCIA PROFESIONAL</header>
                          <div class="panel-body">
                            <form class="form-horizontal" method="get">
                                <cfoutput query="Request.sExperiencia.Experiencia">
                                  <div class="form-group">
                                    <label class="col-sm-2 control-label font-bold">#Request.sExperiencia.Experiencia.FECHA_INI# - #Request.sExperiencia.Experiencia.FECHA_FIN#</label>
                                    <div class="col-sm-10">
                                      <div class="row">
                                        <label class="col-sm-3 text-right">
                                          <strong>Nombre del organismo</strong> 
                                        </label>
                                        <label class="col-sm-9">
                                          #Request.sExperiencia.Experiencia.INSTITUCION#
                                        </label>
                                        <label class="col-sm-3 text-right">
                                          <strong>Puesto desempe&ntilde;ado</strong>
                                        </label>
                                        <label class="col-sm-9">
                                         #Request.sExperiencia.Experiencia.PUESTO#</label>
                                        </label>
                                        <label class="col-sm-3 text-right">
                                          <strong>Sector</strong> 
                                        </label>
                                        <label class="col-sm-9">
                                          #Request.sExperiencia.Experiencia.NOM_CLASIFICACION#</label>
                                        <label class="col-sm-3 text-right">
                                          <strong>Actividades Realizadas</strong> 
                                        </label>
                                        <label class="col-sm-9">
                                          #Request.sExperiencia.Experiencia.ACTIVIDADES#</label>
                                        </label>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="line line-dashed line-lg pull-in"></div>
                                </cfoutput>
                            </form>
                          </div>
                          </section>
                          <section class="panel panel-default">
                            <header class="panel-heading font-bold"> TRABAJOS DE INVESTIGACION</header>
                            <div class="panel-body">
                            <form class="form-horizontal" method="get">
                            	<cfoutput query="Request.sExperiencia.TrabInvestigacion">
                                  <div class="form-group">
                                    <div class="col-sm-12">
                                      <div class="row">
                                        <div class="table-responsive">
                                          <table border="0" class="table">
                                            <tr>
                                              <td align="right"><label class="font-bold">Nombre del trabajo </label></td>
                                              <td colspan="5">#Request.sExperiencia.TrabInvestigacion.TRABAJO#</td>
                                            </tr>
                                            <tr>
                                              <td align="right"><label class="font-bold">Clasificaci&oacute;n </label></td>
                                              <td colspan="2">#Request.sExperiencia.TrabInvestigacion.CLASIFICACION#</td>
                                              <td align="right"><label class="font-bold">Estado </label></td>
                                              <td colspan="2">#Request.sExperiencia.TrabInvestigacion.ESTADO#</td>
                                            </tr>
                                            <tr>
                                              <td align="right"><label class="font-bold">Publicado </label></td>
                                              <td>#Request.sExperiencia.TrabInvestigacion.PUBLICADO#</td>
                                              <td align="right"><label class="font-bold">Duraci&oacute;n del trabajo </label></td>
                                              <td>#Request.sExperiencia.TrabInvestigacion.DURACION#</td>
                                              <td align="right"><label class="font-bold">Periodo</label></td>
                                              <td>#Request.sExperiencia.TrabInvestigacion.FECHA_INI# - #Request.sExperiencia.TrabInvestigacion.FECHA_FIN#</td>
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
                          <section class="panel panel-default">
                            <header class="panel-heading font-bold">EXPERIENCIA COMO DOCENTE</header>
                            <div class="panel-body">
                                  <div class="row">
                                    <div class="table-responsive">
                            			<cfoutput query="Request.sExperiencia.LaborDocente">
                                          <table border="0" class="table">
                                            <tr>
                                              <td align="right" class="font-bold" width="20%">Nombre de la instituci&oacute;n</td>
                                              <td colspan="3" width="80%">#Request.sExperiencia.LaborDocente.INSTITUCION#</td>
                                            </tr>
                                            <tr>
                                              <td align="right" class="font-bold">Asignatura o curso impartido</td>
                                              <td colspan="3">#Request.sExperiencia.LaborDocente.ASIGNATURA#</td>
                                            </tr>
                                            <tr>
                                              <td align="right" class="font-bold">Desde</td>
                                              <td>#Request.sExperiencia.LaborDocente.FECHA_INI#</td>
                                              <td align="right" class="font-bold">Hasta</td>
                                              <td>#Request.sExperiencia.LaborDocente.FECHA_FIN#</td>
                                            </tr>
                                          </table>
                                        </cfoutput>
                                    </div>
                                  </div>
                            </div>
                            <div class="line line-dashed line-lg pull-in"></div>
                          </section>
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
   <div class="modal fade" id="modal-sip01">
    <div class="modal-dialog lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">SIP - 01</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
              <iframe src="/posgrado/views/alumno/sip_01.cfm" width="560px" height="600px"></iframe>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
    <div class="modal fade" id="modal-sip18">
    <div class="modal-dialog lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">SIP - 18</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
              <iframe src="/posgrado/views/alumno/sip_18.cfm" width="560px" height="600px"></iframe>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
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