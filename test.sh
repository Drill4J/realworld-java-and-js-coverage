#!/bin/sh

./chromium-setup.sh;
./chrome-driver-setup.sh;

export DRILL_API_KEY="2_56920c09c27b84f06a0996b622fd24a5b910dda3abdb0d27e4a77138a9620914"
export DRILL_API_URL="http://localhost:8090/api"

./gradlew clean :$1:test;
