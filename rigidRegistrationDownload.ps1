#Rigid Registration Package Download
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://github.com/bsavitzky/rigidRegistration/archive/master.zip" -OutFile "c:/temp/rigidRegistration.zip"
Expand-Archive "c:/temp/rigidRegistration.zip" "c:\\temp"