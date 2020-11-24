dism /mount-image /imagefile:C:\W10EWTEDT\CX\CX-WIM\install.wim /Index:1 /MountDir:C:\W10EWTEDT\Scratch /Optimize
mkdir C:\W10EWTEDT\Scratch\Windows\Windows\Panther
Copy C:\W10EWTEDT\CX\CX-Ans-Files\autounattend.xml C:\W10EWTEDT\Scratch\Windows\Windows\Panther\autounattend.xml
Copy C:\W10EWTEDT\CX\CX-Ans-Files\unattend.xml C:\W10EWTEDT\Scratch\Windows\Windows\Panther\unattend.xml
dism /unmount-image /mountdir:C:\W10EWTEDT\Scratch /commit
copy C:\W10EWTEDT\CX\CX-WIM\install.wim C:\W10EWTEDT\CX\CX-ISO-Files\sources\install.wim -force
copy C:\W10EWTEDT\CX\CX-WIM\install_W10EWTEDT.clg C:\W10EWTEDT\CX\CX-ISO-Files\sources\install_W10EWTEDT.clg -force