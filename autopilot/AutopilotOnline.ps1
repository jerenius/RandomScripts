$modulespath = (get-location).tostring() + "modules"
$env:psmodulepath = $env:psmodulepath + ";" +$modulespath

Install-PackageProvider NuGet -Force


.\Get-WindowsAutopilotInfo.ps1 -online