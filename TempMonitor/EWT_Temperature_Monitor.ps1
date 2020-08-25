#Elsewhen Technology Scripts
#Author: Nic Colon
#Performance Monitor Alert Script
#Last Update: 08/25/2020
#The following script is written to check the temperature of a device's CPU and to send an alert if it reaches a threshold of 80 degrees celsius.
function Send_Report {
    #This function is called by Get-Temperature if the intCurrTempCel variable stores a value greater than 80, it sends an email alert to the reports board email. 
    $addrMailFrom = "backup.reports.ewt@gmail.com"
    $addrMailTo = "reports@ewtpro.com"
    $credUsername = "backup.reports.ewt@gmail.com"
    $credPassword = Get-Content 'C:\EWT\Scripts\TempMonitor\Auth.txt' | ConvertTo-SecureString
    $addrSMTPServ = 'smtp.gmail.com'
    $addrSMTPPort = '465'
    $txtMsgSub = 'Performance Monitor Alert'
    $txtMsg = New-Object System.Net.Mail.MailMessage $addrMailFrom, $addrMailTo
    $Message.Subject = $txtMsgSub
    $txtDeviceLoc = Get-ADDomain -Current LocalComputer
    $txtEventTime = Get-Date 
    $Message.Body = "The Device: $env:computername at $txtDeviceLoc has surpassed the established temperature threshold of 80 degrees Celsius at $txtEventTime"
    $Smtp = New-Object Net.Mail.SmtpClient($addrSMTPServ,$addrSMTPPort)
    $Smtp.EnableSsl = $true
    $Smtp.Credentials = New-Object System.Net.NetworkCredential("$credUsername", "$credPassword")
    $smtpclient.send($addrMailFrom, $addrMailTo, $txtMsgSub, $Message.Body)
    }
function Get-Temperature {
    $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $intReturnTemp = @()
    foreach ($temp in $t.CurrentTemperature)
    {
    $intCurrTempKel = $temp / 10
    $intCurrTempCel = $intCurrTempKel - 273.15
    if($intCurrTempCel -gt 80.0) 
        {
        Send_Report
        }
    $intReturnTemp += $currTempCel.ToString()
    }
    return $intReturnTemp
    } 
function Start_Monitor {
    $Keystone = 0
    while(keystone -eq 0) {
        Get-Temperature
        Start-Sleep -s 300
        }
    }
Start_Monitor