<section class="vbox">
 <section class="scrollable wrapper">
  <div class="row">
    <div class="col-lg-12">
      <section class="panel panel-default">
        <header class="panel-heading font-bold">
          VALIDACI&Oacute;N DE ALUMNOS ESPECIALES
          <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
        </header>
        <div class="panel-body">
          <div class="table-responsive">
            <table class="table table-striped m-b-none" id="tableAlumnos">
              <thead>
                <tr>
                  <th width="7%">Numero de Registro</th>
                  <th width="20%">Nombre del Aspirante</th>
                  <th width="5%">Nivel</th>
                  <th width="30%">Programa de posgrado</th>
                  <th width="13%">Acci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
              <cfoutput query="Request.qAlumnos">
                <tr>
                  <td>9756123</td>
                  <td>#Request.qAlumnos.NOMBRE# #Request.qAlumnos.APELLIDO_PATERNO# #Request.qAlumnos.APELLIDO_MATERNO#</td>
                  <td>MAESTRIA</td>
                  <td>Computo Movil</td>
                  <td>
                    <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-reply"></i></a>
                    <a href="../icon/trash-o" style="font-size:18px"><i class="fa fa-unlock"></i></a>
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
</script>