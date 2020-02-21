<script>
/*-----------------------------------------------------------------------------------FUNCION PARA VALIDAR--------------------------------------------------------------------------*/
/**
 * Jessica Gomez
 * Fecha: febrero 2020
 * Funcion de incio
 */
 $(document).ready(function() {
   document.getElementById("btnGuardarRegistro").disabled = true;
    $("#C_aspFechaNac").datepicker({ 
     locale: 'es',
     format: 'dd/mm/yyyy'
    });

    //$("#btnNext").prop('disabled', true);
    $('.input-group input, .input-group select').on('keyup change', function() { //, .input-group textarea, .input-group select
        var $form = $(this).closest('form'),
            $group = $(this).closest('.input-group'),
			$addon = $group.find('.input-group-addon'),
			$icon = $addon.find('span'),
			estado = false;

            if (!$group.data('validate')) {
    			estado = $(this).val() ? true : false;
    		}else if ($group.data('validate') == "nombres") {
    			estado = /^[A-z\u00e1;\u00e9;\u00ed;\u00f3;\u00fa;\u00c1;\u00c9;\u00cd;\u00d3;\u00da;\u00f1;\u00d1;/\s/]{1,}$/.test($(this).val());
                this.value = this.value.toUpperCase();
    		}else if ($group.data('validate') == "email_Inst") {
    			estado = /^([A-z.-/!]{1,})+([@]{1})+([ipn]{3})+([.]{1})+([mx]{2})$/.test($(this).val());
                this.value = this.value.toUpperCase();
    		}else if ($group.data('validate') == "email_Alt") {
    			estado = /^([A-z0-9.-/!]{1,})+([@]{1})+([A-z0-9]{1,})+([.]{1})+([A-z]{1,})$/.test($(this).val());
                this.value = this.value.toUpperCase();
    		}else if($group.data('validate') == 'telefonos') {
    			estado = /^([+]{0,1})+([52]{0,2})+([0-9]{2,3})+([0-9]{8})$/.test($(this).val())
    		}else if ($group.data('validate') == "alfanumerico") {
    			estado = /^[A-z0-9/\s/]{1,}$/.test($(this).val());
                this.value = this.value.toUpperCase();
    		}
            else if ($group.data('validate') == "url") {
    			estado = /^([http://www.]{11})+([A-z0-9_-]{2,})+([.]{1})+([A-z]{2,})$/.test($(this).val())
    		}else if ($group.data('validate') == "cod-postal") {
    			estado = /^[0-9]{5}$/.test($(this).val())
    		}else if ($group.data('validate') == "numeros") {
    			estado = /^[0-9]{1,}$/.test($(this).val())
    		}else if ($group.data('validate') == "curp") {
    			estado = /^([A-z]{4})+([0-9]{2})+((([0]{1})+([1-9]{1}))|(([1]{1})+([0-2]{1})))+((([0]{1})+([1-9]{1}))|(([1-2]{1})+([0-9]{1}))|(([3]{1})+([0-1]{1})))+([(H)|(M))]{1})+([A-z]{5})+([A-z0-9]{2})$/.test($(this).val());
                this.value = this.value.toUpperCase();
    		}else if ($group.data('validate') == "rfc") {
    			estado = /^([A-z]{4})+([0-9]{2})+((([0]{1})+([1-9]{1}))|(([1]{1})+([0-2]{1})))+((([0]{1})+([1-9]{1}))|(([1-2]{1})+([0-9]{1}))|(([3]{1})+([0-1]{1})))+([A-z0-9]{3})$/.test($(this).val());
                this.value = this.value.toUpperCase();
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
            document.getElementById("btnGuardarRegistro").disabled = false;
        }else{
            document.getElementById("btnGuardarRegistro").disabled = true;
        }
	});
});

function guardarRegistro(){
    if(validacionGenerales()){
        $.post('Inscripcion/creaCuenta', {
            nombre : $("#aspNombre").val(),
            apellidoPat : $("#aspApaterno").val(),
            apellidoMat : $("#aspAmaterno").val(),
            //sexo : $("#genPKSexo").val(),
            fechaNac : $("#aspFechaNac").val(),
            estadoCivil: $("#aspEdoCivil").val(),
            rfc :  $("#aspRFC").val(),
            curp : $("#aspCURP").val(),
            telefono : $("#aspTelAlt").val(),
            correo : $("#aspCorreoI").val(),
            telefono_oficina : $("#aspTelOfic").val(),
            extension : $("#aspExt").val(),
        },
        function(data){
            if(data > 0){
                alert('Por favor confirme la cuenta en la liga que se envió a su correo electrónico.');
                window.location.href = "http://localhost:8501";
            }else{
                $("#aspRFC").val("");
                $("#aspCURP").val("");
                document.getElementById("btnGuardarRegistro").disabled = true;
                alert('El RFC y CURP que proporciono, ya se encuentran registrados, por favor verifique.');
            }
        })
        .done(function() {
        });
    }else{
        alert("Por favor, capture todos los datos del formulario, los campos marcados con (*) son obligatorios.");
    }
}


function validacionGenerales() {
    if($("#aspNombre").val() == null){
        $("#aspNombre").focus();
        return false;
    }else if($("#aspApaterno").val() == null ){
        $("#aspApaterno").focus();
        return false;
    }else if($("#aspAmaterno").val() == null ){
        $("#aspAmaterno").focus();
        return false;
    }else if($("#aspFechaNac").val() == null){
        $("#aspFechaNac").focus();
        return false;
    }else if($("#aspEdoCivil").val() == 0 ){
        $("#aspEdoCivil").focus();
        return false;
    }else if($("#aspRFC").val() == null ){
        $("#aspRFC").focus();
        return false;
    }else if($("#aspCURP").val() == null ){
        $("#aspCURP").focus();
        return false;
    }else if($("#aspTelAlt").val() == null ){
        $("#aspTelAlt").focus();
        return false;
    }else if($("#aspCorreoI").val() == null ){
        $("#aspCorreoI").focus();
        return false;
    }else if($("#aspTelOfic").val() == null ){
        $("#aspTelOfic").focus();
        return false;
    }else if($("#aspExt").val() == null ){
        $("#aspExt").focus();
        return false;
    }else {
        return true;
    }
}

</script>
