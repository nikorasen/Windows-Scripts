#Elsewhen Technology Scripts
#Author: Nic "Rant" Colon
#Last Update: 08/21/2020
#Restart Update Services perpetually
[Array] $Servs = 'wuauserv', 'bits', 'cryptsvc', 'msiserver';  #replace 'service' with the name of the service that needs checked/restarted
#
#Looper variable, helps the script run perpetually
$Looper = 0
while($Looper = 0)
{
    foreach($ServiceName in $Servs)
    {
        Get-Service $ServiceName | Where {$_.Status -eq 'Stopped'} | Start-Service 
    }
    Start-Sleep -s 1800
}