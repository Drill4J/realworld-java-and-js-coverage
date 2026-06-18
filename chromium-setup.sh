#!/bin/bash
chromeBinaryUrl="https://storage.googleapis.com/chrome-for-testing-public/150.0.7871.24/win64/chrome-win64.zip"
destinationDir="./chromium-binary"
zipFile="$destinationDir/chrome-win64.zip"
chromeExe="$destinationDir/chrome-win64/chrome.exe"

mkdir -p "$destinationDir"

if [ ! -f "$chromeExe" ]; then
    echo "Downloading Chromium..."
    curl --ssl-no-revoke -L -o "$zipFile" "$chromeBinaryUrl"
    unzip -d "$destinationDir" "$zipFile"
    rm -f "$zipFile"
else
    echo "Chromium binary already exists in $destinationDir. Skipping download."
fi
