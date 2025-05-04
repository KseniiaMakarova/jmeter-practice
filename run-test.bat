@echo off
REM Set default values
set THREADS=1000
set RAMPUP=1
set JMETER_DIR=apache-jmeter-5.6.3-with-plugin

REM Allow user override via command-line arguments
if not "%1"=="" set THREADS=%1
if not "%2"=="" set RAMPUP=%2

REM Run docker-compose file
powershell -Command "docker-compose up -d"

REM Check if JMeter folder already exists, if not - extract archive
if not exist "%JMETER_DIR%\bin\jmeter.bat" (
    echo Unzipping JMeter...
    powershell -Command "Expand-Archive -Path '%JMETER_DIR%.zip' -DestinationPath ."
)

REM Run JMeter in non-GUI mode
%JMETER_DIR%\bin\jmeter.bat -n -t "Test Plan.jmx" -j jmeter.log ^
  -Jusers=%THREADS% ^
  -Jrampup=%RAMPUP%

pause