<section class="vbox">
    <section class="scrollable wrapper">
      <div class="row">
        <div class="col-lg-12">
          <section class="panel panel-default">
            <header class="panel-heading font-bold">
              SOLICITUDES DE INSCRIPCION
              <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
            </header>
            <div class="panel-body">
              <form class="form-horizontal" role="form">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="exampleInputEmail2">PROGRAMA</label>
                  <div class="col-sm-8">
                    <select id="selectPrograma" class="form-control m-b" onchange="actualizaTabla();"> 
                        <option value="0">Todos</option>
                        <cfoutput query="prc.qProgramas">
                           <option value="#prc.qProgramas.PK_PROGRAMA_POSGRADO#">#prc.qProgramas.NOMBRE_PROGRAMA#</option>
                        </cfoutput>
                    </select>
                  </div>
                </div>
              </form>
              <div class="col-sm-2">
                  </div>
              <div class="table-responsive">
                <table class="table table-striped m-b-none" id="tableAlumnos">
                  <thead>
                    <tr>
                      <th width="7%">N&uacute;mero de Registro</th>
                      <th width="37%">Nombre del Aspirante</th>
                      <th width="7%">Nivel</th>
                      <th width="7%">Tipo de alumno</th>
                      <th width="7%">Fecha de registro</th>
                      <th width="20%">Consejero</th>
                      <th width="15%">Acci&oacute;n</th>
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
                        <cfif prc.qAlumnos.FK_ESTADO_AVANCE lt 3>
                            <a style="font-size:18px"><i class="fa fa-trash-o"></i></a>
                            <a href="detalle_alumno?pkAlumno=#prc.qAlumnos.PK_ALUMNO#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                        <cfelse>
                            <a href="detalle_alumno?pkAlumno=#prc.qAlumnos.PK_ALUMNO#" style="font-size:18px"><i class="fa fa fa-search"></i></a>
                            <a data-toggle="modal" style="font-size:18px"><i class="fa fa-lock"></i></a>
                        </cfif>
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
					var acciones = '';
					if(JSONObject.DATA[x][2] == 3) 
						acciones = '<a style="font-size:18px"><i class="fa fa-trash-o"></i></a><a href="detalle_alumno?pkAlumno='+JSONObject.DATA[x][0]+'" style="font-size:18px"><i class="fa fa-unlock"></i></a>';
					else if(JSONObject.DATA[x][2] == 4)
						acciones = '<a href="detalle_alumno?pkAlumno='+JSONObject.DATA[x][0]+'" style="font-size:18px"><i class="fa fa fa-search"></i></a><a data-toggle="modal" style="font-size:18px"><i class="fa fa-lock"></i></a>';
					$('#tableAlumnos').dataTable().fnAddData([
						JSONObject.DATA[x][1],
						JSONObject.DATA[x][7]+' '+JSONObject.DATA[x][5]+' '+JSONObject.DATA[x][6],
						'MAESTRIA',
						'PARCIAL',
						'02/03/2014',
						'CONSEJERO',
						acciones
					]);
				}
			}
		});
	}
</script>