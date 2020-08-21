#Restarts the Ninja Service, ensures that it is set to automatic
Stop-Service NinjaRMMAgent
Start-Service NinjaRMMAgent
Restart-Service NinjaRMMAgent
Set-Service NinjaRMMAgent -StartupType Automatic
Start-Service NinjaRMMAgent