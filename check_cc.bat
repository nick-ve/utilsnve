@echo off
rem ****************************************************************************
rem *   Script to strictly check C++ code for ANSI standard.
rem *
rem * Usage :
rem * -------
rem * check_cc test.cxx
rem *
rem * This will check test.cxx for correct ANSI C++ statements
rem *
rem * --- NvE 01-jun-2001 UU-SAP Utrecht
rem ****************************************************************************

echo .
echo === Code checker for standard ANSI C++ usage ===
echo .

rem --- The option strings for MSVC++ DLL compilation and linking ---
set mscomp=/nologo /c /TP /Za /W4 /MD /I%ROOTSYS%\include

echo *** Checking of all the source code in directory zzz_check
echo.
cl %mscomp% %1
del *.obj
echo.
echo *** Checking done.
rem --- End of script ---
