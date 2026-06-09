@echo off

call mvn clean test

start "" "%CD%\target\karate-reports\karate-summary.html"