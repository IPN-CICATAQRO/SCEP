<!DOCTYPE html>
<html lang="es-MX" class="panel panel-default bg-white m-t-lg">
<head>
  <meta charset="utf-8" />
  <title>Inicio | Acceso a SCEP</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

  <link rel="shortcut icon" href="/includes/images/favicon.ico" />

  <link rel="stylesheet" href="/includes/base/bootstrap-3.3.7/dist/css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="/includes/styles/animate.css" type="text/css" />
  <link rel="stylesheet" href="/includes/styles/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="/includes/styles/font.css" type="text/css" />
  <script src="/includes/base/scripts/jquery/jquery.min.js"></script>
  <script src="/includes/base/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
  <!--- <link rel="stylesheet" href="/posgrado/includes/styles/app.css" type="text/css" /> --->

</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <section id="content" class="m-t-lg wrapper-md animated fadeInUp">
          <section class="panel panel-default bg-white m-t-lg">
	  	      <cfoutput>
		          <form class="form-signin panel-body wrapper-lg" action="#cgi.SCRIPT_NAME#" method="post">
		            <input type="hidden" name="event" value="Login.autenticacion">
                <div class="form-group">
                  <label class="control-label">Usuario</label>
                  <input type="text" id="inputUsuario" name="inputUsuario" placeholder="Usuario" class="form-control input-lg" value="#Event.getValue('username','')#">
                </div>
                <div class="form-group">
                  <label class="control-label">Contrase&ntilde;a</label>
                  <input type="password" id="inputPassword" name="inputPassword" placeholder="Contrase&ntilde;a" class="form-control input-lg">
                </div>
		            <cfif NOT getPlugin("MessageBox").isEmptyMessage()>
  	              <div class="form-group">
			              #getPlugin("MessageBox").renderIt()#
		              </div>
		            </cfif>
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> Mantener sesi&oacute;n activa
                  </label>
                </div>
                <a href="##" class="pull-right m-t-xs"><small>&iquest;Olvidaste tu contrase&ntilde;a?</small></a>
                <button type="submit" class="btn btn-primary btn-block">Entrar</button>
                <div class="line line-dashed"></div>
                <p class="text-muted text-center"><small>&iquest;No tienes cuenta?</small></p>
                <a href="index.cfm/Cuenta" class="btn btn-default btn-block"><small>Crear cuenta</small></a>
              </form>
	          </cfoutput>
          </section>
        </section>
      </div>
    </div>
  </div>
</body>
</html>
