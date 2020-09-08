#Elsewhen Technology Scripts
#Author: Nic "Rant" Colon
#FixNetShare 
#This script, once started, perpetually checks to ensure that the services network and resource sharing are dependent on are in fact running and enabled.
netsh advfirewall firewall set rule group="network discovery" new enable=yes
netsh firewall set service type=fileandprint mode=enable profile=all
[Array] $Servs = 'fdrespub','ssdpsrv','upnphost','dnscache'
$Keystone=0
while($Keystone = 0)
{
    foreach($ServiceName in $Servs)
    {
        Get-Service $ServiceName | Where {$_.Status -eq 'Stopped'} | Start-Service 
    }
    Start-Sleep -s 1800
}
