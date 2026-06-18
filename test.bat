@echo off

call .\chromium-setup.bat
call .\chrome-driver-setup.bat

set DRILL_API_KEY=7_b67d19818d2968808b031c6ea8b182bb6f7492f33f41c9e89e70864d24741aae
set DRILL_API_URL=http://localhost:8090/api

call gradlew clean :%1:test
