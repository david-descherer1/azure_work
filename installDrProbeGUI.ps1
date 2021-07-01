#Script to install Dr. Probe GUI
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://er-c.org/barthel/drprobe/InstallDrProbe_1_10_1.zip" -OutFile "c:/temp/InstallDrProbe_1_10_1.zip"
Expand-Archive "c:\\temp\\InstallDrProbe_1_10_1.zip" "c:\\temp"
& "c:\\temp\\InstallDrProbe.exe" /run /exit /SilentMode