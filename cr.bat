@echo off
rem set OLD2=%HOME%
rem set HOME=c:\cmz
c:\cmz\cmz -x -r %1 %2 %3 %4
del cmedt.edt
del lastcmz.kumac
del cmfile*.*
rem set HOME=%OLD2%
