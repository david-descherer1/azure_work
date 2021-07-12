#!/bin/bash
#0003 has to be identified or try to understand it
#must disable and enable adapter using powershell (or find other way)

#reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318} /v Manufacturer

#may need to switch to %% for final file

SET fileEnd=""
#check single digit folders to see if they contain Manufacturer key and if key value is "TAP-Windows" set fileEnd to current folder number
for /l %x in (1,1,9) do for /F "tokens=3" %A in ('reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}\000%x /v Manufacturer') DO if %A==TAP-Windows SET fileEnd=%x
#same check for double digits
for /l %x in (10,1,99) do for /F "tokens=3" %A in ('reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}\00%x /v Manufacturer') DO if %A==TAP-Windows SET fileEnd=%x

#if statement
if %fileEnd% LSS 10 reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}\000%fileEnd% /v MAC /d 000D3A8B8316 /f 
if %fileEnd% GEQ 10 reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}\00%fileEnd% /v MAC /d 000D3A8B8316 /f 
if %fileEnd%=="" echo TAP Adapter was not found
#need statement to check if the mac address has been changed
#testing to check if fileEnd is correct value
#for /F "tokens=3" %A in ('reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}\000%fileEnd% /v Manufacturer') DO (Echo %A)

