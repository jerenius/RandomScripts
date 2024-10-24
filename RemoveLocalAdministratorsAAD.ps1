# This script removes any existing users with domain AzureAD from local administrators group
# local administrators groupname is found by using univeral SID and is not language specific
# Domain part might be something different if Entra Connect is or is has been in use.
# You might need to experiment to make it work.

# You could use this script to remove local administrator privileges in ADDS environments also (tweaking required) 


$computerName = (Get-WmiObject win32_computersystem).name

$LocalGroupName = (Get-WmiObject -Query "select * from win32_group where SID='S-1-5-32-544'").name
$localdomain = "azuread"

$Group = [ADSI]("WinNT://$computerName/$localGroupName,group")
$Group.Members() |
foreach {
    $AdsPath = $_.GetType().InvokeMember('Adspath', 'GetProperty', $null, $_, $null)
    $A = $AdsPath.split('/',[StringSplitOptions]::RemoveEmptyEntries)
    $Names = $a[-1]
    $Domain = $a[-2]
    If ($Domain -eq $localdomain) {
        $Group.Remove("$AdsPath")
    }
}


