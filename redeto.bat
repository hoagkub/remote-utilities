@echo off
setlocal EnableDelayedExpansion
:: TODO: Define your user here
set user=%REDETO_USER%
set Password=%REDETO_PW%

:: should around variable by double quote to ensure batch file raise exception
if /I "%~1" EQU "/?" (
    goto HELP
)

:: change working directory to current directory path of the running batch file
cd /d %~dp0
echo change working directory to: %CD%

set "hostname=%~1"
cmdkey /generic:TERMSRV/!hostname! /user:!user! /pass:!Password!
echo execute command: start mstsc /v:!hostname! /f
start mstsc /v:!hostname! /f
goto END
