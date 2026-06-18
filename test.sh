#!/bin/sh

./chromium-setup.sh;
./chrome-driver-setup.sh;

export DRILL_API_KEY="6_e8ff0f8de1e7b2f132e4b16893df4ee043b4e85e75be7ff0a27f489e8f7fda53"
export DRILL_API_URL="http://localhost:8090/api"

./gradlew clean :$1:test;
