#This Script Activates Windows Disk CleanMgr on any windows system, from vista to 10, from Server 2008 to Server 2019
#Must be run as admin
Copy-Item -Path “C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe” -Destination “%systemroot%\System32”
Copy-Item -Path “C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui” -Destination “%systemroot%\System32\en-US”
