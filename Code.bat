@echo off
setlocal
set "output=output.txt"
title Search a file.exe

:home
cls
echo -------------------------------------------------------------------------
set /p "directory=Enter the directory: "
if not exist "%directory%" (
    color 40
    echo Invalid directory!
    color 07
    pause
    goto home
)
cls
echo -------------------------------------------------------------------------
echo What do you want to do?
echo -------------------------------------------------------------------------
echo 1. Find files with a particular extension
echo 2. Find files with a specific name
echo -------------------------------------------------------------------------
set /p "choice=>"
if "%choice%"=="1" goto Ex
if "%choice%"=="2" goto F
color 4f
echo Invalid choice!
color 07
pause
goto home

:Ex
del "%output%"
echo Result : >> "%output%"
cls
set /p "extensions=Enter extension of files (example: .pdf .txt...): "
cls
echo -------------------------------------------------------------------------
echo Searching for files with the following extensions: %extensions%
echo Writing results to: "%output%"
echo -------------------------------------------------------------------------
echo.
echo In progress...
echo -------------------------------------------------------------------------
for /r "%directory%" %%i in (*%extensions%) do (
    echo "%%~fi"
) >> "%output%"
if not exist "%output%" (
    color 4f
    echo No files found!
    color 07
    pause
) else (
    color 2f
    start "" "%output%"
    color 07
)
pause
goto :home

:F
del "%output%"
echo Result : >> "%output%"
cls
set /p "filename=Enter filename: "
cls
echo -------------------------------------------------------------------------
echo Searching for files with the following name: %filename%
echo Writing results to: "%output%"
echo -------------------------------------------------------------------------
echo.
echo In progress...
echo -------------------------------------------------------------------------
for /r "%directory%" %%i in ("%filename%*") do (
    echo "%%~fi"
) >> "%output%"
if not exist "%output%" (
    color 4f
    echo No files found!
    color 07
    pause
) else (
    color 2f
    start "" "%output%"
    color 07
)
pause
goto :home

endlocal
