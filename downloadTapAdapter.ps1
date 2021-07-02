#Script to Download TAP Virtual Adapter
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://build.openvpn.net/downloads/releases/tap-windows-9.23.2-I601-Win10.exe" -OutFile "c:/temp/tap-windows-9.23.2-I601-Win10.exe.exe"