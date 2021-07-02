#Script to install CUDA Toolkit Version 9.0
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://developer.nvidia.com/compute/cuda/9.0/Prod/network_installers/cuda_9.0.176_win10_network-exe" -OutFile "c:/temp/cuda_9.0.176_win10_network.exe"
Invoke-WebRequest -Uri "https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_9.0.176.1_windows-exe" -OutFile "c:/temp/cuda_9.0.176.1_windows.exe"
Invoke-WebRequest -Uri "https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_9.0.176.2_windows-exe" -OutFile "c:/temp/cuda_9.0.176.2_windows.exe"
Invoke-WebRequest -Uri "https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_9.0.176.3_windows-exe" -OutFile "c:/temp/cuda_9.0.176.3_windows.exe"
Invoke-WebRequest -Uri "https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_9.0.176.4_windows-exe" -OutFile "c:/temp/cuda_9.0.176.4_windows.exe"
Start-Process -FilePath “c:/temp/cuda_9.0.176_win10_network.exe” -ArgumentList “-s” -Wait -NoNewWindow
#test