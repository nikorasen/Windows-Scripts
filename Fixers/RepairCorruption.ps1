#Checks Health of filesystem and hard drive and fixes any errors it can
wmic diskdrive get status
chkdsk C: /f /r /x 
y
chkdsk
diskpart
select volume 1
recover
select volume 2
recover
select volume 3
recover
exit
Repair-Volume -DriveLetter C -Scan ; Repair-Volume -DriveLetter C -Spotfix ; Repair-Volume -DriveLetter C -OfflineScanAndFix
C:\Windows\Sysnative\dism.exe /online /cleanup-image /checkhealth ; C:\Windows\Sysnative\dism.exe /online /cleanup-image /scanhealth ; C:\Windows\Sysnative\dism.exe /online /cleanup-image /restorehealth
sfc /scannow