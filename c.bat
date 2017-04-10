@echo off
rem set OLD2=%HOME%
rem set HOME=c:\cmz
copy %1.cmz cmz.bak
c:\cmz\cmz -x %1 %2 %3 %4
choice /c:yn Do you want to save the current CMZ file
if errorlevel 2 copy cmz.bak %1.cmz
del cmz.bak
del cmedt.edt
del lastcmz.kumac
del cmfile*.*
rem set HOME=%OLD2%
