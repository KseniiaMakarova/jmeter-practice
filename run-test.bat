@echo off
set JMETER_DIR=apache-jmeter-5.6.3-with-plugin

REM Run docker-compose file
powershell -Command "docker-compose up -d"

REM Check if JMeter folder already exists, if not - extract archive
if not exist "%JMETER_DIR%\bin\jmeter.bat" (
    echo Unzipping JMeter...
    powershell -Command "Expand-Archive -Path '%JMETER_DIR%.zip' -DestinationPath ."
)

REM Run JMeter in non-GUI mode
%JMETER_DIR%\bin\jmeter.bat -n -t "Test Plan.jmx"