  <section class="vbox">
	<form data-validate="parsley" action="#cgi.SCRIPT_NAME#" method="post" id="formStep1">
      <input type="hidden" name="event" id="eventStep1" value="">
    </form>
	<section class="scrollable wrapper">
	  <div class="row">
		<div class="col-lg-12">
		  <section class="panel panel-default">
			<header class="panel-heading font-bold">
			  PROGRAMAS DE POSGRADO
			  <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
			</header>
			<div class="panel-body">
            <div class="form-group">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                    	<label class="col-sm-2 control-label">Nombre de Programa</label>
                        <div class="col-sm-7">
							<input class="form-control" type="text" id="nombrePrograma" required>
                        </div>
                    </div>
                    <div class="form-group">
                    	<label class="col-sm-2 control-label">Duraci&oacute;n en Semestres</label>
                        <div class="col-sm-4">
							<input class="form-control" type="text" id="duracion" required onKeyPress="return onlyNumbers(event);">
                        </div>
                    </div>
                    <div class="form-group">
                    	<label class="col-sm-2 control-label">Periodo</label>
                        <div class="col-sm-5">
                            <select id="selectPeriodo" name="selectPeriodo" class="form-control"> 
                            <option value="0">Seleccione una opci&oacute;n</option>
                            <cfoutput query="prc.qCatPeriodos">
                                <option value="#prc.qCatPeriodos.TP_PK_PERIODOS#">#prc.qCatPeriodos.TP_ANIO# - #prc.qCatPeriodos.TP_CLASIFICACION#</option>
                            </cfoutput>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                    	<label class="col-sm-2 control-label">Coordinador</label>
                        <div class="col-sm-5">
                            <select id="selectCoordinador" name="selectCoordinador" class="form-control"> 
                            <option value="0">Seleccione una opci&oacute;n</option>
                            <cfoutput query="prc.qCatCoordinador">
                                <option value="#prc.qCatCoordinador.PK_PERSONA#">#prc.qCatCoordinador.NOMBRE# #prc.qCatCoordinador.APELLIDO_PATERNO# #prc.qCatCoordinador.APELLIDO_MATERNO#</option>
                            </cfoutput>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <div class="col-sm-12" style="text-align:center">
                        <button onclick="importarPrograma();" class="btn btn-success btn-s-xs">Guardar Programa</button>
                    </div>
                </div>
                <br/>
            </div>
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
						<cfif prc.qProgramas.FK_ESTADO eq 1>
                            <a href="##" onclick="cambiarEstadoPrograma(#prc.qProgramas.PK_PROGRAMA_POSGRADO#,#prc.qProgramas.FK_ESTADO#,2);" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                            <a href="##" onclick="cambiarEstadoPrograma(#prc.qProgramas.PK_PROGRAMA_POSGRADO#,#prc.qProgramas.FK_ESTADO#,0);" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
							<a href="programa_asignatura?pkPrograma=#prc.qProgramas.PK_PROGRAMA_POSGRADO#" style="font-size:18px"><i class="fa fa-plus-square"></i></a>
                        <cfelse>
	                        <a href="##" style="font-size:18px"><i class="fa fa-lock"></i></a>
	                        <a data-toggle="modal" href="##modal-form" style="font-size:18px"><i class="fa fa-search"></i></a>
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
	function cambiarEstadoPrograma(pkPrograma, estado, estadoAccion){
		var tipoAccion = '';
		if(estadoAccion == 2)
			tipoAccion = 'validar';
		else
			tipoAccion = 'eliminar';

		if (confirm('\u00BFDesea '+tipoAccion+' la informaci\u00f3n seleccionada?')){
			var params = "";
			params += "?pkPrograma=" + pkPrograma;
			params += "&estado=" + estado;
			params += "&estadoAccion="	+ estadoAccion;
			$.post( "cambiarEstadoPrograma" + params, function( data ) {
				var JSONObject =  $.parseJSON(data);
				if (JSONObject.RESULTADO > 0) {
					alert ("La informaci\u00f3n ha sido actualizada con \u00E9xito.");
					$('#eventStep1').val('SEPI.programas');
					$('#formStep1').submit();
				} else {
					alert ("Ocurri\u00f3 una interrupci\u00f3n en la conexi\u00f3n, favor de reintentar la operaci\u00f3n.");
				}
			});
		}
	}

	<!---
	* Fecha: 10 de Abril del 2014
	* @author: David Monterrosa
	--->
	function onlyNumbers (event){	
		var key = (navigator.appName=="Microsoft Internet Explorer") ? event.keyCode : event.which ;	
		return ( key <= 13 || key == 32 || (key > 47 && key < 58) );
	}

	<!---
	* Fecha: 10 de Abril del 2014
	* @author: David Monterrosa
	--->
	function importarPrograma(){
		if(! validarCamposPrograma())
			return;
		if (confirm('\u00BFDesea guardar la informaci\u00f3n seleccionada?')){
			var params = "";
			params += "?nombrePrograma=" + $('#nombrePrograma').val();
			params += "&duracion=" + $('#duracion').val();
			params += "&selectPeriodo="	+ $('#selectPeriodo option:selected').val();
			params += "&selectCoordinador="	+ $('#selectCoordinador option:selected').val();
			$.post( "importarPrograma" + params, function( data ) {
				var JSONObject =  $.parseJSON(data);
				if (JSONObject.RESULTADO > 0) {
					alert ("La informaci\u00f3n ha sido guardada con \u00E9xito.");
					$('#eventStep1').val('SEPI.programas');
					$('#formStep1').submit();
				} else {
					alert ("Ocurri\u00f3 una interrupci\u00f3n en la conexi\u00f3n, favor de reintentar la operaci\u00f3n.");
				}
			});
		}
	}
	
	<!---
	* Fecha: 10 de Abril del 2014
	* @author: David Monterrosa
	--->
	function validarCamposPrograma(){
		if($('#nombrePrograma').val() == ''){
			alert('Es necesario indicar el nombre del programa, por favor verifique.');
			return false;
		}
		if($('#duracion').val() == ''){
			alert('Es necesario indicar la duraci\u00f3n, por favor verifique.');
			return false;
		}
		if($('#selectPeriodo option:selected').val() == 0){
			alert('Es necesario indicar el periodo, por favor verifique.');
			return false;
		}
		if($('#selectCoordinador option:selected').val() == 0){
			alert('Es necesario indicar el coordinador, por favor verifique.');
			return false;
		}
		return true;
	}
  </script>