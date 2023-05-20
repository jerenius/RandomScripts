$serial = (Get-WmiObject win32_bios).serialnumber
$file = ".\autopilot-$serial.csv"


.\Get-WindowsAutoPilotInfo.ps1 -OutputFile $file 
.\Get-WindowsAutoPilotInfo.ps1 -OutputFile AutoPilotAll.csv -append