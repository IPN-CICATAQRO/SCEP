<cfinclude template = "registro_js.cfm">
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Datos Generales</h1>
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
              <div class="form-group">
                <div class="row">
                  <div class="input-group col-md-4" data-validate="nombres">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspNombre" id="aspNombre" placeholder="Nombre">
                  </div>
                  <div class="input-group col-md-4" data-validate="nombres">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspApaterno" id="aspApaterno" placeholder="Apellido paterno">
                  </div>
                  <div class="input-group col-md-4" data-validate="nombres">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspAmaterno" id="aspAmaterno" placeholder="Apellido materno">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="form-group col-md-2">
                    <label for="sFemenino">Sexo:</label>
                  </div>
                  <div class="form-group col-md-2">
                    <div class="custom-control custom-radio custom-control-inline">
                      <div class="input-group">
                        <div class="input-group" >
                          <label class="radio-inline">
                            <input type="radio" id="aspSexo" name="aspSexo" class="custom-control-input" value="1">Mujer
                          </label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group col-md-2">
                    <div class="custom-control custom-radio custom-control-inline">
                      <div class="input-group">
                        <div class="input-group" >
                          <label class="radio-inline">
                            <input type="radio" id="aspSexo" name="aspSexo" class="custom-control-input" value="2">Hombre
                          </label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class='input-group date'id="C_aspFechaNac" >
                      <input type='text' id="aspFechaNac"class="form-control input-sm" placeholder="Fecha de Nacimiento"/>
                      <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="input-group col-md-12">
                    <span class="input-group-addon "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <select class="form-control" id="aspEdoCivil">
                      <option value="0">Estado Civil</option>
                      <cfloop index="i" from="1" to="#prc.estadoCivil.recordcount#" >
                        <cfoutput><option value="#prc.estadoCivil.PK_ESTADO_CIVIL[i]#">#prc.estadoCivil.DESCRIPCION[i]#</option></cfoutput>
                      </cfloop>
                    </select>
                  </div>
                </div>
              </div> 
              <div class="form-group">
                <div class="row">
                  <div class="input-group col-md-6" data-validate="rfc">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspRFC" id="aspRFC" placeholder="RFC">
                  </div>
                  <div class="input-group col-md-6" data-validate="curp">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspCURP" id="aspCURP" placeholder="CURP">
                  </div>
                </div>
              </div>
            </form>
          </section>
          <h2>Datos de contacto</h2> 
           <section>
            <form>
              <div class="form-group">
                <div class="row">
                  <div class="input-group col-md-6" data-validate="telefonos">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspTelAlt" id="aspTelAlt" placeholder="Tel&eacute;fono personal">
                  </div>
                  <div class="input-group col-md-6" data-validate="email_Alt">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspCorreoI" id="aspCorreoI" placeholder="Correo personal">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="input-group col-md-6" data-validate="telefonos">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspTelOfic" id="aspTelOfic" placeholder="Tel&eacute;fono de oficina">
                  </div>
                  <div class="input-group col-md-6" data-validate="numeros">
                    <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                    <input class="form-control form-control-sm" type="text" name="aspExt" id="aspExt" placeholder="Extensi&oacute;n">
                  </div>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
     <button type="button"  id="btnGuardarRegistro" class="btn btn-primary btn-block" onclick="guardarRegistro();">Guaradar</button>
  </div>
  </div>