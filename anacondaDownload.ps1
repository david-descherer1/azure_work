#Script to Install Anaconda3 on Windows without UI
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://repo.anaconda.com/archive/Anaconda3-2021.05-Windows-x86.exe" -OutFile "c:/temp/Anaconda3-2021.05-Windows-x86.exe"



[Environment]::SetEnvironmentVariable("PATH", "C:\Users\aibuser\anaconda3;C:\Users\aibuser\anaconda3\Library\mingw-w64\bin;C:\Users\aibuser\anaconda3\Library\usr\bin;C:\Users\aibuser\anaconda3\Library\bin;C:\Users\aibuser\anaconda3\Scripts;C:\Users\aibuser\anaconda3\bin;C:\Users\aibuser\anaconda3\condabin;C:\Users\aibuser\anaconda3;C:\Users\aibuser\anaconda3\Library\mingw-w64\bin;C:\Users\aibuser\anaconda3\Library\usr\bin;C:\Users\aibuser\anaconda3\Library\bin;C:\Users\aibuser\anaconda3\Scripts;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0;C:\Windows\System32\OpenSSH;C:\Users\aibuser\anaconda3;C:\Users\aibuser\anaconda3\Library\mingw-w64\bin;C:\Users\aibuser\anaconda3\Library\usr\bin;C:\Users\aibuser\anaconda3\Library\bin;C:\Users\aibuser\anaconda3\Scripts;C:\Users\aibuser\AppData\Local\Programs\Python\Python37-32\Scripts;C:\Users\aibuser\AppData\Local\Programs\Python\Python37-32;C:\Users\aibuser\AppData\Local\Microsoft\WindowsApps", "User")
[Environment]::SetEnvironmentVariable("PATH", "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Users\aibuser\AppData\Local\Programs\Python\Python37-32\Scripts\;C:\Users\aibuser\AppData\Local\Programs\Python\Python37-32\;C:\Users\aibuser\AppData\Local\Microsoft\WindowsApps;C:\Users\aibuser\Anaconda3\Library\bin;C:\Users\aibuser\Anaconda3\Scripts;C:\Users\aibuser\Anaconda3\condabin", "User")