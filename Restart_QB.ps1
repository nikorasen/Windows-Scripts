#Elsewhen Technology Scripts
#Author: Nic "Rant" Colon
#Last Update: 08/21/2020
#This is a script template written to restart a specified service. It checks if the service is running and restarts it if it isnt running
[Array] $Servs = 'QuickBooksDB28';  #replace 'service' with the name of the service that needs checked/restarted
#
#Looper variable, helps the script run perpetually
$ver = $host | select version
if ($ver.Version.Major -gt 1)  {$Host.Runspace.ThreadOptions = "ReuseThread"}

# Verify that user running script is an administrator
$IsAdmin=[Security.Principal.WindowsIdentity]::GetCurrent()
If ((New-Object Security.Principal.WindowsPrincipal $IsAdmin).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator) -eq $FALSE)
    {
      "`nERROR: You are NOT a local administrator.  Run this script after logging on with a local administrator account."
        # We are not running "as Administrator" - so relaunch as administrator

        # Create a new process object that starts PowerShell
        $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell.exe";

        # Specify the current script path and name as a parameter
        $newProcess.Arguments = “C:\Restart_QB.ps1” ##Path to running script

        # Indicate that the process should be elevated
        $newProcess.Verb = "runas";

        # Start the new process
        [System.Diagnostics.Process]::Start($newProcess);

        # Exit from the current, unelevated, process
        exit
    }
$Looper=0
while($Looper = 0)
{
    foreach($ServiceName in $Servs)
    {
        Get-Service $ServiceName | Where {$_.Status -eq 'Stopped'} | Start-Service
        Set-Service $ServiceName -StartupType Automatic 
    }
    Start-Sleep -s 1800
}