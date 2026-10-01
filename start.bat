@echo off
title Woninginrichter Plattegrond- & Doorsnede Engine (Poort 8088)
cd /d "%~dp0"

echo ========================================================================
echo  Woninginrichter Plattegrond- & Doorsnede Engine (v2.0 Next.js)
echo  Lokale server op poort 8088...
echo ========================================================================
echo.

:: Controleer of poort 8088 al actief is
netstat -ano | findstr "LISTENING" | findstr ":8088" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [INFO] Server draait reeds op http://localhost:8088!
    echo [INFO] Browser wordt geopend...
    start "" "http://localhost:8088"
    echo.
    echo Druk op een toets om dit venster te sluiten.
    pause >nul
    exit /b 0
)

:: Start de Next.js ontwikkelserver op poort 8088
echo [INFO] Starten van Next.js server op poort 8088...
start "" "http://localhost:8088"
npm run dev

pause
