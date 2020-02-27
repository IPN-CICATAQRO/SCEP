<section class="vbox">
  <section class="scrollable wrapper">
              <div class="row">
                <div class="col-lg-12">
                  <section class="panel panel-default">
                    <div class="panel-body">
                      <!--
                      <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <i class="fa fa-ban-circle"></i><strong>DESCRIPCION DE LA PANTALLA</strong> <a href="#" class="alert-link">Una vez que la reinscripci&oacute;n (SIP-10) del alumno es autorizado, la SIP por conducto de la DAP enviar&aacute; a la SEPI o Centro la validaci&oacute;n de las solicitudes de los alumnos a los semestres
                        <ul>
                          <li>La entrega se hace en un plazo no mayor a un mes</li>
                          <li>Secci&oacute;n de Posgrado o el Centro deber&aacute; entregar al alumno, copia autorizada de su reinscripci&oacute;n</li>
                          <li>En caso de que &eacute;sta no haya procedido, Control Escolar de la Secci&oacute;n o Centro deber&aacute; dar seguimiento a todas aquellas reinscripciones condicionadas hasta que el alumno cumpla con los requisitos solicitados por la SIP</li>
                        </ul>
                      </div>
                      -->
                      <h3>REINSCRIPCIONES AUTORIZADAS POR LA SECRETARIA DE INVESTIGACION Y POSGRADO</h3>
                      <div class="table-responsive">
                        <table class="table table-striped m-b-none" id="dt-solicitudes-inscripcion">
                          <thead>
                            <tr>
                              <th width="5%">No. de registro</th>
                              <th width="40%">Nombre</th>
                              <th width="5%">Semestre</th>
                              <th width="10%">Programa</th>
                              <th width="7%">Estado General</th>
                              <th width="7%">Observaciones</th>
                              <th width="6%">Comprobante</th>
                              <th width="20%">Acciones</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>010108</td>
                              <td>Alfonso Ru&iacute;z Cortines</td>
                              <td>3</td>
                              <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Sistemas</td>
                              <td><a class="btn btn-s-md btn-success" href="#">Inscrito</a></td>
                              <td>Observaciones</td>
                              <td>PDF</td>
                              <td>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-reply"></i></a>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td>020805</td>
                              <td>Julio Santiago Nuñez</td>
                              <td>6</td>
                              <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Telecomunicaciones</td>
                              <td><a class="btn btn-s-md btn-warning" href="#">Rechazado</a></td>
                              <td>Observaciones</td>
                              <td>PDF</td>
                              <td>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-reply"></i></a>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </section>
                </div>
              </div>
            </section>
  
</section>
<a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>


  <!-- VENTANAS MODAL -->
  <div class="modal fade" id="modalRegistrarPeriodoAdmision">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">AUTORIZACI&Oacute;N DE INSCRIPCION</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-12 b-r">
                <form class="form-horizontal" role="form">
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="programaPosgrado">PROGRAMA</label>
                          <div class="col-sm-10">
                            <select id="programaPosgrado" name="account" class="form-control m-b"> 
                              <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Sistemas</option>
                              <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Telecomunicaciones</option>
                              <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a El&eacute;ctrica</option>
                              <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a Mec&aacute;nica</option>
                            </select>  
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="periodoEscolar">Periodo escolar</label>
                          <div class="col-sm-10">
                            <select id="periodoEscolar" name="account" class="form-control m-b"> 
                              <option>2014 A</option>
                              <option>2014 B</option>
                            </select>  
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="periodoEscolar">Numero de Empleado</label>
                          <div class="col-sm-10">
                            <input type="number" class="form-control">
                          </div>
                        </div>
                      </form>
                      <div class="table-responsive">
                        <table class="table table-striped m-b-none" id="dt-comite-evaluador">
                          <thead>
                            <tr>
                              <th width="37%">Numero de Empleado</th>
                              <th width="37%">Nombre del Miembro</th>
                              <th width="37%">Accion</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>583569</td>
                              <td>Riquelme Antara Noe</td>
                              <td>
                                <a href="#" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
            </div>
          </div>          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar Comite</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>