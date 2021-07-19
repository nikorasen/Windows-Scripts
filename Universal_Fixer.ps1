#Universal Fixer
#The flamethrower for your windows issues
#Cleans and restarts just about everything that could be causing errors/issues for most tasks
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
Repair-Volume -Driveletter C -Scan
Repair-Volume -DriveLetter C -SpotFix
Repair-Volume -DriveLetter C -OfflineScanAndFix
dism /online /cleanup-image /checkhealth
dism /online /cleanup-image /scanhealth
dism /online /cleanup-image /restorehealth
dism /online /cleanup-image /analyzecomponentstore
dism /online /cleanup-image /startcomponentcleanup
dism /online /cleanup-image /StartComponentCleanup /Resetbase
sfc /scannow