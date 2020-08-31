#Elsewhen Technology Scripts
#Author: Nic Colon
#Performance Monitor Alert Script
#Last Update: 08/24/2020
function Get-Temperature {
    $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"

    $currentTempKelvin = $t.CurrentTemperature / 10
    $currentTempCelsius = $currentTempKelvin - 273.15

    $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32

    return $currentTempCelsius.ToString() + " C : " + $currentTempFahrenheit.ToString() + " F : " + $currentTempKelvin + "K"  
}