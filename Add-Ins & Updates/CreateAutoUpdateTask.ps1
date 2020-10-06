#Schedules Scripted Maintenance Tasks
Function SchTask1
    {
    $User = "NT AUTHORITY\SYSTEM"
    $Script = "C:\EWT\Scripts\AutoUpdate.ps1" #edit at scripter discretion, able to schedule any script to run
    $Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument $Script
    $Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Saturday -At 1am
    Register-ScheduledTask -TaskName "Automatic Update Weekly" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest -Force
    }
Function SchTask2
    {
    $User = "NT AUTHORITY\SYSTEM"
    $Script = "C:\EWT\Scripts\AutoUpdate.ps1" #edit at scripter discretion, able to schedule any script to run
    $Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument $Script
    $Trigger = New-ScheduledTaskTrigger -Once -At 1am
    Register-ScheduledTask -TaskName "Automatic Update Weekly" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest -Force
    }