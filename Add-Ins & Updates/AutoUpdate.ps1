#AutoUpdate.ps1
#Elsewhen Technology Automation Script
#Author: Nic "Rant" Colon
#Last Updated: 08/17/2020
#This script is for scheduled tasks, it automatically checks for, downloads, and installs updates once a week without user input
Get-Windowsupdate -microsoftupdate -ForceDownload -ForceInstall -acceptall -confirm:$false
Download-WindowsUpdate -MicrosoftUpdate -AcceptAll -Confirm:$False
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot -Confirm:$False
