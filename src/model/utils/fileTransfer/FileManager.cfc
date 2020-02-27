<!---
* =======================================================================================================================================================================
* IPN - CSII
* Sistema: SIIIP
* Modulo: FileManager.cfc
* Fecha: Noviembre, 2013
* Descripcion: Componente para la administraci�n de los archivos
* =======================================================================================================================================================================
--->
<cfcomponent>

	<cfproperty name="ftp" type="any" >
	<cfproperty name="zipFile" type="any">
	<cfproperty name="zipVO" type="any">
	<cfproperty name="resources" type="any">
	<cfscript>
		this.init();
	</cfscript>

	<cfscript>
		function init(){
			//this.fotos = CreateObject('component', 'Locator_Siiip').DigitalesFotos();
			this.ftp = createObject("component","FTP");
			this.zipFile = createObject("java","edu.ipn.sectecnica.utils.files.ZipFile");
			this.resources = createObject("java","edu.ipn.sectecnica.utils.Resources.Resources");
			this.zipVO = createObject("java","edu.ipn.sectecnica.utils.files.ZipFileVo");

			this.resources.init();
			this.zipFile.init();
			this.zipVO.init();
		}
	</cfscript>

    <!---
	* Descripcion: Guarda el archivo en el servidor, lo comprime, renombra y sube al FTP
	* Fecha: Mayo 12, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="attachFile" returntype="struct" >
		<cfargument name="filedata" hint="archivo a Adjuntar">
		<cfargument name="process" hint="carpeta del proceso o modulo">
		<cfargument name="folder" hint="estructura de carpetas en la que se almacenara el archivo">
		<cfset structResult = StructNew()>
		<cfset structResult.FILENAME = "">
		<cfset structResult.SUCCESS = false>
        <cftry>
			<cfscript>
			adminapi = createObject("component","cfide.adminapi.base");
				init();
				localPath	= this.resources.getProperty( process& ".path.file") & folder;
				ftpPath		= this.resources.getProperty( process& ".path.ftp") & folder;
				this.zipFile.validateFolder(localPath);

				//Sube archivo en el la ruta generada
				cffile = upload(filedata,localPath);

				//filename = cffile.SERVERFILENAME;
				filename = cffile.UPLOADALL_RESULTS[1].SERVERFILENAME;

				//SE RENOMBRA ARCHIVO PARA QUITAR CARACTERES ESPECIALES
				filename = replace(filename,"#chr(225)#","a","ALL");
				filename = replace(filename,"#chr(233)#","e","ALL");
				filename = replace(filename,"#chr(237)#","i","ALL");
				filename = replace(filename,"#chr(243)#","o","ALL");
				filename = replace(filename,"#chr(250)#","u","ALL");

				filename = replace(filename,"#chr(193)#","A","ALL");
				filename = replace(filename,"#chr(201)#","E","ALL");
				filename = replace(filename,"#chr(205)#","I","ALL");
				filename = replace(filename,"#chr(211)#","O","ALL");
				filename = replace(filename,"#chr(218)#","U","ALL");

				filename = replace(filename,"#chr(241)#","n","ALL");
				filename = replace(filename,"#chr(209)#","N","ALL");
				filename = replace(filename," ","_","ALL");
				filename = replace(filename,"#chr(44)#","_","ALL");

				//extension = cffile.SERVERFILEEXT;
				extension = cffile.UPLOADALL_RESULTS[1].SERVERFILEEXT;				
				///Pregunta si tiene extension ZIP y comprime.
				if( extension EQ "zip" ) {
					rename(localPath & cffile.UPLOADALL_RESULTS[1].SERVERFILENAME & "." & cffile.UPLOADALL_RESULTS[1].SERVERFILEEXT, localPath & filename & "_." & cffile.UPLOADALL_RESULTS[1].SERVERFILEEXT);
					isZipped = this.zipFile.compressFile(localPath & filename & "_." & cffile.UPLOADALL_RESULTS[1].SERVERFILEEXT,localPath & filename & ".zip");
				}else{
					rename(localPath & cffile.UPLOADALL_RESULTS[1].SERVERFILENAME & "." & cffile.UPLOADALL_RESULTS[1].SERVERFILEEXT,localPath & filename & "." & cffile.UPLOADALL_RESULTS[1].SERVERFILEEXT);
					isZipped = this.zipFile.compressFile(localPath & filename & "." & cffile.UPLOADALL_RESULTS[1].SERVERFILEEXT,localPath & filename & ".zip");
				}

				nuevoNombre = filename & "_" &DateFormat(Now(),"yyyymmdd")&"_"&TimeFormat(Now(),"HHmmss");
				rename(localPath & filename & ".zip",localPath & nuevoNombre & ".zip");

				if(isZipped EQ true){
					//Esta conectado el ftp

					if(NOT this.ftp.hasConnect()){
						if(IsDefined('process')){
							this.ftp.connect(process);
						} else{
							this.ftp.connect();
						}
					}

					//Envio del archivo al FTP

					this.ftp.changeToFolder(ftpPath);

					finalName = this.ftp.uploadFile(localPath,nuevoNombre,"zip");

					//se elimina el archivo de la carpeta temporal
					this.ftp.delete(localPath&finalName);

					structResult.LOCALPATH		= localPath;
					structResult.FTPPATH		= ftpPath;
					structResult.FILENAME		= finalName;
					structResult.ORIGINALNAME	= cffile.UPLOADALL_RESULTS[1].SERVERFILENAME & '.' & cffile.UPLOADALL_RESULTS[1].SERVERFILEEXT;
					structResult.EXTENSION		= extension;
					structResult.SUCCESS		= true;
					return structResult;
				}
				return structResult;
			</cfscript>
		<cfcatch type="any">
			<cfdump var="#cfcatch#">
			<cflog text="Repositorio.utilidades.file_Transfer.attachFile:: Error al cargar el archivo del ftp: #cfcatch.message#">
			<cfreturn structResult>
		</cfcatch>
		</cftry>
	</cffunction>

	<!---
	* Descripcion: Descarga el archivo del FTP
	* Fecha: Mayo 12, 2014
	* @author: Antonio Alvarez
	--->
	<cffunction name="downloadFile" returntype="struct" hint="Descarga un archivo del ftp">
		<cfargument name="fileName"	type="string"	required="yes">
		<cfargument name="process">
		<cfargument name="folder"	type="string"	required="yes">
		<cfscript>
			localPath	= this.resources.getProperty( process& ".path.file") & folder;
			ftpPath		= this.resources.getProperty( process& ".path.ftp") & folder;
			this.zipFile.validateFolder(localPath);

			if(not this.ftp.hasConnect()){
				if(isDefined('process')){
					this.ftp.connect(process);
				}else{
					this.ftp.connect();
				}
			}
			dwRes = this.ftp.downloadFile(ftpPath & filename,localPath & fileName);
			if(dwRes){
				//DESCOMPRESION DE ARCHIVO ZIP
				zipVO = this.zipfile.decompressFile(localPath & fileName);
				StructFile = structnew();
				StructFile.FILE = zipVO.getFile();
				StructFile.FILESIZE = zipVO.getFile().size();
				StructFile.FILENAME = zipVO.getName();
				StructFile.TMPFULLNAME = localPath & zipVO.getName();
				StructFile.SUCCESS = true;
			}else{
				StructFile.TMPFULLNAME = '0';
			}
		</cfscript>
		<cfreturn StructFile>
	</cffunction>



	<cffunction name="deleteFile" returntype="boolean" >
		<cfargument name="fileName" required="yes">
		<cfargument name="process">
		<cfargument name="folder" required="yes">
		<cfscript>
			init();
			localPath	= this.resources.getProperty( process& ".path.file") & folder;
			ftpPath		= this.resources.getProperty( process& ".path.ftp") & folder;
			this.zipFile.validateFolder(localPath);
			if(Not this.ftp.hasConnect()){
				if(isDefined('process')){
					this.ftp.connect(process);
				}else{
					this.ftp.connect();
				}
			}
			return this.ftp.deleteFile(ftpPath & filename);
		</cfscript>
	</cffunction>



	<cffunction name="upload" returntype="any" hint="">
		<cfargument name="filedata">
		<cfargument name="destination">
		<cffile action="uploadAll" fileField="#arguments.filedata#" destination="#destination#" nameConflict="MAKEUNIQUE">
		<cfreturn cffile>
	</cffunction>

	<cffunction name="rename" access="public" hint="">
		<cfargument name="source">
		<cfargument name="destination">
		<cffile action="rename" source="#source#" destination="#destination#">
	</cffunction>

</cfcomponent>
