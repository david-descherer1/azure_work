#Script to Install Anaconda3 on Windows without UI
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://repo.anaconda.com/archive/Anaconda3-2021.05-Windows-x86.exe" -OutFile "c:/temp/Anaconda3-2021.05-Windows-x86.exe"