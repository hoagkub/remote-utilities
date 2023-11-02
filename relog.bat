@ECHO OFF

echo [%date% %time%] This is the log of acounts remote
echo [%date% %time%] This is the log of acounts remote > log\remote_logger.log

set "previous_user="

:LOOP
    TITLE REMOTE_LOGGER
    set "username="
    for /F "usebackq delims=" %%I in (`%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "query user | findstr Active | Select-String '(\w+)' | ForEach-Object { $_.Matches[0].Groups[1].Value }"`) do (
        set username=%%I
    )
    
    if "%username%"=="" (
        if not "%previous_user%"=="%username%" (
            echo [%date% %time%] %previous_user% disconnected
            echo [%date% %time%] %previous_user% disconnected >> log\remote_logger.log
        )
    ) else (
        if not "%previous_user%"=="%username%" (
            echo [%date% %time%] %username% connected
            echo [%date% %time%] %username% connected >> log\remote_logger.log
        )
    )
    set previous_user=%username%
GOTO LOOP
