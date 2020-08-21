If (Test-Path -Path "C:\Program Files (x86)\Google\Update\GoogleUpdate.exe") {
Rename-item -Path "C:\Program Files (x86)\Google\Update\GoogleUpdate.exe" -NewName "DontGoogleUpdate.exe"
Rename-item -Path "C:\Program Files (x86)\Google\Update" -NewName "NoUpdate"
Echo "Google Update Successfully Disabled."}
Else { Echo "Google Update Already Disabled."}
#Uninstalls Google Drive
$Google = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Google Drive"}
$Google.Uninstall()
Uninstall-Package -Name "Google Drive" -AllVersions -Force -Confirm