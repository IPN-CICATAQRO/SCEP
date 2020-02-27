  <section class="vbox">
	<form data-validate="parsley" action="#cgi.SCRIPT_NAME#" method="post" id="formStep1">
      <input type="hidden" name="event" id="eventStep1" value="">
      <input type="hidden" name="event" id="claveUr" value="<cfoutput>#prc.claveUr#</cfoutput>">
    </form>
	<section class="scrollable wrapper">
	  <div class="row">
		<div class="col-lg-12">
		  <section class="panel panel-default">
			<header class="panel-heading font-bold">
			  VALIDACI&Oacute;N DE PROGRAMAS DE POSGRADO
			  <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
			</header>
            
			<div class="panel-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                    	<label class="col-sm-2 control-label" for="exampleInputEmail2">Escuela</label>
                        <div class="col-sm-7">
                            <select id="selectEscuela" name="selectEscuela" class="form-control m-b"> 
                            <option>Todas</option>
                            <option>Escuela Superior de Computo</option>
                            <option>Escuela Superior de Ingenier&iacute;a Mec&aacute;nica y El&eacute;ctrica</option>
                            <option>Escuela Superior de Ingenieria Textil</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                    	<label class="col-sm-2 control-label" for="exampleInputEmail2">Periodo</label>
                        <div class="col-sm-5">
                            <select id="selectPeriodo" name="selectPeriodo" class="form-control m-b"> 
                            <option>Todos</option>
                            <option>2012-A</option>
                            <option>2012-A</option>
                            <option>2013-A</option>
                            <option>2013-B</option>
                            <option>2014-A</option>
                            <option>2014-B</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12" style="text-align:center">
                            <a href="##" style="font-size:30px"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                </form>
			<div class="panel-body">
			  <div class="table-responsive">
				<table class="table table-striped m-b-none" id="dt-solicitudes-inscripcion">
				  <thead>
					<tr>
					  <th width="50%">Nombre del Programa</th>
					  <th width="15%">Periodo</th>
					  <th width="15%">Acciones</th>
					</tr>
				  </thead>
				  <tbody>
                  	<cfoutput query="prc.qProgramas">
					<tr>
					  <td>#prc.qProgramas.NOMBRE_PROGRAMA#</td>
					  <td>#prc.qProgramas.PERIODO_ESCOLAR#</td>
					  <td>
						<cfif prc.qProgramas.FK_ESTADO eq 2>
						<a href="##" onclick="cambiarEstadoPrograma('#prc.qProgramas.FK_UR#',#prc.qProgramas.PK_PROGRAMA_POSGRADO#,#prc.qProgramas.FK_ESTADO#,1);" style="font-size:18px"><i class="fa fa-reply"></i></a>
                        <a href="##" onclick="cambiarEstadoPrograma('#prc.qProgramas.FK_UR#',#prc.qProgramas.PK_PROGRAMA_POSGRADO#,#prc.qProgramas.FK_ESTADO#,3);" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                        <cfelseif prc.qProgramas.FK_ESTADO eq 3>
                        <a href="##" style="font-size:18px"><i class="fa fa-lock"></i></a>
                        </cfif>
						<a data-toggle="modal" href="##modal-form" style="font-size:18px"><i class="fa fa-search"></i></a>
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
            <h4 class="modal-title" id="modalSolicitudEt">CONSULTAR ASIGNATURAS DE PROGRAMA DE POSGRADO</h4>
          </div>
          <div class="panel-body">
            <div class="modal-footer">
            </div>
            <div class="table-responsive">
            <table class="table table-striped m-b-none">
              <thead>
                <tr>
                  <th width="15%">Clave</th>
                  <th width="37%">Asignatura</th>
                  <th width="15%">Creditos</th>
                  <th width="15%">Tipo</th>
                  <th width="15%">Profesor</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>09756123</td>
                  <td>Calculo I</td>
                  <td>5</td>
                  <td>Obligatoria</td>
                  <td>Cesar Villa Contreras</td>
                </tr>
                <tr>
                  <td>09756124</td>
                  <td>Calculo II</td>
                  <td>8</td>
                  <td>Optativa</td>
                  <td>Jos&eacute; Fernando Montaño Hamiltong</td>
                </tr>
                <tr>
                  <td>09756125</td>
                  <td>Calculo III</td>
                  <td>10</td>
                  <td>Optativa</td>
                  <td>Juan Manuel Camilo Couth</td>
                </tr>
              </tbody>
            </table>
          </div>
          </div>
        </div>
      </div>
      </form>
    </div>
  </div>
    <script>
	<!---
	* Fecha: 10 de Abril del 2014
	* @author: David Monterrosa
	--->
	function cambiarEstadoPrograma(claveUR, pkPrograma, estado, estadoAccion){
		var tipoAccion = '';
		if(estadoAccion == 1)
			tipoAccion = 'rechazar';
		else
			tipoAccion = 'validar';

		if (confirm('\u00BFDesea '+tipoAccion+' la informaci\u00f3n seleccionada?')){
			var params = "";
			params += "?pkPrograma="	+ pkPrograma;
			params += "&claveUR="		+ claveUR;
			params += "&estado="		+ estado;
			params += "&estadoAccion="	+ estadoAccion;
			$.post( "cambiarEstadoPrograma" + params, function( data ) {
				var JSONObject =  $.parseJSON(data);
				if (JSONObject.RESULTADO > 0) {
					alert ("La informaci\u00f3n ha sido actualizada con \u00E9xito.");
					$('#eventStep1').val('SIP.programas');
					$('#formStep1').submit();
				} else {
					alert ("Ocurri\u00f3 una interrupci\u00f3n en la conexi\u00f3n, favor de reintentar la operaci\u00f3n.");
				}
			});
		}
	}
  </script>