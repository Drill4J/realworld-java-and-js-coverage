#!/bin/bash
chromeDriverUrl="https://storage.googleapis.com/chrome-for-testing-public/150.0.7871.24/win64/chromedriver-win64.zip"
destinationDir="./chrome-driver"
zipFile="$destinationDir/chromedriver-win64.zip"
driverExe="$destinationDir/chromedriver-win64/chromedriver.exe"

mkdir -p "$destinationDir"

if [ ! -f "$driverExe" ]; then
    echo "Downloading Chrome Driver..."
    curl --ssl-no-revoke -L -o "$zipFile" "$chromeDriverUrl"
    unzip -d "$destinationDir" "$zipFile"
    rm -f "$zipFile"
else
    echo "Chromedriver already exists in $destinationDir. Skipping download."
fi
