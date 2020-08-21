#Checks for and fixes hard drive corruption with all the built in cmdlets available
#Runs checkdsk and schedules a check on reboot
Chkdsk
Chkdsk /r /f /x ; echo "y"
#Runs Repair volume on the device
Get-Volume | Where Drivetype -eq 'fixed' | foreach {repair-volume -driveletter $_.driveletter -Scan}
Get-Volume | Where Drivetype -eq 'fixed' | foreach {repair-volume -driveletter $_.driveletter -SpotFix}
Get-Volume | Where Drivetype -eq 'fixed' | foreach {repair-volume -driveletter $_.driveletter -OfflineScanandFix}
Repair-Volume -Driveletter C -Scan ; Repair-Volume -DriveLetter C -SpotFix ; Repair-Volume -DriveLetter C -OfflineScanAndFix
#Repairs file integrity in most important filesystems
Repair-FileIntegrity -FileName C:\Windows
Repair-FileIntegrity -FileName C:\Temp
Repair-FileIntegrity -FileName C:\Users
Repair-FileIntegrity -FileName "C:\Program Files"
Repair-FileIntegrity -FileName "C:\Program Files (x86)"
#Runs DISM
C:\Windows\Sysnative\DISM.exe /online /cleanup-image /scanhealth
C:\Windows\Sysnative\DISM.exe /online /cleanup-image /checkhealth
C:\Windows\Sysnative\DISM.exe /online /cleanup-image /repairhealth
#SFC with scannow, chkdsk, bootrec, and a delayed reboot.
sfc /scannow
chkdsk
chkdsk /f /r /x
bootrec /rebuildbcd
bootrec /fixboot
bootrec /fixmbr
Write-Host "Filesystem corruption has been corrected. Rebooting in 15 seconds..."
Restart-Computer -delay 15