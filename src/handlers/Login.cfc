<!---
* =========================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: Principal
* Sub modulo: Login
* Fecha: Marzo 20, 2014
* Descripcion: Handler para la autenticacion del usuario
* =========================================================================
--->

<cfcomponent>

	<!---
	* Fecha creacion: Marzo 20, 2014
	* @author Antonio Alvarez
 --->
	<cffunction name="autenticacion_antes" access="public" returntype="void" output="false" hint="Valida la informacion del usuario para el Login">
		<cfargument name="Event" type="any">
		<cfscript>

			var rc = Event.getCollection();
			//var usuario = structNew();

			//Revisa si las variables 'usuario' y 'pass' no estan vacias en el Request Collection
			if ( NOT Len(rc.inputUsuario) OR NOT Len(rc.inputPassword) ){
				getPlugin("MessageBox").setMessage("warning","Debe escribir el usuario y la contrase&ntilde;a");
				setNextEvent("Main.index","username=#Event.getValue("inputUsuario","")#");
			//Usuarios de PRUEBA
			} else if (rc.inputUsuario == "SIP") {
				setNextEvent("SIP.index");
			} else if (rc.inputUsuario == "SEPI") {
				setNextEvent("SEPI.index");
			} else if (rc.inputUsuario == "SEPI_ESIME") {
				setNextEvent("SEPI.index");
			} else if (rc.inputUsuario == "Inscripcion") {
				setNextEvent("Inscripcion.index");
			} else if (rc.inputUsuario == "Alumno") {
				setNextEvent("Alumno.index");
			//Usuarios de PRUEBA
			}else{
				//Se crea el objeto para el acceso a las funciones para el login
				objDataStore = getModel("login.CN_Login");
				usuario = objDataStore.validarUsuario(rc.inputUsuario, rc.inputPassword);

				var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');
				writedump(Session);
				var sessionUsuario		= session.usuario;//getPlugin('SessionStorage');//.getVar('usuario');

				setNextEvent("Inscripcion.index");
				//abort;

				if ( usuario.validado EQ 1 ){
					//Login correcto, se establecen las variables en "Session"
					getPlugin("SessionStorage").setVar("usuario",session.usuario);
					var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');
					//writedump(sessionUsuario);
					//abort;
					if(ListFind(usuario.roles,"POS_ALUMNO")){
						//Se consulta el estado de su inscripcion
						var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
						var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").PKUSUARIO;//pkAlumno;
						var estadoAvance	= cnInscripcion.getEstadoAvanceAlumno(pkAlumno);
						if (estadoAvance EQ 1) {
							//Si aun no esta concluida se redirecciona al modulo de Inscripcion
							setNextEvent("Inscripcion.index");
						} else {
							//En caso de estar concluida se redirecciona al modulo de Alumnos
							setNextEvent("Alumno.index");
						}
				}if(ListFind(usuario.roles,"POS_DIR_UR")){
						setNextEvent("sepi.index");
					}	if(ListFind(usuario.roles,"POS_DIR_IPN")){
						setNextEvent("sip.index");
					}
			} else {
					//Login incorrecto, se redirecciona nuevamente a la vista de login con un mensaje
					getPlugin("MessageBox").setMessage("warning","Nombre de usuario o contrase&ntilde;a incorrectos");
					setNextEvent("Main.index","username=#Event.getValue("inputUsuario")#");
				}
			}
		</cfscript>
	</cffunction>

	<cffunction name="autenticacion" access="public" returntype="void" output="false" hint="Valida la informacion del usuario para el Login">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();
			//var usuario = structNew();

			//Revisa si las variables 'usuario' y 'pass' no estan vacias en el Request Collection
			if ( NOT Len(rc.inputUsuario) OR NOT Len(rc.inputPassword) ){
				getPlugin("MessageBox").setMessage("warning","Debe escribir el usuario y la contrase&ntilde;a");
				setNextEvent("Main.index","username=#Event.getValue("inputUsuario","")#");
			} else {
				//Se crea el objeto para el acceso a las funciones para el login
				objDataStore = getModel("login.CN_Login");
				usuario = objDataStore.validarUsuario(rc.inputUsuario, rc.inputPassword);

				if ( usuario.validado EQ 1 ){
					//Login correcto, se establecen las variables en "Session"
					getPlugin("SessionStorage").setVar("usuario",usuario);
					roles = objDataStore.getRolesSession();
					getPlugin("SessionStorage").setVar("rolesSistema", roles);
					var sessionUsuario		= getPlugin('SessionStorage').getVar('usuario');

					if(ListFind(usuario.roles,"POS_ALUMNO")){
						//Se consulta el estado de su inscripcion
						var cnInscripcion	= getModel("inscripcion.CN_Inscripcion");
						var pkAlumno		= getPlugin("SessionStorage").getVar("usuario").PKUSUARIO;//pkAlumno;
						var estadoAvance	= cnInscripcion.getEstadoAvanceAlumno(pkAlumno);
						if (estadoAvance EQ 1) {
							//Si aun no esta concluida se redirecciona al modulo de Inscripcion
							setNextEvent("Inscripcion.index");
						} else {
							//En caso de estar concluida se redirecciona al modulo de Alumnos
							setNextEvent("Alumno.index");
						}
					}
					if(ListFind(usuario.roles,"POS_DIR_UR")){
						setNextEvent("sepi.index");
					}
					if(ListFind(usuario.roles,"POS_DIR_IPN")){
						setNextEvent("sip.index");
					}

				}if(ListFind(usuario.roles,"POS_ASPIRANTE")){
					setNextEvent("Inscripcion.index");
				}if(ListFind(usuario.roles,"POS_CONVOCATORIA")){
					setNextEvent("Convocatoria.index");
				}else{ //Login incorrecto, se redirecciona nuevamente a la vista de login con un mensaje
					getPlugin("MessageBox").setMessage("error2","Nombre de usuario o contrase&ntilde;a incorrectos.");
					location(url="../", addtoken=false);
			}
		}
    </cfscript>
	</cffunction>


    <!---
	* Descripcion: Cierra la sesion de usuario autentificado
	* Fecha creacion: Septiembre 24, 2015
	* @author Olguin Gallegos Claudia
	--->
	<cffunction name="cerrarSesion" access="public" returntype="void" output="false" hint="Cierra la sesion del usuaro autentificado">
		<cfargument name="Event" type="any">
		<cfscript>
			getPlugin("SessionStorage").clearAll();
			//setNextEvent("main.index");
		</cfscript>
        <cflocation url="/" addtoken="no"/>
	</cffunction>


	<!---
	* Fecha:	julio 21, 2015
	* @author:	Karen S. Bueno Tamayo
	* --->

   <!---cffunction name="init" access="remote" hint="Muestra los creditos">
   		<cfscript>
				var cnCreditosIPN = CreateObject('component' , 'Locator_Siiip').getCN_CreditosIPN();
				Request.creditos= cnCreditosIPN.obtenerInfoCreditos();
				//writedump(Request.creditos);
				//include "V_Creditos_IPN.html";
				</cfscript>
    </cffunction--->

</cfcomponent>
