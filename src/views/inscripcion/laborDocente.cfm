<script type="text/javascript">
$(document).ready(function () {
  //alert('hola');
  //$('#aspAmaterno').val('HOLA');
  //$('#fecha1').datetimepicker();
});
</script>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Labor Docente</h1>
  </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        Instrucciones: A continuaci&oacute;n llena los datos del formulario, los campos marcados con (*) son obligatorios.
      </div>
      <div class="panel-body">
        <div>
          <!--- <h2>Datos Generales</h2> --->
          <section>
            <form>
              <div class="form-row">
                <div class="form-group col-md-3">
                  <label for="ldTipoInstitucion">Tipo de instituci&oacute;n:</label>
                </div>
                <div class="form-group col-md-3">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="ldPrivada" name="ldPrivada" class="custom-control-input">
                    <label>Privada</label>
                  </div>
                </div>
                <div class="form-group col-md-3">
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="ldPrivada" name="ldPublica" class="custom-control-input">
                      <label>P&uacute;blica</label>
                    </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="ldPais">Pa&iacute;s</label>
                  <select class="form-control" id="ldPais">
                    <cfloop index="i" from="1" to="#prc.estadoCivil.recordcount#" >
                      <cfoutput><option value="#prc.estadoCivil.PK_ESTADO_CIVIL[i]#">#prc.estadoCivil.DESCRIPCION[i]#</option></cfoutput>
                    </cfloop>
                  </select>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="ldInstitucion">Instituci&oacute;n</label>
                  <select class="form-control" id="ldInstitucion">
                    <cfloop index="i" from="1" to="#prc.estadoCivil.recordcount#" >
                      <cfoutput><option value="#prc.estadoCivil.PK_ESTADO_CIVIL[i]#">#prc.estadoCivil.DESCRIPCION[i]#</option></cfoutput>
                    </cfloop>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="ldDependencia">Dependencia</label>
                  <select class="form-control" id="ldDependencia">
                    <cfloop index="i" from="1" to="#prc.estadoCivil.recordcount#" >
                      <cfoutput><option value="#prc.estadoCivil.PK_ESTADO_CIVIL[i]#">#prc.estadoCivil.DESCRIPCION[i]#</option></cfoutput>
                    </cfloop>
                  </select>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="ldAsignatura">Asignatura impartida</label>
                  <select class="form-control" id="ldAsignatura">
                    <cfloop index="i" from="1" to="#prc.estadoCivil.recordcount#" >
                      <cfoutput><option value="#prc.estadoCivil.PK_ESTADO_CIVIL[i]#">#prc.estadoCivil.DESCRIPCION[i]#</option></cfoutput>
                    </cfloop>
                  </select>
                </div>
                <div class="form-group col-md-4">
                  <div class='input-group date' id='epFechaInicio'>
                    <label for="epFechaInicio">*Fecha de inicio:</label>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <div class='input-group date' id='epFechaTermino'>
                    <label for="epFechaTermino">*Fecha de t&eacute;rmino:</label>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </div>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </div>
  </div>