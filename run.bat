@echo off
rem ***********************************************************
rem *
rem * Script to run C++ programs in standalone mode
rem *
rem * Usage : run test.cc
rem *
rem * This will run the C++ code in the file "test.cc"
rem *
rem * --- NvE 28-apr-1998 UU-SAP Utrecht
rem ***********************************************************
rem 
echo ***
echo *** Running %1 ***
echo ***
rem ---
rem *** MSVC++ compilation and linking options ***
set mscomp=/nologo /TP /Za /MD /DWIN32 /I%ROOTSYS%\include
set mslink=%ROOTSYS%\lib\*.lib
rem ---
echo Compilation ...
cl %mscomp% %1 /link %mslink% /OUT:zzzrun.exe
rem ---
echo Execution ...
zzzrun.exe >%1.log
rem ---
del *.obj
del zzzrun.exe
rem ---
echo ***
echo *** Job finished. Output in %1.log ***
echo ***