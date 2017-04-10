@echo off
rem ***********************************************************
rem *
rem * Script to run C++ programs using the RALICE library
rem *
rem * Usage : submit test.cc
rem *
rem * This will run the C++ code in the file "test.cc"
rem * The output will be written into the file "test.cc.log"
rem *
rem * --- NvE 26-sep-1997 UU-SAP Utrecht
rem ***********************************************************
rem 
set JOBNAME=%1
rem ---
echo ***
echo *** Running "%JOBNAME%" in batch mode ***
echo ***
rem ---
rem *** Create the CMZ batch kumac file ***
echo file c:\nick\cxx\source\ralice -r -x > %JOBNAME%.kumac
echo seq headers >> %JOBNAME%.kumac
echo rel ralice >> %JOBNAME%.kumac
echo crea cmrun >> %JOBNAME%.kumac
echo ci -is %1 >> %JOBNAME%.kumac
echo set . -INC >> %JOBNAME%.kumac
echo set cmrun.cc -F C++ >> %JOBNAME%.kumac
echo cc * >> %JOBNAME%.kumac
echo exit >> %JOBNAME%.kumac
rem ---
echo Executing CMZ ...
c:\cmz\cmz -b %JOBNAME% > %JOBNAME%.tmp
rem ---
echo Loading ...
g++ -s -g0 -o cmrun.exe *.o -Lc:/nick/cxx/libs -lralice >> %JOBNAME%.log
rem ---
echo Execution ...
cmrun.exe >> %JOBNAME%.log
rem ---
del cmrun.*
del cmexec.*
del %JOBNAME%.kumac
del %JOBNAME%.tmp
rem ---
echo ***
echo *** Job finished. Results in "%JOBNAME%.log" ***
echo ***