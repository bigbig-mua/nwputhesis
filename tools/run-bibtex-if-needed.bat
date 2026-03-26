@echo off
setlocal

set "doc=%~1"
if "%doc%"=="" exit /b 0

set "aux=%doc%.aux"
set "bbl=%doc%.bbl"

if not exist "%aux%" (
    if exist "%bbl%" del /q "%bbl%"
    echo Skip bibtex: no aux file.
    exit /b 0
)

findstr /c:"\citation{" "%aux%" >nul
if errorlevel 1 (
    if exist "%bbl%" del /q "%bbl%"
    echo Skip bibtex: no citations.
    exit /b 0
)

bibtex "%doc%"
exit /b %errorlevel%
