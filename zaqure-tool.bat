@echo off
chcp 65001 >nul
title ZAQURE TOOL
color 0B
setlocal EnableDelayedExpansion

:language
cls
echo =====================================
echo           ZAQURE TOOL
echo =====================================
echo.
echo [1] Turkce
echo [2] English
echo.
set /p lang=Seciminiz / Your choice: 

if "%lang%"=="1" goto turkish
if "%lang%"=="2" goto english
goto language

:turkish
set "L=TR"
goto menu

:english
set "L=EN"
goto menu

:menu
cls
echo ███████╗ █████╗  ██████╗ ██╗   ██╗██████╗ ███████╗
echo ╚══███╔╝██╔══██╗██╔═══██╗██║   ██║██╔══██╗██╔════╝
echo   ███╔╝ ███████║██║   ██║██║   ██║██████╔╝█████╗
echo  ███╔╝  ██╔══██║██║▄▄ ██║██║   ██║██╔══██╗██╔══╝
echo ███████╗██║  ██║╚██████╔╝╚██████╔╝██║  ██║███████╗
echo ╚══════╝╚═╝  ╚═╝ ╚══▀▀═╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
echo.
echo =====================================
echo            ZAQURE TOOL
echo =====================================
echo.

if "!L!"=="TR" (
    echo [1] Temp Dosyalarini Temizle
    echo [2] Windows Temp Dosyalarini Temizle
    echo [3] Geri Donusum Kutusunu Temizle
    echo [4] Sistem Bilgilerini Goster
    echo [5] Windows Update Kontrol Et
    echo [6] Dil Degistir
    echo [7] Cikis
    echo.
    set /p secim=Seciminizi girin: 
) else (
    echo [1] Clean Temp Files
    echo [2] Clean Windows Temp Files
    echo [3] Empty Recycle Bin
    echo [4] Show System Information
    echo [5] Check Windows Update
    echo [6] Change Language
    echo [7] Exit
    echo.
    set /p secim=Enter your choice: 
)

if "%secim%"=="1" goto temp
if "%secim%"=="2" goto wintemp
if "%secim%"=="3" goto recycle
if "%secim%"=="4" goto sistem
if "%secim%"=="5" goto update
if "%secim%"=="6" goto language
if "%secim%"=="7" exit /b
goto menu

:temp
cls
if "!L!"=="TR" echo Temp dosyalari temizleniyor...
if "!L!"=="EN" echo Cleaning temp files...
powershell -Command "Remove-Item $env:TEMP* -Recurse -Force -ErrorAction SilentlyContinue"
echo.
if "!L!"=="TR" echo Islem tamamlandi!
if "!L!"=="EN" echo Operation completed!
pause
goto menu

:wintemp
cls
if "!L!"=="TR" echo Windows Temp dosyalari temizleniyor...
if "!L!"=="EN" echo Cleaning Windows Temp files...
powershell -Command "Remove-Item 'C:\Windows\Temp*' -Recurse -Force -ErrorAction SilentlyContinue"
echo.
if "!L!"=="TR" echo Islem tamamlandi!
if "!L!"=="EN" echo Operation completed!
pause
goto menu

:recycle
cls
if "!L!"=="TR" echo Geri Donusum Kutusu temizleniyor...
if "!L!"=="EN" echo Emptying Recycle Bin...
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo.
if "!L!"=="TR" echo Islem tamamlandi!
if "!L!"=="EN" echo Operation completed!
pause
goto menu

:sistem
cls
echo =====================================
if "!L!"=="TR" echo         SISTEM BILGILERI
if "!L!"=="EN" echo        SYSTEM INFORMATION
echo =====================================
echo.
if "!L!"=="TR" echo Bilgisayar Adi: %COMPUTERNAME%
if "!L!"=="EN" echo Computer Name: %COMPUTERNAME%
if "!L!"=="TR" echo Kullanici: %USERNAME%
if "!L!"=="EN" echo User: %USERNAME%
echo.

systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"

echo.
if "!L!"=="TR" echo Islemci:
if "!L!"=="EN" echo Processor:
powershell -Command "(Get-CimInstance Win32_Processor).Name"

echo.
if "!L!"=="TR" echo Ekran Karti:
if "!L!"=="EN" echo Graphics Card:
powershell -Command "(Get-CimInstance Win32_VideoController | Select-Object -First 1).Name"

echo.
if "!L!"=="TR" echo RAM:
if "!L!"=="EN" echo RAM:
powershell -Command "$ram=[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,2); Write-Host $ram 'GB'"

echo.
if "!L!"=="TR" echo Anakart:
if "!L!"=="EN" echo Motherboard:
powershell -Command "$b=Get-CimInstance Win32_BaseBoard; Write-Host $b.Manufacturer $b.Product"

echo.
pause
goto menu

:update
cls
if "!L!"=="TR" echo Windows Update aciliyor...
if "!L!"=="EN" echo Opening Windows Update...
start ms-settings:windowsupdate
echo.
if "!L!"=="TR" echo Windows Update sayfasi acildi.
if "!L!"=="EN" echo Windows Update page opened.
pause
goto menu