#After allowing scripts to be run on the system, run as administrator to update OS
install-module -name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d
Get-WindowsUpdate
Download-WindowsUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot -RunNow -Force 