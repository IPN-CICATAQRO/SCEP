<script>
$(document).ready(function(){
	$("#btnNext").prop('disabled', true);
    $('.input-group input, .input-group textarea, .input-group select').on('keyup change', function() {
        //alert("Requerido");
        var $form = $(this).closest('form'),
            $group = $(this).closest('.input-group'),
			$addon = $group.find('.input-group-addon'),
			$icon = $addon.find('span'),
			estado = false;

            if (!$group.data('validate')) {
    			estado = $(this).val() ? true : false;
    		}else if ($group.data('validate') == "nombres") {
    			estado = /^[A-z\u00e1;\u00e9;\u00ed;\u00f3;\u00fa;\u00c1;\u00c9;\u00cd;\u00d3;\u00da;\u00f1;\u00d1;/\s/]{1,}$/.test($(this).val())
    		}else if ($group.data('validate') == "email_Inst") {
    			estado = /^([A-z.-/!]{1,})+([@]{1})+([ipn]{3})+([.]{1})+([mx]{2})$/.test($(this).val())
    		}else if ($group.data('validate') == "email_Alt") {
    			estado = /^([A-z.-/!]{1,})+([@]{1})+([A-z0-9]{1,})+([.]{1})+([A-z]{1,})$/.test($(this).val())
    		}else if($group.data('validate') == "telefonos") {
    			estado = /^([+]{0,1})+([52]{0,2})+([0-9]{2,3})+([0-9]{8})$/.test($(this).val())
    		}else if($group.data('validate') == "texto") {
    			estado = /^([A-z0-9-_.,\u00e1;\u00e9;\u00ed;\u00f3;\u00fa;\u00c1;\u00c9;\u00cd;\u00d3;\u00da;\u00f1;\u00d1;/\s/]{0,})$/.test($(this).val())
    		}else if ($group.data('validate') == "url") {
    			estado = /^([http://www.]{11})+([A-z0-9_-]{2,})+([.]{1})+([A-z]{2,})$/.test($(this).val())
    		}else if ($group.data('validate') == "cod-postal") {
    			estado = /^[0-9]{5}$/.test($(this).val())
    		}else if ($group.data('validate') == "numeros") {
    			estado = /^[0-9]{1,}$/.test($(this).val())
    		}else if ($group.data('validate') == "anios") {
    			estado = /^[0-9]{4}$/.test($(this).val())
    		}else if ($group.data('validate') == "curp") {
    			estado = /^([A-z]{4})+([0-9]{2})+((([0]{1})+([1-9]{1}))|(([1]{1})+([0-2]{1})))+((([0]{1})+([1-9]{1}))|(([1-2]{1})+([0-9]{1}))|(([3]{1})+([0-1]{1})))+([(H)|(M))]{1})+([A-z]{5})+([A-z0-9]{2})$/.test($(this).val())
    		}else if ($group.data('validate') == "rfc") {
    			estado = /^([A-z]{4})+([0-9]{2})+((([0]{1})+([1-9]{1}))|(([1]{1})+([0-2]{1})))+((([0]{1})+([1-9]{1}))|(([1-2]{1})+([0-9]{1}))|(([3]{1})+([0-1]{1})))+([A-z0-9]{3})$/.test($(this).val())
    		}
		if (estado) {
				$addon.removeClass('danger');
                $addon.removeClass('info');
				$addon.addClass('success');
				$icon.attr('class', 'glyphicon glyphicon-ok');
		}else{
				$addon.removeClass('success');
                $addon.removeClass('info');
				$addon.addClass('danger');
				$icon.attr('class', 'glyphicon glyphicon-remove');
		}

        if ($form.find('.input-group-addon.danger').length == 0 && $form.find('.input-group-addon.info').length == 0) {
            document.getElementById("btnNext").disabled = false;
        }else{
            document.getElementById("btnNext").disabled = true;
        }
	});
	/*
	* Descripcion: funcion para mostar el calendario
	* Fecha: Octubre 29, 2015
	* @author: Olguin Gallegos Claudia
	*/
	$(function () {
    $('#FechaNac').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
	});

	$(function () {
    $('#FechaResEdit').datetimepicker({
        locale: 'es',
        format: 'DD/MM/YYYY',
        viewMode: 'years'
    });
	});



$(function () {
	$("#fechaForma").datetimepicker({
			locale: 'es',
			format: 'DD/MM/YYYY',
			viewMode: 'years'
	});
});



	/*
	* Descripcion: Funciones para mostrar las graficas
	* Fecha: Octubre 29, 2015
	* @author: Olguin Gallegos Claudia
	*/


	$(function () {
    $('#grafica1').highcharts({
        title: {
            text: 'Cantidad de alumnos por materia',
            x: 0 //center
        },
        /*subtitle: {
            text: 'Source: WorldClimate.com',
            x: -20
        },*/
        xAxis: {
            categories: ['2010', '2011', '2012', '2013', '2014', '2015']
        },
        yAxis: {
            title: {
                text: 'Cantidad'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        /*tooltip: {
            valueSuffix: '�C'
        },*/
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Matematicas',
            data: [20, 25, 15, 40, 55, 35]
        }, {
            name: 'Fisica',
            data: [15, 20, 10, 30, 45, 25]
        }, {
            name: 'Quimica',
            data: [12, 17, 8, 27, 42, 22]
        }, {
            name: 'Computacion',
            data: [30, 35, 25, 50, 65, 45]
        }]
    });
});

$(function () {
    $('#grafica2').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Numero de alumnos por categoria'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Alumnos:',
            data: [
                ['Doctorado', 75],
                ['Especialidad', 65],
                /*{
                    name: 'Maestria',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },*/
                ['Maestria', 85],
                /*['Opera', 6.2],
                ['Others', 0.7]*/
            ]
        }]
    });
});




		/*
		* Descripcion: funcion para el boton siguiente
		* Fecha: Octubre 29, 2015
		* @author: Olguin Gallegos Claudia
		*/
		/*$('#rootwizard').bootstrapWizard({'nextSelector': '.button-next', 'previousSelector': '.button-previous'});
		function cerrar() {
	      $('.navbar-collapse').collapse('hide');
	  }*/

});
function cerrar() {
$('.navbar-collapse').collapse('hide');
}
		/*
		* Descripcion: funciones para la modal requisitos
		* Fecha: Octubre 29, 2015
		* @author: Olguin Gallegos Claudia
		*/
		var cont = 1;
		var arrayDocumentoR = new Array();
		 function eliminar(idInput){
			var contenido=$("#input"+idInput).val();
			arrayDocumentoR.splice(contenido);
			$("#input"+idInput).remove();
			$("#btn"+idInput).remove();
			$("#lblReq"+idInput).remove();
		 }
		 function agregar(){
			cont++;
			$("#formReq").append('<br>');
		  	$("#formReq").append('<br>');
			$("#formReq").append('<div class="row"><div class="col-sm-1 col-sm-offset-1"><label id="lblReq'+cont+'"><div class="inst">'+cont+'.-</div></label></div><div class="col-sm-7"><label style="color:black;"><input class="documentoR" id="input'+cont+'" type="text" size="50px" style="color:black" name="input_" value=""></div><div class="col-sm-1 col-sm-offset-2"><button class="btn btn-default glyphicon glyphicon-trash" style="color:black;" id="btn'+cont+'" onclick="eliminar('+cont+')"></button></div></div>');
		 }
		 function guardarRequisito(){
				var miLista="";
				$(".documentoR").each(function(index,value){
					var len = $('.documentoR').length;
					var jObj=$(value);
					if(index == (len-1)){
						arrayDocumentoR.push(jObj.val());
						miLista = miLista + jObj.val();
					}else{
						arrayDocumentoR.push(jObj.val()+';');
						miLista = miLista +jObj.val()+";";
					}
				});
				$.post('guardarRequisito',{
						pkConvocatoria : $('#pkConvocatoria').val(),
						addRequisito: miLista
					},
					function(data){
					});
				}

				/*
				* Descripcion: Funciones para la modal revalidacion
				* Fecha: Octubre 29, 2015
				* @author: Olguin Gallegos Claudia
				*/
				conta=1;
				var arrayDocumentosRev = new Array();
				 function eliminarRev(idInput){
					var contenido=$("#inputRev"+idInput).val();
					arrayDocumentosRev.splice(contenido);
					$("#inputRev"+idInput).remove();
					$("#btnRev"+idInput).remove();
					$("#lblRev"+idInput).remove();
				 }
				 function agregarRev(){
					conta++;
					$("#formRev").append('<br>');
				  $("#formRev").append('<br>');
					$("#formRev").append('<div class="row"><div class="col-sm-1 col-sm-offset-1"><label id="lblRev'+cont+'"><div class="inst">'+conta+'.-</div></label></div><div class="col-sm-7"><input class="documentoR" id="inputRev'+conta+'" type="text" size="50px" style="color:black" name="input_" value=""></div><div class="col-sm-1 col-sm-offset-2"><button class="btn btn-default glyphicon glyphicon-trash" style="color:black;" id="btnRev'+conta+'" onclick="eliminarRev('+conta+')"></button></div></div>');
				 }
				function guardarRevalidacion(){
					var listaRevalidacion = "";
					$(".documentoRev").each(function(index,value){
						var len = $('.documentoRev').length;
						var jObj=$(value);
						if(index == (len-1)){
							arrayDocumentosRev.push(jObj.val());
							listaRevalidacion = listaRevalidacion + jObj.val();
						}else{
							arrayDocumentosRev.push(jObj.val()+';');
							listaRevalidacion = listaRevalidacion +jObj.val()+";";
						}
					});
					$.post('guardarRevalidacion',{
						pkConvocatoria : $('#pkConvocatoria').val(),
						addRevalidacion: listaRevalidacion
					},
					function(data){
					});
				}

				/*
				* Descripcion: Funciones para la modal requisitos para el aspirante extranjero
				* Fecha: Octubre 29, 2015
				* @author: Olguin Gallegos Claudia
				*/
				contador=1;
				var arrayDocumentosDoc = new Array();
				function eliminarDoc(idInput){
					var contenido=$("#input3"+idInput).val();
					arrayDocumentosDoc.splice(contenido);
					$("#inputDoc"+idInput).remove();
					$("#btnDoc"+idInput).remove();
					$("#lblDoc"+idInput).remove();
				}
				function agregarDoc(){
					contador++;
					$("#formDoc").append('<br>');
				  $("#formDoc").append('<br>');
					$("#formDoc").append('<div class="row"><div class="col-sm-1 col-sm-offset-1"><label id="lblDoc'+cont+'"><div class="inst">'+contador+'.-</div></label></div><div class="col-sm-7"><input class="documentoDoc" id="inputDoc'+contador+'" type="text" size="50px" style="color:black" name="input_" value=""></div><div class="col-sm-1 col-sm-offset-2"><button class="btn btn-default glyphicon glyphicon-trash" style="color:black;" id="btnDoc'+contador+'" onclick="eliminarDoc('+contador+')"></button></div></div>');
				}
				function guardarDoc(){
					var listaDocumento = "";
					$(".documentoDoc").each(function(index,value){
						var len = $('.documentoDoc').length;
						var jObj=$(value);
						if(index == (len-1)){
							arrayDocumentosDoc.push(jObj.val());
							listaDocumento = listaDocumento + jObj.val();
						}else{
							arrayDocumentosDoc.push(jObj.val() + ';');
							listaDocumento = listaDocumento + jObj.val() + ";";
						}
					});
					$.post('guardarDocumento',{
						pkConvocatoria : $("#pkConvocatoria").val(),
						addDocumento: listaDocumento
					},
					function(data){
					});
				}

				/*
				* Descripcion: funciones para la modal proceso
				* Fecha: Octubre 29, 2015
				* @author: Olguin Gallegos Claudia
				*/
				contPro=1;
				var arrayDocumentoPro = new Array();
				function eliminarPro(idInput){
					var contenido=$("#inputPro"+idInput).val();
					arrayDocumentoPro.splice(contenido);
					$("#inputPro"+idInput).remove();
					$("#btnPro"+idInput).remove();
					$("#lblPro"+idInput).remove();
				}
				function agregarPro(){
					contPro++;
					$("#formPro").append('<br>');
				  $("#formPro").append('<br>');
					$("#formPro").append('<div class="row"><div class="col-sm-1 col-sm-offset-1"><label id="lblPro'+cont+'"><div class="inst">'+contPro+'.-</div></label></div><div class="col-sm-7"><input class="documentoPro" id="inputPro'+contPro+'" type="text" size="50px" style="color:black" name="input_" value=""></div><div class="col-sm-1 col-sm-offset-2"><button class="btn btn-default glyphicon glyphicon-trash" style="color:black;" id="btnPro'+contPro+'" onclick="eliminarPro('+contPro+')"></button></div></div>');
				}
			  function guardarPro(){
					var listaProceso = "";
					$(".documentoPro").each(function(index,value){
						var len = $('.documentoPro').length;
						var jObj=$(value);
						if(index == (len-1)){
							arrayDocumentoPro.push(jObj.val());
							listaProceso = listaProceso + jObj.val();
						}else{
							arrayDocumentoPro.push(jObj.val() + ';');
							listaProceso = listaProceso + jObj.val() + ";";
						}
					});
					$.post('guardarProceso',{
						pkConvocatoria : $("#pkConvocatoria").val(),
						addProceso: listaProceso
					},
					function(data){
					});
				}

				/*
				* Descripcion: funciones para la modal fecha
				* Fecha: Octubre 29, 2015
				* @author: Olguin Gallegos Claudia
				*/
				contFor=1;
				var arrayDocumentosForma = new Array();
				function eliminarForma(idInput){
					var contenido=$("#inputForma"+idInput).val();
					arrayDocumentosForma.splice(contenido);
					$("#inputForma"+idInput).remove();
					$("#fechaForma"+idInput).remove();
					$("#btnForma"+idInput).remove();
					$("#lblForma"+idInput).remove();
				}
				function agregarForma(){
					contFor++;
					$("#formForma").append('<br>');
				  	$("#formForma").append('<br>');
					$("#formForma").append('<div class="row"><div class="col-sm-1 col-sm-offset-1"><label id="lblForma'+contFor+'"><div class="inst">'+contFor+'.-</div></label></div><div class="col-sm-6"><input class="documentoForma" id="inputForma'+contFor+'" type="text" size="30px" style="color:black" name="input_" value=""></div><div class="col-sm-2"><div class="input-group date " style="color:black;" id="fechaForma'+contFor+'" ><input type="text" id="id_fecha'+contFor+'" class="form-control fechaPublicacion" /><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span></div></div><div class="col-sm-2"><button class="btn btn-default glyphicon glyphicon-trash" style="color:black;" id="btnForma'+contFor+'" onclick="eliminarForma('+contFor+')"></button></div></div>');
					$("#fechaForma"+cont).datetimepicker({
							locale: 'es',
							format: 'DD/MM/YYYY',
							viewMode: 'years'
					});
				}
				function guardarForma(){
					var listaFechas="";
					var arrayDocumentosFechas = new Array();
					$(".fechaPublicacion").each(function(index,value){
						var long = $(".fechaPublicacion").length;
						var jObjF =$(value);
						if(index == (long-1)){
							arrayDocumentosFechas.push(jObjF.val());
							listaFechas = listaFechas + jObjF.val();
						}else{
							arrayDocumentosFechas.push(jObjF.val() + ';');
							listaFechas = listaFechas + jObjF.val() + ';';
						}
					});
					var listaForma = "";
					$(".documentoForma").each(function(index,value){
						var len = $('.documentoForma').length;
						var jObj=$(value);
						if(index == (len-1)){
							arrayDocumentosForma.push(jObj.val());
							listaForma = listaForma + jObj.val();
						}else{
							arrayDocumentosForma.push(jObj.val() + ';');
							listaForma = listaForma + jObj.val() + ';';
						}
					});
					$.post('guardarFormaResultados',{
						pkConvocatoria : $("#pkConvocatoria").val(),
						addForma: listaForma,
						addFechaForma: listaFechas
					},
					function(data){
					});
				}

				/*
				* Descripcion: funciones la modal grado
				* Fecha: Octubre 29, 2015
				* @author: Olguin Gallegos Claudia
				*/
				contGra=1;
				var arrayDocumentosGra = new Array();
				function eliminarGrado(idInput){
					var contenido=$("#inputGra"+idInput).val();
					arrayDocumentosGra.splice(contenido);
					$("#inputGra"+idInput).remove();
					$("#btnGra"+idInput).remove();
					$("#lblGra"+idInput).remove();
				 }
				 function agregarGra(){
					contGra++;
					$("#formGra").append('<br>');
				  $("#formGra").append('<br>');
					$("#formGra").append('<div class="row"><div class="col-sm-1 col-sm-offset-1"><label id="lblGra'+cont+'"><div class="inst">'+contGra+'.-</div></label></div><div class="col-sm-7"><input class="documentoGra" id="inputGra'+contGra+'" type="text" size="50px" style="color:black" name="input_" value=""></div><div class="col-sm-1 col-sm-offset-2"><button class="btn btn-default glyphicon glyphicon-trash" style="color:black;" id="btnGra'+contGra+'" onclick="eliminarGra('+contGra+')"></button></div></div>');
				 }
				function guardarGra(){
					var listaGrado = "";
					$(".documentoGra").each(function(index,value){
						var len = $('.documentoGra').length;
						var jObj=$(value);
						if(index == (len-1)){
							arrayDocumentosGra.push(jObj.val());
							listaGrado = listaGrado + jObj.val();
						}else{
							arrayDocumentosGra.push(jObj.val() + ';');
							listaGrado = listaGrado + jObj.val() + ";";
						}
					});
					$.post('guardarGrado',{
						pkConvocatoria : $("#pkConvocatoria").val(),
						addGrado: listaGrado
					},
					function(data){
					});
				}

				/*
				* Descripcion: funcion para guardar lo de la primera pesta�a
				* Fecha: Octubre 29, 2015
				* @author: Olguin Gallegos Claudia
				*/
				function guardarPest1(){
					alert("Guarda pest1");
						/*$.post('guardarDatosConvocatoria',{
							periodo : $("#idPeriodo").val(),
							objetivo : $("#objetivoConvocatoria").val(),
							perfil_ingreso : $("#perfilIngreso").val(),
							perfil_egreso : $("#perfilEgreso").val(),
						},
							function(data){
								$("#pkConvocatoria").val(data);
						});*/

				}

				/*
				* Descripcion: funcion para guardar lo de la segunda pesta�a
				* Fecha: Octubre 29, 2015
				* @author: Olguin Gallegos Claudia
				*/
				function guardarPest2(){
					$.post('guardarDatosPestana',{
						pkConvocatoria : $("#pkConvocatoria").val(),
						fechaResultados : $("#id_fecha").val(),
						cupoMaximoAlumnos : $("#maximoAlumnos").val(),
					},
					function(data){
					});
				}
				/*
				* Descripcion: funcion para guardar lo de la tercera pesta�a
				* Fecha: Octubre 29, 2015
				* @author: Olguin Gallegos Claudia
				*/
				function guardarPest3(){
					$.post('guardarDatosGenerales', {
						pkConvocatoria : $("#pkConvocatoria").val(),
						nombre : $("#nombre").val(),
						aPaterno : $("#aPaterno").val(),
						aMaterno :$("#aMaterno").val(),
						conmutador: $("#noConmutador").val(),
						extension :$("#noExtension").val(),
						correoI : $("#eInstitucional").val(),
						correoA : $("#eAlt").val()
				  },
					function(data){
				  });
					$.post('guardarURL',{
						pkConvocatoria : $("#pkConvocatoria").val(),
						URLacademica : $("#URLacademica").val()
					},
					function(data) {
					})
				}

				/*
				* Descripcion: Funcion para mostrar los datos de la tabla seguimiento
				* Fecha: Noviembre 03, 2015
				* @author: Olguin Gallegos Claudia
				*/
				/*function getInformacionConvocatoria(){
					$.post('getInformacionConvocatoria', {
						pkConvocatoria : $("#pkConvocatoria").val(),
				  },
					function(data) {
						$("#tablaSeguimiento").append($('<tr ><td style="font-weight:100">'+data.DATOS.DATA.PK_CONVOCATORIA+'</td><td style="font-weight:100">'+data.DATOS.DATA.PERIODO+'</td><td style="font-weight:100">'+data.DATOS.DATA.FECHA_RESULTADOS+'</td><td style="font-weight:100">'+data.DATOS.DATA.CUPO_MAXIMO_ALUMNOS+'</td><td style="font-weight:100">'+data.DATOS.DATA.NOMBRE_RESPONSABLE+'</td><td style="font-weight:100"><button class="btn btn-xs fa fa-file-pdf-o"></button></td><td style="font-weight:100"><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalEditarDatos"  class="btn btn-xs fa fa-pencil-square-o"></button></td><td style="font-weight:100"><button class="btn btn-xs fa fa-trash-o"></button></</td><td style="font-weight:100"><button class="btn btn-xs fa fa-unlock-alt"></button></td></tr>'));
					});
				}*/

				/*
				* Descripcion: Funcion para mostrar los datos de una convocatoria especifica
				* Fecha: Noviembre 04, 2015
				* @author: Olguin Gallegos Claudia
				*/
				function getDatosGenerales(pkConvocatoria){
					alert(pkConvocatoria);
					$.post('getDatosCompletos', {
						pkConvocatoria : pkConvocatoria,
				  },
					function(data) {
						alert(JSON.stringify(data.RESULTADOS));
						ReqAspirante = $("#ContenidoReqAspirante");
						ReqAspirante.empty();
						ReqExtranjeros = $("#ContenidoReqExtranjeros");
						ReqExtranjeros.empty();
						ReqGrado =  $("#ContenidoReqGrado");
						ReqGrado.empty();
						Rev = $("#ContenidoRevalidacion");
						Rev.empty();
						Proceso = $("#ContenidoProceso");
						Proceso.empty();
						Resultados = $("#ContenidoResultados");
						Resultados.empty();
						document.getElementById("idPeriodoEdit").value = data.GENERAL.DATA.PERIODO;
						document.getElementById("objetivoConvocatoriaEdit").value = data.GENERAL.DATA.OBJETIVO;
						document.getElementById("perfilIngresoEdit").value = data.GENERAL.DATA.PERFIL_INGRESO;
						document.getElementById("fechaResultadosEdit").value = data.GENERAL.DATA.FECHA_RESULTADOS;
						document.getElementById("cupoMaximoEdit").value = data.GENERAL.DATA.CUPO_MAXIMO_ALUMNOS;
						document.getElementById("nombreResponsableEdit").value = data.RESPONSABLE.DATA.NOMBRE;
						document.getElementById("maternoResponsableEdit").value = data.RESPONSABLE.DATA.AP_MATERNO;
						document.getElementById("paternoResponsableEdit").value = data.RESPONSABLE.DATA.AP_PATERNO;
						document.getElementById("conmutadorResponsableEdit").value = data.RESPONSABLE.DATA.CONMUTADOR;
						document.getElementById("extResponsableEdit").value = data.RESPONSABLE.DATA.EXTENSION;
						document.getElementById("correoIntResponsableEdit").value = data.RESPONSABLE.DATA.CORREO_INSTITUCIONAL;
						document.getElementById("correoAltResponsableEdit").value = data.RESPONSABLE.DATA.CORREO_ALTERNATIVO;
						document.getElementById("URLConvocatoriaEdit").value = data.GENERAL.DATA.URL_PLAN_ACADEMICO;
						//alert(data.REQUISITOS.ROWCOUNT);
						var cadenaReqAspirante = "";
						var cadenaReqExtranjeros = "";
						var cadenaReqGrado = "";
						var cadenaRevalidacion = "";
						var cadenaProceso = "";
						var cadenaResultados = "";
						for(i=0; i < data.REQUISITOS.ROWCOUNT; i++){
							inputReqGrado = "<div class='form-group'><div class='row'><div class='col-sm-6'><div class='input-group'><input type='text' id='idReqGradoEdit"+i+"' class='form-control input-sm' placeholder='Requisito'><span class='input-group-addon'><span ></span></span></div></div></div></div>"
							inputReqExtranjeros = "<div class='form-group'><div class='row'><div class='col-sm-6'><div class='input-group'><input type='text' id='idReqExtranjerosEdit"+i+"' class='form-control input-sm' placeholder='Requisito'><span class='input-group-addon'><span ></span></span></div></div></div></div>"
							inputReqAspirante = "<div class='form-group'><div class='row'><div class='col-sm-6'><div class='input-group'><input type='text' id='idReqAspiranteEdit"+i+"' class='form-control input-sm' placeholder='Requisito'><span class='input-group-addon'><span ></span></span></div></div></div></div>"
							if(data.REQUISITOS.DATA.TIPO_REQUISITO[i] == 1){
								ReqAspirante.append(inputReqAspirante);
								$("#idReqAspiranteEdit"+i).val(data.REQUISITOS.DATA.REQUISITO[i]);
								cadenaReqAspirante = cadenaReqAspirante + data.REQUISITOS.DATA.REQUISITO[i] +";";
							}else if(data.REQUISITOS.DATA.TIPO_REQUISITO[i] == 2){
								ReqExtranjeros.append(inputReqExtranjeros );
								$("#idReqExtranjerosEdit"+i).val(data.REQUISITOS.DATA.REQUISITO[i]);
								cadenaReqExtranjeros = cadenaReqExtranjeros + data.REQUISITOS.DATA.REQUISITO[i] +";";
							}else if(data.REQUISITOS.DATA.TIPO_REQUISITO[i] == 3){
								ReqGrado.append(inputReqGrado);
								$("#idReqGradoEdit"+i).val(data.REQUISITOS.DATA.REQUISITO[i]);
								cadenaReqGrado = cadenaReqGrado + data.REQUISITOS.DATA.REQUISITO[i] +";";
							}
					    }
						$("#cadenaReqAspirante").val(cadenaReqAspirante);
						$("#cadenaReqExtranjeros").val(cadenaReqExtranjeros);
						$("#cadenaReqGrado").val(cadenaReqGrado);
						for(i=0; i < data.REVALIDACION.ROWCOUNT; i++){
						 	input = "<div class='form-group'><div class='row'><div class='col-sm-6'><div class='input-group'><input type='text' id='idRevalidacionEdit"+i+"' class='form-control input-sm' placeholder='Revalidaci&oacute;n'><span class='input-group-addon'><span ></span></span></div></div></div></div>"
						 	Rev.append(input);
						 	$("#idRevalidacionEdit"+i).val(data.REVALIDACION.DATA.REVALIDACION[i]);
							cadenaRevalidacion = cadenaRevalidacion + data.REVALIDACION.DATA.REVALIDACION[i] + ";";
						}
						$("#cadenaRevalidacion").val(cadenaRevalidacion);
						for(i=0; i < data.PROCESO.ROWCOUNT; i++){
						 	input = "<div class='form-group'><div class='row'><div class='col-sm-6'><div class='input-group'><input type='text' id='idProcesoEdit"+i+"' class='form-control input-sm' placeholder='Descipci6oacute;n proceso'><span class='input-group-addon'><span ></span></span></div></div></div></div>"
						 	Proceso.append(input);
						 	$("#idProcesoEdit"+i).val(data.PROCESO.DATA.PROCESO[i]);
							cadenaProceso = cadenaProceso + data.PROCESO.DATA.PROCESO[i] + ";";
						}
						$("#cadenaProceso").val(cadenaProceso);
						for(i=0; i < data.RESULTADOS.ROWCOUNT; i++){
						 	input = "<div class='form-group'><div class='row'><div class='col-sm-6'><div class='input-group'><input type='text' id='idResultadosEdit"+i+"' class='form-control input-sm' placeholder='Resultados'><span class='input-group-addon'><span ></span></span></div></div></div></div>"
						 	Resultados.append(input);
						 	$("#idResultadosEdit"+i).val(data.RESULTADOS.DATA.FORMA_RESULTADO[i]);
							cadenaResultados = cadenaResultados + data.RESULTADOS.DATA.FORMA_RESULTADO[i] + ";";
						}
						$("#cadenaResultados").val(cadenaResultados);
					});
				}
			    /*
				* Descripcion : Funcion para inicializar tabla POS_TASIGNACION_PROFESOR( tAsinacionProfesor)
				* Fecha : Noviembre 11, 2015
				* @author: Aaron Quintana Gomez
				*/
				function initTabla_AsignacionProfesor()
				{
					 botonesAcciones= "<div class='row'><div class='col-sm-3'><button class='btn btn-xs fa fa-pencil-square-o'  onclick='cargarEdicion(pk1);'></button></div><div class='col-sm-3'><button  class='btn btn-xs fa fa-trash-o' onclick='eliminarRegistroAsignacion(pk2);' ></button></div><div class='col-sm-3'><button class='btn btn-xs fa fa-unlock' onclick='validarRegistroAsignacion(pk3);'></button></div></div>"
					 var dataAsignacionProfesor=new Array();
					 var a;
					$.post("initTablaAsignacion"
							,{},function(data){
	   							var dataA;
								for(i=0; i < data.ROWCOUNT; i++){
									dataAsignacionProfesor[i] = dataA =
								    				   {
										        			    	"ID":              i+1,
										            				"nombreProfesor":  data.DATA.PROFESOR[i] ,
										            				"asignatura":         data.DATA.ASIGNATURA[i],
										            				"semestre":        data.DATA.SEMESTRE[i],
										            				"grupo":           data.DATA.GRUPO[i],
										                			"turno":           data.DATA.TURNO[i],
										                			"periodo":         data.DATA.PERIODO[i],
										                			"status":           data.DATA.STATUS[i],
										            				"acciones":        botonesAcciones.replace("pk1", data.DATA.PK_ASIGNACION_PROFESOR[i] ).replace("pk2", data.DATA.PK_ASIGNACION_PROFESOR[i]).replace("pk3",data.DATA.PK_ASIGNACION_PROFESOR[i])
										              			};
										              			var status = dataAsignacionProfesor[i].status;
										              			if(status == 2)
										              			{	dataAsignacionProfesor[i].acciones = dataAsignacionProfesor[i].acciones.replace("fa-unlock","fa-lock");
										              			}
										              }

							$(function () {
								$('#tbAsignacionProfesor').bootstrapTable({

				       				});
								$('#tbAsignacionProfesor').bootstrapTable('load',dataAsignacionProfesor);
							}); }
				          );
				}

				/*
				* Descripcion : Funcion que limpia valores al cargar la pagina
				* Fecha : Noviembre 11, 2015
				* @author: Aaron Quintana Gomez
				*/
				function limpiarFormularioAlCargaPagina()
				{
					    $("#a_combo1").val(-1);
						$("#a_combo2").val(-1);
						$("#a_combo3").val(-1);
						$("#a_combo4").val(-1);
						$("#a_combo5").val(-1);
						$("#a_combo6").val(-1);
						$("#idAsignacion").val(0);
				}

				/*
				* Descripcion : Funcion para limpiar nuestro formulario
				* Fecha : Noviembre 11, 2015
				* @author: Aaron Quintana Gomez
				*/
				function limpiarFormulario()
				{
					$('.limpiarC').click(function(){

						$("#a_combo1").val(-1);
						$("#a_combo2").val(-1);
						$("#a_combo3").val(-1);
						$("#a_combo4").val(-1);
						$("#a_combo5").val(-1);
						$("#a_combo6").val(-1);
						$("#idAsignacion").val(0);


       				});

				}



				function validarRegistroAsignacion(pk)
				{

					$.post("validarAsignacion"
							,{pkAsignacion: +"" +pk},function(data){

								alert("El registro ha sido validado");


							  }


				          );
					initTabla_AsignacionProfesor();
				}
				/*
				* Descripcion: Funcion para cargar la Edicion de la Asignacion de un Profesor
				*Fecha: Noviembre 11, 2015
				*@author: Aaron Quintana Gomez
				*/
				function cargarEdicion(pk)
				{

					//alert("pk: " +pk);
					$.post("buscarAsignacionByID"
							,{pkAsignacion: +"" +pk},function(data){



								$("#a_combo1").val("" +data.DATA.FK_PROFESOR[0] );
								$("#a_combo2").val("" +data.DATA.FK_MATERIA[0]);
								$("#a_combo3").val("" +data.DATA.FK_SEMESTRE[0]);
								$("#a_combo4").val(""+data.DATA.FK_GRUPO[0]);
								$("#a_combo5").val("" +data.DATA.FK_TURNO[0]);
								$("#a_combo6").val("" +data.DATA.FK_PERIODO[0]);
								$("#idAsignacion").val(data.DATA.PK_ASIGNACION_PROFESOR[0]);

							  }


				          );





					/*$("#tbInfoAcademica").bootstrapTable('getRowByUniqueId', 1);
					alert("cargar edicion: " );
					var $etiqueta = $(".editarA").attr('class').parent();
					alert($etiqueta);
					$("#a_combo2").val("One").attr();*/



				}

				/*
				* Descripcion: Funcion para Eliminar Asignaciones profesores pasan al estado 3, al hacerlo no se mostraran en la tabla
				* Fecha: Noviembre 11, 2015
				* @author Aaron Quintana Gomez
				*/
				function eliminarRegistroAsignacion(pk)
				{

					$.post("eliminarAsignacion"
							    ,{ pkRegistroActivo:   "" +pk,
								 },function(data){

	   									  alert("La informaci\u00f3n ha sido eliminada exitosamente.");
	                               }
							   );

				initTabla_AsignacionProfesor();
				}

				/*
				* Descripcion : Funcion para Guardar Asignaciones de Materias a Profesores
				* Fecha : Noviembre 11, 2015
				* @author: Aaron Quintana Gomez
				*/
				function guardarRegistroAsignacion()
				{

					var pkRegistroAsignacionActivo = $("#idAsignacion").val();
					 //alert("La llave es: " +pkRegistroAsignacionActivo);


						if( $("#a_combo1").val() == "-1" ){
							alert("Profavor: El nombre es requerido ");
							return;
					    }
	                    if( $("#a_combo2").val() == "-1" ){
							alert("Profavor: La materia es requerida ");
							return;
						}
						if( $("#a_combo3").val() == "-1" ){
							alert("Profavor: El semestre es requerido");
							return;
						}
						if( $("#a_combo4").val() == "-1" ){
							alert("Profavor: El grupo es requerido ");
							return;
					    }
						if( $("#a_combo5").val() == "-1" ){
							alert("Profavor: El  turno es requerido");
							return;
						}
						if( $("#a_combo6").val() == "-1" ){
							alert("Profavor: El  periodo es requerido");
							return;
						}

						var mensaje = ""
						var Control    = "Convocatoria.cfc";
						var  metodo = "";
						if(pkRegistroAsignacionActivo == 0){
                			metodo += "guardarAsignacion";
                			var mensaje = "La informaci\u00f3n ha sido registrada exitosamente.";
            			}else{
			                metodo += "editarAsignacion";
			                var mensaje = "La informaci\u00f3n ha sido actualizada exitosamente."
			            }



						$.post("" +metodo
							    ,{ pkRegistroActivo:   "" +pkRegistroAsignacionActivo,
								   nombre : 		   $("#a_combo1").val(),
								   materia :           $("#a_combo2").val(),
						           semestre :          $("#a_combo3").val(),
						           grupo :             $("#a_combo4").val(),
						           turno :             $("#a_combo5").val(),
						           periodo:            $("#a_combo6").val(),
					             },function(data){

	   									  alert(mensaje);


								   }
							   )

					  limpiarFormularioAlCargaPagina();
					  initTabla_AsignacionProfesor();
				}

				/*
				* Descripcion : Funcion que obtiene las asginaciones a profesores, almacena la informacion en un json.
				* Fecha : Noviembre 11, 2015
				* @author: Aaron Quintana Gomez
				*/
					 function obtenerAsignacionesProfesores()
					 {

					 	var dataAsignacionProfesor = [
	            			<!---<cfif isDefined('prc.infoAcademica.RECORDCOUNT')>
		    	       			<cfloop index="i" from="1" to="#prc.infoAcademica.RECORDCOUNT#">
		                		<cfset botonesAcciones= "<div class='row'><div class='col-sm-3'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>"> --->
		                      		<cfoutput>
			            		        {
			            				"no":              "2008",
			            				"nombreProfesor":  "Alberto Garcia Cortez",
			            				"materia":         "Matematicas",
			            				"semestre":        "8",
			            				"grupo":           "2CM5",
			                            "turno":           "Matutino",
			            				"acciones":        "acciones"
			            				},
		            				</cfoutput>
		    		    		<!---</cfloop>
		        			</cfif> --->
	        			];
	        			$(function () {
	    					$('#tbAsignacionProfesor').bootstrapTable({
		       					data: dataAsignacionProfesor
							});
						});

					 }

					 /*
	 				* Descripcion : Funcion que obtiene las asginaciones a profesores, almacena la informacion en un json.
	 				* Fecha : Noviembre 24, 2015
	 				* @author: Olguin Gallegos Claudia
	 				*/
					function getDatosGrafica(){
						dataGrado = [];
					$.post('getDatosGrafica',{

					},
					function(data){
						for(i=0; i < data.DATA.GRADO.length; i++){
							dataGrado[i] = dataGradoA = {
								name: data.DATA.GRADO[i],
								y: data.DATA.CUANTOS[i],
							}
						}
						$(function () {
						    $('#grafica4').highcharts({
						        chart: {
						            type: 'pie',
						            options3d: {
						                enabled: true,
						                alpha: 45
						            }
						        },
						        title: {
						            text: 'Grado de los directores de tesis'
						        },
						        subtitle: {
						            text: 'Grado que tienen los profesores que pueden elegir de directores de tesis'
						        },
						        plotOptions: {
						            pie: {
						                innerSize: 100,
						                depth: 45
						            }
						        },
						        series: [{
						            name: 'Cantidad:',
						            data: dataGrado,
						                /*['DR.', doctores],
						                ['DRA.', 9],
						                ['M en C.', 5],
						                ['ESP.', 6],
						                ['L', 8],
						            ]*/
						        }]
						    });
						});


					});
					}

					/*
				   * Descripcion : Funcion que obtiene las asginaciones a profesores, almacena la informacion en un json.
				   * Fecha : Noviembre 24, 2015
				   * @author: Olguin Gallegos Claudia
				   */
				   function getDatosMateriasArea(){
					   dataMateria = [];
					   $.post('getDatosMateriasArea',{

					   },
					   function(data){
						   for(i=0; i < data.DATA.AREA_CONOCIMIENTO.length; i++){
							   dataMateria[i] = dataMateriaA = {
								   name: data.DATA.DESCRIPCION[i],
								   y: data.DATA.CUANTOS[i],
							   }
						   }
						   //alert(dataMateria);
						   $(function () {
							    // Create the chart
							    $('#grafica3').highcharts({
							        chart: {
							            type: 'column'
							        },
							        title: {
							            text: 'Total de materias por area de conocimiento'
							        },
							        /*subtitle: {
							            text: 'Click the columns to view versions. Source: <a href="http://netmarketshare.com">netmarketshare.com</a>.'
							        },*/
							        xAxis: {
							            type: 'category'
							        },
							        yAxis: {
							            title: {
							                text: 'Total de materias'
							            }

							        },
							        legend: {
							            enabled: false
							        },
							        plotOptions: {
							            series: {
							                borderWidth: 0,
							                dataLabels: {
							                    enabled: true,
							                    format: '{point.y}'
							                }
							            }
							        },

							        tooltip: {
							            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
							            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b><br/>'
							        },

							        series: [{
							            name: 'Barra',
							            colorByPoint: true,
							            data: dataMateria,
							                /*name: 'Microsoft Internet Explorer',
							                y: 56.33,
							                drilldown: 'Microsoft Internet Explorer'
							            }, {
							                name: 'Chrome',
							                y: 24.03,
							                drilldown: 'Chrome'
							            }, {
							                name: 'Firefox',
							                y: 10.38,
							                drilldown: 'Firefox'
							            }, {
							                name: 'Safari',
							                y: 4.77,
							                drilldown: 'Safari'
							            }, {
							                name: 'Opera',
							                y: 0.91,
							                drilldown: 'Opera'
							            }, {
							                name: 'Proprietary or Undetectable',
							                y: 0.2,
							                drilldown: null*/
							            //}]
							        }],
							    });
							});
					   });

				   }



					$(document).ready(function() {
					getDatosGrafica();
					getDatosMateriasArea();
					limpiarFormularioAlCargaPagina();
					initTabla_AsignacionProfesor();
					limpiarFormulario();
					cerrar();
					//obtenerAsignacionesProfesores();

				    $('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) {
						alert("funciona");
				            if(index==1){

								guardarPest1();
							}
				            if(index==2) {

								guardarPest2();
				            }

							if(index==3){

								guardarPest3();


							}

				        }, onTabShow: function(tab, navigation, index) {
				            var $total = navigation.find('li').length;
				            var $current = index+1;
				            var $percent = ($current/$total) * 100;
				            $('#rootwizard').find('.bar').css({width:$percent+'%'});
				        }
				    });
				});

				$(document).ready(function() {
			        var heights = $(".well").map(function() {
			            return $(this).height();
			        }).get(),

			        maxHeight = Math.max.apply(null, heights);

			        $(".well").height(maxHeight);
			    });
				/*
				* Descripcion : Funcion para inicializar tabla POS_TASIGNACION_PROFESOR( tAsinacionProfesor)
				* Fecha : Diciembre 07, 2015
				* @author: Aldo Peña Alba
				*/
				function guardarDatosEditados(){
					var cadenaRequisitos = $("#cadenaReqAspirante").val()+$("#cadenaReqExtranjeros").val()+$("#cadenaReqGrado").val();
					var cadenaRevalidacion = $("#cadenaRevalidacion").val();
					var cadenaProceso = $("#cadenaProceso").val();
					var cadenaResultados = $("#cadenaResultados").val();
					$.post('guardarDatosConvocatoria',{
						pkConvocatoria : 		$("#pkConvocatoria").val(),
						periodo: 				$("#idPeriodoEdit").val(),
						objetivo:				$("#objetivoConvocatoriaEdit").val(),
						perfil_ingreso:			$("#perfilIngresoEdit").val(),
						perfil_egreso: 			$("#perfilEgresoEdit").val(),
						fecha_resultados: 		$("#fechaResultadosEdit").val(),
						cupo_maximo:			$("#cupoMaximoEdit").val(),
						plan_academico:			$("#URLConvocatoriaEdit").val(),
	                    requisito:				cadenaRequisitos.substr(0,cadenaRequisitos.length - 1),
						proceso:				cadenaProceso.substr(0,cadenaProceso.length - 1),
						revalidacion:	 		cadenaRevalidacion.substr(0,cadenaRevalidacion.length - 1),
						forma_resultado:		cadenaResultados.substr(0,cadenaResultados.length - 1),
						nombre:					$("#nombreResponsableEdit").val(),
						apellido_paterno:		$("#paternoResponsableEdit").val(),
						apellido_materno:		$("#maternoResponsableEdit").val(),
	                	conmutador:				$("#conmutadorResponsableEdit").val(),
						extension:				$("#extResponsableEdit").val(),
						correo_alternativo:		$("#correoIntResponsableEdit").val(),
						correo_institucional:	$("#correoAltResponsableEdit").val(),
					},
						function(data){
							//$("#pkConvocatoria").val(data);
					});
				}

</script>
