<section class="vbox">
  <section class="scrollable wrapper">
              <div class="row">
                <div class="col-lg-12">
                  <!-- .breadcrumb 
                  <ul class="breadcrumb">
                    <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="#"><i class="fa fa-list-ul"></i> Elements</a></li>
                    <li class="active">Components</li>
                  </ul>
                  <!-- / .breadcrumb -->
                  

                  <section class="panel panel-default">
                    <header class="panel-heading font-bold">
                      REGISTRO DE COMITES EVALUADORES &nbsp;&nbsp;&nbsp;&nbsp;<a data-target="#modalRegistrarPeriodoAdmision" data-toggle="modal" href="#" class="btn btn-dark btn-sm">Registrar Nuevo Comite Evaluador</a>
                      <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
                    </header>
                    <div class="panel-body">
                      <div class="table-responsive">
                        <table class="table table-striped m-b-none" id="dt-solicitudes-inscripcion">
                          <thead>
                            <tr>
                              <th width="37%">Programa de posgrado</th>
                              <th width="37%">Periodo Escolar</th>
                              <th width="37%">Accion</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Sistemas</td>
                              <td>2014A</td>
                              <td>
                                
                                <a href="#" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                                <a href="#" style="font-size:18px"><i class="fa fa-edit"></i></a>
                                <a href="#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a de Telecomunicaciones</td>
                              <td>2013B</td>
                              <td>
                                <a href="#" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                                <a href="#" style="font-size:18px"><i class="fa fa-edit"></i></a>
                                <a href="#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a El&eacute;ctrica</td>
                              <td>2013A</td>
                              <td>
                                <a href="#" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                                <a href="#" style="font-size:18px"><i class="fa fa-edit"></i></a>
                                <a href="#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                              </td>
                            </tr>
                            <tr>
                              <td>Maestr&iacute;a en Ciencias en Ingenier&iacute;a Mec&aacute;nica</td>
                              <td>2012B</td>
                              <td>
                                <a href="#" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                                <a href="#" style="font-size:18px"><i class="fa fa-edit"></i></a>
                                <a href="#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
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