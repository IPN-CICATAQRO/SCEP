<section class="vbox">
  <section class="scrollable wrapper">
    <div class="row">
      <div class="col-lg-12">
        <section class="panel panel-default">
            <header class="panel-heading font-bold">
              REVALIDACI&Oacute;N DE ESTUDIOS
              <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
            </header>
            <div class="panel-body">
              <div class="tab-content">
                <div class="tab-pane fade active in" id="informacion-general">
                  <div class="col-sm-6">
                    <section class="panel panel-default"><header class="panel-heading">Captura de asignatura a revalidar</header>
                        <div class="panel-body">
                          <form class="bs-example form-horizontal">
                            <div class="form-group">
                              <label class="col-sm-4 control-label">Nombre Asignatura</label>
                              <div class="col-sm-8">
                                <input type="text"  class="form-control">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-sm-4 control-label">Escuela Origen</label>
                              <div class="col-sm-8">
                                <input type="text"  class="form-control">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-sm-4 control-label">Documento Comprobatorio</label>
                              <div class="col-sm-8">
                                <div class="dropfile visible-lg">
                                  <small>Arrastra el archivo aqu&iacute;</small>
                                </div>
                              </div>
                            </div>
                          </form>
                        </div>
                    </section>
                  </div>
                  <div class="col-sm-6">
                    <section class="panel panel-default"><header class="panel-heading">Selecci&oacute;n de asignatura en plan de estudios</header>
                        <div class="panel-body">
                            <form class="bs-example form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Programa</label>
                                    <div class="col-sm-10">
                                      <select name="account" class="form-control m-b">
                                        <option>Seleccione una opci&oacute;n</option>
                                        <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a El&eacute;ctrica </option>
                                        <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a Electr&oacute;nica</option>
                                        <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a Mec&aacute;nica</option>
                                        <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Sistemas</option>
                                        <option>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Telecomunicaciones</option>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="col-sm-2 control-label">Asignatura</label>
                                    <div class="col-sm-10">
                                      <select name="account" class="form-control m-b">
                                        <option>Seleccione una opci&oacute;n</option>
                                        <option>Sist&eacute;mica Transdisciplinaria</option>
                                        <option>Sistemas de Informaci&oacute;n</option>
                                        <option>Optimizaci&oacute;n Matem&aacute;tica</option>
                                        <option>Seminario Departamental I</option>
                                        <option>Seminario Departamental II</option>
                                        <option>Seminario de Tesis</option>
                                      </select>
                                    </div>
                                  </div>
                            </form>
                        </div>
                     </section>
                  </div>
               </div>
            </div>
          </div>
          <div class="modal-footer" style="text-align:center">
            <button type="submit" class="btn btn-success">A&ntilde;adir Asignatura</button>
          </div>
		  <div class="table-responsive">
            <table class="table table-striped m-b-none" id="dt-solicitudes-inscripcion">
              <thead>
                <tr>
                  <th width="20%">Asignatura a revalidar</th>
                  <th width="20%">Escuela origen</th>
                  <th width="10%">Documento</th>
                  <th width="20%">Programa</th>
                  <th width="20%">Asignatura</th>
                  <th width="10%">Acci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Sist&eacute;mica Transdisciplinaria</td>
                  <td>Escuela Superior de Computo</td>
                  <td><a href="#" style="font-size:18px"><i class="fa fa-file-text-o"></i></a></td>
                  <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a Mec&aacute;nica</td>
                  <td>Sistemas de Informaci&oacute;n</td>
                  <td>
                    <a href="#" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                    <a data-toggle="modal" href="#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>Seminario Departamental II</td>
                  <td>Escuela Superior de Computo</td>
                  <td><a href="#" style="font-size:18px"><i class="fa fa-file-text-o"></i></a></td>
                  <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Sistemas</td>
                  <td>Sist&eacute;mica Transdisciplinaria</td>
                  <td>
                    <a href="#" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                    <a href="#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>Optimizaci&oacute;n Matem&aacute;tica</td>
                  <td>Escuela Superior de Computo</td>
                  <td><a href="#" style="font-size:18px"><i class="fa fa-file-text-o"></i></a></td>
                  <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Sistemas</td>
                  <td>Sistemas de Informaci&oacute;n</td>
                  <td>
                    <a href="detalle_inscripcion" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                    <a href="#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                  </td>
                </tr>
              </tbody>
            </table>
		   </div>
       </section>
      </div>
    </div>
  </section>
</section>
<a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>