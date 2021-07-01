#Script to install muStem
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#Download and Expand CPU Single Precision
Invoke-WebRequest -Uri "https://github.com/HamishGBrown/MuSTEM/raw/master/Executables/CPU_muSTEM_x64_v5.3_single_precision.zip" -OutFile "c:/temp/CPU_muSTEM_x64_v5.3_single_precision.zip"
Expand-Archive "c:/temp/CPU_muSTEM_x64_v5.3_single_precision.zip" "c:\\temp"

#Download and Expand CPU Double Precision
Invoke-WebRequest -Uri "https://github.com/HamishGBrown/MuSTEM/raw/master/Executables/CPU_muSTEM_x64_v5.3_double_precision.zip" -OutFile "c:/temp/CPU_muSTEM_x64_v5.3_double_precision.zip"
Expand-Archive "c:/temp/CPU_muSTEM_x64_v5.3_double_precision.zip" "c:\\temp"

#Download and Expand GPU/CUDA Single Precision
Invoke-WebRequest -Uri "https://github.com/HamishGBrown/MuSTEM/raw/master/Executables/CUDA_muSTEM_x64_v5.3_single_precision.zip" -OutFile "c:/temp/CUDA_muSTEM_x64_v5.3_single_precision.zip"
Expand-Archive "c:/temp/CUDA_muSTEM_x64_v5.3_single_precision.zip" "c:\\temp"

#Download and Expand GPU/CUDA Double Precision
Invoke-WebRequest -Uri "https://github.com/HamishGBrown/MuSTEM/raw/master/Executables/CUDA_muSTEM_x64_v5.3_double_precision.zip" -OutFile "c:/temp/CUDA_muSTEM_x64_v5.3_double_precision.zip"
Expand-Archive "c:/temp/CUDA_muSTEM_x64_v5.3_double_precision.zip" "c:\\temp"