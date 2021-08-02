if (test-path "C:\EWT" -eq $False)
{
    mkdir "C:\EWT"
}
invoke-webrequest "https://cscsupportftp.mykonicaminolta.com/DownloadFile/Download.ashx?fileversionid=31327&productid=2177" -outfile "C:\EWT\bzC250iDrv.zip"
if (test-path "$env:ProgramFiles\7-zip" -eq $False)
{
    invoke-webrequest "https://www.7-zip.org/a/7z1900-x64.exe" -outfile "C:\EWT\7z1900-x64.exe"
    & "C:\EWT\7z1900-x64.exe" /S 
    start-sleep -s 120
    rm -force "C:\EWT\7*"
    new-alias 7z "$env:ProgramFiles\7-zip\7z.exe"
} elseif (test-path "$env:ProgramFiles\7-zip")
{
    new-alias 7z "$env:ProgramFiles\7-zip\7z.exe"
}
7z x "C:\EWT\bzC250iDrv.zip"
pnputil.exe -i -a C:\EWT\Driver\Drivers\PS\EN\Win_x64\*.inf
pnputil.exe -i -a C:\EWT\Driver\Drivers\PCL\EN\Win_x64\*.inf
pnputil.exe -i -a C:\EWT\Driver\Drivers\FAX\EN\Win_x64\*.inf
Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL"
$PortName = "IP_10.1.10.200"
$PortCheck = Get-PrinterPort -name $PortName -ErrorAction SilentlyContinue
if (-not $PortCheck) {Add-PrinterPort -Name $portname -PrinterHostAddress "10.1.10.200"}
Add-Printer -name "Km_c250i" -DriverName "KONICA MINOLTA Universal PCL" -Portname "IP_10.1.10.200"
$wsnObj = New-Object -COM WScript.Network
$wsnObj.SetDefaultPrinter("Km_c250i")
[string]$Uname = "CRM_Scan"
[string]$PWtxt = "CRMSoluti0ns"
[securestring]$SecPW = $PWtxt | ConvertTo-SecureString -AsPlainText -Force
New-LocalUser $Uname -Password $SecPW -FullName "Scan" -Description "Scan User"
