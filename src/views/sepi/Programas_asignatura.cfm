  <section class="vbox">
	<section class="scrollable wrapper">
	  <div class="row">
		<div class="col-lg-12">
		  <section class="panel panel-default">
          <form data-validate="parsley" action="#cgi.SCRIPT_NAME#" method="post" id="formStep1">
		  <input type="hidden" name="event" id="eventStep1" value="">
          <input type="hidden" name="event" id="pkPrograma" value="<cfoutput>#prc.pkPrograma#</cfoutput>">
          </form>
			<header class="panel-heading font-bold">
			  REGISTRO DE PROGRAMAS DE POSGRADO
			  <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
			</header>
			<div class="panel-body">
            	<cfif prc.qInfoPrograma.RECORDCOUNT GT 0>
                <cfoutput>
				<form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">NOMBRE DEL PROGRAMA</label>
                        <div class="col-sm-8">
                            <p class="form-control-static">#prc.qInfoPrograma.NOMBRE_PROGRAMA#</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label  font-bold">COORDINADOR DEL PROGRAMA</label>
                        <div class="col-sm-8">
                            <p class="form-control-static">#prc.qInfoPrograma.NOMBRE# #prc.qInfoPrograma.APELLIDO_PATERNO# #prc.qInfoPrograma.APELLIDO_MATERNO#</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label  font-bold">DURACI&Oacute;N EN SEMESTRES</label>
                        <div class="col-sm-8">
                            <p class="form-control-static">#prc.qInfoPrograma.DURACION_SEMESTRES#</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label  font-bold">NO. CREDITOS</label>
                        <div class="col-sm-8">
                            <p class="form-control-static">6</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">NO. OPTATIVAS</label>
                        <div class="col-sm-8">
                            <p class="form-control-static">6</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">NO. SEMINARIOS</label>
                        <div class="col-sm-8">
                            <p class="form-control-static">6</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label font-bold">NO. OBLIGATORIAS</label>
                        <div class="col-sm-8">
                            <p class="form-control-static">6</p>
                        </div>
                    </div>
				</form>
                </cfoutput>
                </cfif>
			</div>
		</section>
		<section class="panel panel-default">
			<header class="panel-heading font-bold">
			  REGISTRO DE PROGRAMAS DE POSGRADO&nbsp;&nbsp;&nbsp;
			  <a href="registro_asignaturas?pkPrograma=<cfoutput>#prc.pkPrograma#</cfoutput>&pkAsignatura=0" class="btn btn-primary btn-sm">Registrar Nueva Asignatura Para este Programa</a>
			</header>
			<div class="panel-body">
			  <div class="table-responsive">
				<table class="table table-striped m-b-none" id="dt-solicitudes-inscripcion">
				  <thead>
					<tr>
						<th width="60%">Nombre Asignatura</td>
						<th width="10%">Tipo de Asignatura</td>
						<th width="5%">Horas Teor&iacute;a</td>
						<th width="5%">Horas Practica</td>
						<th width="5%">Horas Te&oacute;rico Practicas</td>
						<th width="5%">Unidades de Cr&eacute;dito</td>
						<th width="20%">Acci&oacute;n</td>
					</tr>
				  </thead>
				  <tbody>
                  <cfoutput query="prc.qAsignaturasPrograma">
                  	<tr>
					  <td>#prc.qAsignaturasPrograma.NOMBRE#</td>
					  <td>#prc.qAsignaturasPrograma.DESCRIPCION#</td>
					  <td>#prc.qAsignaturasPrograma.HORAS_TEORIA#</td>
					  <td>#prc.qAsignaturasPrograma.HORAS_PRACTICA#</td>
					  <td>#prc.qAsignaturasPrograma.HORAS_TP#</td>
					  <td>#prc.qAsignaturasPrograma.UNIDADES_DE_CREDITO#</td>
					  <td>
						<cfif prc.qAsignaturasPrograma.FK_ESTADO eq 1>
                            <a href="##" onclick="cambiarEstadoAsignatura(#prc.qAsignaturasPrograma.PK_ASIGNATURA#,#prc.qAsignaturasPrograma.FK_ESTADO#,2);" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                            <a href="##" onclick="cambiarEstadoAsignatura(#prc.qAsignaturasPrograma.PK_ASIGNATURA#,#prc.qAsignaturasPrograma.FK_ESTADO#,0);" style="font-size:18px"><i class="fa fa-trash-o"></i></a>
							<a href="registro_asignaturas?pkPrograma=<cfoutput>#prc.pkPrograma#</cfoutput>&pkAsignatura=#prc.qAsignaturasPrograma.PK_ASIGNATURA#" style="font-size:18px"><i class="fa fa-edit"></i></a>
                        <cfelse>
	                        <a href="##" style="font-size:18px"><i class="fa fa-lock"></i></a>
							<a href="registro_asignaturas?pkPrograma=<cfoutput>#prc.pkPrograma#</cfoutput>&pkAsignatura=#prc.qAsignaturasPrograma.PK_ASIGNATURA#" style="font-size:18px"><i class="fa fa-search"></i></a>
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
  </div>
  <script>
	<!---
	* Fecha: 10 de Abril del 2014
	* @author: David Monterrosa
	--->
	function cambiarEstadoAsignatura(pkAsignatura, estado, estadoAccion){
		var tipoAccion = '';
		if(estadoAccion == 2)
			tipoAccion = 'validar';
		else
			tipoAccion = 'eliminar';

		if (confirm('\u00BFDesea '+tipoAccion+' la informaci\u00f3n seleccionada?')){
			var params = "";
			params += "?pkAsignatura=" + pkAsignatura;
			params += "&estado=" + estado;
			params += "&estadoAccion="	+ estadoAccion;
			$.post( "cambiarEstadoAsignatura" + params, function( data ) {
				var JSONObject =  $.parseJSON(data);
				if (JSONObject.RESULTADO > 0) {
					alert ("La informaci\u00f3n ha sido actualizada con \u00E9xito.");
					$('#eventStep1').val('SEPI.programa_asignatura');
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
    </script>