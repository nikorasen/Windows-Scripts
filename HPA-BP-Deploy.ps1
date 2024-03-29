$Folder = "C:\EWT"
if (test-path $Folder) {
    Write-Host "Folder Exists"
}
else {
    mkdir $Folder
}
invoke-webrequest "https://portal.blackpointcyber.com/installer/c63fca65-055e-4852-a3d5-2f1f672f9479/HighPerformanceAlloys_snap_installer.exe" -Outfile "C:\EWT\HPA-Installer.exe"
$Install = "C:\EWT\HPA-installer.exe"
Start-Process -NoNewWindow -FilePath $Install -ArgumentList "-y"
# SIG # Begin signature block
# MIIFZAYJKoZIhvcNAQcCoIIFVTCCBVECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUrJ/Nwyms9iasjJ7/IJE/KY2X
# hK+gggMCMIIC/jCCAeagAwIBAgIQILF959fygJ1MCqG1BN+ICjANBgkqhkiG9w0B
# AQsFADAXMRUwEwYDVQQDDAxFV1QtVmVyaWZpZWQwHhcNMjIwMzAxMTgzOTU4WhcN
# MjMwMzAxMTg1OTU4WjAXMRUwEwYDVQQDDAxFV1QtVmVyaWZpZWQwggEiMA0GCSqG
# SIb3DQEBAQUAA4IBDwAwggEKAoIBAQC/ElBQmvrkEmFn4/H2upOWBMGTVavWFg/u
# w4Fz5mUstCVf9BCKJclPJ4Y+rNSnwnkMc4pPMd3lRQal/SzoZYjipsZGBCaOBwUQ
# Sq9DAMnx21hKXngM9++q/75q1oGP7rHxsS8g+0i4dEYOtFZvc7J+DcRtA4gDW0eg
# aAgCn+dQbqsYhQ/Fgfqt/ETmnZ5IYDFyFK1GxVOn5zrb+PBv8gHCaWG/xxtVx7t/
# omy+oVudL+qPTZXapbdqbEZ+E81dMGPGkvKF7IX+GYojn+TV3gPkLasxRoSW89PP
# sup1XxlfWZbhciKAtgi69TNnIpY8pbLCSmOuQQ2rkiskickV9+9RAgMBAAGjRjBE
# MA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQU
# nAnb/OLmCbO4mW01bYMXlLnCYkwwDQYJKoZIhvcNAQELBQADggEBACfYWMphDVHB
# q+MH5mfAEJ9YVWcrcwhmr3+bys1LOJ6U//Mb/1EtYvOvC/5k7d2/aTuY5d+506Qp
# nHc+T2BuivFubFrb2nKSR87FM/PZ40HODIEAMtQF9gPzlQazUwffqbpQbWA9lAp9
# b5383oBMLJBd9r4QmYf9jvBaBnJFuotcfQ+VpxROA/beiQXU7PEToq0t4kcd1hfC
# ILi3uKxZDi7fqLlC3hxBD0Tnw9xN89x8unAuzwFH8isaIYJR6jLKPCyMV8q5Rri0
# KAcg0seuHkcTaK6aDUgCypwDcQ3T649hCP7kvpLWZiijh6YQ7U87WzYP48buEk5n
# AtOwthyJHxgxggHMMIIByAIBATArMBcxFTATBgNVBAMMDEVXVC1WZXJpZmllZAIQ
# ILF959fygJ1MCqG1BN+ICjAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUnym7nbMUtzHStSOpsOq+
# /A0titgwDQYJKoZIhvcNAQEBBQAEggEAWAf4OUeH/qKb1tlv5K7KwdgJU+VDj3RG
# B+1DbTAulf2dtRrhz2mLLxZlwa3GlaSII0D1biTyYVya0gbDcXEPTOXzZBOALJWF
# vWlHcGoTyATzBFh8rJiGohnFme+8yCDQNKyN1UBFPjE1UDgOHOdF5DeG7SO7QhSo
# vcsfaMxGJZiKWAsMQW7D3k1EwHNTA4ox6fuzjPbjCjijj9hzx6QrZ3ylJE7YK7pI
# Tc1BmF55vnHiuGF8UlVU/4xhjGlnSX/oTX8xmOHltBYQy3LX5WEa3WXS/FVC1lfc
# 4LWUw5+H1zbGJcqMObH1P0PwIIVda024W0fk9Maj0THdMY4t6wAe+A==
# SIG # End signature block
