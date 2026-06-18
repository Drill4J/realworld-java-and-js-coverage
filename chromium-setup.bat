@echo off

set "chromeBinaryUrl=https://storage.googleapis.com/chrome-for-testing-public/150.0.7871.24/win64/chrome-win64.zip"
set "destinationDir=.\chromium-binary"
set "zipFile=%destinationDir%\chrome-win64.zip"
set "chromeExe=%destinationDir%\chrome-win64\chrome.exe"

if not exist "%destinationDir%" mkdir "%destinationDir%"

if not exist "%chromeExe%" (
    echo Downloading Chromium. Please wait a minute...
    powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '%chromeBinaryUrl%' -OutFile '%zipFile%'"
    powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%destinationDir%' -Force"
    del /Q "%zipFile%" 2>nul
) else (
    echo Chromium binary already exists in %destinationDir%. Skipping download.
)
