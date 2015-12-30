@ECHO OFF
ECHO USE THIS INSTALL AT YOUR OWN RISK!!!
ECHO THIS WILL INSTALL AND CONFIGURE FUSIONPBX FREESWITCH, POSTGRESQL, PHP, AND NGINX
    
    @echo on
     
    title Install FusionPBX on Windows
	ECHO Let's Install!
	ECHO Please wait just a few moments.....
	
    
	cd "%USERPROFILE%\Downloads"
	Pause Going to download Freeswitch
	powershell -Command "(New-Object Net.WebClient).DownloadFile('http://files.freeswitch.org/windows/installer/x64/freeswitch.msi', 'freeswitch.msi')"
	powershell -Command "Invoke-WebRequest http://files.freeswitch.org/windows/installer/x64/freeswitch.msi -OutFile freeswitch.msi"
	REM // Powershell.exe -executionpolicy remotesigned $client = new-object System.Net.WebClient
	REM // Powershell.exe -executionpolicy remotesigned $client.DownloadFile("http://files.freeswitch.org/windows/installer/x64/freeswitch.msi", "%Downloads%")
	REM // starting install of freeswitch
  REM // cd "%Downloads%"
	ECHO Going to install Freeswitch
	Pause
  start /wait freeswitch.msi /quiet
	Pause Going to download Postgresql
	
  powershell -Command "(New-Object Net.WebClient).DownloadFile('http://get.enterprisedb.com/postgresql/postgresql-9.4.5-3-windows-x64.exe', 'postgresql-9.4.5-3-windows-x64.exe')"
	powershell -Command "Invoke-WebRequest http://get.enterprisedb.com/postgresql/postgresql-9.4.5-3-windows-x64.exe -OutFile postgresql-9.4.5-3-windows-x64.exe"
	Pause
	ECHO Going to install Postgresql
	
	start /wait postgresql-9.4.5-3-windows-x64.exe --mode unattended --superpassword database_superuser_password --servicepassword system_password
	Pause Going to install NGINX 1.9.9
	cd "C:/"
	powershell -Command "(New-Object Net.WebClient).DownloadFile('http://nginx.org/download/nginx-1.9.9.zip', 'nginx-1.9.9.zip')"
	powershell -Command "Invoke-WebRequest http://nginx.org/download/nginx-1.9.9.zip -OutFile nginx-1.9.9.zip"
	Pause Going to unzip NGINX
	ECHO Going to UnZip NGINX
	unzip nginx-1.9.9.zip
	cd "C:/nginx-1.9.9"
	Pause
	REM // needed for php7.0
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe', 'vc_redist.x64.exe')"
	powershell -Command "Invoke-WebRequest https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe -OutFile vc_redist.x64.exe"
	start /wait vc_redist.x64.exe /quiet
	ECHO Going to install PHP 7.0
	powershell -Command "(New-Object Net.WebClient).DownloadFile('http://windows.php.net/downloads/releases/php-7.0.1-nts-Win32-VC14-x64.zip', 'php-7.0.1-nts-Win32-VC14-x64.zip')"
	powershell -Command "Invoke-WebRequest http://windows.php.net/downloads/releases/php-7.0.1-nts-Win32-VC14-x64.zip -OutFile php-7.0.1-nts-Win32-VC14-x64.zip"
	unzip php-7.0.1-nts-Win32-VC14-x64.zip
	
	pause
	echo Download FusionPBX
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/fusionpbx/fusionpbx/archive/4.0.0.zip', '4.0.0.zip')"
	powershell -Command "Invoke-WebRequest https://github.com/fusionpbx/fusionpbx/archive/4.0.0.zip -OutFile 4.0.0.zip"
	
	cd "C:/nginx-1.9.9/html"
	unzip 4.0.0.zip
	del 4.0.0.zip
	echo goto http://localhost to do web gui install part. Come back and press enter to continue after that.
	pause
	
	
	
	
	
	
    
