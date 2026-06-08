@echo off

call mvn clean test

if %ERRORLEVEL% neq 0 (
exit /b %ERRORLEVEL%
)

start "" "%CD%\target\karate-reports\karate-summary.html"
