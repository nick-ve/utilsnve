@echo off
rem set OLD2=%HOME%
rem set HOME=c:\cmz
c:\cmz\cmz -install %1 %2 %3 %4
del cmfile*.*
del cmexec.bat
rem set HOME=%OLD2%
