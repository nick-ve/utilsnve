@echo off
rem ***********************************************************
rem *
rem * Script to compile C++ programs using MSVC++
rem *
rem * Usage : compile test.cxx
rem *
rem * This will run the MSVC++ compiler on the file "test.cxx"
rem *
rem * --- NvE 03-dec-1998 UU-SAP Utrecht
rem ***********************************************************
rem 
echo ***
echo *** Compilation of %1 ***
echo ***
rem ---
rem *** MSVC++ compilation options ***
set mscomp=/nologo /c /TP /Za /MD /I%ROOTSYS%\include
rem ---
echo Compilation ...
cl %mscomp% %1
rem ---
rem ---
del %1.obj
rem ---
echo ***
echo *** Compilation finished. ***
echo ***