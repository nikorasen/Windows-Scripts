#Elsewhen Technology Scripts
#Author: Nic Colon
#Last Update: 08/25/2020
#Perpetual Drive Mapper
#This script checks to see if a specified mapped network location is being used or not. If it isn't, this script adds it. 
$Keystone = 0
while($Keystone -eq 0) 
    {
    if(Test-Path "\\Ortman-Server\Shared" -ne $true)
        {New-SmbMapping -LocalPath "S" -RemotePath "\\Ortman-Server\Shared"
        }
    Start-Sleep -s 300
    }