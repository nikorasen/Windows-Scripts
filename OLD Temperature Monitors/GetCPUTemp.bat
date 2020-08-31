#Elsewhen Technology Scripts
#Author: Nic Colon
#CPU Temperature Monitor
#Last Update: 08/24/2020
@echo off
for /f "skip=1 tokens=2 delims==" %%A in ('wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature /value') do set /a "HunDegCel=(%%~A*10)-27315"
echo %HunDegCel:~0,-2%.%HunDegCel:~-2% Degrees Celsius
