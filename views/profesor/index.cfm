<script src="/posgrado/includes/base/scripts/highcharts/highcharts.js"></script>
<script src="/posgrado/includes/base/scripts/highcharts/modules/exporting.js"></script>
<script src="/posgrado/includes/base/scripts/highcharts/highcharts-3d.js"></script>
<cfinclude template = "profesor_js.cfm">
<section id="content">
    <div class="wrapper row2" style="background-color:#2E626E;">
        <div class="row">
            <div class="col-sm-12">
                <nav  class="navbar" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle  btn-lg fl_left" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">Desplegar navegación</span>
                            <span class="glyphicon glyphicon-align-justify" style="color: DADADDA;"></span> Men&uacute;
                        </button>
                    </div>
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul  id="tabs" class="nav nav-tabs nav-justified" data-tabs="tabs" >
                            <li class="active" ><a href="#paso1"  data-toggle="tab" onclick="cerrar();"><span>Tablero de</span><br><span>Control</span></a></li>
                            <li ><a  href="#paso2" data-toggle="tab" onclick="cerrar();"><span>Evaluacion de</span><br><span>alumnos</span></a></li>
                            <li ><a  href="#paso3" data-toggle="tab" onclick="cerrar();"><span>Gesti&oacute;n de </span><br><span>Reportes</span></a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="wrapper row3 well">
        <div class="tab-content">
            <div  class="tab-pane active" id="paso1">
              <div class="panel-body">
				<section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;" >
						<div class="row">
							<div class="col-sm-6">
								<div id="grafica1" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
							</div>
							<div class="col-sm-6">
								<div id="grafica2" style="height: 400px"></div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<div id="grafica3" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
							</div>
							<div class="col-sm-6">
								<div id="grafica4" style="height: 400px"></div>
							</div>
						</div>
						<br>
				</section>
			</div>			  
            </div>
            <div  class="tab-pane fade" id="paso2" >
			<div class="panel-body">
                <section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;" >
                    <div class="panel-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label class="text-left"> Elije el programa de posgrado:</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <select id="califPrograma" name="califPrograma" class="form-control m-b" required="true">
                                           <option value="-1">Seleccione una opci&oacute;n</option>
                                       </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label class="text-left"> Elije el curso:</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <select id="califCurso" name="califCurso" class="form-control m-b" required="true">
                                           <option value="-1">Seleccione una opci&oacute;n</option>
                                       </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-condensed" >
                                                <thead>
                                                    <tr >
                                                        <th width="20%">Alumno</th>
                                                        <th width="20%">Materia</th>
                                                        <th width="10%">Calificaci&oacute;n</th>
                                                        <th width="15%">Eliminar</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyHorario">
                                                    <cfif isDefined('prc.qHorario')>
                                                        <cfoutput query="prc.qHorario">
                                                            <tr id="trExperienciaProfesional#prc.qHorario.PK#">
                                                              <th style="font-weight:100">#prc.qExperiencia.PK_ALUMNO#</th>
                                                              <th style="font-weight:100">#prc.qExperiencia.MATERIA#</th>
                                                              <th style="font-weight:100">#prc.qExperiencia.CALIFICACION#</th>
                                                              <th><label><i class="fa fa-trash-o" style="cursor:pointer" onclick="eliminarExperiencia(#prc.qExperiencia.PK#);"></i></label></th>
                                                            </tr>
                                                        </cfoutput>
                                                    </cfif>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <button onclick="guardarDatosGenerales();" class="btn btn-s-xs fl_right">Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
                </div>
            </div>
            <div  class="tab-pane fade" id="paso3">
			
            </div>
            <!---<div  class="tab-pane fade" id="paso4">

            </div>
            <div  class="tab-pane fade" id="paso5">

            </div> --->
        </div>
    </div>
    <!---Ventana modal de cargando--->
    <div class="modal modal-static fade in" id="cargador-modal" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="text-center">
                        <img src="/posgrado/includes/base/images/loading.gif" class="icon" alt="" />
                        <h4>Procesando... <button type="button" class="close" style="float: none;" data-dismiss="modal" aria-hidden="true">&times;</button></h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--- Fin Ventana modal de cargando--->

</section>
<script type="text/javascript">

function cerrar() {
    $('.navbar-collapse').collapse('hide');
}
</script>
