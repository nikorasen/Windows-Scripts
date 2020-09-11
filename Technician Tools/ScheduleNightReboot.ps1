#Elsewhen Techology Scripts
#Author: Nic "Rant" Colon
#Last Update: 09/11/2020
#This script scheduled the target device for a reboot for midnight of whatever day the script is run on. 
$Date = Get-Date -Format "MM/dd/yyyy"
cmd.exe | schtasks /create /tn "Scheduled Reboot" /tr "shutdown /r t/ 0" /sc once /st 00:00:00 /sd $_.Date /ru "System"
