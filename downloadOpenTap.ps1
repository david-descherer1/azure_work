#Script to Download OpenTap
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://www.opentap.io/docs/OpenTAP.9.14.0+51e7081e.exe" -OutFile "c:/temp/OpenTAP.9.14.0+51e7081e.exe"