#disable and enable network adapter
Disable-NetAdapter -InterfaceDescription "TAP-Windows Adapter V9" -Confirm:$false
Enable-NetAdapter -InterfaceDescription "TAP-Windows Adapter V9"
