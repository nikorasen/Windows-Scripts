#Turns on network discovery and dependent services
Set-Service -Name FDResPub -StartupType Automatic
Set-Service -Name SSDPSRV -StartupType Automatic
Set-Service -Name upnphost -StartupType Automatic
Set-Service -Name dnscache -StartupType Automatic
Start-Service FDResPub
Start-Service SSDPSRV
Start-Service upnphost
Start-Service Dnscache
netsh advfirewall firewall set rule group="network discovery" new enable=yes
netsh firewall set service type=fileandprint mode=enable profile=all
