$ErrorActionPreference = SilentlyContinue
# First Check for and or create the backup directory
$BkLoc = Test-Path "$env:USERPROFILE\Recycle Bin Backup"
If ($BkLoc = "False") 
{
    Mkdir "$env:USERPROFILE\Recycle Bin Backup"
}
# Then Get a list of the items in the Recycle Bin
function Get-RB
{
    (New-Object -ComObject Shell.Application).Namespace(0x0a).Items() |
    select-object Name, Size, Path
}
Get-RB | Out-File "$env:USERPROFILE\Recycle Bin Backup\Recycled Items List.txt"
#Then Copy the items in the recycle bin
$SID = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
copy-item C:\"$"Recycle.Bin\$SID\* -Destination "$env:USERPROFILE\Recycle Bin Backup" -force -recurse 
Clear-RecycleBin -Force -Confirm:$false