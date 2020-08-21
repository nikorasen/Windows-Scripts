#Elsewhen Technology Scripts
#Author: Nic "Rant" Colon
#Last Update: 08/21/2020
#This is a script written to automatically check for and restart select services should they fail
[Array] $Servs = 'UniFi', 'DNScache', 'FDResPub', 'SSDPSRV', 'upnphost';  #The Services needed for unifi controller
#
#Looper variable, helps the script run perpetually
$Looper=0
while($Looper = 0)
{
    foreach($ServiceName in $Servs)
    {
        Get-Service $ServiceName | Where {$_.Status -eq 'Stopped'} | Start-Service 
    }
    Start-Sleep -s 300 #300 seconds is 5 mins
}