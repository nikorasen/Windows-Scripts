#Updates windows to most current available version
#Enables Remote Updates
Enable-WURemoting
#Clean Windows Updates first
Get-Service -Name wuauserv |
Stop-Service -Force -Verbose -ErrorAction SilentlyContinue
Get-Service -Name bits |
Stop-Service -Force -Verbose -ErrorAction SilentlyContinue
Get-Service -Name cryptsvc |
Stop-Service -Force -Verbose -ErrorAction SilentlyContinue
Get-Service -Name msiserver |
Stop-Service -Force -Verbose -ErrorAction SilentlyContinue
Get-ChildItem "C:\Windows\SoftwareDistribution\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue |
Remove-Item -force -Verbose -Recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\Windows\Temp\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue |
Where-Object { ($_.CreationTime -lt $(Get-Date).AddDays(-$DaysToDelete)) } | 
remove-item -force -Verbose -recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\users\*\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue |
Where-Object { ($_.CreationTime -lt $(Get-Date).AddDays(-$DaysToDelete))} | 
remove-item -force -Verbose -recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue | 
Where-Object {($_.CreationTime -le $(Get-Date).AddDays(-$DaysToDelete))} | 
remove-item -force -recurse -ErrorAction SilentlyContinue 
Get-ChildItem "C:\inetpub\logs\LogFiles\*" -Recurse -Force -ErrorAction SilentlyContinue | 
Where-Object { ($_.CreationTime -le $(Get-Date).AddDays(-60)) } | 
Remove-Item -Force -Verbose -Recurse -ErrorAction SilentlyContinue
$objFolder.items() | ForEach-Object { Remove-Item $_.path -ErrorAction Ignore -Force -Verbose -Recurse } 
Cleanmgr autoclean
#Checks for and repairs componenet store corruption
C:\Windows\Sysnative\DISM.exe /online /cleanup-image /ScanHealth |
C:\Windows\Sysnative\DISM.exe /online /cleanup-image /RestoreHealth ; sfc /scannow
#Restart Update Services
Start-Service wuauserv
Start-Service Bits
Start-Service Cryptsvc
Start-Service msiserver
#Add Updates for other microsoft products
Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d
#Force Check for updates
(New-Object -ComObject Microsoft.Updte.AutoUpdate).DetectNow()
#Source folder
$SourceFolder = "c:\temp"

#Crete new Powershell object
$KBArrayList = New-Object -TypeName System.Collections.ArrayList 

#Mofify KB article list
$KBArrayList.AddRange(@("KB4494453","KB4537557","KB4532998","KB4530739","KB4523201","KB4516059")) 

foreach ($KB in $KBArrayList) { 
    if (-not(Get-Hotfix -Id $KB)) { 
        Start-Process -FilePath "wusa.exe" -ArgumentList "$SourceFolder$KB.msu /quiet /norestart" -Wait } 
}
#Force Download and Install of updates
#Gets Latest Windows Build
#Get-WindowsUpdate -ForceDownload -ForceInstall -AcceptAll -AutoReboot -kbarticleid '4535996'
Get-WindowsUpdate -ForceDownload -ForceInstall -AcceptAll -IgnoreReboot