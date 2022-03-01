#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
#.______    __          ___       ______  __  ___ .______     ______    __  .__   __. .___________.##  
#|   _  \  |  |        /   \     /      ||  |/  / |   _  \   /  __  \  |  | |  \ |  | |           |## 
#|  |_)  | |  |       /  ^  \   |  ,----'|  '  /  |  |_)  | |  |  |  | |  | |   \|  | `---|  |----`##  
#|   _  <  |  |      /  /_\  \  |  |     |    <   |   ___/  |  |  |  | |  | |  . `  |     |  |####### 
#|  |_)  | |  `----./  _____  \ |  `----.|  .  \  |  |      |  `--'  | |  | |  |\   |     |  |#######         
#|______/  |_______/__/     \__\ \______||__|\__\ | _|       \______/  |__| |__| \__|     |__|#######         
#####################################################################################################                                                                                                
####################################╔═╗╔╗╔╔═╗╔═╗///╔╦╗╔═╗╔═╗╔═╗╔╗╔╔═╗╔═╗#############################
####################################╚═╗║║║╠═╣╠═╝/// ║║║╣ ╠╣ ║╣ ║║║╚═╗║╣ ###### Ver 2.2 04/09/2021 ###
####################################╚═╝╝╚╝╩ ╩╩/////═╩╝╚═╝╚  ╚═╝╝╚╝╚═╝╚═╝#############################

###########
# EDIT ME
###########

#Customer UID found in URL From Blackpoint Portal
$CustomerUID = "b2b48649-463c-473b-a80d-1ef6a34f56f0"

#Snap Installer name
$CompanyEXE = "KokomoRescueMission_snap_installer.exe" 

##############################
# DO NOT EDIT PAST THIS POINT
##############################

#Installer Name
$InstallerName = "snap_installer.exe"

#InstallsLocation
$InstallerPath =  Join-Path $env:TEMP $InstallerName

#Snap URL
$DownloadURL = "https://portal.blackpointcyber.com/installer/$CustomerUID/$CompanyEXE"

#Service Name
$SnapServiceName = "Snap"

#Enable Debug with 1
$DebugMode = 1 

#Failure message
$Failure = "Snap was not installed Successfully. Contact support@blackpointcyber.com if you need more help."

function Get-TimeStamp {
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
}


#Checking if the Service is Running
function Snap-Check($service)
{
    if (Get-Service $service -ErrorAction SilentlyContinue)
    {
        return $true
    }
    return $false
}

#Debug 
function Debug-Print ($message)
{
    if ($DebugMode -eq 1)
    {
        Write-Host "$(Get-TimeStamp) [DEBUG] $message"
    }
}

#Checking .NET Ver 4.6.1
function Net-Check {
    #Left in to help with troubleshooting
    #$cimreturn = (Get-CimInstance Win32_Operatingsystem | Select-Object -expand Caption -ErrorAction SilentlyContinue) 
    #$windowsfull =  $cimreturn
    #$WindowsSmall = $windowsfull.Split(" ")
    #[string]$WindowsSmall[0..($WindowsSmall.Count-2)]
    #If ($WindowsSmall -eq $Windows10) {  
    
    Debug-Print("Checking for .NET 4.6.1+...") 
    #Calls Net Ver 
        If (! (Get-ItemProperty "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release -gt 394254){
                   

        $NetError = "SNAP needs 4.6.1+ of .NET...EXITING" 
        Write-Host "$(Get-TimeStamp) $NetError"
        exit 0
        }
        
        {
        Debug-Print ("4.6.1+ Installed...")
        }
           
}

#Downloads file
function Download-Installer {
    Debug-Print("Downloading from provided $DownloadURL...")
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $Client = New-Object System.Net.Webclient
    try
    {
        $Client.DownloadFile($DownloadURL, $InstallerPath)
    }
    catch
    {
    $ErrorMsg = $_.Exception.Message
    Write-Host "$(Get-TimeStamp) $ErrorMsg"
    }
    If ( ! (Test-Path $InstallerPath) ) {
        $DownloadError = "Failed to download the SNAP Installation file from $DownloadURL"
        Write-Host "$(Get-TimeStamp) $DownloadError" 
        throw $Failure
    }
    Debug-Print ("Installer Downloaded to $InstallerPath...")

}

#Installation 
function Install-Snap {
    Debug-Print ("Verifying AV did not steal exe...")
    If (! (Test-Path $InstallerPath)) {
    {
        $AVError = "Something, or someone, deleted the file."
        Write-Host "$(Get-TimeStamp) $AVError"
        throw $Failure
    }
    }
    Debug-Print ("Unpacking and Installing agent...")
    Start-Process -NoNewWindow -FilePath $InstallerPath -ArgumentList "-y"    
}

function runMe {
    Debug-Print("Starting...")
    Debug-Print("Checking if SNAP is already installed...")
    If ( Snap-Check($SnapServiceName) )
    {
        $ServiceError = "SNAP is Already Installed...Bye." 
        Write-Host "$(Get-TimeStamp) $ServiceError"
        exit 0
    }
    Net-Check
    Download-Installer
    Install-Snap
  # Error-Test
    Write-Host "$(Get-TimeStamp) Snap Installed..."
}

try
{
    runMe
}
catch
{
    $ErrorMsg = $_.Exception.Message
    Write-Host "$(Get-TimeStamp) $ErrorMsg"
    exit 1
}
# SIG # Begin signature block
# MIIFcwYJKoZIhvcNAQcCoIIFZDCCBWACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUrPphToybRSY+yLRM0o/jHtC7
# XHigggMMMIIDCDCCAfCgAwIBAgIQcw1MEhUr8JRLS3RhQyGzPjANBgkqhkiG9w0B
# AQsFADAcMRowGAYDVQQDDBFLUk0gQlAgRGVwbG95bWVudDAeFw0yMjAzMDExNzU3
# MTdaFw0yMzAzMDExODE3MTdaMBwxGjAYBgNVBAMMEUtSTSBCUCBEZXBsb3ltZW50
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA39YIOdsH0RUl6BeQbGAJ
# YNHJScNSMsla8bfuualQKi6y7zYPzbeomz1VLwpWDa/gXT/jHsph+Fgucnf1p14t
# YP3alQKgbVeX3TbnAu4g1hrA1N5UsYa3dXMMh/I/TixgU7cBdUXkJ9swIQuRWYV/
# +egEolWpGkge37sMDqxgpcELDoS5V1S71TYlzsQei1f0nX0Mr3i/IoYLB0lE9Ek3
# KURcrMdS+BmtfpllNv/Fa9YWPdtumvTJ2Yrt5owYgBNT3fGqT/vFnFsV1mqP0rA8
# 2HjdslrPP5aun4/eQiUPeuGEUBdNLSAzjDAShNTfMRDXxQv0QV1LXk0H4qBen74D
# cQIDAQABo0YwRDAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMw
# HQYDVR0OBBYEFHC4GvCeZWvRbt9EYTi2UUz1xRdgMA0GCSqGSIb3DQEBCwUAA4IB
# AQCfXF9fwm1QERFS2egjOt/+vP9tPvPJ4+bKEYuZCBjys/FBleD2+/joJLgjJmOe
# R2l64Bg90TGcRFeezhAgwewfpUmbvfGI54Pp4rwFBd6ufItWmE0CTrn9aNZi/rW1
# WngSFBrhFw0PcEqvd5RPXFoGt96pjZC7rSRaMGIMa3p2fnm+iClKgHN2/zHgDZt+
# z7x7AUOxb7h77tyHGoP+HuAgAn4Xg8I9hMZCUBaUnCdYw62IufsTww6QP9V6CR/O
# 4AdAkxCFggMfPYH+hDwKzNKmdfR0wv8GpU91m6fxMgrqxnBComFXo9PPq26XcQFX
# ugQvX+o7VQ5MJtm1MBrokfkTMYIB0TCCAc0CAQEwMDAcMRowGAYDVQQDDBFLUk0g
# QlAgRGVwbG95bWVudAIQcw1MEhUr8JRLS3RhQyGzPjAJBgUrDgMCGgUAoHgwGAYK
# KwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIB
# BDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU
# HTEFnxfisnTt6CSoLUWqBn3kK30wDQYJKoZIhvcNAQEBBQAEggEAtPiHpnu3UmFq
# z8ftKFKg8+cuUFHnkYOCpZ6d5yO4WQ61rUkgvwJKNz5jhr2T/xumkekwTTLGGBj6
# PftAV7u2HYKtiffizaZa3fC+qkLAizhWZVnqKR2oAmhPPbLblaIqwXAkrhGKePlB
# QFzGVSI8tll483WWmQQj8HrBsE9engdF3sGJQbb5ONEEW1pmkqwqb8EWRzTP0y9N
# MWnaRtlTq8fDXTEIZaO4PgPCeNhxqP1rOjQUUNZId2ybyRDtX1kJRq+nE895jQHK
# EHp5bSromivt+GDyxQcZqYaa6pP4xuJ+sSF0QlpbGTxTnqW9lCuzYvvsocgNv3GQ
# S+7fYQCHMQ==
# SIG # End signature block
