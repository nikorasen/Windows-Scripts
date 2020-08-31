#Elsewhen Technology Scripts
#Author: Nic Colon
#Scripted Temperature Monitor Installer
Set-exceutionpolicy remotesigned
if(Test-Path C:\Users\$env:Username\Documents\WindowsPowershell\modules\) {
    mkdir C:\Users\$env:Username\Documents\WindowsPowershell\modules\get-temperature
    copy-item -Path C:\Users\$env:Username\Desktop\TempMon\get-temperature.psm1 -Destination C:\Users\$env:Username\Documents\WindowsPowerShell\modules\get-temperature -PassThru
    }