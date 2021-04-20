If (Test-path "$env:USERPROFILE\Recycle Bin Backup")
{
    Remove-Item "$env:USERPROFILE\Recycle Bin Backup" -Recurse -Force -Confirm:$false
}