#Elsewhen Technology Scripts
#Author: Nic "Rant" Colon
#This Script Activates Windows Disk CleanMgr on any windows system, from vista to 10, from Server 2008 to Server 2019
#Must be run as admin
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
        $newProcess.Arguments = $myInvocation.MyCommand.Definition;

        # Indicate that the process should be elevated
        $newProcess.Verb = "runas";

        # Start the new process
        [System.Diagnostics.Process]::Start($newProcess);

        # Exit from the current, unelevated, process
        exit
    }
$Fixable = Test-Path “C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe”
If ($Fixable -eq $True)
  {
    Copy-Item -Path “C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe” -Destination “%systemroot%\System32”
    Copy-Item -Path “C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui” -Destination “%systemroot%\System32\en-US”
  }
If ($Fixable -eq $False)
  {
  Write-Host "Cleanmgr is not fixable on this system"
  }
