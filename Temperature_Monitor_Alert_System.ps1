#Elsewhen Technology Scripts
#Author: Nic Colon
#Last Update: 08/31/2020
#Temperature Monitor & Alert Generator
function Get-Temp
    {
    $intRunnTemp = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $intRetuTemp = 0

    ForEach ($temp in $intRunnTemp.CurrentTemperature)
        {
        $intCurrTempKelv = $temp / 10
        $intCurrTempCels = $intCurrTempKelv - 273.15
        $intRetuTemp = $intCurrTempCels
        }
    return $intRetuTemp
    }
Function Send-Alert
    {
    $addrFrom = "backups.reports.ewt@gmail.com"
    $addrTo = "reports@ewtpro.com"
    $credUname = "backups.reports.ewt@gmail.com"
    $credPword = Get-Content "C:\EWT\Scripts\TempMonitor\Auth.txt" | ConvertTo-SecureString
    $addrSMTP = "smtp.gmail.com"
    $addrSMTPport = 465
    $DevName = $env:COMPUTERNAME
    $txtMsgSub = "High Temperature Alert on $DevName"
    $txtDevLoc = Get-AzureADDomain -Current LocalComputer
    $txtEventTime = Get-Date 
    $txtMsgBody = "The Device $DevName at $txtDevLoc has surpassed the temperature threshold of 80 degrees Celsius. At Approx. $txtEventTime the device temperature reached $intTemp degrees Celsius"
    Send-MailMessage -to $addrTo -From $addrFrom -subject $txtMsgSub -Body $txtMsgBody -Credential $credPword

    }
function Check-Temp
    {
    $intThresh = 80
    if ($intTemp -eq $intThresh)
        {
        Send-Alert
        }
    if ($intTemp -gt $intThresh)
        {
        Send-Alert
        }
    }
function Main
    {
    $intTemp = 0
    $Keystone = 0
    while ($Keystone -eq 0)
        {
        $intTemp = Get-Temp
        Check-Temp
        Start-Sleep -s 300
        }
    }
Main