#Elsewhen Technology Scripts
#Author: Nic "Rant" Colon
#Last Update: 08/21/2020
#This is a script template written to restart a specified service. It checks if the service is running and restarts it if it isnt running
[Array] $Servs = 'UniFi', 'DNScache', 'FDResPub', 'SSDPSRV', 'upnphost';  #replace 'service' with the name of the service that needs checked/restarted
#
#Looper variable, helps the script run perpetually
$Looper=0
while($Looper = 0)
{
    foreach($ServiceName in $Servs)
    {
        Get-Service $ServiceName | Where {$_.Status -eq 'Stopped'} | Start-Service 
    }
    Start-Sleep -s 1800
}