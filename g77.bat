@echo off
rem *** MS-DOS portable F77 compiler based on F2C of the DJGPP package *** 
rem *** Nick van Eijndhoven 15-jul-1995 SAP Utrecht ***
rem
echo.
echo *************************************************
echo * G77 : DJGPPX package used temporarily for F2C *
echo *************************************************
echo.
rem
rem --- Temp. environment settings to access DJGPP V1 ---
set G771=%PATH%
set G772=%DJGPP%
set DJGPP=C:\DJGPPX\DJGPP.ENV
set PATH=C:\DJGPPX\BIN;%PATH%
rem
rem --- Convert F77 to C and compile ---
f2c -aA %1
gcc -c -g0 *.c 
del *.c
rem
rem --- Reset environment ---
set PATH=%G771%
set DJGPP=%G772%
