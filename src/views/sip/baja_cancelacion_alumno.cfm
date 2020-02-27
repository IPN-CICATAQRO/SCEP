<section class="vbox">
 <section class="scrollable wrapper">
              <div class="row">
                <div class="col-lg-12">
                  <section class="panel panel-default">
                    <header class="panel-heading font-bold">
                      ALUMNOS QUE DEBEN SER DADOS DE BAJA
                      <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
                    </header>
                    <div class="panel-body">
                      <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <i class="fa fa-ban-circle"></i><strong>DESCRIPCION DE LA PANTALLA</strong> <a href="#" class="alert-link">se refiere a la responsabilidad de la Secci&oacute;n o Centro de informar a la Secretar&iacute;a cuando el Colegio de Profesores determine la cancelaci&oacute;n o baja de un registro de un alumno inscrito en alg&uacute;n programa de posgrado. 
                        <ul>
                          <li>Las situaciones de bajas o cancelaci&oacute;n de registros deber&aacute;n reportarse durante el proceso de recepci&oacute;n de inscripciones y reinscripciones</li>
                          <li>Tambien se pueden reportar casos de baja o cancelacion fuera de periodo cuando el alumno lo solicita durante el periodo escolar</li>
                          <li>La unidad acad&eacute;mica tiene la responsabilidad de reportar las bajas de forma inmediata a la Secretar&iacute;a</li>
                          <li>
                            Los motivos por los cuales se le puede dar de baja
                            <ul>
                              <li>Por solicitud propia</li>
                              <li>Por abandonar estudios sin autorizaci&oacute;n</li>
                              <li>Por reprobar dos asignaturas</li>
                              <li>Por reprobar en dos ocasiones la misma asignatura</li>
                              <li>Por presentar un trabajo de tesis o tesina copiado en su mayor parte y en lo esencial, de otro trabajo realizado por otros alumnos </li>o investigadores
                              <li>Por incurrir en faltas a los ordenamientos vigentes en el Instituto</li>
                              <li>Por acumular dos evaluaciones no aprobatorias del comit&eacute; tutorial</li>
                              <li>Exceder los plazos establecidos para obtener el diploma o grado correspondiente</li>
                              <li>Recibir un dictamen de reprobado en el examen de especialidad, especialidad m&eacute;dica, maestr&iacute;a, doctorado o predoctoral</li>
                            </ul>    
                          </li>
                        </ul>
                      </div>
                      <div class="table-responsive">
                        <table class="table table-striped m-b-none" id="dt-solicitudes-inscripcion">
                          <thead>
                            <tr>
                              <th width="7%">Numero de Registro</th>
                              <th width="20%">Nombre del Aspirante</th>
                              <th width="5%">Nivel</th>
                              <th width="30%">Programa de posgrado</th>
                              <th width="25%">Motivo</th>
                              <th width="13%">Accion</th>
                            </tr>
                          </thead>
                          <tbody>
                          <cfoutput query="Request.qAlumnos">
                            <tr>
                              <td>9756123</td>
                              <td>#Request.qAlumnos.NOMBRE# #Request.qAlumnos.APELLIDO_PATERNO# #Request.qAlumnos.APELLIDO_MATERNO#</td>
                              <td>MAESTRIA</td>
                              <td>Computo Movil</td>
                              <td>Por incurrir en faltas a los ordenamientos vigentes en el Instituto</td>
                              <td>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                                <a href="detalle_inscripcion.html" style="font-size:18px"><i class="fa fa fa-plus-square"></i></a>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-share-square-o"></i></a>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-search"></i></a>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-reply"></i></a>
                                <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-pencil"></i></a>
                              </td>
                            </tr>
                          </cfoutput>
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