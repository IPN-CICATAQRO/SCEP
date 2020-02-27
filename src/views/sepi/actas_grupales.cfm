<section class="vbox">
  <section class="scrollable wrapper">
              <div class="row">
                <div class="col-lg-12">
                  <section class="panel panel-default">
                    <header class="panel-heading font-bold">
                    <h3>Validaci&oacute;n de actas grupales de evaluaci&oacute;n</h3><br/>
                      <div class="form-group pull-in clearfix">
                          <div class="col-sm-6">
                            <label>Programa de Posgrado</label>
                            <select name="estatusTiempo" class="form-control m-b">
                                <option>Seleccione una opci&oacute;n</option>
                                <option>Maestria en Ciencias en Ingenieria de Sistemas</option>
                                <option>Maestria en Ciencias en Ingenieria de Telecomunicaciones</option>
                             </select>
                          </div>
                      </div>
                       <h5>Seleccione la materia a la cual desea generar el acta grupal de evaluaci&oacute;n</h5><br/>
                      <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
                    </header>
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-sm-12">
                          <div class="table-responsive">
                            <table class="table table-striped m-b-none" id="dt-periodos-admision">
                              <thead>
                                <tr>
                                  <td width="10%">Clave</td>
                                  <td width="35%">Nombre de Asignatura</td>
                                  <td width="15%">Semestre</td>
                                  <td width="30%">Programa</td>
                                  <td width="10%">Acciones</td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>053696</td>
                                  <td>TOPICOS  SELECTOS DE SISTEMAS DE INGENIERIA</td>
                                  <td>3</td>
                                  <td>Maestria en Ciencias en Ingenieria de Sistemas</td>
                                  <td>
                                    <a style="font-size:18px" href="#"><i class="fa fa-pencil" href="#modal-form" data-toggle="modal"></i></a>
                                    <a style="font-size:18px"><i class="fa fa-unlock"></i></a>
                                  </td>
                                </tr>
                                <tr>
                                  <td>265890</td>
                                  <td>TOPICOS  SELECTOS DE CIENCIA  DE SISTEMAS</td>
                                  <td>3</td>
                                  <td>Maestria en Ciencias en Ingenieria de Telecomunicaciones</td>
                                  <td>
                                     <a style="font-size:18px" href="#"><i class="fa fa-search-plus" href="#modal-form-consulta" data-toggle="modal"></i></a>
                                     <a style="font-size:18px"><i class="fa fa-lock"></i></a>
                                  </td>
                                </tr>
                                <tr>
                                  <td>987746</td>
                                  <td>OPERACION DE SISTEMAS FLEXIBLES DE PRODUCCION</td>
                                  <td>3</td>
                                  <td>Maestria en Ciencias en Ingenieria de Telecomunicaciones</td>
                                  <td>
                                     <a style="font-size:18px" href="#"><i class="fa fa-search-plus" href="#modal-form-consulta" data-toggle="modal"></i></a>
                                     <a style="font-size:18px"><i class="fa fa-lock"></i></a>
                                  </td>
                                </tr>
                                <tr>
                                  <td>987746</td>
                                  <td>TEORIA ELECTROMAGNETICA</td>
                                  <td>3</td>
                                  <td>Maestria en Ciencias en Ingenieria de Telecomunicaciones</td>
                                  <td>
                                     <a style="font-size:18px" href="#"><i class="fa fa-search-plus" href="#modal-form-consulta" data-toggle="modal"></i></a>
                                     <a style="font-size:18px"><i class="fa fa-lock"></i></a>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                    </div>
                  </section>
                </div>
              </div>
              </div>
            </section>
  
</section>
<a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>


  <!-- VENTANAS MODAL -->
  <!--
  VENTANAS MODALES
  -->
    <div class="modal fade" id="modal-form">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">Validaci&oacute;n de Actas Grupales de Evaluaci&oacute;n</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-sm-12 b-r">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Asignatura:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">TOPICOS SELECTOS DE SISTEMAS DE INGENIERIA</p>
                          </div>
                        </div>
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Clave del Programa de Posgrado:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">026398</p>
                          </div>
                        </div>
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Profesor:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">Rafael Norman Saucedo</p>
                          </div>
                        </div>
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Numero de Registro:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">583569</p>
                          </div>
                        </div>
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Semestre donde se imparte:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">3</p>
                          </div>
                        </div>
                    </div>
                  </form>
                  <div class="table-responsive">
                    <table class="table table-striped m-b-none" id="dt-comite-evaluador">
                      <thead>
                        <tr>
                          <th width="15%">No. Registro</th>
                          <th width="40%">Alumno</th>
                          <th width="15%">Calificaci&oacute;n N&uacute;mero</th>
                          <th width="15%">Calificaci&oacute;n Letra</th>
                          <th width="10%">Acciones</th>
                        </tr>
                      </thead>
                      <tbody>
                        <cfoutput query="Request.qAlumnos">
                            <tr>
                              <td>01</td>
                              <td>#Request.qAlumnos.NOMBRE# #Request.qAlumnos.APELLIDO_PATERNO# #Request.qAlumnos.APELLIDO_MATERNO#</td>
                              <td>
                                <input id="numero" type="number" class="form-control" value="9" data-required="true" required>
                              </td>
                              <td>
                                <p class="form-control-static">Nueve</p>
                              </td>
                              <td align="center"><a style="font-size:18px" href="#"><i class="fa fa-unlock"></i></a></td>
                            </tr>
                        </cfoutput>
                      </tbody>
                    </table>
                  </div>
               </div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Validar</button>&nbsp;
          <button type="button" class="btn btn-primary" data-dismiss="modal">Generar Formato</button>&nbsp;
          <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar Cambios</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
    <div class="modal fade" id="modal-form-consulta">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">CONSULTA DE ACTA GRUPAL DE CALIFICACIONES</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-sm-12 b-r">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Asignatura:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">TOPICOS SELECTOS DE CIENCIA DE SISTEMAS</p>
                          </div>
                        </div>
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Clave:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">026398</p>
                          </div>
                        </div>
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Profesor:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">Rafael Norman Saucedo</p>
                          </div>
                        </div>
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>No. Registro:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">01</p>
                          </div>
                        </div>
            <div class="form-group">
                          <label class="col-sm-4 control-label"><strong>Semestre:</strong></label>
                          <div class="col-sm-8">
                            <p class="form-control-static">3</p>
                          </div>
                        </div>
                    </div>
                  </form>
                  <div class="table-responsive">
                    <table class="table table-striped m-b-none" id="dt-comite-evaluador">
                      <thead>
                        <tr>
                          <th width="15%">No. Registro</th>
                          <th width="40%">Alumno</th>
                          <th width="15%">Calificaci&oacute;n N&uacute;mero</th>
                          <th width="15%">Calificaci&oacute;n Letra</th>
                        </tr>
                      </thead>
                      <tbody>
                      <cfoutput query="Request.qAlumnos">
                        <tr>
                          <td>589760</td>
                          <td>#Request.qAlumnos.NOMBRE# #Request.qAlumnos.APELLIDO_PATERNO# #Request.qAlumnos.APELLIDO_MATERNO#</td>
                          <td>9</td>
                          <td>
                            <p class="form-control-static">Nueve</p>
                          </td>
                        </tr>
                      </cfoutput>
                      </tbody>
                    </table>
                  </div>
               </div>
            </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>