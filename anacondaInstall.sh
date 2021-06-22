#!/bin/bash
#Script to finish install of Anaconda
#anaconda download script must precede this script
start /wait "" Anaconda3-2021.05-Windows-x86.exe /InstallationType=JustMe /AddToPath=1 /S /D=c:/temp/Anaconda3-2021.05-Windows-x86.exe
#line below is for testing purposes 
#start /wait "" Anaconda3-2021.05-Windows-x86.exe /InstallationType=JustMe /AddToPath=1 /S /D=c:/temp/Anaconda3-2021.05-Windows-x86.exe