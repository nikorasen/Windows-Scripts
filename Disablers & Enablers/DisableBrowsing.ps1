#Elsewhen Technology Scripts
#Author: Nic "Rant" Colon
#Last Review Date: 08/18/2020
#Disables any kind of Web Browsing on target device, must be run as Admin
new-netfirewallrule -displayname "Disable Web Browsing FF" -Direction Outbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Block
new-netfirewallrule -displayname "Disable Web Browsing ED" -Direction Outbound -Program "C:\Windows\SystemApps\Microsoft.MicrosoftEdge8ewkyb3d8bbwe\MicrosoftEdge.exe" -Action Block
New-NetFirewallRule -DisplayName "Disable Web Browsing CH" -Direction Outbound -Program "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -Action Block
New-NetFirewallRule -DisplayName "Disable Web Browsing IE" -Direction Outbound -Program "C:\Program Files\Internet Explorer\iexplore.exe" -Action Block