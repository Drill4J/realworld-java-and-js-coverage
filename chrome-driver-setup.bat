@echo off

set "chromeDriverUrl=https://storage.googleapis.com/chrome-for-testing-public/150.0.7871.24/win64/chromedriver-win64.zip"
set "destinationDir=.\chrome-driver"
set "zipFile=%destinationDir%\chromedriver-win64.zip"
set "driverExe=%destinationDir%\chromedriver-win64\chromedriver.exe"

if not exist "%destinationDir%" mkdir "%destinationDir%"

if not exist "%driverExe%" (
    echo Downloading Chrome Driver. Please wait a minute...
    powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '%chromeDriverUrl%' -OutFile '%zipFile%'"
    powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%destinationDir%' -Force"
    del /Q "%zipFile%" 2>nul
) else (
    echo Chromedriver already exists in %destinationDir%. Skipping download.
)
