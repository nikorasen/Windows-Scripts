#Fix_Net_Error_V3-01
#Fixes common network related errors
#
#ensure that the firewall is allowing connection
netsh advfirewall firewall set rule group="network discovery" new enable=yes
netsh firewall set service type=fileandprint mode=enable profile=all
#restart the dependent services
[Array] $Servs = 'fdrespub','ssdpsrv','upnphost','dnscache'
foreach($ServiceName in $Servs)
    {
        Stop-Service $ServiceName
        Get-Service $ServiceName | Where {$_.Status -eq 'Stopped'} | Start-Service 
        Restart-Service $ServiceName
    }
#Refresh IP Settings
netsh int ip reset
netsh winsock reset catalog
netsh int ipv4 reset
netsh int ipv6 reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns