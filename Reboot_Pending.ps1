$RebootPending = $false 

#Check for 'Reboot Required' registry key 
if(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -ea SilentlyContinue) {
    $RebootPending = $true
}

#Check for 'Reboot Required' registry key 
if(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired" -ea SilentlyContinue) {
    $RebootPending = $true
}

#Check for recent installation requiring reboot 
if(Test-Path "HKLM:\SOFTWARE\Microsoft\Updates\UpdateExeVolatile" -ea SilentlyContinue) {
    $RebootPending = $true
}

#Check for PendingFileRenameOperations 
if(Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name PendingFileRenameOperations -EA SilentlyContinue) {
    $RebootPending = $true
}

$RebootPending
