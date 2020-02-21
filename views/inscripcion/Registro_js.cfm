<script>
/*-----------------------------------------------------------------------------------FUNCION PARA VALIDAR--------------------------------------------------------------------------*/
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion para ocultar el menu de selecci�n despu�s de elegir una opci�n
 */
 $(document).ready(function() {
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
    		}else if($group.data('validate') == 'telefonos') {
    			estado = /^([+]{0,1})+([52]{0,2})+([0-9]{2,3})+([0-9]{8})$/.test($(this).val())
    		}else if ($group.data('validate') == "alfanumerico") {
    			estado = /^[A-z0-9/\s/]{1,}$/.test($(this).val())
    		}
            else if ($group.data('validate') == "url") {
    			estado = /^([http://www.]{11})+([A-z0-9_-]{2,})+([.]{1})+([A-z]{2,})$/.test($(this).val())
    		}else if ($group.data('validate') == "cod-postal") {
    			estado = /^[0-9]{5}$/.test($(this).val())
    		}else if ($group.data('validate') == "numeros") {
    			estado = /^[0-9]{1,}$/.test($(this).val())
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
});
/*-----------------------------------------------------------------------------------TERMINA FUNCION PARA VALIDAR--------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------FUNCIONES DATOS GENERALES--------------------------------------------------------------------------*/
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que llena una lista de direccion apartir de un C�digo Postal
 */
function direccion() {
    cp = String($("#genCP").val());
    tam = cp.length;
    if (tam == 5){
        $("#genColonia").attr("disabled", "false");
        $.post('obtenerDireccion', {
            pkCP : $("#genCP").val(),
        },
        function(data){
            if(data.ROWCOUNT > 0){
                $("#genColonia").html(' <option value="0">Seleccione Colonia</option>');
                $("#genColonia").prop("disabled",false);
                $("#genDelomncp").val(data.DATA.DEL_MUN[1].toUpperCase());
                $("#PKgenDelomncp").val(data.DATA.PK_DEL_MUN[1]);
                $("#genEstado").val(data.DATA.ESTADO[1].toUpperCase());
                $("#PKgenEstado").val(data.DATA.PK_ESTADO[1]);
                $("#genPais").val(data.DATA.PAIS[1].toUpperCase());
                $("#PKgenPais").val(data.DATA.PK_PAIS[1]);
                for(i=0; i < data.ROWCOUNT; i++){
                    $("#genColonia").append($('<option></option>',{value:data.DATA.PK_COLONIA[i]}).text(data.DATA.COLONIA[i].toUpperCase()));
                }
            }else{
            }
        });
    }else if(tam == 0){
        $("#genColonia").empty();
        $("#genDelomncp").val("");
        $("#genEstado").val("");
        $("#genPais").val("");
    }else{
        $("#genColonia").empty();
        $("#genColonia").append(' <option value="0">Seleccione Colonia</option>');
        $("#genDelomncp").val("");
        $("#PKgenDelomncp").val("");
        $("#genEstado").val("");
        $("#PKgenEstado").val("");
        $("#genPais").val("");
        $("#PKgenPais").val("");
    }
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene los paises del catalogo para modificar dinamicamente la seleccion de estados
 */
function obtenerPaisesNac(elemento) {

    $.post('obtenerPaises', {
    },
    function(data){
        $("#"+elemento).prop("disabled",false);
        for(i=0; i < data.ROWCOUNT; i++){
            $("#"+elemento).append($('<option></option>',{value:data.DATA.PK_PAIS[i]}).text(data.DATA.PAIS[i].toUpperCase()));
        }
    });
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que obtiene los estados del catalogo
 */
function obtenerEstadosNac(pkPais, elemento) {
    $("#PK"+elemento).val(pkPais);
    if(pkPais == 157){
        $("#divSelEstadoNac").removeClass("hide");
        $("#divInpEstadoNac").addClass("hide");
        $("#genEstadoNac").attr("disabled", "false");
        $.post('obtenerEstados', {
        },
        function(data){
            $("#genEstadoNac").html(' <option value="0">Seleccione Estado</option>');
            $("#genEstadoNac").prop("disabled",false);
            for(i=0; i < data.ROWCOUNT; i++){
                $("#genEstadoNac").append($('<option></option>',{value:data.DATA.PK_ESTADO[i]}).text(data.DATA.ESTADO[i].toUpperCase()));
            }
        });
    }else{
        $("#divSelEstadoNac").addClass("hide");
        $("#divInpEstadoNac").removeClass("hide");
    }
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene los paises del catalogo para modificar dinamicamente la seleccion de estados
 */
function obtenerPaises(pkPais) {

    $.post('obtenerPaises', {
        pkPais: pkPais,
    },
    function(data){
        $("#genPaisNac").prop("disabled",false);
        $("#acadPais").prop("disabled",false);
        for(i=0; i < data.ROWCOUNT; i++){
            $("#genPaisNac").append($('<option></option>',{value:data.DATA.PK_PAIS[i]}).text(data.DATA.PAIS[i].toUpperCase()));
            $("#acadPais").append($('<option></option>',{value:data.DATA.PK_PAIS[i]}).text(data.DATA.PAIS[i].toUpperCase()));
            $("#labDocentePais").append($('<option></option>',{value:data.DATA.PK_PAIS[i]}).text(data.DATA.PAIS[i].toUpperCase()));
        }
    });
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que gurda los datos generales
 */
function guardarDatosGenerales() {
    //alert($("#PKgenEstadoNac").val());
    //alert($("#PKgenPaisNac").val());
    //alert($("#genFechaNac").val());
        $.post('guardarDatosGenerales', {
            numReg : 10000,
            estatus : 1,
            Ur : "O2K000",
            nombre : $("#genNombre").val(),
            apellidoPat : $("#genPaterno").val(),
            apellidoMat : $("#genMaterno").val(),
            rfc :  $("#genRFC").val(),
            curp : $("#genCURP").val(),
            sexo : $("#genPKSexo").val(),
            fechaNac : $("#genFechaNac").val(),
            estadoNac: $("#PKgenEstadoNac").val(),
            paisNac : $("#PKgenPaisNac").val(),
            estadoCivil: $("#genEstadoCivil").val(),
            calle : $("#genCalle").val(),
            numExt : $("#genNumExt").val(),
            colonia : $("#PKgenColonia").val(),
            delomncp : $("#PKgenDelomncp").val(),
            cp: $("#genCP").val(),
            estado: $("#PKgenEstado").val(),
            pais : $("#PKgenPais").val(),
            telefono : $("#genTelefono").val(),
			telefono_oficina : $("#genTelOficina").val(),
            telefono_movil : $("#genMovil").val(),
            extension : $("#genExtension").val(),
            correo_Inst : $("#genCorreoInst").val(),
            correo_Alt : $("#genCorreoAlt").val(),

            beforeSend: function() {
                alert("before send");
            },
        },

        function(data){

        });
}

/*-------------------------------------------------------------------------------TERMINA FUNCIONES DATOS GENERALES----------------------------------------------------------------------*/
/*-------------------------------------------------------------------------FUNCIONES NIVEL ACADEMICO Y LABOR DOCENTE--------------------------------------------------------------------*/
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene los niveles educativos �nicamente para el registro de un programa de posgrado
 */
function obtenerNivelesReg() {
    //alert("funciona");
    $.post('obtenerNiveles', {
    },
    function(data){
        for(i=0; i < data.ROWCOUNT; i++){
            if(data.DATA.ID[i] == 13 || data.DATA.ID[i] == 10 || data.DATA.ID[i] == 12 ){
                $("#nivelAcad").append($('<option></option>',{value:data.DATA.ID[i]}).text(data.DATA.DES[i].toUpperCase()));
            }
        }
    });
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene los niveles educativos existentes
 */
function obtenerNiveles() {
    //alert("funciona");
    $.post('obtenerNiveles', {
    },
    function(data){
        for(i=0; i < data.ROWCOUNT; i++){
            $("#acadNivel").append($('<option></option>',{value:data.DATA.ID[i]}).text(data.DATA.DES[i].toUpperCase()));
        }
    });
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que mantiene el nivel electo
 */
function nivelElecto(valor){
    $("#acadNivelText").val(valor);
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que obtiene las instituciones de acuerdo al tipo y pais solicitado
 */
function obtenerInstitucionesAcad() {
    $("#acadInstitucion").empty();
    $("#acadInstitucion").append($('<option></option>',{value:0}).text("Seleccione instituci\u00f3n"));

    if($('input:radio[name=acadTipo]:checked').val() == undefined){
        $("#acadTipo").focus();
    }else if($("#acadPais").val() == -1){
        $("#acadPais").focus();
    }
    else{
        if($('input:radio[name=acadTipo]:checked').val() == 1){
            $("#acadTipoText").val("PUBLICA");
        }else{
            $("#acadTipoText").val("PRIVADA");
        }
        $.post('obtenerInstituciones', {
            tipoInst : $('input:radio[name=acadTipo]:checked').val(),
            pais : $("#acadPais").val(),
        },
        function(data){
            $("#acadInstitucion").prop("disabled",false);
            for(i=0; i < data.ROWCOUNT; i++){
                $("#acadInstitucion").append($('<option></option>',{value:data.DATA.INST_ID[i]}).text(data.DATA.INST_NOMBRE[i]));
            }
        });
    }
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que obtiene las instituciones de acuerdo al tipo y pais solicitado
 */
function obtenerInstituciones() {
    $("#labDocenteInstitucion").empty();
    $("#labDocenteInstitucion").append($('<option></option>',{value:0}).text("Seleccione instituci\u00f3n"));
    if($('input:radio[name=labDocenteTipo]:checked').val() == undefined ){
        $("#labDocenteTipo").focus();
    }else if($("#labDocentePais").val() == -1){
        $("#labDocentePais").focus();
    }
    else{
        $.post('obtenerInstituciones', {
            tipoInst : $('input:radio[name=labDocenteTipo]:checked').val(),
            pais : $("#labDocentePais").val(),
        },
        function(data){
            $("#labDocenteInstitucion").prop("disabled",false);
            for(i=0; i < data.ROWCOUNT; i++){
                $("#labDocenteInstitucion").append($('<option></option>',{value:data.DATA.INST_ID[i]}).text(data.DATA.INST_NOMBRE[i]));
            }
        });
    }

}
/*
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que obtiene las dependencias de la institucion deseada
 */
function obtenerDependencias(pkInstitucion) {
    alert(pkInstitucion);
    $("#acadDependencia").empty();
    $("#labDocenteDependencia").empty();
    $("#acadDependencia").append($('<option></option>',{value:0}).text("Seleccione Dependencia"));
    $("#labDocenteDependencia").append($('<option></option>',{value:0}).text("Seleccione Dependencia"));
    $.post('obtenerDependencias', {
        pkInstitucion : pkInstitucion,
    },
    function(data){
        $("#acadDependencia").prop("disabled",false);
        $("#labDocenteDependencia").prop("disabled",false);
        for(i=0; i < data.ROWCOUNT; i++){
            $("#acadDependencia").append($('<option></option>',{value:data.DATA.CDE_PK_DEPENDENCIA[i]}).text(data.DATA.CDE_DESCRIPCION[i]));
            $("#labDocenteDependencia").append($('<option></option>',{value:data.DATA.CDE_PK_DEPENDENCIA[i]}).text(data.DATA.CDE_DESCRIPCION[i]));
        }
    });
}

/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que obtiene las dependencias de la institucion deseada
 */
function obtenerCarreras(pkDependencia) {
    alert("Dependencia:"+pkDependencia);
    var pkNivel = $("#acadNivel").val();
    alert("Nivel"+pkNivel);
    $("#acadCarrera").empty();
    $("#acadCarrera").append($('<option></option>',{value:0}).text("Seleccione una carrera"));
    $.post('obtenerCarreras', {
        pkDependencia : pkDependencia,
        pkNivel : pkNivel,
    },
    function(data){
        $("#acadCarrera").prop("disabled",false);
    });
}

/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que habilita el bot�n para el registro acad�mico
 */
function habilitaReg() {
    if($("#nivelAcad").val() == -1){
        alert("Debes de seleccionar un nivel");
        $("#nivelAcad").focus();
    }
    $("#btnAcadReg").prop("disabled", false);
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que gurda los datos generales
 */
function guardarDatosAcademicos(alumno, aspirante) {
    if(validarDatosAcademicos()){
        alert("se puede guardar");
        $.post('guardarDatosAcademicos', {
            alumno: alumno,
            aspirante : aspirante,
            nivel : $("#acadNivel").val(),
            tipo : $("#acadTipo").val(),
            pais : $("#acadPais").val(),
            institucion : $("#acadInstitucion").val(),
            dependencia : $("#acadDependencia").val(),
            carrera : $("#acadCarrera").val(),
            fechaInicio : $("#acadFechaInicio").val(),
            fechaFin : $("#acadFechaFin").val(),
            titulo : $("#acadTitulo").val(),
            cedula : $("#acadCedula").val(),
            fechaTitulo : $("#acadFechaTitulo").val(),

        },

        function(data){

        })
        .done(function() {
            if($("#acadNivel").val() == 9 && $("#nivelAcad").val() == 12){
                alert("Licenciatura y Maestria");
                $("#btnNext").prop('disabled', false);
            }else if($("#acadNivel").val() == 9 && $("#nivelAcad").val() == 10){
                alert("Licenciatura y Especialidad");
                $("#btnNext").prop('disabled', false);
            }
            else if($("#acadNivel").val() == 12 && $("#nivelAcad").val() == 13){
                alert("Maestria y Doctorado");
                $("#btnNext").prop('disabled', false);
            }
            obtenerInfoAcademica(alumno, aspirante);
            limpiarAcademicos();
        });
    }else{
        alert("no se puede guardadr");
    }
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que limpia el formulario para el registro de informaci�n acad�mica
 */
function limpiarAcademicos(){
    alert("entro");
    $("#acadNivel").val("");
    $("#acadTipo").val("");
    $("#acadPais").val("");
    $("#acadInstitucion").val("");
    $("#acadDependencia").val("");
    $("#acadCarrera").val("");
    $("#acadFechaInicio").val("");
    $("#acadFechaFin").val("");
    $("#acadTitulo").val("");
    $("#acadCedula").val("");
    $("#acadFechaTitulo").val("");
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que valida si el registro de la infromacion academica es correcta
 */
function validarDatosAcademicos() {
    alert("validacion");
    if($("#acadFechaInicio").val().length == 0 ){
        $("#acadFechaInicio").focus();
        return false;
    }else if($("#acadFechaFin").val().length == 0 ){
        $("#acadFechaFin").focus();
        return false;
    }else if($("#acadFechaTitulo").val().length == 0 ){
        $("#acadFechaTitulo").focus();
        return false;
    }else {
        alert("Todo Bien");
        return true;
    }
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene infromacion academica
 */
 function obtenerInfoAcademica(alumno, aspirante){
     $.post('obtenerInfoAcademica', {
         alumno: alumno,
         aspirante : aspirante,
     },
     function(data){
         dataFinal = [];
         for(i=0; i < data.ROWCOUNT; i++){
            dataFinal [i] = datatest = {
                "nivel":        data.DATA.NIVEL[i],
                "tipo":         data.DATA.TIPO_INST[i],
                "pais":         data.DATA.PAIS[i],
                "institucion":  data.DATA.INSTITUCION[i],
                "dependencia":  data.DATA.DEPENDENCIA[i],
                "carrera":      data.DATA.CARRERA[i],
                "fechaInicio":  data.DATA.FECHA_INI[i],
                "fechaFin":     data.DATA.FECHA_FIN[i],
                "titulo":       data.DATA.TITULO[i],
                "cedula":       data.DATA.CEDULA_PROF[i],
                "fechaTitulo":  data.DATA.FECHA_TITULO[i],
                 "acciones":     "<div class='row'><div class='col-sm-4'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>"
            };
        }
        $('#tbInfoAcademica').bootstrapTable({
    	});
        $('#tbInfoAcademica').bootstrapTable('load', dataFinal);
     })
 }
 /**
  * Aldo Pe�a Alba
  * Fecha: Octubre de 2015
  * Funcion que gurda los datos del labor como docente
  */
 function guardarDatosDocente(alumno, aspirante) {
     alert("Funciona");
     if(validarDatosDocente()){
         alert("se puede guardar");
         //alert($("#acadNivel").val());
         $.post('guardarDatosDocente', {
             alumno: alumno,
             aspirante : aspirante,
             institucion : $("#labDocenteInstitucion").val(),
             dependencia: $("#labDocenteDependencia").val(),
             materia : $("#labDocenteMateria").val(),
             fechaInicio : $("#labDocenteFechaInicio").val(),
             fechaTermino: $("#labDocenteFechaTermino").val(),
         },
         function(data){
         })
         .done(function() {
             obtenerInfoDocente(alumno, aspirante);
             limpiarDocente();
         });
     }else{
         alert("no se puede guardar");
     }
 }
 // --------------------------------------------------------------DOCENTE ------------------------------------------------------------------------------------------*/
 /**
  * Aldo Pe�a Alba
  * Fecha: Octubre de 2015
  * Funcion que limpia el formulario para el registro de informaci�n acad�mica
  */
 function limpiarDocente(){
     alert("entro");
     $("#labDocenteInstitucion").val("");
     $("#labDocenteDependencia").val("");
     $("#labDocenteMateria").val("");
     $("#labDocenteFechaInicio").val("");
     $("#labDocenteFechaTermino").val("");
 }
 /**
  * Aldo Pe�a Alba
  * Fecha: Octubre de 2015
  * Funcion que valida si el registro de la infromacion academica es correcta
  */
 function validarDatosDocente() {
     alert("validacion");
     if($("#labDocenteInstitucion").val().length == 0 ){
         $("#labDocenteInstitucion").focus();
         return false;
     }else if($("#labDocenteDependencia").val().length == 0 ){
         $("#labDocenteDependencia").focus();
         return false;
     }else if($("#labDocenteMateria").val().length == 0 ){
         $("#labDocenteMateria").focus();
         return false;
     }else if($("#labDocenteFechaInicio").val().length == 0 ){
         $("#labDocenteFechaInicio").focus();
         return false;
     }else if($("#labDocenteFechaTermino").val().length == 0 ){
         $("#labDocenteFechaTermino").focus();
         return false;
     }else {
         alert("Todo Bien");
         return true;
     }
 }
 /**
  * Aldo Pe�a Alba
  * Fecha: Octubre de 2015
  * Funcion obtiene infromacion de experiencia profesional
  */
  function obtenerInfoDocente(alumno, aspirante){
      $.post('obtenerInfoDocente', {
          alumno: alumno,
          aspirante : aspirante,
      },
      function(data){
         dataFinal = [];
          for(i=0; i < data.ROWCOUNT; i++){
             dataFinal [i] = datatest = {
                 "institucion":   data.DATA.INSTITUCION[i],
                 "dependencia":   data.DATA.DEPENDENCIA[i],
                 "asignatura":    data.DATA.ASIGNATURA[i],
                 "fechaInicio":   data.DATA.FECHA_INI[i],
                 "fechaFin":      data.DATA.FECHA_FIN[i],
                  "acciones":     "<div class='row'><div class='col-sm-4'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>"
             };
         }
         $('#tbInfoDocente').bootstrapTable({
        });
         $('#tbInfoDocente').bootstrapTable('load', dataFinal);
      })
  }
/*-------------------------------------------------------------------TERMINA FUNCIONES NIVEL ACADEMICO Y LABOR DOCENTE------------------------------------------------------------------*/

/*--------------------------------------------------------------------------FUNCIONES EXPERIENCIA PROFESIONAL---------------------------------------------------------------------------*/
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que gurda los datos de experiencia profesional
 */
function guardarDatosProfesionales(alumno, aspirante) {
    if(validarDatosProfesionales()){
        alert("se puede guardar");
        $.post('guardarDatosProfesionales', {
            alumno: alumno,
            aspirante : aspirante,
            institucion: $("#expProfInstitucion").val(),
            tipoInstitucion : $("#expProfTipoInstitucion").val(),
            puesto: $("#expProfPuesto").val(),
            fechaInicio : $("#expProfFechaInicio").val(),
            fechaTermino : $("#expProfFechaTermino").val(),
            actividades: $("#expProfActividades").val(),
        },
        function(data){

        })
        .done(function() {
            obtenerInfoProfesional(alumno, aspirante);
            limpiarProfesional();
        });
    }else{
        alert("no se puede guardar");
    }

}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que limpia el formulario para el registro de informaci�n profesional
 */
function limpiarProfesional(){
    alert("entro");
    $("#expProfInstitucion").val("");
    $("#expProfTipoInstitucion").val("");
    $("#expProfPuesto").val("");
    $("#expProfFechaInicio").val("");
    $("#expProfFechaTermino").val("");
    $("#expProfActividades").val("");
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que valida si el registro de la infromacion academica es correcta
 */
function validarDatosProfesionales() {
    alert("validacion");
    //alert($("#acadFechaInicio").val().length);
    if($("#expProfInstitucion").val().length == 0 ){
        $("#expProfInstitucion").focus();
        return false;
    }else if($("#expProfTipoInstitucion").val().length == 0 ){
        $("#expProfTipoInstitucion").focus();
        return false;
    }else if($("#expProfPuesto").val().length == 0 ){
        $("#expProfPuesto").focus();
        return false;
    }else if($("#expProfFechaInicio").val().length == 0 ){
        $("#expProfFechaInicio").focus();
        return false;
    }else if($("#expProfFechaTermino").val().length == 0 ){
        $("#expProfFechaTermino").focus();
        return false;
    }else if($("#expProfActividades").val().length == 0 ){
        $("#expProfActividades").focus();
        return false;
    }else {
        alert("Todo Bien");
        return true;
    }
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene infromacion de experiencia profesional
 */
 function obtenerInfoProfesional(alumno, aspirante){
     $.post('obtenerInfoProfesional', {
         alumno: alumno,
         aspirante : aspirante,
     },
     function(data){
        dataFinal = [];
         for(i=0; i < data.ROWCOUNT; i++){
            dataFinal [i] = datatest = {
                "institucion":   data.DATA.INSTITUCION[i],
                "tipo":          data.DATA.TIPO_INST[i],
                "puesto":        data.DATA.PUESTO[i],
                "actividades":   data.DATA.ACTIVIDADES[i],
                "fechaInicio":   data.DATA.FECHA_INI[i],
                "fechaFin":      data.DATA.FECHA_FIN[i],
                 "acciones":     "<div class='row'><div class='col-sm-4'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>"
            };
        }
        $('#tbInfoProfesional').bootstrapTable({
     });
        $('#tbInfoProfesional').bootstrapTable('load', dataFinal);
     })
 }

/*-------------------------------------------------------------------------TERMINA FUNCIONES EXPERIENCIA PROFESIONAL--------------------------------------------------------------------*/
/*--------------------------------------------------------------------------FUNCIONES TRABAJOS DE INVESTIGACION-------------------------------------------------------------------------*/
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene tipos de participacion para un trabajo de investigaci�n
 */
function obtenerTipoParticipacion() {
    $.post('obtenerTipoParticipacion', {
    },
    function(data){
        for(i=0; i < data.ROWCOUNT; i++){
            $("#trabInvesTipoPart").append($('<option></option>',{value:data.DATA.PK[i]}).text(data.DATA.NOMBRE[i].toUpperCase()));
        }
    });
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene tipos de proyecto para un trabajo de investigaci�n
 */
function obtenerTipoProyecto() {
    //alert("funciona");
    $.post('obtenerTipoProyecto', {
    },
    function(data){
        for(i=0; i < data.ROWCOUNT; i++){
            $("#trabInvesTipoProy").append($('<option></option>',{value:data.DATA.PK[i]}).text(data.DATA.NOMBRE[i].toUpperCase()));
        }
    });
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que gurda los datos de los proyectos de investigacion
 */
function guardarDatosInvestigacion(alumno, aspirante) {
    alert("Funciona");
    if(validarDatosInvestigacion()){
        alert("se puede guardar");
        $.post('guardarDatosInvestigacion', {
            alumno: alumno,
            aspirante : aspirante,
            tipo_proy : $("#trabInvesTipoProy").val(),
            tipo_part: $("#trabInvesTipoPart").val(),
            nombre_profesor : $("#trabInvesProfesor").val(),
            fechaInicio : $("#trabInvesFechaInicio").val(),
            fechaTermino: $("#trabInvesFechaTermino").val(),
            clave_proy: $("#trabInvesClave").val(),
        },
        function(data){
        })
        .done(function() {
            obtenerInfoInvestigacion(alumno, aspirante);
        });
    }else{
        alert("no se puede guardar");
    }
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funcion que valida si el registro de la infromacion de los proyectos de investigacion
 */
function validarDatosInvestigacion() {
    alert("validacion");
    if($("#trabInvesTipoProy").val().length == 0 ){
        $("#trabInvesTipoProy").focus();
        return false;
    }else if($("#trabInvesTipoPart").val().length == 0 ){
        $("#trabInvesTipoPart").focus();
        return false;
    }else if($("#trabInvesProfesor").val().length == 0 ){
        $("#trabInvesProfesor").focus();
        return false;
    }else if($("#trabInvesFechaInicio").val().length == 0 ){
        $("#trabInvesFechaInicio").focus();
        return false;
    }else if($("#trabInvesFechaTermino").val().length == 0 ){
        $("#trabInvesFechaTermino").focus();
        return false;
    }else if($("#trabInvesClave").val().length == 0 ){
        $("#trabInvesClave").focus();
        return false;
    }else {
        alert("Todo Bien");
        return true;
    }
}
/**
 * Aldo Pe?a Alba
 * Fecha: Octubre de 2015
 * Funcion obtiene infromacion de experiencia profesional
 */
 function obtenerInfoInvestigacion(alumno, aspirante){
     $.post('obtenerInfoInvestigacion', {
         alumno: alumno,
         aspirante : aspirante,
     },
     function(data){
        dataFinal = [];
         for(i=0; i < data.ROWCOUNT; i++){
            dataFinal [i] = datatest = {
                "clave":               data.DATA.CLAVE_PROYECTO[i],
                "profesor":            data.DATA.PROFESOR[i],
                "tipoParticipacion":   data.DATA.TIPO_PARTICIPACION[i],
                "tipoProyecto":        data.DATA.TIPO_PROYECTO[i],
                "fechaIni":            data.DATA.FECHA_INI[i],
                "fechaFin":            data.DATA.FECHA_FIN[i],
                "acciones":     "<div class='row'><div class='col-sm-4'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>"
            };
        }
        $('#tbInfoInvestigacion').bootstrapTable({
       });
        $('#tbInfoInvestigacion').bootstrapTable('load', dataFinal);
     })
 }
 /**
  * Aldo Pe�a Alba
  * Fecha: Octubre de 2015
  * Funcion que se encarga de ejecutar la busqueda al oprimir la tecla enter
  */
  function buscar() {
      dataFinal = [];
      if($("#busqProyInvAnio").val().length == 0 &&  $("#busqProyInvTitulo").val().length == 0){
          alert("Ingrese al menos un campo para realizar la busqueda");
      }else{
          $.post('obtenerProyectosInv', {
              anio : $("#busqProyInvAnio").val(),
              titulo: $("#busqProyInvTitulo").val(),
          },
          function(data){
              for(i=0; i < data.ROWCOUNT; i++){
                 dataFinal [i] = datatest = {
                      "clave":        data.DATA.CLAVE[i],
                      "titulo":       data.DATA.NOMBRE[i],
                      "anio":         data.DATA.ANIO_PUBLICACION[i],
                      "acciones":     '<div class="row"><div class="col-sm-2"><button class="btn btn-xs glyphicon glyphicon-ok-circle" onclick="javascript:seleccionarTrabajo(\''+data.DATA.CLAVE[i]+'\');"></button></div></div>'
                 };
              }
              $(function () {
                  $('#tbBusquedaProyectosInv').bootstrapTable({

                  });
                  $('#tbBusquedaProyectosInv').bootstrapTable('load', dataFinal);
              });
          });
      }
  }
  /**
    * Aldo Pe�a Alba
    * Fecha: Octubre de 2015
    * Funciones que obtiene los datos del trabajo de investigaci�n seleccionado
    */
   function seleccionarTrabajo(valor){
       $("#trabInvesAnt").addClass("hide");
       $("#trabInvesSig").removeClass("hide");
      alert(valor);
      $("#trabInvesClave").val(valor);
   }
   /**
    * Aldo Pe�a Alba
    * Fecha: Octubre de 2015
    * Funciones qreinicia los trabajo de investigaci�n
    */
   function  reiniciarTrabajos(){
       $("#trabInvesAnt").removeClass("hide");
       $("#trabInvesSig").addClass("hide");

   }

/*-------------------------------------------------------------------------TERMINA FUNCIONES TRABAJOS DE INVESTIGACION------------------------------------------------------------------*/
/*-------------------------------------------------------------------------FUNCIONES PROGRAMA ACADEMICO---------------------------------------------------------------------------------*/
/**
 * Olguin Gallegos Claudia
 * Fecha: Noviembre 12, 2015
 * Funcion que obtiene todas las areas de conocimiento
 */
function obtenerAreaConocimiento() {
    $.post('getAreaConocimiento', {
    },
    function(data){
        for(i=0; i < data.ROWCOUNT; i++){
			$("#areaConocimiento").append($('<option></option>',{value:data.DATA.AREA_CONOCIMIENTO[i]}).text(data.DATA.DESCRIPCION[i]));
        }
    });
}
/**
 * Olguin Gallegos Claudia
 * Fecha: Noviembre 12, 2015
 * Funcion que obtiene todos los programas academicos
 */
function getProgramaAcademico() {
        $("#programaAcademico").empty();
		$.post('getProgramaAcademico',{
			areaConocimiento : $("#areaConocimiento").val()

        },
        function(data){
            $("#programaAcademico").prop("disabled",false);
            if(data.ROWCOUNT == 0){
				$("#programaAcademico").append($('<option></option>',{value:0}).text("Sin programa academico "));
			}else{
			$("#programaAcademico").append($('<option></option>',{value:0}).text("Seleccione un programa"));
				for(i=0; i < data.ROWCOUNT; i++){
                $("#programaAcademico").append($('<option></option>',{value:data.DATA.PROGRAMA_ACADEMICO[i]}).text(data.DATA.DESCRIPCION[i]));
            }
			}
        });
}
/*-------------------------------------------------------------------------TERMINA PROGRAMA ACADEMICO-----------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------FUNCIONES CARGA ACADEMICA-------------------------------------------------------------------------------------*/
/**
* Olguin Gallegos Claudia
* Fecha: Noviembre 12, 2015
* Funcion que obtiene la carga academica de un programa academico
*/
function mostrarCargaAcademica(programaAcademico){
    var dataCarga = [];
    var dataCursadas = [];
    var tCursadas = 0, tConsulta=0;
    var nombreProfesor
	if($('#programaAcademico').val() == 0){
		alert('Por favor elija un programa academico');
	}else{
		$.post('getCargaAcademica', {
			programaAcademico : $("#programaAcademico").val(),
		},
		function(data){
            alert(JSON.stringify(data.DATA));
            for(i=0; i<data.ROWCOUNT; i++){
                if(data.DATA.SEMESTRE_CURSADO[i] == 0){
                    if(data.DATA.NOMBRE_PROFESOR[i]==0){
                        nombreProfesor = 'Profesor no asignado'
                    }else{
                        nombreProfesor = data.DATA.NOMBRE_PROFESOR[i]+ " " +data.DATA.APATERNO[i]+ " "  +data.DATA.AMATERNO[i]
                    }
                    dataCarga[tConsulta] = dataDicc = {
                        "id":           tConsulta +1,
                        "asignatura":   data.DATA.PK_ASIGNATURA[i],
                        "asignacion":   data.DATA.SA[i],
                        "clave":        data.DATA.CLAVE[i],
                        "materia":      data.DATA.NOMBRE[i],
                        "semestre":	    data.DATA.SEMESTRE[i],
                        "profesor":	    nombreProfesor,
                        "creditos":     data.DATA.CREDITOS[i],
                        "horas":    	data.DATA.HORAS_SEMESTRE[i],
                    }
                    tConsulta = tConsulta + 1;
                }else{
                    if(data.DATA.NOMBRE_PROFESOR[i]==0){
                        nombreProfesor = 'Profesor no asignado'
                    }else{
                        nombreProfesor = data.DATA.NOMBRE_PROFESOR[i]+ " " +data.DATA.APATERNO[i]+ " "  +data.DATA.AMATERNO[i]
                    }
                    dataCursadas[tCursadas] = dataDicc = {
                        "id":           tCursadas +1,
                        "asignatura":   data.DATA.PK_ASIGNATURA[i],
                        "asignacion":   data.DATA.SA[i],
                        "clave":        data.DATA.CLAVE[i],
                        "materia":      data.DATA.NOMBRE[i],
                        "semestre":	    data.DATA.SEMESTRE[i],
                        "profesor":	    nombreProfesor,
                        "creditos":     data.DATA.CREDITOS[i],
                        "horas":    	data.DATA.HORAS_SEMESTRE[i],
                    }
                    tCursadas = tCursadas + 1;
                }
            }
            $(function () {
                $('#tablaConsultarCursadas').bootstrapTable({

                });
                $('#tablaConsultarCursadas').bootstrapTable('load', dataCursadas);
            });
            $(function () {
                $('#tablaConsultar').bootstrapTable({

                });
                $('#tablaConsultar').bootstrapTable('load', dataCarga);
            });
        });

    }
}
/*
* Olguin Gallegos Claudia
* Fecha: Diciembre 03, 2015
* Funcion que guarda toda la carga academica
*/
function saveCargaAcademica(){
  datos = $("#tablaConsultar").bootstrapTable("getAllSelections");
  tam = datos.length;
  pkAsignatura = "";
  pkSemestre = "";
  pkAsignacion = "";

  for(i=0; i<tam; i++){
    if(i==0){
      pkAsignatura = datos[i].asignatura;
      pkSemestre = datos[i].semestre;
      pkAsignacion = datos[i].asignacion;
    }else{
      pkAsignatura = pkAsignatura + ";"+ datos[i].asignatura;
      pkSemestre = pkSemestre+ ";" + datos[i].semestre;
      pkAsignacion = pkAsignacion+ ";" + datos[i].asignacion;
    }
  }
 $.post('saveCargaAcademica',{
    pkAsignatura: pkAsignatura,
    pkSemestre: pkSemestre,
    area_conocimiento: $("#areaConocimiento").val(),
    programa_academico: $("#programaAcademico").val(),
    asignacionProfesor: pkAsignacion,

  },
  function(data){
  });
}


/**
* Olguin Gallegos Claudia
* Fecha: Noviembre 18, 2015
* Funcion que muestra todos los datos de la tabla programa academico
*/

function getTablaPrograma(){
	dataTabla = [];
	if($('#areaConocimiento').val() == 0){
		alert('Por favor elija un area de conocimiento');
	}else{
		$.post('getTablaPrograma', {
			areaConocimiento : $("#areaConocimiento").val(),
			programaAcademico : $("#programaAcademico").val(),
		},
		function(data){
			for(i=0; i<data.ROWCOUNT; i++){
				dataTabla[i] = dataTablaPA = {
					"clave":       	data.DATA.CLAVE[i],
					"materia":		data.DATA.ASIGNATURA[i],
					"creditos":		data.DATA.CREDITOS[i],
				};
			}
			$(function () {
                 $('#tablaPrograma').bootstrapTable({

                 });
                 $('#tablaPrograma').bootstrapTable('load', dataTabla);
             });
		});
	}
}
/**
 * Olguin Gallegos Claudia
 * Fecha: Noviembre 12, 2015
 * Funcion que obtiene todas las areas de conocimiento
 */
function getDirectorTesis() {
	var directoresT = "";
    $.post('getDirectorTesis', {
    },
    function(data){
        for(i=0; i < data.ROWCOUNT; i++){
			var directoresT = data.DATA.GRADO[i]+ " " +data.DATA.NOMBRE[i]+ " " + data.DATA.APATERNO[i] + " " + data.DATA.AMATERNO[i];
			$("#directorTesis").append($('<option></option>',{value:data.DATA.PK_PROFESOR[i]}).text(directoresT));
        }
    });
}
/*-------------------------------------------------------------------------TERMINA FUNCIONES CARGA ACADEMICA-----------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------FUNCIONES INICIALES-------------------------------------------------------------------------------------------*/
function cerrar() {
       $('.navbar-collapse').collapse('hide');
}
/**
 * Aldo Pe�a Alba
 * Fecha: Octubre de 2015
 * Funciones que se necesitan cargar al inicio
 */

$(document).ready(function() {
	getDirectorTesis();
	//getProgramaIndividual();
	obtenerAreaConocimiento();
    obtenerNiveles();
    obtenerPaises(0);
    obtenerNivelesReg();
    obtenerInstituciones(0);
    obtenerTipoParticipacion();
    obtenerTipoProyecto();
    //ajustarVentana();
    cerrar();
/* Tabla de Informaci�n Acad�mica --------------------------------------------------------------------------------------------*/
        var dataAcedemica = [
            <cfif isDefined('prc.infoAcademica.RECORDCOUNT')>
    	        <cfloop index="i" from="1" to="#prc.infoAcademica.RECORDCOUNT#">
                <cfset botonesAcciones= "<div class='row'><div class='col-sm-3'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>">
                      <cfoutput>
            		        {
            				"nivel":        "#prc.infoAcademica.NIVEL[i]#",
            				"tipo":         "#prc.infoAcademica.TIPO_INST[i]#",
            				"pais":         "#prc.infoAcademica.PAIS[i]#",
            				"institucion":  "#prc.infoAcademica.INSTITUCION[i]#",
            				"dependencia":  "#prc.infoAcademica.DEPENDENCIA[i]#",
                            "carrera":      "#prc.infoAcademica.CARRERA[i]#",
            				"fechaInicio":  "#prc.infoAcademica.FECHA_INI[i]#",
                            "fechaFin":     "#prc.infoAcademica.FECHA_FIN[i]#",
                            "titulo":       "#prc.infoAcademica.TITULO[i]#",
                            "cedula":       "#prc.infoAcademica.CEDULA_PROF[i]#",
                            "fechaTitulo":  "#prc.infoAcademica.FECHA_TITULO[i]#",
                            "acciones":     "#botonesAcciones#"
            				},
            			</cfoutput>
    		    </cfloop>
	        </cfif>
        ];
        var dataProfesional = [
            <cfif isDefined('prc.infoProfesional.RECORDCOUNT')>
    	        <cfloop index="i" from="1" to="#prc.infoProfesional.RECORDCOUNT#">
                <cfset botonesAcciones=  "<div class='row'><div class='col-sm-1'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>">
                      <cfoutput>
            		        {
            				"institucion":    "#prc.infoProfesional.INSTITUCION[i]#",
            				"tipo":           "#prc.infoProfesional.TIPO_INST[i]#",
                            "puesto":         "#prc.infoProfesional.PUESTO[i]#",
                            "actividades":    "#prc.infoProfesional.ACTIVIDADES[i]#",
            				"fechaInicio":    "#prc.infoProfesional.FECHA_INI[i]#",
                            "fechaFin":       "#prc.infoProfesional.FECHA_FIN[i]#",
                            "acciones":       "#botonesAcciones#"
            				},
            			</cfoutput>
    		    </cfloop>
	        </cfif>
        ];
        var dataDocente = [
            <cfif isDefined('prc.infoDocente.RECORDCOUNT')>
    	        <cfloop index="i" from="1" to="#prc.infoDocente.RECORDCOUNT#">
                <cfset botonesAcciones=  "<div class='row'><div class='col-sm-1'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>">
                      <cfoutput>
            		        {
            				"institucion":   "#prc.infoDocente.INSTITUCION[i]#",
            				"dependencia":   "#prc.infoDocente.DEPENDENCIA[i]#",
                            "asignatura":    "#prc.infoDocente.ASIGNATURA[i]#",
            				"fechaInicio":   "#prc.infoDocente.FECHA_INI[i]#",
                            "fechaFin":      "#prc.infoDocente.FECHA_FIN[i]#",
                            "acciones":      "#botonesAcciones#"
            				},
            			</cfoutput>
    		    </cfloop>
	        </cfif>
        ];
        var dataInvestigacion= [
            <cfif isDefined('prc.infoInvestigacion.RECORDCOUNT')>
    	        <cfloop index="i" from="1" to="#prc.infoInvestigacion.RECORDCOUNT#">
                <cfset botonesAcciones=  "<div class='row'><div class='col-sm-1'><button  class='btn btn-xs fa fa-trash-o' ></button></div></div>">
                      <cfoutput>
            		        {
            				"clave":               "#prc.infoInvestigacion.CLAVE_PROYECTO[i]#",
            				"profesor":      "#prc.infoInvestigacion.PROFESOR[i]#",
                            "tipoParticipacion":   "#prc.infoInvestigacion.TIPO_PROYECTO[i]#",
                            "tipoProyecto":        "#prc.infoInvestigacion.TIPO_PARTICIPACION[i]#",
            				"fechaIni":            "#prc.infoInvestigacion.FECHA_INI[i]#",
                            "fechaFin":            "#prc.infoInvestigacion.FECHA_FIN[i]#",
                            "acciones":            "#botonesAcciones#"
            				},
            			</cfoutput>
    		    </cfloop>
	        </cfif>
        ];

$(function () {
    $('#tbInfoAcademica').bootstrapTable({
	       data: dataAcedemica

	});
});
$(function () {
    $('#tbInfoProfesional').bootstrapTable({
	       data: dataProfesional
	});
});
$(function () {
    $('#tbInfoDocente').bootstrapTable({
	       data: dataDocente
	});
});
$(function () {
    $('#tbInfoInvestigacion').bootstrapTable({
	       data: dataInvestigacion
	});
});
/* -----------------------------------------------------------------------------------------------------------------*/
    $('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) {
            if(index==1){
                alert("Pest 1");
                guardarDatosGenerales();
            }
            if(index==2) {
                alert("Pest 2");
            }

            // Set the name for the next tab
            $('#tab3').html('Hello, ' + $('#matricula').val());

        }, onTabShow: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index+1;
            var $percent = ($current/$total) * 100;
            $('#rootwizard').find('.bar').css({width:$percent+'%'});
        }
    });
});

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

$(function () {
$('#grafica3').highcharts({
    chart: {
        type: 'column'
    },
    title: {
        text: 'Cantidad de materias por area de conocimiento'
    },
    xAxis: {
        categories: ['2011', '2012', '2013', '2014', '2015']
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Total de areas de conocimiento'
        },
        stackLabels: {
            enabled: true,
            style: {
                fontWeight: 'bold',
                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
            }
        }
    },
    legend: {
        align: 'right',
        x: -30,
        verticalAlign: 'top',
        y: 25,
        floating: true,
        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
    },
    tooltip: {
        headerFormat: '<b>{point.x}</b><br/>',
        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
    },
    plotOptions: {
        column: {
            stacking: 'normal',
            dataLabels: {
                enabled: true,
                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                style: {
                    textShadow: '0 0 3px black'
                }
            }
        }
    },
    series: [{
        name: 'Interdiciplinario',
        data: [5, 3, 4, 7, 2]
    }, {
        name: 'Ciencias medico biologicas',
        data: [2, 2, 3, 2, 1]
    }, {
        name: 'Administracion',
        data: [3, 4, 4, 2, 5]
    }]
});
});

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
        data: [
            ['DR.', 8],
            ['DRA.', 9],
            ['M en C.', 5],
            ['ESP.', 6],
            ['L', 8],
        ]
    }]
});
});

$(function () {
$('#grafica5').highcharts({
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
$('#grafica6').highcharts({
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

$(function () {
$('#grafica7').highcharts({
    chart: {
        type: 'column'
    },
    title: {
        text: 'Cantidad de materias por area de conocimiento'
    },
    xAxis: {
        categories: ['2011', '2012', '2013', '2014', '2015']
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Total de areas de conocimiento'
        },
        stackLabels: {
            enabled: true,
            style: {
                fontWeight: 'bold',
                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
            }
        }
    },
    legend: {
        align: 'right',
        x: -30,
        verticalAlign: 'top',
        y: 25,
        floating: true,
        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
    },
    tooltip: {
        headerFormat: '<b>{point.x}</b><br/>',
        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
    },
    plotOptions: {
        column: {
            stacking: 'normal',
            dataLabels: {
                enabled: true,
                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                style: {
                    textShadow: '0 0 3px black'
                }
            }
        }
    },
    series: [{
        name: 'Interdiciplinario',
        data: [5, 3, 4, 7, 2]
    }, {
        name: 'Ciencias medico biologicas',
        data: [2, 2, 3, 2, 1]
    }, {
        name: 'Administracion',
        data: [3, 4, 4, 2, 5]
    }]
});
});

$(function () {
    // Create the chart
    $('#grafica8').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Browser market shares. January, 2015 to May, 2015'
        },
        subtitle: {
            text: 'Click the columns to view versions. Source: <a href="http://netmarketshare.com">netmarketshare.com</a>.'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'Total percent market share'
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
                    format: '{point.y:.1f}%'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
        },

        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'Microsoft Internet Explorer',
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
                drilldown: null
            }]
        }],
        drilldown: {
            series: [{
                name: 'Microsoft Internet Explorer',
                id: 'Microsoft Internet Explorer',
                data: [
                    [
                        'v11.0',
                        24.13
                    ],
                    [
                        'v8.0',
                        17.2
                    ],
                    [
                        'v9.0',
                        8.11
                    ],
                    [
                        'v10.0',
                        5.33
                    ],
                    [
                        'v6.0',
                        1.06
                    ],
                    [
                        'v7.0',
                        0.5
                    ]
                ]
            }, {
                name: 'Chrome',
                id: 'Chrome',
                data: [
                    [
                        'v40.0',
                        5
                    ],
                    [
                        'v41.0',
                        4.32
                    ],
                    [
                        'v42.0',
                        3.68
                    ],
                    [
                        'v39.0',
                        2.96
                    ],
                    [
                        'v36.0',
                        2.53
                    ],
                    [
                        'v43.0',
                        1.45
                    ],
                    [
                        'v31.0',
                        1.24
                    ],
                    [
                        'v35.0',
                        0.85
                    ],
                    [
                        'v38.0',
                        0.6
                    ],
                    [
                        'v32.0',
                        0.55
                    ],
                    [
                        'v37.0',
                        0.38
                    ],
                    [
                        'v33.0',
                        0.19
                    ],
                    [
                        'v34.0',
                        0.14
                    ],
                    [
                        'v30.0',
                        0.14
                    ]
                ]
            }, {
                name: 'Firefox',
                id: 'Firefox',
                data: [
                    [
                        'v35',
                        2.76
                    ],
                    [
                        'v36',
                        2.32
                    ],
                    [
                        'v37',
                        2.31
                    ],
                    [
                        'v34',
                        1.27
                    ],
                    [
                        'v38',
                        1.02
                    ],
                    [
                        'v31',
                        0.33
                    ],
                    [
                        'v33',
                        0.22
                    ],
                    [
                        'v32',
                        0.15
                    ]
                ]
            }, {
                name: 'Safari',
                id: 'Safari',
                data: [
                    [
                        'v8.0',
                        2.56
                    ],
                    [
                        'v7.1',
                        0.77
                    ],
                    [
                        'v5.1',
                        0.42
                    ],
                    [
                        'v5.0',
                        0.3
                    ],
                    [
                        'v6.1',
                        0.29
                    ],
                    [
                        'v7.0',
                        0.26
                    ],
                    [
                        'v6.2',
                        0.17
                    ]
                ]
            }, {
                name: 'Opera',
                id: 'Opera',
                data: [
                    [
                        'v12.x',
                        0.34
                    ],
                    [
                        'v28',
                        0.24
                    ],
                    [
                        'v27',
                        0.17
                    ],
                    [
                        'v29',
                        0.16
                    ]
                ]
            }]
        }
    });
});
/*----------------------------------------------------------------------- TERMINAN FUNCIONES INICIALES-----------------------------------------------------------------------------*/
</script>
