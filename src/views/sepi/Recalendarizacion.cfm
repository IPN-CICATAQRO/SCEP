<section class="vbox">
    <section class="scrollable wrapper">
      <div class="row">
        <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">
              SOLICITUD DE RECALENDARIZACI&Oacute;N
              <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
            </header>
            <div class="panel-body">
              <form class="form-horizontal" role="form">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="exampleInputEmail2">PROGRAMA</label>
                  <div class="col-sm-8">
                    <select id="selectPrograma" class="form-control m-b" onchange="actualizaTabla();"> 
                        <option value="0">Seleccione una opci&oacute;n</option>
                      <cfoutput query="prc.qProgramas">
                        <option value="#prc.qProgramas.PK_PROGRAMA_POSGRADO#">#prc.qProgramas.NOMBRE_PROGRAMA#</option>
                      </cfoutput>
                    </select>
                  </div>
                </div>
              </form>
              <div class="table-responsive">
                <table class="table table-striped m-b-none" id="tableAlumnos">
                  <thead>
                    <tr>
                      <th width="12%">Numero de Registro</th>
                      <th width="37%">Nombre del Aspirante</th>
                      <th width="7%">Nivel</th>
                      <th width="7%">Tipo de alumno</th>
                      <th width="7%">Fecha de registro</th>
                      <th width="20%">Alumno Consejero</th>
                      <th width="10%">Seleccionar</th>
                    </tr>
                  </thead>
                  <tbody>
                  <cfoutput query="prc.qAlumnos">
                    <tr>
                      <td>#prc.qAlumnos.FOLIO#</td>
                      <td>#prc.qAlumnos.NOMBRE# #prc.qAlumnos.APELLIDO_PATERNO# #prc.qAlumnos.APELLIDO_MATERNO#</td>
                      <td>MAESTRIA</td>
                      <td>PARCIAL</td>
                      <td>02/03/2014</td>
                      <td>CONSEJERO</td>
                      <td>
                       <input type="checkbox" data-toggle="modal" href="##modal-form">
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
<div class="modal fade" id="modal-form" >
    <form data-validate="parsley">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="modalSolicitudEt">SOLICITUD DE RECALENDARIZACI&Oacute;N</h4>
          </div>
          <div class="panel-body">
            <p class="text-muted">Importancia de cumplimiento al Jefe de Secci&oacute;n o Director</p>
            <div class="form-group pull-in clearfix">
              <div class="col-sm-11">
                <label>Diagnostico de la situaci&oacute;n que impide la entrega</label>
                <textarea id="actividades" class="form-control" rows="6" data-minwords="6" data-required="true"
                 placeholder="Capturar diagnostico aqu&iacute;" required></textarea>
              </div>
            </div>
            <div class="form-group pull-in clearfix">
              <div class="col-sm-11">
                <label>Detalle de correctivos</label>
                <textarea id="actividades" class="form-control" rows="6" data-minwords="6" data-required="true"
                 placeholder="Capturar correctivos aqu&iacute;" required></textarea>
              </div>
            </div>
            <div class="form-group pull-in clearfix">
              <div class="col-sm-11">
                <label>Fecha compromiso para entrega</label>
                <input class="datepicker-input form" size="16" type="text" value="" data-date-format="dd-mm-yyyy" >
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary">Importar</button>
          </div>
        </div>
      </div>
      </form>
    </div>
  </div>
<script>
	$(document).ready(function() {
		$('#tableAlumnos').dataTable();
	});

	function actualizaTabla(){
		var params = "";
		params += "?selectPrograma=" + $("#selectPrograma option:selected").val();
		$.post( "actualizaTabla" + params, function( data ) {
			var JSONObject = $.parseJSON(data);
			$('#tableAlumnos').dataTable().fnClearTable();
			if(JSONObject.DATA.length > 0){
				for(x=0 ; x<JSONObject.DATA.length ; x++){
					$('#tableAlumnos').dataTable().fnAddData([
						JSONObject.DATA[x][1],
						JSONObject.DATA[x][7]+' '+JSONObject.DATA[x][5]+' '+JSONObject.DATA[x][6],
						'MAESTRIA',
						'PARCIAL',
						'02/03/2014',
						'CONSEJERO',
						'<input type="checkbox" data-toggle="modal" href="##modal-form">'
					]);
				}
			}
		});
	}
</script>