#!/bin/sh

./chromium-setup.sh;
./chrome-driver-setup.sh;

export DRILL_API_KEY="7_b67d19818d2968808b031c6ea8b182bb6f7492f33f41c9e89e70864d24741aae"
export DRILL_API_URL="http://localhost:8090/api"

./gradlew clean :$1:test;
