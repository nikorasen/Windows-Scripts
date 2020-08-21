Repair-Volume -Filesystemlabel Recovery -Scan
dism /online /cleanup-image /checkhealth
dism /online /cleanup-image /scanhealth
dism /online /cleanup-image /restorehealth
dism /online /cleanup-image /analyzecomponentstore
dism /online /cleanup-image /startcomponentcleanup
dism /online /cleanup-image /StartComponentCleanup /Resetbase
sfc /scannow