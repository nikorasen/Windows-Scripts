﻿#This Script Activates Windows Disk CleanMgr on any windows system, from vista to 10, from Server 2008 to Server 2019
#Must be run as admin
dism /online /cleanup-image /startcomponentcleanup
dism /online /cleanup-image /startcomponentcleanup /resetbase
dism /online /cleanup-image /spsuperseded
Copy-Item -Path “C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe” -Destination “C:\Windows\System32”
Copy-Item -Path “C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui” -Destination “C:\Windows\System32\en-US”
Copy-Item "C:\Windows\WinSxS\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.3.9600.16384_en-us_4e94cff86c9dcc30\cleanmgr.exe.mui" -Destination "C:\Windows\System32\en-US\cleanmgr.exe.mui" -Force
Copy-Item "C:\Windows\WinSxS\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.3.9600.16384_none_5e02966c3182d7a7\cleanmgr.exe" -Destination "C:\Windows\System32\cleanmgr.exe" -Force
Copy-Item -Path "C:\Windows\winsxs\amd64_micrisoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe" -Destination "C:\Windows\System32\" -Force
Copy-Item -Path "C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui" -Destination "C:\Windows\System32\en-US" -Force