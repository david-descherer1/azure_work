#Script to install Dr. Probe GUI
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://www.dropbox.com/s/ml534wztyxeottk/InstallDrProbe_1_10_1.zip?dl=0" -OutFile "c:/temp/InstallDrProbe_1_10_1.zip"
Expand-Archive "c:\\temp\\InstallDrProbe_1_10_1.zip" "c:\\temp"
& "c:\\temp\\InstallDrProbe.exe" /run /exit /SilentMode