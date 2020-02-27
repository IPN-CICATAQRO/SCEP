<cfinclude template = "Crear_js.cfm">
<section id="content">
    <div class="wrapper row2" style="background-color:#2E626E;">
        <div class="row">
            <div class="col-sm-12">
                <nav  class="navbar" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle  btn-lg fl_left" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">Desplegar navegaci&oacute;n</span>
                            <span class="glyphicon glyphicon-align-justify" style="color: DADADDA;"></span> Men&uacute;
                        </button>
                    </div>
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul  id="tabs" class="nav nav-tabs nav-justified" data-tabs="tabs" >
                            <li class="active" ><a href="#TableroControl"  data-toggle="tab" onclick="cerrar();"><span>Tablero de</span><span> <br>Control</span></a></li>
                            <li ><a  href="#NuevaConv" data-toggle="tab" onclick="cerrar();"><span>Nueva</span><br><span>Convocatoria</a></li>
                            <li ><a  href="#Reportes" data-toggle="tab" onclick="cerrar();"><span>Reportes</span><br><span>Convocatoria</a></li>
                            <li ><a  href="#Profesores" data-toggle="tab" onclick="cerrar();"><span>Profesores</span><br><span>Agregar</span></a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="wrapper row3 well">
        <div class="tab-content">
            <div  class="tab-pane active" id="TableroControl" >
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
            </div>
            <div  class="tab-pane fade" id="NuevaConv" >
                <div class="panel-body">
                    <section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;" ><!--- inicio de section 1 --->
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
                                        <li class="active" ><a href="#convocatoria"  data-toggle="tab" onclick="cerrar();">Nueva <br> Convocatoria</a></li>
                                        <li ><a href="#seguimiento"  data-toggle="tab" onclick="cerrar();">Seguimiento <br> Convocatoria</a></li>
                                        <li ><a href="#lineamiento"  data-toggle="tab" onclick="cerrar();">Lineamientos a <br> Revisar</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </header>
                        <div class="panel-body">
                            <input type="hidden" id="pkConvocatoria" value="">
                            <div class="tab-content">
                                <div class="tab-pane active" id="convocatoria" style="background-color: #F4F6F6;">
                                    <div class="panel-body">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="pest1" style="background-color: #F4F6F6;">
                                                <section style="border: solid; border-color: #DADADA;">
                                                    <div class="panel-body" >
                                                        <div id="rootwizard">
                                                            <div class="navbar">
                                                                <div class="navbar-inner">
                                                                    <div class="container">
                                                                        <ul id="subtabs" class="nav nav-tabs nav-justified" data-tabs="tabs">
                                                                            <li><a href="#tab1" data-toggle="tab" class="hidden">Paso 1</a></li>
                                                                            <li><a href="#tab2" data-toggle="tab" class="hidden">Paso 2</a></li>
                                                                            <li><a href="#tab3" data-toggle="tab" class="hidden">Paso 3</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tab-content">
                                                                <div class="tab-pane active" id="tab1">
                                                                    <div class="panel-body" >
                                                                        <form id="genForm" role="form">
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <div class="inst" align="left" style="padding-left:10px" > A continuaci&oacute;n se presenta una serie de campos que tendra que llenar, para registrar su convocatoria.</div>
                                                                                        <br>
                                                                                        <label>
                                                                                            <div class="subtitulo" align="center" style="padding-left:10px">EL INSTITUTO POLIT&Eacute;CNICO NACIONAL A TRAV&Eacute;S DE LA  CONVOCA</div><!---cfoutput>#Session.usuario.NOMBRE_DEP#</cfoutput--->
                                                                                            <br>
                                                                                            <div class="row">
                                                                                                <div class="col-sm-12">
                                                                                                    <div class="cont" align="justify" style="padding-left:10px">Con base en el Reglamento de Estudios de Posgrado del Instituto Politecnico Nacional, se expide la presente <strong>CONVOCATORIA</strong> para participar en el proceso de admision a (PROGRAMA DE POSGRADO) para el periodo de</div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <br>
                                                                                            <div class="row">
                                                                                                <div class="col-sm-3">
                                                                                                    <div class="input-group" data-validate="anios">
                                                                                                        <input type="text" class="form-control input-sm" name="idPeriodo" id="idPeriodo" placeholder="Per&iacute;odo"
                                                                                                                required="true">
                                                                                                        <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-sm-2">
                                                                                                    <div class="cont" align="left">con el siguiente:</div>
                                                                                                </div>
                                                                                             </div>
                                                                                         </label>
                                                                                    </div>
                                                                                </div>
                                                                                <br>
                                                                                <div class="row">
                                                                                    <div class="col-sm-5">
                                                                                        <div class="cont" style="padding-left:10px">Ingrese aqu&iacute; el objetivo de la convocatoria a publicar:</div>
                                                                                    </div>
                                                                                    <div class="col-sm-7">
                                                                                        <div class="form-group">
                                                                                            <div class="input-group" data-validate="texto">
                                                                                                <textarea type="text" id="objetivoConvocatoria" maxlength="275" class="form-control"  placeholder="Capture objetivos aqu&iacute;" required="true"></textarea>
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-5">
                                                                                        <div class="cont" style="padding-left:10px">Ingrese aqu&iacute; el perfil para el ingreso:</div>
                                                                                    </div>
                                                                                    <div class="col-sm-7">
                                                                                        <div class="input-group" data-validate="texto">
                                                                                            <textarea type="text" id="perfilIngreso"  maxlength="275" class="form-control"  placeholder="Capture el perfil de ingreso aqu&iacute;" required="true"></textarea>
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk" ></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <br>
                                                                                <div class="row">
                                                                                    <div class="col-sm-5">
                                                                                        <div class="cont" style="padding-left:10px">Ingrese aqu&iacute; el perfil de egreso:</div>
                                                                                    </div>
                                                                                    <div class="col-sm-7">
                                                                                        <div class="input-group" data-validate="texto">
                                                                                            <textarea type="text" id="perfilEgreso" pattern="^[_A-z0-9-]{1,}$" maxlength="275" class="form-control"  placeholder="Capture el perfil de egreso aqu&iacute;" required="true"></textarea>
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                         </div>
                                                                                    </div>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane" id="tab2">
                                                                    <div class="panel-body" >
                                                                        <form id="genForm" role="form">
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <label class="text-left" style="padding-left:10px">Requisitos del Aspirante: </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-8">
                                                                                        <div class="inst" align="justify" style="padding-left:10px">que se soliciten al aspirante para presentar el preoceso de admisi&oacute;n, tanto los establecidos en los articulos 28&#176; o 29&#176; del Reglamento de Estudios de Posgrado, como los declarados en el perfil de ingreso del programa acad&eacute;mico correspondiente.</div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalRequisito"><div class="h5"> Agregar requisito</div> </button>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <label class="text-left" style="padding-left:10px">Revalidaci&oacute;n: </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-8">
                                                                                        <div class="inst" align="justify" style="padding-left:10px">Requisitos para los aspirantes que est&eacute;n en posibilidad de revalidar unidades de aprendizaje seg&uacute;n se estipula en el articulo 35 del regimen de Estudios de Posgrado.(En caso de que el programa no acepte revalidaci&oacute;n, como en el caso de Especialidades M&eacute;dicas estar&aacute; exento de este rubro).</div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalRevalidacion"><div class="h5">Agregar revalidaci&oacute;n</div></button>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <label class="text-left" style="padding-left:10px">Requisitos para Aspirantes Extranjeros: </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-8">
                                                                                        <div class="inst" align="justify" style="padding-left:10px">Aqu&iacute; se agregaran los documentos requeridos para aspirantes de nacionalidad distinta a la mexicana y que esten interesados en ingresar a un programa de prosgrado.</div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalDocumentos"><div class="h5">Agregar documentos</div> </button>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <label class="text-left" style="padding-left:10px">Descripci&oacute;n del proceso de admisi&oacute;n:</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-8">
                                                                                        <div class="inst" align="justify" style="padding-left:10px">Descripci&oacute;n del proceso de admisi&oacute;n y criterios de acreditaci&oacute;n de cada parte o etapa del proceso, en concordancia con los art&iacute;culos 32, 33 y 34 del Reglamento de Estudios de Posgrado.</div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#modalProceso" ><div class="h5"><span>Agregar etapa</span><br><span> del proceso</span> </div></button>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <label class="text-left" style="padding-left:10px">Fecha de Resultados:</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-8">
                                                                                        <label>
                                                                                            <div class="inst" style="padding-left:10px">Adicionalmente, se deber&aacute; especificar la <strong>forma</strong> y <strong>fecha</strong> de emis&iacute;n de resultados finales del proceso de admisi&oacute;n. (Podr&aacute;n colocar un peque&#241;o cuadro con el calendario del proceso).</div>
                                                                                        </label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalFecha"><div class="h5"><span>Agregar Forma</span> <br><span> Resultados</span></div></button>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-3">
                                                                                        <div class="inst"style="padding-left:10px">Fecha de resultados:</div>
                                                                                    </div>
                                                                                    <div class="col-md-3">
                                                                                        <div class="input-group">
                                                                                            <div class='input-group date' id="FechaNac" >
                                                                                                <input type='text' id="id_fecha"class="form-control" required="true"/>
                                                                                                <span class="input-group-addon info"><span class="glyphicon glyphicon-calendar"></span></span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <br>
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <label class="text-left" style="padding-left:10px">Cupo m&aacute;ximo de alumnos:</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-7">
                                                                                        <label>
                                                                                            <div class="inst" style="padding-left:10px">N&uacute;mero m&aacute;ximo de alumnos que podr&aacute;n ser admitidos al programa.</div>
                                                                                        </label>
                                                                                    </div>
                                                                                    <div class="col-sm-3" >
                                                                                        <div class="input-group" data-validate="numeros">
                                                                                            <input type="text" id="maximoAlumnos"  maxlength="2" class="form-control" placeholder="M&aacute;ximo de alumnos" size="5" required="true">
                                                                                            <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane" id="tab3">
                                                                    <div class="panel-body" >
                                                                        <form id="genForm" role="form">
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                								    <div class="col-sm-12">
                                                                                        <label class="text-left" style="padding-left:10px">Plan de estudios</label>
                                                        							</div>
                                                        						</div>
                                                        						<div class="row">
                                                        						    <div class="col-sm-7">
                                                        							    <label>
                                                        								<div class="inst" style="padding-left:10px">Obligatoriamente debe indicarse el sitio en Internet del programa acad&eacute;mico, donde el aspirante pueda consultar el plan de estudios y las l&iacute;neas de investigaci&oacute;n asociadas al programa acad&eacute;mico.(URL completa, donde con un solo click, los direccione al programa acad&eacute;mico, dentro de la p&aacute;gina de la ECU&#180;S).</div>
                                                        								</label>
                                                        							</div>
                                                        							<div class="col-sm-5" >
                                                                                        <div class="input-group" data-validate="url">
                                                                                            <textarea type="text" id="URLacademica"  class="form-control" placeholder="http://www..." required></textarea>
                                                                                            <span class="input-group-addon"><span ></span></span>
                                                                                        </div>
                                                        							</div>
                                                        						</div>
                                                        						<div class="row">
                                                        					        <div class="col-sm-12">
                                                                                        <label class="text-left" style="padding-left:10px">Requisitos para la obtenci&oacute;n del grado:</label>
                                                        							</div>
                                                        						</div>
                                                        						<div class="row">
                                                        						    <div class="col-sm-7">
                                                        							    <label>
                                                        								<div class="inst" style="padding-left:10px">Requisitos para obtenci&oacute;n del diploma o grado acad&eacute;mico de conformidad con los articulos 53, 54, 55 del Reglamento de Estudios de Posgrado. (Colocar las fracciones completas del art&iacute;culo que corresponda).</div>
                                                        								</label>
                                                        							</div>
                                                        							<div class="col-sm-4" >
                                                        							    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalGrado"><div class="h5"><span>Agregar</span> <span>requisitos</span></div></button>
                                                        							</div>
                                                        						</div>
                                                                                <div class="row">
                                                        						    <div class="col-sm-12">
                                                        							    <div class="subtitulo" style="padding-left:10px">Datos de informes del programa:</div>
                                                        							</div>
                        													    </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <label class="text-left" >
                                                                                            <div class="inst" align="justify" style="padding-left:10px">Se debe de proporcionar el nombre completo, n&uacute;mero de conmutador y extenci&oacute;n, obligatoriamente correo electronico <strong>INSTITUCIONAL</strong> de la persona designada para ampliar la informaci&oacute;n referida en la convocatoria.(Adicionalmente podr&aacute;n a&#241;adir alg&uacute;n otro correo alterno).</div>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <br>
                                                                                <div class="row">
                                                                                    <div class="col-sm-4">
                                                                                        <div class="input-group" data-validate="nombres">
                                                                                            <input type='text' class="form-control" pattern="^[_A-z]{1,}$" name="nombre" placeholder="Nombre:" id="nombre"/>
                                                                                            <span class="input-group-addon"><span ></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4 ">
                                                                                        <div class="input-group" data-validate="nombres">
                                                                                            <input type='text' class="form-control" pattern="^[_A-z]{1,}$" name="aPaterno" placeholder="Apellido paterno:" id="aPaterno"/>
                                                                                            <span class="input-group-addon"><span ></span></span>
                                                                                        </div>
                                                    			                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class="input-group" data-validate="nombres">
                                                                                            <input type='text' class="form-control" pattern="^[_A-z]{1,}$" name="aMaterno" placeholder="Apellido materno:" id="aMaterno"/>
                                                                                            <span class="input-group-addon"><span ></span></span>
                                                                                        </div>
                                  												    </div>
                                                                                </div>
                                                                                <br>
                                                                                <div class="row">
                                                                                	<div class="col-sm-3">
                                                                                		<div class="input-group" data-validate="numeros">
                                                                                            <input type='text' class="form-control" pattern="^[0-9]+$" name="telefonoConmutador" placeholder="N&uacute;mero de conmutador" id="noConmutador"/>
                                                                                            <span class="input-group-addon"><span ></span></span>
                                                                                        </div>
                                                                                	</div>
                                                                                	<div class="col-sm-3">
                                                                                		<div class="input-group" data-validate="numeros">
                                                                                            <input type='text' class="form-control" pattern="^[0-9]+$" name="telefonoExt" placeholder="N&uacute;mero de extensi&oacute;n" id="noExtension"/>
                                                                                            <span class="input-group-addon"><span ></span></span>
                                                                                            </div>
                                                                                    	</div>
                                                                                    <div class="col-sm-3">
                                                                                    	<div class="input-group" data-validate="email_Inst">
                                                                                            <input type='text' id="eInstitucional" class="form-control" name="emailInst" placeholder="Email institucional" id="eInstitucional"/>
                                                                                            <span class="input-group-addon"><span ></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-3">
                                                                                    	<div class="input-group" data-validate="email_Alt">
                                                                                            <input type='text' id="eAlt" class="form-control"  name="emailInst" placeholder="Email alternativo" id="eInstitucional"/>
                                                                                            <span class="input-group-addon"><span ></span></span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <div class="titulo" style="padding-left:10px">Conclusi&oacute;n:</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-11">
                                                                                        <div class="inst" style="padding-left:10px"> La convocatoria debe concluir con la frase "Cualquier situaci&oacute;n no prevista originada durante el proceso de admisi&oacute;n se resolver&aacute; con pleno apego al Reglamento de Estudios de Posgrado, del Instituto Polit&eacute;cnico Nacional.</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                    <ul class="pager wizard">
                                                                        <li class="previous first" style="display:none;"><a href="#">First</a></li>
                                                                        <li class="previous"><button class="fl_left btn btn-default">Previous</button></li>
                                                                        <li class="next last" style="display:none;"><a href="#">Last</a></li>
                                                                        <li class="next"><button id="btnNext"class="fl_right btn btn-default" >Next</button></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                </section>
                							</div>
                                            <div class="tab-pane" id="pest2" style="background-color: #F4F6F6;">
                                                <section>
                                                    <p>Seguimiento</p>
                								</section>
                                            </div>
                                            <div class="tab-pane" id="pest3" style="background-color: #F4F6F6;">
                                                <section>
                                                    <p>Lineamientos</p>
                								</section>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane " id="seguimiento" style="background-color: #F4F6F6;">
                                    <section>
                                        <cfoutput>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="table-responsive">
                                                        <table  id="tablaSeguimiento"
                                                            data-search="true"
                                                            data-pagination="true"
                                                            data-height="450"
                                                            align="center">
                                                            <thead>
                                                                <tr>
                                                                    <th class="tb_titulo" colspan="12"><div align="center">Convocatorias registradas</div></th>
                                                                </tr>
                                                                <tr>
                                                                    <th class="col-sm-1 tb_contenido" data-field="numero">No.</th>
                                                                    <th class="col-sm-1 tb_contenido" data-field="convocatoria">Convocatoria</th>
                                                                    <th class="col-sm-1 tb_contenido" data-field="periodo">Periodo</th>
                                                                    <th class="col-sm-1 tb_contenido" data-field="fechaResultados">Fecha Resultados</th>
                                                                    <th class="col-sm-1 tb_contenido" data-field="cupoMaximo">Cupo maximo</th>
                                                                    <th class="col-sm-1 tb_contenido" data-field="nombreResponsable">Nombre</th>
                                                                    <th class="col-sm-6 tb_contenido" data-field="acciones" >Acciones</th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </cfoutput>
                                    </section>
                                </div>
                                <div class="tab-pane " id="lineamiento" style="background-color: #F4F6F6;">
                                    <section>
                                        <div class="table-responsive">
                                            <div class="custom_pad">
                                                <table class="table table-striped table-bordered"  >
                                                    <thead>
                                                        <tr>
                                                            <th  class="tb_titulo" width="5%">No.</th>
                                                            <th  class="tb_titulo" width="80%">Lineamientos a revisar</th>
                                                            <th  class="tb_titulo" width="15%" colspan="2">Cumplimiento</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tLineamiento">
                                                        <tr>
                                                            <td style="font-weight:100">1</td>
                                                            <td style="font-weight:100"><div class="inst">La convocatoria debe iniciar con la frase <strong>"EL INSTITUO POLITECNICO NACIONAL, A TRAVES DE ANOTAR EL NOMBRE DE LA(S) UNIDAD(ES) ACADEMICA(S) QUE OFRECE(N) EL PROGRAMA convoca a los interesados
                                                en cursar estudios en el programa ANOTAR EL NOMBRE DEL PROGRAMA, modalidad ANOTAR LA MODALIDAD DEL PROGRAMA: ESCOLARIZADA, NO ESCOLARIZADA O MIXTA, para iniciar en el ciclo escolar ANOTAR EL
                                                PERIODO ESCOLAR O CICLO LECTIVO, bajo las siguientes bases"</strong>.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">2</td>
                                                            <td style="font-weight:100"><div class="inst">Requisitos que se solicitan al aspirante para presentar el proceso de admision, tanto los establecidos en el Articulo 29&#176; del Reglamento de Estudios de Posgrado, como los declaradosen el perfil
                                                de ingreso del programa academico correspondiente.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option4"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">3</td>
                                                            <td style="font-weight:100"><div class="inst">Requisitos para los aspirantes que esten en posibilidad de revalidar unidades de aprendizaje segun se estipula en el articulo 35 del Reglamento de Estudios de Posgrado. (en caso de que el programa
                                                no acepte revalidacion, favor de mencionarlo).</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="option5"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio6" value="option6"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">4</td>
                                                            <td style="font-weight:100"><div class="inst">Requisitos para el aspirante de nacionalidad distinta a la mexicana.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio7" value="option7"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio8" value="option8"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">5</td>
                                                            <td style="font-weight:100"><div class="inst">Descripcion del proceso de admision y criterios de acreditacion de cada parte o etapadel proceso, en concordancia con los articulos 32, 33 y 34 del Reglamento de Estudios de Posgrado.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio9" value="option9"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio10" value="option10"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">6</td>
                                                            <td style="font-weight:100"><div class="inst">Adicionalmente, se debera especificar la forma y fecha de emision de resultados finales del proceso de admision.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio11" value="option11"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio12" value="option12"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">7</td>
                                                            <td style="font-weight:100"><div class="inst">Numero maximo de aspirantes que podran ser admitidos en el programa.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio13" value="option13"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio14" value="option14"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">8</td>
                                                            <td style="font-weight:100"><div class="inst">El sitio Internet del programa academico, donde el aspirante pueda consultar el plan de estudios y las lineas de investigacion asociadas al programa academico.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio15" value="option15"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio16" value="option16"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">9</td>
                                                            <td style="font-weight:100"><div class="inst">Requisitos para la obtencion del diploma o grado academico de conformidad con el Articulo 55&#176; del Reglamento de Estudios de Posgrado.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio17" value="option17"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio18" value="option18"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">10</td>
                                                            <td style="font-weight:100"><div class="inst">Nombre, numero telefonico y correo electronico institucional de la persona designada para ampliar la informacion referida en la convocatoria. (podran colocar un correo alterno).</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio19" value="option19"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio20" value="option20"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-weight:100">11</td>
                                                            <td style="font-weight:100"><div class="inst">La convocatoria debera concluir con la frase <strong>"Cualquier situacion originada durante el proceso de admision se resolvera con pleno apego al Reglamento de Estudios de Posgrado.</div></td>
                                                            <td style="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio21" value="option21"> Si
                                                                </label>
                                                            </td>
                                                            <td dstyle="font-weight:100">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio22" value="option22"> No
                                                                </label>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>

            <div  class="tab-pane fade" id="Reportes">
                <div class="panel-body">
                    <section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;">
                        <p>Reportes</p>
                    </section>
                </div>
            </div>

            <div  class="tab-pane fade" id="Profesores">
                <div class="panel-body">
                    <section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;">
                        <form  class="form-horizontal" role="form">
                          <div class="form-group"  hidden  >
                               <label  class="control-label col-sm-2" for="idAsignacion" >ID ASIGNACION:</label>
                               <div class="col-sm-10">
                                 <input id="idAsignacion" value="0" >
                                </div>
                          </div>
                          <div class="form-group">
                               <label  class="control-label col-sm-2" for="a_combo1">Nombre Profesor:</label>
                               <div class="col-sm-10">
                                    <select class="form-control" id="a_combo1" >
                                      <option value="-1" selected >Selecciona una opci&oacute;n</option>
                                      <!--- <cfloop index="i" from="1" to="#prc.catalogoProfesores.RECORDCOUNT#">
                                        <cfoutput>
                                          <option value=#prc.catalogoProfesores.PK_PROFESORES[i]#>#prc.catalogoProfesores.NOMBRE[i]#</option>
                                        </cfoutput>
                                      </cfloop> --->
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                              <label  class="control-label col-sm-2" for="a_combo2">Asignatura:</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="a_combo2" >
                                      <option value="-1"  selected>Selecciona una opci&oacute;n</option>
                                      <!--- <cfloop index="i" from="1" to="#prc.catalogoAsignaturas.RECORDCOUNT#">
                                        <cfoutput>
                                          <option value=#prc.catalogoAsignaturas.PK_ASIGNATURA[i]#>#prc.catalogoAsignaturas.ASIGNATURA[i]#</option>
                                        </cfoutput>
                                      </cfloop> --->
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-sm-2" for="a_combo6">Periodo:</label>
                              <div class="col-md-4">
                                    <select class="form-control" id="a_combo6" >
                                      <option value="-1" selected>Selecciona una opci&oacute;n</option>
                                      <!--- <cfloop index="i" from="1" to="#prc.catalogoPeriodo.RECORDCOUNT#">
                                        <cfoutput>
                                          <option value=#prc.catalogoPeriodo.PK_PERIODO[i]#>#prc.catalogoPeriodo.PERIODO[i]#</option>
                                        </cfoutput>
                                      </cfloop> --->
                                    </select>
                              </div>
                                <label class="control-label col-sm-2" for="a_combo3">Semestre:</label>
                                 <div class="col-md-4">
                                    <select class="form-control" id="a_combo3" >
                                      <option value="-1" selected >Selecciona una opci&oacute;n</option>
                                      <!--- <cfloop index="i" from="2" to="#prc.catalogoSemestre.RECORDCOUNT#">
                                        <cfoutput>
                                          <option  value=#prc.catalogoSemestre.PK_SEMESTRE[i]#>#prc.catalogoSemestre.SEMESTRE[i]#</option>
                                        </cfoutput>
                                      </cfloop> --->
                                    </select>
                                </div>
                            </div>
                              <div class="form-group">
                              <label class="control-label col-sm-2" for="a_combo5" >Turno:</label>
                              <div class="col-md-4">
                                   <select class="form-control" id="a_combo5" >
                                       <option value="-1" selected>Selecciona una opci&oacute;n</option>
                                       <!--- <cfloop index="i" from="1" to="#prc.catalogoTurno.RECORDCOUNT#">
                                        <cfoutput>
                                           <option value=#prc.catalogoTurno.PK_TURNO[i]#>#prc.catalogoTurno.TURNO[i]#</option>
                                         </cfoutput>
                                       </cfloop> --->
                                     </select>
                              </div>
                                <label class="control-label col-sm-2" for="a_combo4">Grupo:</label>
                                 <div class="col-md-4">
                                    <select class="form-control" id="a_combo4" >
                                      <option value="-1" selected>Selecciona una opci&oacute;n</option>
                                      <option value="2CME" selected>2CME</option>
                                      <option value="2CMA" selected>2CMA</option>
                                      <option value="2CMU" selected>2CMU</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                              <center>
                              <div class="btn-group" >
                                  <button type="button"  id="p_agregar"    class="btn btn-primary glyphicon glyphicon glyphicon-floppy-disk"
                                          onclick="guardarRegistroAsignacion()"></button>
                                  <button type="button"  id="p_limpiar"     class="limpiarC btn btn-primary glyphicon glyphicon-refresh"
                                           onclick="limpiarFormulario()"></button>

                               </div>
                               </center>
                            </div>
                      </form>

                    </section>
                </div>

                <div class="panel-body">
                  <section style="padding-left: 15px; padding-right: 15px; border: solid; border-color: #DADADA;">
                    <div class="row">
                      <div class="col-sm-12">
                        <div class="table-responsive">
                          <table  id="tbAsignacionProfesor"
                                   data-search="true"
                                   data-pagination="true"
                                   data-height="450"
                                   data-page-size="5"
                                   style="text-align: center;" >
                            <thead>
                               <tr>
                                  <th colspan="12"><div align="center">Registro de Asignaciones a Profesores</div></th>
                               </tr>
                               <tr >
                                  <th class="col-sm-1" data-field="ID">No.</th>
                                  <th class="col-sm-1" data-field="nombreProfesor">Nombre Profesor</th>
                                  <th class="col-sm-1" data-field="asignatura">Asignatura</th>
                                  <th class="col-sm-1" data-field="semestre">Semestre</th>
                                  <th class="col-sm-1" data-field="grupo">Grupo</th>
                                  <th class="col-sm-1" data-field="turno">Turno</th>
                                  <th class="col-sm-1" data-field="periodo">Periodo</th>
                                  <th class="col-sm-6" data-field="acciones">Acciones</th>
                               </tr>
                            </thead>
                           </table>
                        </div>
                      </div>
                    </div>
                  </section>
                </div>  <!-- Termina  class="tab-pane fade" id="Profesores" --->

    </div>




<div class="modal fade" id="modalRequisito" tabindex="-1" data-focus-on="input:first" role="dialog" aria-labelledby="modalHorarioLabel" aria-hidden="true"><!---  Ventana Modal requisitos  --->
    <div class="modal-dialog modal-lg">
        <div class="modal-content" >
            <div class="modal-header" style="background-color:#2E626E;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="modal-title h4" style="color:#FAFAFA;" id="modalHorarioLabel">Agregar requisito</div>
            </div>
            <div class="modal-body">
                <div class="panel panel-default">
				<!---<div class="panel-heading">
					<h3 class="panel-title">Panel 1</h3>
				</div>--->
    				<div class="panel-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="inst">
                                    A continuacion de clic en <i class="glyphicon glyphicon-plus"></i> para agregar un nuevo requisito:
                                </div>
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-deafult glyphicon glyphicon-plus" style="color:black;" onclick="agregar()"></button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-9">
                                <form id="formReq">
                                    <div id="miDiv">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p style="color:black;">Requisitos:</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-1 col-sm-offset-1">
                                                <label id="lblReq" style="color:black;"><div class="inst">1.-</div></label>
                                            </div>
                                            <div class="col-sm-7">
                                                <input id="input1" class="documentoR" type="text" size="50px" style="color:black;">
                                            </div>
                                        </div>
                                    </div>
                               </form>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="row" align="center">
                            <div class="col-sm-12">
                               <button type="button"  id="btnGuardarRequisitos" class="btn btn-default glyphicon glyphicon-floppy-disk" style="color:black;" onclick="guardarRequisito();"></button>
                            </div>
                        </div>
    			    </div>
                </div>
            </div>
            <!---<div class="modal-footer">
                <button type="button"  class="btn btn-default" data-dismiss="modal"><span style="color:black">Cerrar</span></button>
            </div>---->
        </div>
    </div>
</div>

<div class="modal fade" id="modalRevalidacion" tabindex="-1" role="dialog" aria-labelledby="modalHorarioLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" >
            <div class="modal-header" style="background-color:#2E626E;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="modal-title h4" style="color:#FAFAFA;" id="modalHorarioLabel">Agregar Revalidaci&oacute;n</div>
            </div>
            <div class="modal-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="inst">
                                    A continuaci&oacute;n de clic en <i class="glyphicon glyphicon-plus"></i> para agregar un nuevo requisito de revalidaci&oacute;n:
                                </div>
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-deafult glyphicon glyphicon-plus" style="color:black;" onclick="agregarRev()"></button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-9">
                                <form id="formRev">
                                    <div id="miDivRev">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p style="color:black;">Requisitos:</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                          	<div class="col-sm-1 col-sm-offset-1">
                                          		<label id="lblRev" style="color:black;"><div class="inst">1.-</div></label>
                                           	</div>
                                           	<div class="col-sm-7 ">
                                           		<input id="inputRev" class="documentoRev" type="text" size="50px" style="color:black;">
                                           	</div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="row" align="center">
                            <div class="col-sm-12">
                                <button type="button"  id="btnGuardarReV" class="btn btn-default glyphicon glyphicon-floppy-disk" style="color:black;" onclick="guardarRevalidacion();"></button>
                            </div>
                		</div>
                	</div>
                </div>
            </div>
            <!---<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span style="color:black">Cerrar</span></button>
            </div>--->
        </div>
     </div>
 </div>

 <div class="modal fade" id="modalDocumentos" tabindex="-1" role="dialog" aria-labelledby="modalHorarioLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
         <div class="modal-content" >
             <div class="modal-header" style="background-color:#2E626E;">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <div class="modal-title h4" style="color:#FAFAFA;" id="modalHorarioLabel">Agregar documentos</div>
             </div>
            <div class="modal-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="inst">
                                    A continuaci&oacute;n de clic en <i class="glyphicon glyphicon-plus"></i> para agregar un nuevo requisito para los aspirantes extranjeros:
                                </div>
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-deafult glyphicon glyphicon-plus" style="color:black;" onclick="agregarDoc()"></button>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-9">
                                <form id="formDoc">
                                    <div id="miDivDoc">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p style="color:black;">Requisitos:</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                          	<div class="col-sm-1 col-sm-offset-1">
                                          		<label id="lblDoc" style="color:black;"><div class="inst">1.-</div></label>
                                           	</div>
                                           	<div class="col-sm-7 ">
                                           		<input id="inputDoc" class="documentoDoc" type="text" size="50px" style="color:black;">
                                           	</div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="row" align="center">
                            <div class="col-sm-12">
                                <button type="button"  id="btnGuardarDoc" class="btn btn-default glyphicon glyphicon-floppy-disk" style="color:black;" onclick="guardarDoc();"></button>
                            </div>
                		</div>
                	</div>
                </div>
            </div>
            <!---<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span style="color:black">Cerrar</span></button>
            </div>--->
         </div>
    </div>
</div>

     <div class="modal fade" id="modalProceso" tabindex="-1" role="dialog" aria-labelledby="modalHorarioLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
             <div class="modal-content" >
                 <div class="modal-header" style="background-color:#2E626E;">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                     <div class="modal-title h4" style="color:#FAFAFA;" id="modalHorarioLabel">Agregar etapa de proceso</div>
                 </div>
                 <div class="modal-body">
                     <div class="panel panel-default">
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-sm-7">
                                  <div class="inst">
                                      A continuaci&oacute;n de clic en <i class="glyphicon glyphicon-plus"></i> para agregar una nueva etapa del proceso:
                                  </div>
                              </div>
                              <div class="col-sm-1">
                                  <button class="btn btn-deafult glyphicon glyphicon-plus" style="color:black;" onclick="agregarPro()"></button>
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-sm-9">
                                  <form id="formPro">
                                      <div id="miDivPro">
                                          <div class="row">
                                              <div class="col-sm-3">
                                                  <p style="color:black;">Etapas:</p>
                                              </div>
                                          </div>
                                          <div class="row">
                                            	<div class="col-sm-1 col-sm-offset-1">
                                            		<label id="lblPro" style="color:black;"><div class="inst">1.-</div></label>
                                             	</div>
                                             	<div class="col-sm-7 ">
                                             		<input id="inputPro" class="documentoPro" type="text" size="50px" style="color:black;">
                                             	</div>
                                          </div>
                                      </div>
                                  </form>
                              </div>
                          </div>
                          <br>
                          <br>
                          <div class="row" align="center">
                              <div class="col-sm-12">
                                  <button type="button"  id="btnGuardarPro" class="btn btn-default glyphicon glyphicon-floppy-disk" style="color:black;" onclick="guardarPro();"></button>
                              </div>
                  		</div>
                  	</div>
                  </div>
                 </div>
                 <!---<div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal"><span style="color:black">Cerrar</span></button>
                 </div>--->
             </div>
         </div>
     </div>

     <div class="modal fade" id="modalFecha" tabindex="-1" role="dialog" aria-labelledby="modalHorarioLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
             <div class="modal-content" >
                 <div class="modal-header" style="background-color:#2E626E;">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                     <div class="modal-title h4" style="color:#FAFAFA;" id="modalHorarioLabel">Fecha de resultados</div>
                 </div>
                 <div class="modal-body">
                     <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="inst">
                                        A continuaci&oacute;n de clic en <i class="glyphicon glyphicon-plus"></i> para agregar un nuevo requisito:
                                    </div>
                                </div>
                                <div class="col-sm-1">
                                    <button class="btn btn-deafult glyphicon glyphicon-plus" style="color:black;" onclick="agregarForma()"></button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-9">
                                    <form id="formForma">
                                        <div id="miDivForma">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <p style="color:black;">Requisitos:</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                              	<div class="col-sm-1 col-sm-offset-1">
                                              		<label id="lblForma" style="color:black;"><div class="inst">1.-</div></label>
                                               	</div>
                                               	<div class="col-sm-6">
                                               		<input id="inputForma" class="documentoForma" type="text" size="30px" style="color:black;">
                                               	</div>
                    							<div class="col-sm-2">
                    								<div class="input-group date " id="fechaForma" style="color:black;">
                                                       <input type="text" id="id_fecha" class="form-control fechaPublicacion"  />
                                                       <span class="input-group-addon">
                                                       <span class="glyphicon glyphicon-calendar"></span>
                                                       </span>
                    								</div>
                    							</div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="row" align="center">
                                <div class="col-sm-12">
                                    <button type="button"  id="btnGuardarForma" class="btn btn-default glyphicon glyphicon-floppy-disk" style="color:black;" onclick="guardarForma();"></button>
                                </div>
                    		</div>
                    	</div>
                    </div>
                 </div>
                 <!---<div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal"><span style="color:black">Cerrar</span></button>
                 </div>--->
             </div>
         </div>
     </div>

     <div class="modal fade" id="modalGrado" tabindex="-1" role="dialog" aria-labelledby="modalHorarioLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
             <div class="modal-content" >
                 <div class="modal-header" style="background-color:#2E626E;">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                     <div class="modal-title h4" style="color:#FAFAFA;" id="modalHorarioLabel">Agregar requisitos para la obtenci&ocute;n de grado</div>
                 </div>
                 <div class="modal-body">
                     <div class="panel panel-default">
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-sm-6">
                                  <div class="inst">
                                      A continuaci&oacute;n de clic en <i class="glyphicon glyphicon-plus"></i> para agregar un nuevo requisito:
                                  </div>
                              </div>
                              <div class="col-sm-1">
                                  <button class="btn btn-deafult glyphicon glyphicon-plus" style="color:black;" onclick="agregarGra()"></button>
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-sm-9">
                                  <form id="formGra">
                                      <div id="miDivGra">
                                          <div class="row">
                                              <div class="col-sm-3">
                                                  <p style="color:black;">Requisitos:</p>
                                              </div>
                                          </div>
                                          <div class="row">
                                            	<div class="col-sm-1 col-sm-offset-1">
                                            		<label id="lblGra" style="color:black;"><div class="inst">1.-</div></label>
                                             	</div>
                                             	<div class="col-sm-7 ">
                                             		<input id="inputGra" class="documentoGra" type="text" size="50px" style="color:black;">
                                             	</div>
                                          </div>
                                      </div>
                                  </form>
                              </div>
                          </div>
                          <br>
                          <br>
                          <div class="row" align="center">
                              <div class="col-sm-12">
                                  <button type="button"  id="btnGuardarGra" class="btn btn-default glyphicon glyphicon-floppy-disk" style="color:black;" onclick="guardarGra();"></button>
                              </div>
                  		</div>
                  	</div>
                  </div>
                 </div>
                 <!---<div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal"><span style="color:black">Cerrar</span></button>
                 </div>--->
             </div>
         </div>
     </div>

     <div class="modal fade modalEdit" id="modalEditarDatos" tabindex="-1" data-focus-on="input:first" role="dialog" aria-labelledby="modalEditarDatos" aria-hidden="true">
         <div class="modal-dialog modal-lg">
             <div class="modal-content" >
                 <div class="modal-header" style="background-color:#2E626E;">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                     <div class="modal-title h4" style="color:#FAFAFA;" id="modalEditarDatos">Edici&oacute;n de la informaci&oacute;n de la convocatoria</div>
                 </div>
                 <div class="modal-body">
                     <div class="form-group">
                         <div class="row">
                             <div class="col-sm-12">
                                 <div class="subtitulo" align="left" style="padding-left:10px"> En esta ventana podras editar la informaci&oacute;n de la convocatoria seleccionada.</div>
                             </div>
                         </div>
                     </div>
                     <div class="bs-example">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading icon" data-toggle="collapse" data-parent="#accordion" class="subtitulo h5" href="#collapse1">
                                    <label>Datos Generales de la Convocatoria</label>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <form id="editarDatosForm" role="form">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="inst" align="left" style="padding-left:10px" > Informacion de la convocatoria registrada.</div>
                                                    </div>
                                                </div>
                                           </div>
                                           <div class="form-group">
                                               <div class="row">
                                                   <div class="col-sm-12">
                                                       <div class="subtitulo" align="left" style="padding-left:10px">EL INSTITUTO POLIT&Eacute;CNICO NACIONAL A TRAV&Eacute;S DE LA <!---cfoutput>#Session.usuario.NOMBRE_DEP#</cfoutput---> CONVOCA.</div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="form-group">
                                               <div class="row">
                                                   <div class="col-sm-12">
                                                       <div class="cont" align="justify" style="padding-left:10px">Con base en el Reglamento de Estudios de Posgrado del Instituto Politecnico Nacional, se expide la presente <strong>CONVOCATORIA</strong> para participar en el proceso de admision a (PROGRAMA DE POSGRADO) para el periodo de</div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="form-group">
                                               <div class="row">
                                                   <div class="col-sm-4">
                                                       <div class="input-group" data-validate="numeros">
                                                           <input type="text" id="idPeriodoEdit"   class="form-control input-sm" placeholder="Per&iacute;odo">
                                                           <span class="input-group-addon"><span ></span></span>
                                                       </div>
                                                   </div>
                                                   <div class="col-sm-4">
                                                       <div class="cont" align="left">con el siguiente:</div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="form-group">
                                               <div class="row">
                                                   <div class="col-sm-5">
                                                        <div class="cont" style="padding-left:10px">Ingrese aqu&iacute; el objetivo de la convocatoria a publicar:</div>
                                                    </div>
                                                    <div class="col-sm-7">
                                                        <div class="input-group" data-validate="nombres">
                                                            <textarea type="text" id="objetivoConvocatoriaEdit" maxlength="275" class="form-control" rows="4" placeholder="Capture objetivos aqu&iacute;"></textarea>
                                                            <span class="input-group-addon"><span ></span></span>
                                                        </div>
                                                    </div>
                                               </div>
                                           </div>
                                           <div class="form-group">
                                               <div class="row">
                                                   <div class="col-sm-5">
                                                        <div class="cont" style="padding-left:10px">Ingrese aqu&iacute; el perfil de ingreso de la convocatoria a publicar:</div>
                                                    </div>
                                                    <div class="col-sm-7">
                                                        <div class="input-group" data-validate="nombres">
                                                            <textarea type="text" id="perfilIngresoEdit" maxlength="275" class="form-control" rows="4" placeholder="Capture objetivos aqu&iacute;"></textarea>
                                                            <span class="input-group-addon"><span ></span></span>
                                                        </div>
                                                    </div>
                                               </div>
                                           </div>
                                           <div class="form-group">
                                               <div class="row">
                                                   <div class="col-sm-5">
                                                        <div class="cont" style="padding-left:10px">Ingrese aqu&iacute; el perfil de egreso de la convocatoria a publicar:</div>
                                                    </div>
                                                    <div class="col-sm-7">
                                                        <div class="input-group" data-validate="nombres">
                                                            <textarea type="text" id="perfilEgresoEdit" maxlength="275" class="form-control" rows="4" placeholder="Capture objetivos aqu&iacute;"></textarea>
                                                            <span class="input-group-addon"><span ></span></span>
                                                        </div>
                                                    </div>
                                               </div>
                                           </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading icon" data-toggle="collapse" data-parent="#accordion" class="subtitulo h5" href="#collapse2">
                                    <label>Requisitos para el aspirante y revalidaciones</label>
                                </div>
                                <div id="collapse2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    Estos son los requisitos para los aspirantes al programa de posgrado.
                                                </div>
                                            </div>
                                        </div>
                                        <div id="ContenidoReqAspirante">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    Estos son los requisitos para los aspirantes extranjeros al programa de posgrado.
                                                </div>
                                            </div>
                                        </div>
                                        <div id="ContenidoReqExtranjeros">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    Estas son las formas de revalidacion para el programa de posgrado.
                                                </div>
                                            </div>
                                        </div>
                                        <div id="ContenidoRevalidacion">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading icon"  data-toggle="collapse" data-parent="#accordion" class="subtitulo h5" href="#collapse3">
                                    <label>Descripci&oacute;n del proceso</label>
                                </div>
                                <div id="collapse3" class="panel-collapse collapse">
                                    <div class="panel-body" style="padding-bottom: 250px;">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    Estas son las descripciones del proceso para el programa de posgrado.
                                                </div>
                                            </div>
                                        </div>
                                        <div id="ContenidoProceso">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    Esta es la forma y fecha de emis&iacute;on de resultados finales del proceso de admisión. para el programa de posgrado.
                                                </div>
                                            </div>
                                        </div>
                                        <div id="ContenidoResultados">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div style="padding-left:10px">Fecha de resultados:</div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class='input-group date' id="FechaResEdit" >
                                                        <input type='text' id="fechaResultadosEdit"class="form-control" required="true"/>
                                                        <span class="input-group-addon info"><span class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div style="padding-left:10px">Cupo m&aacute;ximo:</div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class='input-group'>
                                                        <input type='text' id="cupoMaximoEdit" class="form-control" required="true"/>
                                                        <span class="input-group-addon "><span ></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading icon" data-toggle="collapse" data-parent="#accordion" class="subtitulo h5" href="#collapse4">
                                    <label>Plan de estudios y obtencion del grado</label>
                                </div>
                                <div id="collapse4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    Datos del responsable de la convocatoria al programa de posgrado.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class='input-group'>
                                                        <input type='text' id="nombreResponsableEdit" class="form-control" placeholder="Nombre del responsable" required="true"/>
                                                        <span class="input-group-addon "><span ></span></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class='input-group'>
                                                        <input type='text' id="paternoResponsableEdit" class="form-control" placeholder="Apellido paterno del responsable" required="true"/>
                                                        <span class="input-group-addon "><span ></span></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class='input-group'>
                                                        <input type='text' id="maternoResponsableEdit" class="form-control" placeholder="Apellido materno del responsable" required="true"/>
                                                        <span class="input-group-addon "><span ></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class='input-group'>
                                                        <input type='text' id="conmutadorResponsableEdit" class="form-control" placeholder="Conmutador" required="true"/>
                                                        <span class="input-group-addon "><span ></span></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class='input-group'>
                                                        <input type='text' id="extResponsableEdit" class="form-control" placeholder="Extensi&oacute;n" required="true"/>
                                                        <span class="input-group-addon "><span ></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class='input-group'>
                                                        <input type='text' id="correoIntResponsableEdit" class="form-control" placeholder="Correo institucional" required="true"/>
                                                        <span class="input-group-addon "><span ></span></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class='input-group'>
                                                        <input type='text' id="correoAltResponsableEdit" class="form-control" placeholder="Correo alternativo" required="true"/>
                                                        <span class="input-group-addon "><span ></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    Eeste es el plan de estudios.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                     <div class="cont" style="padding-left:10px">Ingrese aqu&iacute; la URL donde se publicara el plan  de estudios para el programa de posgrados:</div>
                                                 </div>
                                                 <div class="col-sm-8">
                                                     <div class="input-group" data-validate="URL">
                                                         <textarea type="text" id="URLConvocatoriaEdit" maxlength="275" class="form-control" rows="4" placeholder="Capture la URL aqu&iacute;"></textarea>
                                                         <span class="input-group-addon"><span ></span></span>
                                                     </div>
                                                 </div>
                                            </div>
                                        </div>
                                        <div id="ContenidoPlanEstudios">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    Estos son los pasos para la obtenci&oacute;n del grado.
                                                </div>
                                            </div>
                                        </div>
                                        <div id="ContenidoReqGrado">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-default" onclick="javascript:guardarDatosEditados()"><span >Guardar</span></button>
                     <input type='text' id="cadenaReqAspirante" class='form-control input-sm' placeholder='Requisito'>
                     <input type='text' id="cadenaReqExtranjeros" class='form-control input-sm' placeholder='Requisito'>
                     <input type='text' id="cadenaReqGrado" class='form-control input-sm' placeholder='Requisito'>
                     <input type='text' id="cadenaRevalidacion" class='form-control input-sm' placeholder='Requisito'>
                     <input type='text' id="cadenaProceso" class='form-control input-sm' placeholder='Requisito'>
                     <input type='text' id="cadenaResultados" class='form-control input-sm' placeholder='Resultados'>
                 </div>
             </div>
         </div>
     </div>
<script>
var data = [
    <cfif isDefined('prc.infoSeguimiento.DATOS.RecordCount')>
	   <cfloop index="i" from="1" to="#prc.infoSeguimiento.DATOS.RecordCount#">
            <cfset botonesAcciones= "<div class='row'><div class='col-sm-3'><button class='btn btn-xs fa fa-file-pdf-o'></button></div><div class='col-sm-3'><button class='btn btn-xs fa fa-pencil-square-o' data-toggle='modal' data-target='.modalEdit' onclick='getDatosGenerales(#prc.infoSeguimiento.DATOS.PK_CONVOCATORIA[i]#);'></button></div><div class='col-sm-3'><button  class='btn btn-xs fa fa-trash-o' ></button></div><div class='col-sm-3'><button class='btn btn-xs fa fa-unlock'></button></div></div>">
          <cfoutput>
		        {
				"numero":             "#i#",
				"convocatoria":       "#prc.infoSeguimiento.DATOS.PK_CONVOCATORIA[i]#",
				"periodo":            "#prc.infoSeguimiento.DATOS.PERIODO[i]#",
				"fechaResultados":    "#prc.infoSeguimiento.DATOS.FECHA_RESULTADOS[i]#",
				"cupoMaximo":         "#prc.infoSeguimiento.DATOS.CUPO_MAXIMO_ALUMNOS[i]#",
				"nombreResponsable":  "#prc.infoSeguimiento.DATOS.NOMBRE_RESPONSABLE[i]#",
                "acciones":           "#botonesAcciones#"
				},
			</cfoutput>
		</cfloop>
	</cfif>
];
$(function () {
    $('#tablaSeguimiento').bootstrapTable({
	       data: data
	});
});
</script>
