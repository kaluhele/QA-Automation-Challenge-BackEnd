@echo off

call mvn clean test

allure serve target/allure-results