<cfinclude template = "Registro_js.cfm">
<section id="content">
	<div class="wrapper row2" style="background-color:#2E626E;">
		<div class="row">
			<div class="col-sm-12">
				<!--- <cfif ListFind(Session.Usuario.ROLES,"POS_ALUMNO")>
					<nav  class="navbar" role="navigation">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle  btn-lg fl_left" data-toggle="collapse" data-target=".navbar-ex1-collapse">
								<span class="sr-only">Desplegar navegación</span>
								<span class="glyphicon glyphicon-align-justify" style="color: DADADDA;"></span> Men&uacute;
							</button>
						</div>
						<div class="collapse navbar-collapse navbar-ex1-collapse">
							<ul  id="tabs" class="nav nav-tabs nav-justified" data-tabs="tabs" >
								<li class="active" ><a href="#pasoA"  data-toggle="tab" onclick="cerrar();"><span>Tablero de</span><span> <br>Control</span></a></li>
								<li ><a href="#paso1"  data-toggle="tab" onclick="cerrar();"><span>Informaci&oacute;n</span><span> <br>General</span></a></li>
								<li ><a  href="#paso2" data-toggle="tab" onclick="cerrar();"><span>Exposici&oacute;n</span><br><span>Motivos</a></li>
								<li ><a  href="#paso3" data-toggle="tab" onclick="cerrar();"><span>Documentos</span><br><span>Comprobatorios</a></li>
								<li ><a  href="#paso4" data-toggle="tab" onclick="cerrar();"><span>Programa</span><br><span>Individual</a></li>
								<li ><a  href="#paso5" data-toggle="tab" onclick="cerrar();"><span>Carga</span><br><span> Acad&eacute;mica</span></a></li>
							</ul>
						</div>
					</nav> --->
			<!---	<cfif ListFind(Session.Usuario.ROLES,"POS_ASPIRANTE")>
					 <cfelseif ListFind(Session.Usuario.ROLES,"POS_ASPIRANTE")> --->
					<nav  class="navbar" role="navigation">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle  btn-lg fl_left" data-toggle="collapse" data-target=".navbar-ex1-collapse">
								<span class="sr-only">Desplegar navegación</span>
								<span class="glyphicon glyphicon-align-justify" style="color: DADADDA;"></span> Men&uacute;
							</button>
						</div>
						<div class="collapse navbar-collapse navbar-ex1-collapse">
							<ul  id="tabs" class="nav nav-tabs nav-justified" data-tabs="tabs" >
								<li class="active" ><a href="#pasoA"  data-toggle="tab" onclick="cerrar();"><span>Tablero de</span><span> <br>Control</span></a></li>
								<li ><a href="#paso1"  data-toggle="tab" onclick="cerrar();"><span>Informaci&oacute;n</span><span> <br>General</span></a></li>
								<li ><a  href="#paso2" data-toggle="tab" onclick="cerrar();"><span>Exposici&oacute;n</span><br><span>Motivos</a></li>
								<li ><a  href="#paso3" data-toggle="tab" onclick="cerrar();"><span>Documentos</span><br><span>Comprobatorios</a></li>
								<!---<li ><a  href="#paso4" data-toggle="tab" onclick="cerrar();"><span>Programa</span><br><span>Individual</a></li>
								<li ><a  href="#paso5" data-toggle="tab" onclick="cerrar();"><span>Carga</span><br><span> Acad&eacute;mica</span></a></li>--->
							</ul>
						</div>
					</nav>
				<!--- </cfif> --->
			</div>
		</div>
	</div>
    <div class="wrapper row3 well">
        <!---<div class="panel-body"> --->
            <div class="tab-content">
			<!---<cfif ListFind(Session.Usuario.ROLES,"POS_ASPIRANTE")>--->
				<div class="tab-pane active"  id="pasoA">
				<cfif ListFind(Session.Usuario.ROLES,"POS_ALUMNO")>
					<section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;" >
	                    <div class="row">
	                        <div class="col-sm-6">
	                            <div id="grafica1" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	                        </div>
	                        <div class="col-sm-6">
	                            <div id="grafica2" style="height: 400px"></div>
	                        </div>
	                    </div>
	                    <br>
	                    <div class="row">
	                        <div class="col-sm-6">
	                            <div id="grafica3" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	                        </div>
	                        <div class="col-sm-6">
	                            <div id="grafica4" style="height: 400px"></div>
	                        </div>
	                    </div>
	                    <br>
	                </section>
				<cfelseif ListFind(Session.Usuario.ROLES,"POS_ASPIRANTE")>
					<section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;" >
	                    <div class="row">
	                        <div class="col-sm-6">
	                            <div id="grafica5" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	                        </div>
	                        <div class="col-sm-6">
	                            <div id="grafica6" style="height: 400px"></div>
	                        </div>
	                    </div>
	                    <br>
	                    <div class="row">
	                        <div class="col-sm-6">
	                            <div id="grafica7" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	                        </div>
	                        <div class="col-sm-6">
	                            <div id="grafica8" style="height: 400px"></div>
	                        </div>
	                    </div>
	                    <br>
	                </section>
				</cfif>

				</div>
			<!---</cfif>--->

				<!---<div class="tab-pane active" id="pasoA">

				</div>--->

				<div  class="tab-pane" id="paso1">
                    <section>
                        <div id="rootwizard">
                        <header class="subnav">
                                  <nav  class="navbar subnav" role="navigation" >
                                      <div class="navbar-header">
                                          <button type="button" class="navbar-toggle btn-lg fl_left " data-toggle="collapse" data-target=".navbar-ex2-collapse">
                                              <span class="sr-only">Desplegar navegación</span>
                                              <span class="glyphicon glyphicon-chevron-down" style="color: DADADDA;"></span> Contenido
                                          </button>
                                      </div>
                                      <div class="collapse navbar-collapse navbar-ex2-collapse">
                                          <ul  id="subtabs" class="nav nav-tabs nav-justified" data-tabs="tabs" >
                                              <li class="active" ><a href="#pest1"  data-toggle="tab" onclick="cerrar();">Datos <br>Generales</a></li>
                                              <li ><a href="#pest2"  data-toggle="tab" onclick="cerrar();">Informaci&oacute;n <br> Acad&eacute;mica</a></li>
                                              <li ><a href="#pest3"  data-toggle="tab" onclick="cerrar();">Experiencia <br> Profesional</a></li>
                                              <li ><a href="#pest4"  data-toggle="tab" onclick="cerrar();">Labor <br> Docente</a></li>
                                              <li ><a href="#pest5"  data-toggle="tab" onclick="cerrar();">Trabajos de<br> Investigaci&oacute;n</a></li>
                                          </ul>
                                      </div>
                                  </nav>
                        </header>
                        <div class="panel-body">
                            <div class="tab-content" >
                                <div class="tab-pane active" id="pest1" style="background-color: #F4F6F6;">
                                    <section style="border: solid; border-color: #DADADA;">
                                        <div class="panel-body" >
                                            <form id="genForm" role="form">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-9">
                                                            <label class="text-left">Nombre completo:</label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="text-left">Sexo:</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                             <cfif isDefined('prc.infoUsuario.DATOS.NOMBRE') >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genNombre" placeholder="Nombre" readonly="true"
                                                                           value='#prc.infoUsuario.DATOS.NOMBRE#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="nombres">
                                                                    <input type="text" class="form-control input-sm" name="genNombre" id="genNombre" placeholder="Nombre"
                                                                           onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                    <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.PATERNO') >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genPaterno" placeholder="Apellido paterno" readonly="true"
                                                                           value='#prc.infoUsuario.DATOS.PATERNO#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="nombres">
                                                                    <input type="text" class="form-control input-sm" name="genPaterno" id="genPaterno" placeholder="Apellido Paterno"
                                                                        onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                    <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.MATERNO') >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genMaterno" placeholder="Apellido materno" readonly="true"
                                                                           value='#prc.infoUsuario.DATOS.MATERNO#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="nombres">
                                                                    <input type="text" class="form-control input-sm" name="genMaterno" id="genMaterno" placeholder="Apellido Materno"
                                                                            onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                    <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.SEXO') >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genSexo"  readonly="true"
                                                                           value='<cfif prc.infoUsuario.DATOS.SEXO EQ 1> Hombre <cfelse> Mujer</cfif>'>
                                                                    <input type="hidden"  class="form-control input-sm" id="genPKSexo"  readonly="true"
                                                                            value='#prc.infoUsuario.DATOS.SEXO#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" >
                                                                    <label class="radio-inline">
                                                                        <input type="radio" id="genSexo" name="genSexo" value="1"> Hombre
                                                                    </label>
                                                                    <label class="radio-inline">
                                                                        <input type="radio" id="genSexo" name="genSexo" value="2"> Mujer
                                                                    </label>
                                                                </div>
                                                            </cfif>
                                                      </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <label class="text-left">Datos de residencia: </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="input-group" data-validate="alfanumerico">
                                                                <input type="text" class="form-control input-sm" name="genCalle" id="genCalle" placeholder="Calle"
                                                                onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="input-group" data-validate="numeros">
                                                                <input type="text" class="form-control input-sm" name="genNumExt" id="genNumExt" placeholder="N&uacute;mero"
                                                                    required="true">
                                                                <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="input-group" data-validate="cod-postal">
                                                                <input type="text" class="form-control input-sm" name="genCP" id="genCP" placeholder="CP"
                                                                    onkeyup="javascript:direccion();" required="true">
                                                                <span class="input-group-addon info "><span class="glyphicon glyphicon-asterisk"></span></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="input-group">
                                                                <select class="form-control input-sm" id="genColonia" name="genColonia" disabled="true" onchange="seleccionGeneral(this.value, this.id);">
                                                                    <option value="0">Colonia</option>
                                                                </select>
                                                                <span class="input-group-addon"><span></span></span>
                                                            </div>
                                                            <input type="hidden"  class="form-control input-sm" id="PKgenColonia" value="0" readonly="true">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <input type="text" class="form-control input-sm" id="genPais" placeholder="Pa&iacute;s"
                                                                      onkeyup="javascript:this.value=this.value.toUpperCase();" disabled="true">
                                                            <input type="hidden"  class="form-control input-sm" id="PKgenPais" value="0" readonly="true">
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <input type="text" class="form-control input-sm" id="genEstado" placeholder="Estado"
                                                            onkeyup="javascript:this.value=this.value.toUpperCase();" disabled="true">
                                                            <input type="hidden"  class="form-control input-sm" id="PKgenEstado" value="0" readonly="true">
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <input type="text" class="form-control input-sm" id="genDelomncp" placeholder="Delegaci&oacute;n o Municipio"
                                                            onkeyup="javascript:this.value=this.value.toUpperCase();" disabled="true">
                                                            <input type="hidden"  class="form-control input-sm" id="PKgenDelomncp" value="0" readonly="true">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.TELEFONO') AND prc.infoUsuario.DATOS.TELEFONO NEQ "NA" >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genTelefono" readonly="true"
                                                                           value='#prc.infoUsuario.DATOS.TELEFONO#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="url">
                                                                    <input type="text" class="form-control input-sm" name="genTelefono" id="genTelefono" placeholder="Tel&eacute;fono"
                                                                           required="true">
                                                                    <span class="input-group-addon"><span ></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.TELEFONO_MOVIL') AND prc.infoUsuario.DATOS.TELEFONO_MOVIL NEQ "NA" >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genMovil" readonly="true"
                                                                           value='#prc.infoUsuario.DATOS.TELEFONO#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="telefonos">
                                                                    <input type="text" class="form-control input-sm" name="genMovil" id="genMovil" placeholder="Tel&eacute;fono movil"
                                                                        required="true">
                                                                    <span class="input-group-addon"><span ></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <label class="subtitulo text-left">Datos personales: </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <div class='input-group date'id="C_genFechaNac" >
                                                                <input type='text' id="genFechaNac"class="form-control" />
                                                                <span class="input-group-addon">
                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <!---<cfif isDefined('prc.infoUsuario.PAIS_NAC.PAIS') AND prc.infoUsuario.PAIS_NAC.PAIS NEQ "" >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genPaisNac" readonly="true"
                                                                           value='#UCase(prc.infoUsuario.PAIS_NAC.PAIS)#' >
                                                                    <input type="hidden"  class="form-control input-sm" id="PKgenPaisNac"  readonly="true" value="#prc.infoUsuario.DATOS.PK_PAIS_NAC#">
                                                                </cfoutput>
                                                            <cfelse> --->
                                                                <div class="input-group">
                                                                    <select class="form-control input-sm" id="genPaisNac" name="genPaisNac" onchange="javascript:obtenerEstadosNac(this.value, this.id);">
                                                                        <option value="0">Pa&iacute;s</option>
                                                                    </select>
                                                                    <span class="input-group-addon "><span></span></span>
                                                                </div>
                                                                <input type="hidden"  class="form-control input-sm" id="PKgenPaisNac" value="0" readonly="true">

                                                            <!---</cfif> --->
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <!---<cfif isDefined('prc.infoUsuario.ESTADO_NAC.ESTADO') AND prc.infoUsuario.ESTADO_NAC.ESTADO NEQ "" >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genEstadoNac" readonly="true"
                                                                            value='#UCase(prc.infoUsuario.ESTADO_NAC.ESTADO)#'>
                                                                    <input type="hidden"  class="form-control input-sm" id="PKgenEstadoNac"  readonly="true" value="#prc.infoUsuario.DATOS.PK_LUGAR_NAC#">
                                                                </cfoutput>
                                                            <cfelse> --->
                                                                <div  class="input-group" id="divSelEstadoNac">
                                                                    <select class="form-control input-sm" id="genEstadoNac" name="genEstadoNac" disabled="true"
                                                                            onchange="javascript:seleccionGeneral(this.value, this.id);">
                                                                        <option value="0">Estado</option>
                                                                    </select>
                                                                    <span class="input-group-addon"><span></span></span>
                                                                    <input type="hidden"  class="form-control input-sm" id="PKgenEstadoNac" value="0" readonly="true">
                                                                </div>
                                                                <div class="input-group hide" id="divInpEstadoNac"  data-validate="nombres">
                                                                    <input type="text" class="form-control input-sm" name="genEstadoNac" id="genEstadoNac" placeholder="Estado de nacimiento"
                                                                             required="true">
                                                                    <span class="input-group-addon"><span ></span></span>
                                                                </div>
                                                            <!---</cfif> --->
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.RFC') AND prc.infoUsuario.DATOS.RFC NEQ "NA">
                                                                <cfoutput>
                                                                        <input type="text" class="form-control input-sm" id="genRFC" readonly="true"
                                                                               value='#prc.infoUsuario.DATOS.RFC#' >
                                                                </cfoutput>
                                                            <cfelse>
                                                                    <div class="input-group" data-validate="rfc">
                                                                            <input type="text" class="form-control input-sm" name="genRFC" id="genRFC" placeholder="RFC"
                                                                                    onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                    </div>
                                                            </cfif>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.CURP') AND prc.infoUsuario.DATOS.CURP NEQ "NA" >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genCURP" readonly="true"
                                                                              value='#prc.infoUsuario.DATOS.CURP#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="curp">
                                                                    <input type="text" class="form-control input-sm" name="genCURP" id="genCURP" placeholder="CURP"
                                                                            onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                    <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <cfif isDefined('prc.infoUsuario.ESTADOCIVIL.ESTADO_CIVIL') AND prc.infoUsuario.ESTADOCIVIL.ESTADO_CIVIL NEQ "" >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genEstadoCivil" readonly="true"
                                                                            value='#prc.infoUsuario.ESTADOCIVIL.ESTADO_CIVIL#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group">
                                                                    <cfoutput>
                                                                        <select class="form-control input-sm" id="genEstadoCivil" name="genEstadoCivil">
                                                                            <option value="0">Estado civil</option>
                                                                            <cfloop from="1" to="#prc.infoUsuario.ESTADOCIVIL.RECORDCOUNT#" index="i">
                                                                                <option value="#prc.infoUsuario.ESTADOCIVIL.PK_ESTADO_CIVIL[i]#">#prc.infoUsuario.ESTADOCIVIL.DESCRIPCION[i]#</option>
                                                                            </cfloop>
                                                                        </select>
                                                                    </cfoutput>
                                                                    <span class="input-group-addon"><span ></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!---<div class="form-group">

                                                </div>    --->
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <label class="text-left">Datos de contacto: </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.TELEFONO_OFICINA') AND prc.infoUsuario.DATOS.TELEFONO_OFICINA NEQ "">
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genTelOficina" readonly="true"
                                                                            value='#prc.infoUsuario.DATOS.TELEFONO_OFICINA#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="telefonos">
                                                                    <input type="text" class="form-control input-sm" name="genTelOficina" id="genTelOficina"
                                                                        placeholder="Tel&eacute;fono de Oficina">
                                                                    <span class="input-group-addon"><span ></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.EXTENSION') AND prc.infoUsuario.DATOS.EXTENSION NEQ "" >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genExtension" readonly="true"
                                                                            value='#prc.infoUsuario.DATOS.EXTENSION#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="numeros">
                                                                    <input type="text" class="form-control input-sm" name="genExtension" id="genExtension"
                                                                            placeholder="Extensi&oacute;n">
                                                                    <span class="input-group-addon"><span ></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <cfif isDefined('prc.infoUsuario.DATOS.CORREO_INST') AND prc.infoUsuario.DATOS.CORREO_INST NEQ "">
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genCorreoInst" readonly="true"
                                                                            value='#prc.infoUsuario.DATOS.CORREO_INST#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="email_Inst">
                                                                    <input type="text" class="form-control input-sm" name="genCorreoInst" id="genCorreoInst"
                                                                           placeholder="Correo Institucional">
                                                                    <span class="input-group-addon"><span ></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <cfif isDefined('prc.infoUsuario.CORREO_ALT') AND prc.infoUsuario.CORREO_ALT NEQ "" >
                                                                <cfoutput>
                                                                    <input type="text" class="form-control input-sm" id="genCorreoAlt" readonly="true"
                                                                            value='#prc.infoUsuario.CORREO_ALT#'>
                                                                </cfoutput>
                                                            <cfelse>
                                                                <div class="input-group" data-validate="email_Alt">
                                                                    <input type="text" class="form-control input-sm" name="genCorreoAlt" id="genCorreoAlt"
                                                                        placeholder="Correo Alternativo">
                                                                    <span class="input-group-addon"><span ></span></span>
                                                                </div>
                                                            </cfif>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </section>
                                </div>
                                    <div class="tab-pane fade" id="pest2" style="background-color: #F4F6F6;">
                                        <section style="border: solid; border-color: #DADADA;">
                                            <div class="panel-body">
                                                <form class="form-horizontal custom_pad" role="form" >
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label class="text-left">Elija el nivel que desea cursar: </label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <select class="form-control input-sm" id="nivelAcad" name="nivelAcad" onchange="javascript:habilitaReg();">
                                                                        <option value="0">Nivel acad&eacute;mico</option>
                                                                    </select>
                                                                    <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                </div>
                                                                <input type="hidden"  class="form-control input-sm" id="PKnivelAcad" value="0" readonly="true">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-10">
                                                            <label class="text-left text-muted cont">Agregue su historial acad&eacute;mico dando click en el siguiente bot&oacute;n, debera llenar toda la informaci&oacute;n que se le pide: </label>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <!-- Botón de apertura -->
                                                            <button type="button" id="btnAcadReg" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalNivelAcad" disabled="true;">
                                                                Agregar
                                                            </button>
                                                            <!-- Ventana Modal -->
                                                            <div class="modal fade" id="modalNivelAcad" tabindex="-1" role="dialog" aria-labelledby="modalNivelAcadLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-lg">
                                                                    <div class="modal-content" >
                                                                        <div class="modal-header" style="background-color:#2E626E;">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                            <div class="modal-title h4" style="color:#FAFAFA;" id="modalNivelAcadLabel">Registro de Historial Acad&eacute;mico</div>
                                                                        </div>
                                                                        <div class="modal-body" style="background-color: #F4F6F6;">
                                                                            <form id="histAcadForm" role="form">
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-4">
                                                                                            <div class="input-group">
                                                                                                <select class="form-control input-sm" id="acadNivel" name="acadNivel">
                                                                                                    <option value="0">Seleccione nivel de estudios</option>
                                                                                                </select>
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                            <!---<input type="text"  class="form-control input-sm" id="acadNivelText" readonly="true">--->
                                                                                        </div>
                                                                                        <div class="col-sm-4">
                                                                                            <div class="input-group">
                                                                                                <div class="input-group" >
                                                                                                    <label class="radio-inline">
                                                                                                        <input type="radio" id="acadTipo" name="acadTipo" value="2" onchange="javascript:obtenerInstitucionesAcad();"> Privada
                                                                                                    </label>
                                                                                                    <label class="radio-inline">
                                                                                                        <input type="radio" id="acadTipo" name="acadTipo" value="1" onchange="javascript:obtenerInstitucionesAcad();"> Publica
                                                                                                    </label>
                                                                                                    <input type="text"  class="form-control input-sm" id="acadTipoText" readonly="true">
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-4">
                                                                                            <div class="input-group">
                                                                                                <select class="form-control input-sm" id="acadPais" name="acadPais" onchange="javascript:obtenerInstitucionesAcad();">
                                                                                                    <option value="0">Pa&iacute;s</option>
                                                                                                </select>
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                            <input type="text"  class="form-control input-sm" id="PKacadNivel" readonly="true">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-6">
                                                                                            <div class="input-group">
                                                                                                <select class="form-control input-sm" id="acadInstitucion" name="acadInstitucion" disabled="true" onchange="javascript:obtenerDependencias(this.value);">
                                                                                                    <option value="0">Seleccione Instituci&oacute;n</option>
                                                                                                </select>
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                            <input type="text"  class="form-control input-sm" id="PKacadInstitucion" readonly="true">
                                                                                        </div>
                                                                                        <div class="col-sm-6">
                                                                                            <div class="input-group">
                                                                                                <select class="form-control input-sm" id="acadDependencia" name="acadDependencia" disabled="true" onchange="javascript:obtenerCarreras(this.value);">
                                                                                                    <option value="0">Seleccione Dependencia</option>
                                                                                                </select>
                                                                                                <span class="input-group-addon"><span></span></span>
                                                                                            </div>
                                                                                            <input type="text"  class="form-control input-sm" id="PKacadDependencia" readonly="true">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-4">
                                                                                            <!---<div class="input-group">
                                                                                                <select class="form-control input-sm" id="acadCarrera" name="acadCarrera" disabled="true">
                                                                                                    <option value="0">Seleccione carrera</option>
                                                                                                </select>
                                                                                                <span class="input-group-addon"><span></span></span>
                                                                                            </div>
                                                                                            <input type="text"  class="form-control input-sm" id="PKacadDependencia" readonly="true"> --->
                                                                                            <div class="input-group" data-validate="numeros">
                                                                                                <input type="text" class="form-control input-sm" name="acadCarrera" id="acadCarrera" placeholder="Carrera"
                                                                                                    onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-4">
                                                                                            <div class='input-group date'id="C_acadFechaInicio" >
                                                                                                <input type='text' id="acadFechaInicio"class="form-control input-sm" placeholder="Fecha de inicio"/>
                                                                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-4">
                                                                                            <div class='input-group date'id="C_acadFechaFin" >
                                                                                                <input type='text' id="acadFechaFin"class="form-control input-sm" placeholder="Fecha de finalizaci&oacute;n"/>
                                                                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-4">
                                                                                            <div class="input-group" data-validate="nombres">
                                                                                                <input type="text" class="form-control input-sm" name="acadTitulo" id="acadTitulo" placeholder="T&iacute;tulo profesional"
                                                                                                        onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-4">
                                                                                            <div class="input-group" data-validate="numeros">
                                                                                                <input type="text" class="form-control input-sm" name="acadCedula" id="acadCedula" placeholder="C&eacute;dula profesional"
                                                                                                        onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-4">
                                                                                            <div class='input-group date'id="C_acadFechaTitulo">
                                                                                                <input type='text' id="acadFechaTitulo" class="form-control input-sm" placeholder="Fecha de finalizaci&oacute;n">
                                                                                                <span class="input-group-addon "><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                        <div class="modal-footer">
                                    																			<cfoutput>
                                    																				<button type="button" class="btn btn-default" onclick="javascript:guardarDatosAcademicos(0,0);"><span style="color:black">Guardar</span></button><!---(#Session.Usuario.PK_ALUMNO#, #Session.Usuario.PKUSUARIO#);--->
                                    																			</cfoutput>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="table-responsive">
                                                            <table id="tbInfoAcademica" class="table table-striped table-bordered table-condensed"  data-search="true"
                                                        data-pagination="true" data-page-size="4" align="center">
                                                                <thead>
                                                                    <tr style="text-align: center;" >
                                                                        <th  class="tb_titulo" colspan="12">Registro de Historial Acad&eacute;mico</th>
                                                                    </tr>
                                                                    <tr style="text-align: center;" >
                                                                        <th class="tb_contenido"  data-field="nivel">Nivel</th>
                                                                        <th class="tb_contenido"  data-field="tipo">Tipo de instituci&oacute;n</th>
                                                                        <th class="tb_contenido"  data-field="pais">Pa&iacute;s</th>
                                                                        <th class="tb_contenido"  data-field="institucion">Instituci&oacute;n</th>
                                                                        <th class="tb_contenido"  data-field="dependencia">Dependencia</th>
                                                                        <th class="tb_contenido"  data-field="carrera">Carrera</th>
                                                                        <th class="tb_contenido"  data-field="fechaInicio">Fecha inicio</th>
                                                                        <th class="tb_contenido"  data-field="fechaFin">Fecha termino</th>
                                                                        <th class="tb_contenido"  data-field="titulo">T&iacute;tulo</th>
                                                                        <th class="tb_contenido"  data-field="cedula">C&eacute;dula profesional</th>
                                                                        <th class="tb_contenido"  data-field="fechaTitulo">Fecha de titulaci&oacute;n</th>
                                                                        <th class="tb_contenido"  data-field="acciones">Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                                <!---<tbody id="tbodyInfoAcademica">
                                                                    <cfif isDefined('prc.infoAcademica')>
                                                                        <cfoutput >
                                                                            <tr id="trInfoAcademica#prc.infoAcademica.ACADEMICA.TIA_PK_INFORMACION_ACADEMICA#" >
                                                                              <th style="font-weight:100">#prc.infoAcademica.ACADEMICA.TIA_FK_NIVEL_ACADEMICO#</th>
                  															  <th style="font-weight:100">#prc.infoAcademica.ACADEMICA.TIA_FK_TIPO_INSTITUCION#</th>
                  															  <th style="font-weight:100">#prc.infoAcademica.ACADEMICA.TIA_FK_PAIS#</th>
                  															  <th style="font-weight:100">#prc.infoAcademica.ACADEMICA.TIA_FK_INSTITUCION#</th>
                  															  <th><label><i class="fa fa-trash-o" style="cursor:pointer" onclick="eliminarExperiencia();"></i></label></th>
                                                                          </tr>
                                                                        </cfoutput>
                                                                    </cfif>
                                                                </tbody> --->
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                    <div class="tab-pane fade" id="pest3" style="background-color: #F4F6F6;">
                                        <section style="border: solid; border-color: #DADADA;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-10">
                                                        <label class="text-left text-muted cont">Agregue su historial profesional dando click en el siguiente bot&oacute;n, debera llenar toda la informaci&oacute;n que se le pide: </label>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <!-- Botón de apertura -->
                                                        <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalExpProfesional" >
                                                            Agregar
                                                        </button>
                                                        <!-- Ventana Modal -->
                                                        <div class="modal fade" id="modalExpProfesional" tabindex="-1" role="dialog" aria-labelledby="modalExpProfesionalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-lg">
                                                                <div class="modal-content" >
                                                                    <div class="modal-header" style="background-color:#2E626E;">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                        <div class="modal-title h4" style="color:#FAFAFA;" id="modalExpProfesionalLabel">Registro de Historial Profesional</div>
                                                                    </div>
                                                                    <div class="modal-body" style="background-color: #F4F6F6;">
                                                                        <form id="histAcadForm" role="form">
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-6">
                                                                                        <div class="input-group" >
                                                                                            <input type="text" class="form-control input-sm" name="expProfInstitucion" id="expProfInstitucion" placeholder="Instituci&oacute;n donde trabajo"
                                                                                                onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-6">
                                                                                        <div class="input-group" >
                                                                                            <input type="text" class="form-control input-sm" name="expProfTipoInstitucion" id="expProfTipoInstitucion" placeholder="Tipo de instituci&oacute;n "
                                                                                                onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-4">
                                                                                        <div class="input-group" >
                                                                                            <input type="text" class="form-control input-sm" name="expProfPuesto" id="expProfPuesto" placeholder="Puesto que desempe&ntilde;o"
                                                                                                onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class='input-group date'id="C_expProfFechaInicio">
                                                                                            <input type='text' id="expProfFechaInicio" class="form-control input-sm" placeholder="Fecha de inicio">
                                                                                            <span class="input-group-addon "><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class='input-group date'id="C_expProfFechaTermino">
                                                                                            <input type='text' id="expProfFechaTermino" class="form-control input-sm" placeholder="Fecha de t&eacute;rmino">
                                                                                            <span class="input-group-addon "><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-4">
                                                                                        <label class="text-left cont">Escribe aqu&iacute; las actividades que desempe&ntilde;aste: </label>
                                                                                    </div>
                                                                                    <div class="col-sm-8">
                                                                                        <div class="input-group">
                                                                                            <textarea id="expProfActividades" name="expProfActividades" class="form-control" rows="4"></textarea>
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                    <div class="modal-footer">
                                  																		<cfoutput>
                                  																			<button type="button" class="btn btn-default" onclick="javascript:guardarDatosProfesionales(0,0);"><span style="color:black">Guardar</span></button><!---#Session.Usuario.PK_ALUMNO#, #Session.Usuario.PKUSUARIO#--->
                                  																		</cfoutput>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="table-responsive">
                                                            <table id="tbInfoProfesional" class="table table-striped table-bordered table-condensed"  data-search="true"
                                                                    data-pagination="true" data-page-size="3" align="center">
                                                                <thead>
                                                                    <tr style="text-align: center;" >
                                                                        <th width="10%" class="tb_titulo" colspan="12">Registro de Historial Profesional</th>
                                                                    </tr>
                                                                    <tr style="text-align: center;" >
                                                                        <th class="tb_contenido" data-field="institucion">Instituci&oacute;n</th>
                                                                        <th class="tb_contenido" data-field="tipo">Clasificaci&oacute;n</th>
                                                                        <th class="tb_contenido" data-field="puesto">Puesto</th>
                                                                        <th class="tb_contenido" data-field="actividades">Actividades</th>
                                                                        <th class="tb_contenido" data-field="fechaInicio">Fecha de inicio</th>
                                                                        <th class="tb_contenido" data-field="actividades">Actividades</th>
                                                                        <th class="tb_contenido" data-field="acciones">Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                    <div class="tab-pane fade" id="pest4" style="background-color: #F4F6F6;" >
                                        <section style="border: solid; border-color: #DADADA;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-10">
                                                        <label class="text-left text-muted cont">Agregue su historial como docente dando click en el siguiente bot&oacute;n, debera llenar toda la informaci&oacute;n que se le pide: </label>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <!-- Botón de apertura -->
                                                        <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalLabDocente" >
                                                            Agregar
                                                        </button>
                                                        <!-- Ventana Modal -->
                                                        <div class="modal fade" id="modalLabDocente" tabindex="-1" role="dialog" aria-labelledby="modalLabDocenteLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-lg">
                                                                <div class="modal-content" >
                                                                    <div class="modal-header" style="background-color:#2E626E;">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                        <div class="modal-title h4" style="color:#FAFAFA;" id="modalLabDocenteLabel">Registro de labor como docente</div>
                                                                    </div>
                                                                    <div class="modal-body" style="background-color: #F4F6F6;">
                                                                        <form id="histAcadForm" role="form">
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-4">
                                                                                        <div class="input-group">
                                                                                            <select class="form-control input-sm" id="labDocentePais" name="labDocentePais" onchange="javascript:obtenerInstituciones();">
                                                                                                <option value="0">Pa&iacute;s</option>
                                                                                            </select>
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class="input-group">
                                                                                            <div class="input-group" >
                                                                                                <label class="radio-inline">
                                                                                                    <input type="radio" id="labDocenteTipo" name="labDocenteTipo" value="2" onchange="javascript:obtenerInstituciones();"> Privada
                                                                                                </label>
                                                                                                <label class="radio-inline">
                                                                                                    <input type="radio" id="labDocenteTipo" name="labDocenteTipo" value="1" onchange="javascript:obtenerInstituciones();"> Publica
                                                                                                </label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class="input-group">
                                                                                            <select class="form-control input-sm" id="labDocenteInstitucion" name="labDocenteInstitucion" onchange="javascript:obtenerDependencias(this.value);">
                                                                                                <option value="0">Seleccione Instituci&oacute;n</option>
                                                                                            </select>
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-6">
                                                                                        <div class="input-group" >
                                                                                            <select class="form-control input-sm" id="labDocenteDependencia" name="labDocenteDependencia" >
                                                                                                <option value="0">Seleccione dependencia</option>
                                                                                            </select>
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-6">
                                                                                        <div class="input-group" >
                                                                                            <input type="text" class="form-control input-sm" name="labDocenteMateria" id="labDocenteMateria" placeholder="Materia o asignatura impartida"
                                                                                                onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-4 col-sm-offset-1">
                                                                                        <div class='input-group date'id="C_labDocenteFechaInicio">
                                                                                            <input type='text' id="labDocenteFechaInicio" class="form-control input-sm" placeholder="Fecha de t&eacute;rmino">
                                                                                            <span class="input-group-addon "><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4 col-sm-offset-1">
                                                                                        <div class='input-group date'id="C_labDocenteFechaTermino">
                                                                                            <input type='text' id="labDocenteFechaTermino" class="form-control input-sm" placeholder="Fecha de t&eacute;rmino">
                                                                                            <span class="input-group-addon "><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                    <div class="modal-footer">
                                  																		<cfoutput>
                                  																			<button type="button" class="btn btn-default" onclick="javascript:guardarDatosDocente(0,0);"><span style="color:black">Guardar</span></button><!---(#Session.Usuario.PK_ALUMNO#, #Session.Usuario.PK_ASPIRANTE#);--->
                                  																		</cfoutput>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="table-responsive">
                                                            <table id="tbInfoDocente" class="table table-striped table-bordered table-condensed"  data-search="true"
                                                                    data-pagination="true" align="center">
                                                                <thead>
                                                                    <tr style="text-align: center;" >
                                                                        <th width="10%" class="tb_titulo" colspan="12">Registro de labor docente</th>
                                                                    </tr>
                                                                    <tr style="text-align: center;" >
                                                                        <th class="tb_contenido" data-field="institucion">Instituci&oacute;n</th>
                                                                        <th class="tb_contenido" data-field="dependencia">Dependencia</th>
                                                                        <th class="tb_contenido" data-field="asignatura">Asignatura</th>
                                                                        <th class="tb_contenido" data-field="fechaInicio">Fecha de inicio</th>
                                                                        <th class="tb_contenido" data-field="fechaFin">Fecha de t&eacute;rmino</th>
                                                                        <th class="tb_contenido" data-field="acciones">Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                    <div class="tab-pane fade" id="pest5" style="background-color: #F4F6F6;">
                                        <section style="border: solid; border-color: #DADADA;">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-10">
                                                        <label class="text-left text-muted cont">Agregue sus trabajos de investigaci&oacute;n dando click en el siguiente bot&oacute;n, debera llenar toda la informaci&oacute;n que se le pide: </label>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <!-- Botón de apertura -->
                                                        <button type="button" class="btn btn-default btn-xs" onclick="javascript:reiniciarTrabajos();" data-toggle="modal" data-target="#modalTrabInves" >
                                                            Agregar
                                                        </button>
                                                        <!-- Ventana Modal -->
                                                        <div class="modal fade" id="modalTrabInves" tabindex="-1" role="dialog" aria-labelledby="modalTrabInvesLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-lg">
                                                                <div class="modal-content" >
                                                                    <div class="modal-header" style="background-color:#2E626E;">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                        <div class="modal-title h4" style="color:#FAFAFA;" id="modalTrabInvesLabel">Registro de Trabajos de Investigaci&oacute;n</div>
                                                                    </div>
                                                                    <div class="modal-body" style="background-color: #F4F6F6;">
                                                                        <form id="histAcadForm" role="form">
                                                                            <div  id="trabInvesAnt">
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-6">
                                                                                            <div class="input-group" data-validate="numeros">
                                                                                                <input type="text" class="form-control input-sm" name="busqProyInvAnio" id="busqProyInvAnio" placeholder="Ingrese el a&ntilde;o del trabajo a buscar">
                                                                                                <span class="input-group-addon"><span></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-6">
                                                                                            <div class="input-group" >
                                                                                                <input type="text" class="form-control input-sm" name="busqProyInvTitulo" id="busqProyInvTitulo" placeholder="Ingrese el nombre del trabajo a buscar">
                                                                                                <span class="input-group-addon "><span></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-1 col-sm-offset-10">
                                                                                            <button class="btn btn-default" onclick="buscar();">Buscar </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <table id="tbBusquedaProyectosInv" class="table table-striped table-bordered table-condensed"  data-search="false"
                                                                                            data-pagination="true" data-page-size="5" align="center">
                                                                                        <thead>
                                                                                            <tr style="text-align: center;" >
                                                                                                <th width="10%" class="tb_titulo" colspan="12">Proyectos de Investigacion Registrados</th>
                                                                                            </tr>
                                                                                            <tr style="text-align: center;" >
                                                                                                <th class="tb_contenido" data-field="clave">Clave del Proyecto</th>
                                                                                                <th class="tb_contenido" data-field="titulo">Nombre o T&iacute;tulo</th>
                                                                                                <th class="tb_contenido" data-field="anio">A&ntilde;o de publicaci&oacute;n</th>
                                                                                                <th class="tb_contenido" data-field="acciones">Acciones</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                            <div class="hide" id="trabInvesSig">
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-6">
                                                                                            <div class="input-group">
                                                                                                <select class="form-control input-sm" name="trabInvesTipoProy" id="trabInvesTipoProy">
                                                                                                    <option value="0">Seleccione tipo de proyecto</option>
                                                                                                </select>
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-6">
                                                                                            <div class="input-group" >
                                                                                                <select class="form-control input-sm" name="trabInvesTipoPart" id="trabInvesTipoPart">
                                                                                                    <option value="0">Seleccione tipo de participaci&oacute;n</option>
                                                                                                </select>
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-6">
                                                                                            <div class="input-group" >
                                                                                                <input type="text" class="form-control input-sm" name="trabInvesProfesor" id="trabInvesProfesor" placeholder="Nombre del profesor y/o asesor"
                                                                                                    onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-6">
                                                                                            <div class="input-group" >
                                                                                                <input type="text" class="form-control input-sm" name="trabInvesClave" id="trabInvesClave" readonly="yes"
                                                                                                    onkeyup="javascript:this.value=this.value.toUpperCase();" required="true">
                                                                                                <span class="input-group-addon"><span ></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-offset-3 col-sm-3">
                                                                                            <div class='input-group date'id="C_trabInvesFechaInicio">
                                                                                                <input type='text' id="trabInvesFechaInicio" class="form-control input-sm" placeholder="Fecha de inicio">
                                                                                                <span class="input-group-addon "><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                            <div class='input-group date'id="C_trabInvesFechaTermino">
                                                                                                <input type='text' id="trabInvesFechaTermino" class="form-control input-sm" placeholder="Fecha de t&eacute;rmino">
                                                                                                <span class="input-group-addon "><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                    <div class="modal-footer">
                                  																		<cfoutput>
                                  																			<button type="button" class="btn btn-default" onclick="javascript:guardarDatosInvestigacion(0,0);"><span style="color:black">Guardar</span></button><!---(#Session.Usuario.PK_ALUMNO#, #Session.Usuario.PKUSUARIO#);--->
                                  																		</cfoutput>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="table-responsive">
                                                            <table id="tbInfoInvestigacion" class="table table-striped table-bordered table-condensed"  data-search="true"
                                                                    data-pagination="true" align="center">
                                                                <thead>
                                                                    <tr style="text-align: center;" >
                                                                        <th width="10%" class="tb_titulo" colspan="12">Registro de Trabajos de Investigaci&oacute;n</th>
                                                                    </tr>
                                                                    <tr style="text-align: center;" >
                                                                        <th class="tb_contenido" data-field="clave">Clave del Proyecto</th>
                                                                        <th class="tb_contenido" data-field="tipoProyecto">Tipo de Proyecto</th>
                                                                        <th class="tb_contenido" data-field="tipoParticipacion">Tipo de Participaci&oacute;n</th>
                                                                        <th class="tb_contenido" data-field="profesor">Nombre del Profesor</th>
                                                                        <th class="tb_contenido" data-field="fechaIni">Fecha de inicio</th>
                                                                        <th class="tb_contenido" data-field="fechaFin">Fecha de t&eacute;rmino</th>
                                                                        <th class="tb_contenido" data-field="acciones">Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                    <div class="form-group">
                                        <div class="row" style="padding-left:30px; padding-right: 30px;">
                                            <div class="col-sm-12">
                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a href="#">First</a></li>
                                                    <li class="previous"><button class="fl_left btn btn-default">Previous</button></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a></li>
                                                    <li class="next"><button id="btnNext"class="fl_right btn btn-default" >Next</button></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>

                        <!---<div class="panel-body">
                            <div style="float:right">
                                <button type="submit" class="btn btn-xs button-next" onclick="validarGenerales();">
                                    Siguiente <span class="glyphicon glyphicon-arrow-right"></span>
                                </button>
		                    </div>
                    		<div style="float:left">
                                <button type="button" class="btn btn-xs button-previous">
                                    <span class="glyphicon glyphicon-arrow-left"></span> Previo
                                </button>
                    		</div>
                        </div> --->
                    </div>
                    </section>
                </div>
                <div  class="tab-pane fade" id="paso2" >
                    <div class="panel-body">
                        <section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;" >
                        <!---<header class="panel-heading font-bold ">
                            <span class="h3">Exposici&oacute;n de Motivos</span>
                        </header>--->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-2">
                                    <div class="subtitulo">Programa de posgrado:()</div>
                                </div>
								<div class="col-sm-2">
									<div class="cont">Programa individual:</div>
								</div>
                                <div class="col-sm-8">
                                    <select class="form-control" id="programaIndividual" name="programaIndividual">
                                        <option value="0">Seleccione una opci&oacute;n</option>
                                        <!---<option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>--->
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-7">
                                    <div class="inst">A continuaci&oacute;n explique los motivos para estudiar el programa de posgrado.</div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="cont">Manifiesta a continuaci&oacute;n los motivos por los que ha deicido estudiar el programa antes mencionado:</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <textarea size="10" maxlength="500" class="form-control"  placeholder="Exposici&oacute;n de motivos"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-5">
                                     <!---<cfif PK_ESTATUS EQ 0>--->
                                        <button id="btnValidar" class="btn btn-default fa fa-unlock"></button>
                                     <!---<cfelse>--->
                                        <button id="btnValidado" class="btn btn-default fa fa-lock"></button>
                                        <button id="btnPDF" class="btn btn-default fa fa-file-pdf-o"></button>
								<!---</cfif>--->
                                </div>
                            </div>
							<br>
                        </section>
                    </div>
                </div>
                <div  class="tab-pane fade" id="paso3">
                    <div class="panel-body">
	                    <section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;">
	                        <!---<header class="panel-heading font-bold ">
	                            <span class="h3">Documentos Comprobatorios</span>
	                        </header> --->
	 					<div class="panel-body">
							  <form id="docForm" method="post" enctype="multipart/form-data">
							   	<div class="row">
							   		<div class="col-sm-6">
							   			<div class="form-group">
							   				<div class="row">
							   					<div class="col-sm-6 col-sm-offset-2">
							   						<label class="control-label">Acta de nacimiento</label>
							   						<input id="docActaNacimiento" name="docActaNacimiento" type="file" multiple class="file-loading"> <!--- onchange="javascript:cargarFTP();" --->
							   						<script>
							   								$(document).on('ready', function() {
							   										$("#docActaNacimiento").fileinput({
							   											showCaption:false,
							   											browseLabel: "Buscar",
							   											showUpload: false,
							   											showRemove: false,
							   											dropZoneEnabled: false,
							   											uploadUrl: "conectarFTP",
																		uploadExtraData: {id :"1" , tipoDoc: "Acta de Nacimiento"},
							   										});
							   								});
							   						</script>
							   					</div>
							   				</div>
							   			</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-2">
													<label class="control-label">C&eacute;dula profesional</label>
													<input id="docCedula" name="docCedula" type="file" multiple class="file-loading">
													<script>
															$(document).on('ready', function() {
																	$("#docCedula").fileinput({
																		showCaption: false,
							   											browseLabel: "Buscar",
							   											showUpload: false,
							   											showRemove: false,
							   											dropZoneEnabled: false,
							   											uploadUrl: "conectarFTP",
																		uploadExtraData: {id :"2" , tipoDoc: "C\u00e9dula profesional"},
																	});
															});
													</script>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-2">
													<label class="control-label">CURP</label>
													<input id="docCURP" name="docCURP" type="file" multiple class="file-loading">
													<script>
															$(document).on('ready', function() {
																	$("#docCURP").fileinput({
																		showCaption: false,
							   											browseLabel: "Buscar",
							   											showUpload: false,
							   											showRemove: false,
							   											dropZoneEnabled: false,
							   											uploadUrl: "conectarFTP",
																		uploadExtraData: {id :"3" , tipoDoc: "CURP"},
																	});
															});
													</script>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-2">
													<label class="control-label">Certificado de licenciatura</label>
													<input id="docCertificadolLic" name="docCertificadolLic" type="file" multiple class="file-loading">
													<script>
															$(document).on('ready', function() {
																	$("#docCertificadolLic").fileinput({
																		showCaption: false,
							   											browseLabel: "Buscar",
							   											showUpload: false,
							   											showRemove: false,
							   											dropZoneEnabled: false,
							   											uploadUrl: "conectarFTP",
																		uploadExtraData: {id :"4" , tipoDoc: "Certificado de licenciatura"},
																	});
															});
													</script>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-2">
													<label class="control-label">T&iacute;tulo profesional</label>
													<input id="docTituloProf" name="docTituloProf" type="file" multiple class="file-loading">
													<script>
															$(document).on('ready', function() {
																	$("#docTituloProf").fileinput({
																		showCaption: false,
							   											browseLabel: "Buscar",
							   											showUpload: false,
							   											showRemove: false,
							   											dropZoneEnabled: false,
							   											uploadUrl: "conectarFTP",
																		uploadExtraData: {id :"5" , tipoDoc: "T\u00edtulo profesional"},
																	});
															});
													</script>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-2">
													<label class="control-label">Carta de pasante</label>
													<input id="docCartaPasante" name="docCartaPasante" type="file" multiple class="file-loading">
													<script>
															$(document).on('ready', function() {
																	$("#docCartaPasante").fileinput({
																		showCaption: false,
							   											browseLabel: "Buscar",
							   											showUpload: false,
							   											showRemove: false,
							   											dropZoneEnabled: false,
							   											uploadUrl: "conectarFTP",
																		uploadExtraData: {id :"6" , tipoDoc: "Carta de pasante"},
																	});
															});
													</script>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-2">
													<label class="control-label">Acta de examen profesional</label>
													<input id="docActaExamenProf" name="docActaExamenProf" type="file" multiple class="file-loading">
													<script>
															$(document).on('ready', function() {
																	$("#docActaExamenProf").fileinput({
																		showCaption: false,
							   											browseLabel: "Buscar",
							   											showUpload: false,
							   											showRemove: false,
							   											dropZoneEnabled: false,
							   											uploadUrl: "conectarFTP",
																		uploadExtraData: {id :"7" , tipoDoc: "Acta de examen profesional"},
																	});
															});
													</script>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-2">
													<label class="control-label">Sobretiros</label>
													<input id="docSobretiros" name="docSobretiros" type="file" multiple class="file-loading">
													<script>
															$(document).on('ready', function() {
																	$("#docSobretiros").fileinput({
																		showCaption: false,
							   											browseLabel: "Buscar",
							   											showUpload: false,
							   											showRemove: false,
							   											dropZoneEnabled: false,
							   											uploadUrl: "conectarFTP",
																		uploadExtraData: {id :"8" , tipoDoc: "Sobretiros"},
																	});
															});
													</script>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-12">
											<button  class="btn btn-s-xs fl_right">Subir</button>
										</div>
									</div>
								</div>
							  </form>
						 </div>
	                        <!---<div class="form-group">
	                            <div class="row">
	                                <div class="col-sm-12">
	                                    <button onclick="guardarDatosGenerales();" class="btn btn-s-xs fl_right">Guardar</button>
	                                </div>
	                            </div>
	                        </div> --->
	                    </section>
                    </div>
                </div>
                <div  class="tab-pane fade" id="paso4">
                    <div class="panel-body">
                        <section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;">
                            <form id="formPrograma" class="form-group">
                                <br>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="cont">Al cumplir los requisitos de admisi&oacute;n, se le ha asignado un n&uacute;mero de registro:<strong>#prc.Numero_registro#</strong> como alumno de tiempo:</div>
                                    </div>
								</div>
								<div class="row">
									<div class="col-sm-5 col-sm-offset-1">
										<div class="cont">
											<label class="radio-inline">
												<input type="radio" id="radioPrograma" name="radioPrograma" value="1"> Completo
											</label>
										</div>
									</div>
									<div class="col-sm-5 col-sm-offset-1">
										<div class="cont">
											<label class="radio-inline">
												<input type="radio" id="radioPrograma" name="radioPrograma" value="2"> Parcial
											</label>
										</div>
									</div>
								</div>
								<form class="form-group">
									<div class="row">
										<div class="col-sm-12">
										     <div class="cont">Adscrito a la dependencia:<strong> <!---cfoutput>#Session.usuario.NOMBRE_DEP#</cfoutput---></strong> a continuaci&oacute;n elija un director de tesis y programa academico de los disponibles:</div>
										</div>
									</div>
									<br>
									<div class="row" >
										<div class="col-sm-3">
											<div class="cont">Director de tesis:</div>
										</div>
										<div class="col-sm-9">
											<select class="form-control" id="directorTesis" name="directorTesis">
												<option value="0">Seleccione un director</option>
												<!---<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>--->
											</select>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-sm-3">
											<div class="cont">Area de conocimiento:</div>
										</div>
										<div class="col-sm-9">
											<select class="form-control" id="areaConocimiento" name="areaConocimiento" onchange="getProgramaAcademico();">
												<option value="0">Seleccione un area de conocimiento</option>
											</select>
										</div>
									</div>
									<br>
									<div class="row" >
										<div class="col-sm-3">
											<div class="cont">Programa acad&eacute;mico:</div>
										</div>
										<div class="col-sm-9">
											<select class="form-control" id="programaAcademico" name="programaAcademico" onchange="mostrarCargaAcademica(this.value)" onclick="getTablaPrograma();">
												<option value="0">Seleccione un programa acad&eacute;mico</option>
											</select>
										</div>
									</div>
									<br>
									<div class="tab-pane" id="programaA" style="background-color: #F4F6F6;">
										<div class="row">
											<div class="col-sm-12">
												<div class="table-responsive">
													<table  id="tablaPrograma"
                                                        data-search="true"
                                                        data-pagination="true"
                                                        data-height="450"
                                                        align="center">
														<thead>
															<tr>
																<th class="tb_titulo" colspan="4"><div align="center">Programa acad&eacute;mico</div></th>
															</tr>
															<tr>
																<th class="tb_contenido" data-field="clave">Clave</th>
																<th class="tb_contenido" data-field="materia">Materia</th>
																<th class="tb_contenido" data-field="creditos">Cr&eacute;ditos</th>
															</tr>
														</thead>
													</table>
												</div>
											</div>
										</div>
									</div>
								</form>
								<div class="row">
									<div class="col-sm-6 col-sm-offset-5">
										<!---<cfdump var="#prc.validar.ESTADO_PROGRAMA#">--->
										<!---<cfif #prc.validar.ESTADO_PROGRAMA# EQ 1>--->
										<button id="btnGuardarMotivos" class="btn btn-default glyphicon glyphicon-floppy-disk"></button>
										<button id="btnValidar" class="btn btn-default fa fa-unlock"></button>
										<!---<cfelse >--->
										<button id="btnValidado" class="btn btn-default fa fa-lock"></button>
										<button id="btnPDF" class="btn btn-default fa fa-file-pdf-o"></button>
										<!---</cfif>--->
									</div>
								</div>
								<br>
							</section>
						</div>
					</div>
					<div  class="tab-pane fade" id="paso5">
						<div class="panel-body">
							<section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;">
								<div class="panel-body">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-12">
												<div class="inst">En la siguiente tabla encontraras toda la carga academica del alumno: #prc.Nombre_Alumno# </div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="table-responsive">
													<table  id="tablaConsultar"
														data-search="true"
														data-pagination="true"
														data-click-to-select="true"
														data-unique-id="id"
														align="center">
														<thead>
															<tr>
																<th class="tb_titulo" colspan="10"><div align="center">Carga acad&eacute;mica</div></th>
															</tr>
															<tr>
																<th class="tb_contenido" data-field="asignatura" data-visible="false">	Asignatura	</th>
																<th class="tb_contenido" data-field="asignacion" data-visible="false">	Asignacion Profesor	</th>
																<th class="tb_contenido" data-field="id">	ID	</th>
																<th class="tb_contenido" data-field="clave">			Clave				</th>
																<th class="tb_contenido" data-field="materia">		Materia			</th>
																<th class="tb_contenido" data-field="semestre">		Semestre		</th>
																<th class="tb_contenido" data-field="profesor"> 	Profesor		</th>
																<th class="tb_contenido" data-field="creditos">		Creditos		</th>
																<th class="tb_contenido" data-field="horas">			Horas				</th>
																<th class="tb_contenido" data-field="acciones" data-checkbox="true">		Acciones		</th>
															</tr>
														</thead>
													</table>
													<table  id="tablaConsultarCursadas"
														data-search="true"
														data-pagination="true"
														data-unique-id="id"
														data-page-size="5"
														align="center">
														<thead>
															<tr>
																<th class="tb_titulo" colspan="9"><div align="center">Materias cursadas</div></th>
															</tr>
															<tr>
																<th class="tb_contenido" data-field="asignatura" data-visible="false">	Asignatura	</th>
																<th class="tb_contenido" data-field="asignacion" data-visible="false">	Asignacion Profesor	</th>
																<th class="tb_contenido" data-field="id">	ID	</th>
																<th class="tb_contenido" data-field="clave">			Clave				</th>
																<th class="tb_contenido" data-field="materia">		Materia			</th>
																<th class="tb_contenido" data-field="semestre">		Semestre		</th>
																<th class="tb_contenido" data-field="profesor"> 	Profesor		</th>
																<th class="tb_contenido" data-field="creditos">		Creditos		</th>
																<th class="tb_contenido" data-field="horas">			Horas				</th>
															</tr>
														</thead>
													</table>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6 col-sm-offset-5">
												<button id="btnGuardaCarga" class="btn btn-default fa fa-floppy-o" onclick=saveCargaAcademica();></button>
												<!---<cfif PK_ESTATUS EQ 0>--->
													<button id="btnValidar" class="btn btn-default fa fa-unlock"></button>
												<!---<cfelse>--->
													<button id="btnValidado" class="btn btn-default fa fa-lock"></button>
													<button id="btnPDF" class="btn btn-default fa fa-file-pdf-o"></button>
												<!---</cfif>--->
											</div>
										</div>
										<br>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!---Ventana modal de cargando--->
		<div class="modal modal-static fade in" id="cargador-modal" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="text-center">
							<img src="/posgrado/includes/base/images/loading.gif" class="icon" alt="" />
							<h4>Procesando... <button type="button" class="close" style="float: none;" data-dismiss="modal" aria-hidden="true">&times;</button></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--- Fin Ventana modal de cargando--->
	</section>

<script type="text/javascript">
$('#nivelAcad').on('change', function (e) {
    nivel = $('#nivelAcad').val();
    $('#nivelTab li a').eq(nivel).tab('show');
});
$(function () {
    $('#C_genFechaNac').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        //viewMode: 'years'
    });
});
$(function () {
    $('#C_acadFechaInicio').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
$(function () {
    $('#C_acadFechaFin').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
$(function () {
    $('#C_acadFechaTitulo').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
$(function () {
    $('#C_expProfFechaInicio').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
$(function () {
    $('#C_expProfFechaTermino').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
$(function () {
    $('#C_labDocenteFechaInicio').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
$(function () {
    $('#C_labDocenteFechaTermino').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
$(function () {
    $('#C_trabInvesFechaInicio').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
$(function () {
    $('#C_trabInvesFechaTermino').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
});
</script>
