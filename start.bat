@echo off
title Woninginrichter Plattegrond- en Doorsnede-Engine (Poort 8088)
cd /d "%~dp0"

echo ========================================================================
echo  Woninginrichter Plattegrond- en Doorsnede-Engine (v2.0 Next.js)
echo ========================================================================
echo.

:: 1. Controleer of poort 8088 al actief is
netstat -ano | findstr "LISTENING" | findstr ":8088" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [OK] De server draait reeds op poort 8088!
    echo [INFO] Browser wordt geopend op http://localhost:8088 ...
    start http://localhost:8088
    echo.
    echo ------------------------------------------------------------------------
    echo  Next.js Studio URL:  http://localhost:8088
    echo  Legacy Picker URL:   http://localhost:8088/google_maps_picker.html
    echo ------------------------------------------------------------------------
    echo.
    echo De applicatie is geopend in je browser.
    echo Druk op een toets om dit venster te sluiten.
    pause >nul
    exit /b 0
)

:: 2. Start achtergrond-watcher die de browser opent zodra poort 8088 luistert
start /b cmd /c "for /l %%i in (1,1,30) do (ping 127.0.0.1 -n 2 >nul & netstat -ano | findstr \"LISTENING\" | findstr \":8088\" >nul && (start http://localhost:8088 & exit))"

:: 3. Start Next.js ontwikkelserver op in dit venster
echo [INFO] Next.js ontwikkelserver wordt opgestart op poort 8088...
echo [INFO] Zodra Turbopack gereed is, opent de browser automatisch.
echo.
npm run dev

if %ERRORLEVEL% neq 0 (
    echo.
    echo [FOUT] Server kon niet worden gestart.
    echo Controleer of Node.js correct is geinstalleerd.
    pause
)
