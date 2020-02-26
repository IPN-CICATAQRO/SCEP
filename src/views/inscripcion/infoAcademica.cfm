<script type="text/javascript">
$(document).ready(function () {
  alert('hola');
  //$('#aspAmaterno').val('HOLA');
  //$('#fecha1').datetimepicker();
});
</script>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Informaci&oacute;n Acad&eacute;mica</h1>
  </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        Instrucciones: A continuaci&oacute;n llena los datos del formulario
      </div>
      <div class="panel-body">
        <div>
          <h2>Datos Generales</h2>
          <section>
            <form>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="aspNombre">Nombre</label>
                  <input class="form-control form-control-sm" type="text" name="aspNombre" id="aspNombre" placeholder="">
                </div>
                <div class="form-group col-md-4">
                  <label for="aspApaterno">Apellido paterno</label>
                  <input class="form-control form-control-sm" type="text" name="aspApaterno" id="aspApaterno" placeholder="">
                </div>
                <div class="form-group col-md-4">
                  <label for="aspAmaterno">Apellido materno</label>
                  <input class="form-control form-control-sm" type="text" name="aspAmaterno" id="aspAmaterno" placeholder="">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-1">
                  <label for="sFemenino">Sexo:</label>
                </div>
                <div class="form-group col-md-2">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="sFemenino" name="sFemenino" class="custom-control-input">
                    <label>Mujer</label>
                  </div>
                </div>
                <div class="form-group col-md-2">
                    <div class="custom-control custom-radio custom-control-inline">
                      <input type="radio" id="sMasculino" name="sFemenino" class="custom-control-input">
                      <label>Hombre</label>
                    </div>
                </div>
                <div class="form-group col-md-4">
                  <div class='input-group date' id='aspFechaNac'>
                    <label for="aspFechaNac">Fecha de nacimiento:</label>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="aspEdoCivil">Estado civil</label>
                  <select class="form-control" id="aspEdoCivil">
                    <cfloop index="i" from="1" to="#prc.estadoCivil.recordcount#" >
                      <cfoutput><option value="#prc.estadoCivil.PK_ESTADO_CIVIL[i]#">#prc.estadoCivil.DESCRIPCION[i]#</option></cfoutput>
                    </cfloop>
                  </select>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="aspRFC">RFC</label>
                  <input class="form-control form-control-sm" type="text" name="aspRFC" id="aspRFC" placeholder="">
                </div>
                <div class="form-group col-md-6">
                  <label for="aspCURP">CURP</label>
                  <input class="form-control form-control-sm" type="text" name="aspCURP" id="aspCURP" placeholder="">
                </div>
                <!--- <div class="form-group col-md-4">
                  <label for="aspEdoCivil">Estado civil</label>
                  <select class="form-control" id="aspEdoCivil">
                    <cfloop index="i" from="1" to="#prc.estadoCivil.recordcount#" >
                      <cfoutput><option value="#prc.estadoCivil.PK_ESTADO_CIVIL[i]#">#prc.estadoCivil.DESCRIPCION[i]#</option></cfoutput>
                    </cfloop>
                  </select>
                </div> --->
              </div>
            </form>
          </section>
          <section>
            <h2>Datos de residencia</h2>
            <form>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="aspCalle">Calle</span>
                  <input class="form-control form-control-sm" type="text" name="aspCalle" id="aspCalle" placeholder="">
                </div>
                <div class="form-group col-md-3">
                  <label for="aspNoEx">N&uacute;mero Ext.</span>
                  <input class="form-control form-control-sm" type="text" name="aspNoEx" id="aspNoEx" placeholder="">
                </div>
                <div class="form-group col-md-3">
                  <label for="aspNoInt">N&uacute;mero Int.</span>
                  <input class="form-control form-control-sm" type="text" name="aspNoInt" id="aspNoInt" placeholder="">
                </div>
                <div class="form-group col-md-2">
                  <label for="aspCP">C.P.</span>
                  <input class="form-control form-control-sm" type="text" name="aspCP" id="aspCP" placeholder="">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-3">
                  <label for="aspColonia">Colonia</span>
                  <input class="form-control form-control-sm" type="text" name="aspColonia" id="aspColonia" placeholder="">
                </div>
                <div class="form-group col-md-4">
                  <label for="aspDM">Delegaci&oacute;n o Municipio</span>
                  <input class="form-control form-control-sm" type="text" name="aspDM" id="aspDM" placeholder="">
                </div>
                <div class="form-group col-md-3">
                  <label for="aspPais">Pa&iacute;s</span>
                  <input class="form-control form-control-sm" type="text" name="aspPais" id="aspPais" placeholder="">
                </div>
                <div class="form-group col-md-2">
                  <label for="aspEstado">Estado</span>
                  <input class="form-control form-control-sm" type="text" name="aspEstado" id="aspEstado" placeholder="">
                </div>
              </div>
            </form>
          </section>
          <h2>Datos de contacto</h2> 
           <section>
            <form>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="aspTelOfic">Tel&eacute;fono de oficina</span>
                  <input class="form-control form-control-sm" type="text" name="aspTelOfic" id="aspTelOfic" placeholder="">
                </div>
                <div class="form-group col-md-4">
                  <label for="aspExt">Extensi&oacute;n</span>
                  <input class="form-control form-control-sm" type="text" name="aspExt" id="aspExt" placeholder="">
                </div>
                <div class="form-group col-md-4">
                  <label for="aspTelAlt">Tel&eacute;fono alternativo</span>
                  <input class="form-control form-control-sm" type="text" name="aspTelAlt" id="aspTelAlt" placeholder="">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="aspCorreoI">Correo institucional</span>
                  <input class="form-control form-control-sm" type="text" name="aspCorreoI" id="aspCorreoI" placeholder="">
                </div>
                <div class="form-group col-md-6">
                  <label for="aspCorreoA">Correo alternativo</span>
                  <input class="form-control form-control-lg" type="text" name="aspCorreoA" id="aspCorreoA" placeholder="">
                </div>
              </div>
            </form>
          </section> 
        </div>
      </div>
    </div>
  </div>
  </div>