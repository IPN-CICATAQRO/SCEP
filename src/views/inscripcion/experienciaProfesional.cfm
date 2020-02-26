<script type="text/javascript">
$(document).ready(function () {
  //$('#aspAmaterno').val('HOLA');
  //$('#fecha1').datetimepicker();
});
</script>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Experiencia Profesional</h1>
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
          <h2>Datos Generales</h2>
          <section>
            <form>
              <div class="form-row">
                <div class="form-group col-md-12">
                  <label for="epInstitucion">*Instituci&oacute;n donde trabaj&oacute;</label>
                  <input class="form-control form-control-sm" type="text" name="epInstitucion" id="epInstitucion" placeholder="">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-12">
                  <label for="epTipoInstitucion">*Tipo de instituci&oacute;n</label>
                  <input class="form-control form-control-sm" type="text" name="epTipoInstitucion" id="epTipoInstitucion" placeholder="">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-12">
                  <label for="epPuesto">*Puesto que desempe&ntilde;&oacute;</label>
                  <input class="form-control form-control-sm" type="text" name="epPuesto" id="epPuesto" placeholder="">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <div class='input-group date' id='epFechaInicio'>
                    <label for="epFechaInicio">*Fecha de inicio:</label>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <div class='input-group date' id='epFechaTermino'>
                    <label for="epFechaTermino">*Fecha de t&eacute;rmino:</label>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="aspNombre">*Escriba aqu&iacute; las actividades que desempe&ntilde;&oacute;.</label>
                </div>
                <div class="form-group col-md-6">
                  <textarea class="form-control" id="epActividades" name="epActividades" rows="7"></textarea>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </div>
  </div>