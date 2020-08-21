#Elsewhen Technology Scripts
#Author: Nic "Rant" Colon
#Last Review Date: 08/18/2020
#Script to enable web browsing apps
remove-netfirewallrule -DisplayName "Disable Web Browsing FF"
remove-netfirewallrule -DisplayName "Disable Web Browsing ED"
remove-netfirewallrule -DisplayName "Disable Web Browsing CH"
remove-netfirewallrule -DisplayName "Disable Web Browsing IE"