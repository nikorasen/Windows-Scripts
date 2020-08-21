$Date = Get-Date -Format "MM/dd/yyyy"
cmd.exe | schtasks /create /tn "Scheduled Reboot" /tr "shutdown /r t/ 0" /sc once /st 00:00:00 /sd $_.Date /ru "System"