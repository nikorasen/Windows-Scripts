Import-Module ActiveDirectory
# Change the users listed under users to edit the script for use on other domains
$Users = @('ablackwell','asheaffer','bshumaker','corwell','cjones','dfik','dmatwey','fheavrin','hreffett','jswain','jwelch','kbandy','kdawson','kkuntz','kmanning','lspringer','minglish','mpowell','mweseli','rblackgrave','slutterbach','smartin','smeyer','smyer')
Foreach ($User in $Users)
{
    Remove-ADUser -Identity $User
}