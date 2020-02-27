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
				  <label class="col-sm-2 control-label">CLASIFICACI&Oacute;N</label>
				  <div class="col-sm-8">
                        <select name="clasificacion" id="clasificacion" onchange="javascript:cambiaDepsByNivel();" class="form-control m-b">
                            <option value="0">Seleccione una opci&oacute;n</option>
                            <cfif isdefined('prc.niveles')>
                                <cfoutput query="prc.niveles">
                                    <option value="#prc.niveles.CLASE#">#UCase(prc.niveles.DESCRIPCION)#</option>
                                </cfoutput>
                            </cfif>
                        </select>
                    </div>
                </div>
                <div class="form-group">
				  <label class="col-sm-2 control-label">DEPENDENCIA</label>
				  <div class="col-sm-8">
                        <select name="dependencia" id="dependencia" class="form-control m-b" onchange="javascript:cambiaProgsByDep();">
                            <option value="0">Seleccione una opci&oacute;n</option>
                        </select>
                    </div>
                </div>
				<div class="form-group">
				  <label class="col-sm-2 control-label">PROGRAMA</label>
				  <div class="col-sm-8">
					<select id="selectPrograma" name="account" class="form-control m-b"> 
					  <option value="0">Seleccione una opci&oacute;n</option>
					</select>
				  </div>
				</div>
				<div class="form-group">
				  <div class="col-sm-12" style="text-align:center">
                    <a href="##" onclick="actualizaTabla();" style="font-size:24px"><i class="fa fa fa-search"></i></a>
				  </div>
				</div>
			  </form>
			  <div class="table-responsive">
                <table class="table table-striped m-b-none" data-ride="tableAlumnos" id="tableAlumnos">
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
				  <tbody id="tbodytableAlumnos">
                  <cfoutput query="prc.qAlumnos">
					<tr>
					  <td>#prc.qAlumnos.FOLIO#</td>
					  <td>#prc.qAlumnos.NOMBRE# #prc.qAlumnos.APELLIDO_PATERNO# #prc.qAlumnos.APELLIDO_MATERNO#</td>
					  <td>nivel</td>
					  <td>tipo alumno</td>
					  <td>02/03/2014</td>
					  <td>consejero</td>
					  <td>
						<cfif prc.qAlumnos.FK_ESTADO_AVANCE eq 3>
                            <a href="detalle_alumno?pkAlumno=#prc.qAlumnos.PK_ALUMNO#" style="font-size:18px"><i class="fa fa-unlock"></i></a>
                            <a href="##" style="font-size:18px"><i class="fa fa-reply"></i></a>
                        <cfelseif prc.qAlumnos.FK_ESTADO_AVANCE eq 4>
                            <a href="detalle_alumno?pkAlumno=#prc.qAlumnos.PK_ALUMNO#" style="font-size:18px"><i class="fa fa fa-search"></i></a>
                            <a style="font-size:18px"><i class="fa fa-lock"></i></a>
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

	<!---
	* Descripcion: Carga las dependancias por Nivel seleccionado
	* Fecha creacion: Abril 23, 2014
	* @author Antonio Alvarez
	--->
	function cambiaDepsByNivel(){
		var clasif = $("#clasificacion option:selected").val();
		//Remover todas las opciones
		$('#dependencia').find('option').remove().end();
		//Agrega la opcion por dafault
		$('#dependencia').append('<option value=0>Seleccione una opci&oacute;n</option>');
		if (clasif != 0){
			var params = "";
			params += "?nivel=" + clasif;
			$.post( "cargaDependencias" + params, function( data ) {
				var JSONObject =  $.parseJSON(data);
				for(x=0 ; x<JSONObject.DATA.length ; x++){
					$('#dependencia').append('<option value=' + JSONObject.DATA[x][0] + '>' + JSONObject.DATA[x][2] + " - " + JSONObject.DATA[x][1] + '</option>');
				}
			})
		}
	}

	function cambiaProgsByDep(){
		var pkdependencia = $("#dependencia option:selected").val();
		$('#selectPrograma').find('option').remove().end();
		$('#selectPrograma').append('<option value=0>Seleccione una opci&oacute;n</option>');
		if (pkdependencia != 0){
			var params = "";
			params += "?claveUr=" + pkdependencia;
			$.post( "obtenerProgramasEscuela" + params, function( data ) {
				var JSONObject =  $.parseJSON(data);
				for(x=0 ; x<JSONObject.DATA.length ; x++){
					$('#selectPrograma').append('<option value=' + JSONObject.DATA[x][0] + '>' + JSONObject.DATA[x][2] + " - " + JSONObject.DATA[x][1] + '</option>');
				}
			})
		}
	}
	
	function actualizaTabla(){
		var params = "";
		params += "?clasificacion=" + $("#clasificacion option:selected").val();
		params += "&dependencia=" + $("#dependencia option:selected").val();
		params += "&selectPrograma=" + $("#selectPrograma option:selected").val();
		$.post( "actualizaTabla" + params, function( data ) {
			var JSONObject = $.parseJSON(data);
			$('#tableAlumnos').dataTable(). fnClearTable();
			if(JSONObject.DATA.length > 0){
				for(x=0 ; x<JSONObject.DATA.length ; x++){
					var acciones = '';
					if(JSONObject.DATA[x][2] == 3) 
						acciones = '<a href="detalle_alumno?pkAlumno='+JSONObject.DATA[x][0]+'" style="font-size:18px"><i class="fa fa-unlock"></i></a><a href="##" style="font-size:18px"><i class="fa fa-reply"></i></a>';
					else if(JSONObject.DATA[x][2] == 4)
						acciones = '<a href="detalle_alumno?pkAlumno='+JSONObject.DATA[x][0]+'" style="font-size:18px"><i class="fa fa fa-search"></i></a><a style="font-size:18px"><i class="fa fa-lock"></i></a>';

					$('#tableAlumnos').dataTable().fnAddData([
						JSONObject.DATA[x][1],
						JSONObject.DATA[x][7]+' '+JSONObject.DATA[x][5]+' '+JSONObject.DATA[x][6],
						'nivel',
						'tipo alumno',
						'02/03/2014',
						'consejero',
						acciones
					]);
				}
			}
		});
	}
</script>
