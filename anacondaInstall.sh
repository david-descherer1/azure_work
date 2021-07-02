#!/bin/bash
#Script to finish install of Anaconda
#anaconda download script must precede this script
start /wait "" Anaconda3-2021.05-Windows-x86.exe /InstallationType=JustMe /AddToPath=1 /S /D=c:/temp/Anaconda3-2021.05-Windows-x86.exe
#line below is for testing purposes 
#start /wait "" Anaconda3-2021.05-Windows-x86.exe /InstallationType=JustMe /AddToPath=1 /S /D=c:/temp/Anaconda3-2021.05-Windows-x86.exe
SETX PATH "%PATH%;C:\Users\aibuser\anaconda3\Library\bin;C:\Users\aibuser\anaconda3\Scripts;C:\Users\aibuser\anaconda3"
SETX PATH "C:\Users\aibuser\anaconda3\Library\bin;C:\Users\aibuser\anaconda3\Scripts;C:\Users\aibuser\anaconda3\condabin"