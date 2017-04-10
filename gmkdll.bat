@echo off
rem *** Script to create a relocatable GNU-Win32 DLL from *.cc files ***
rem *
rem --- Create a file entry.cc to provide the entry point for the DLL ---
rem ---------------------------------------------------------------------*
echo #include "windows.h" >entry.cc
echo extern "C" >>entry.cc
echo { >>entry.cc
echo  int WINAPI dll_entry(HANDLE h, DWORD reason, void *ptr); >>entry.cc
echo }; >>entry.cc
echo int WINAPI dll_entry(HANDLE, DWORD reason, void *) >>entry.cc
echo { >>entry.cc
echo  return 1; >>entry.cc
echo } >>entry.cc
rem ----------------------------------------------------------------------
rem --- Create a special file fixup.cc needed for execution of the DLL ---
rem ----------------------------------------------------------------------
echo asm (".section .idata$3\n" ".long 0,0,0,0, 0,0,0,0"); >fixup.cc
rem ----------------------------------------------------------------------
rem *
rem --- Create a normal G++ library out of the .cc files
rem g++ -s -c Funcs.cc entry.cc fixup.cc
g++ -s -c %1 entry.cc fixup.cc
ar rs q.a *.o
rem *
rem --- Create the .def file
echo EXPORTS >q.def
nm q.a | egrep " [CT] " | sed s/.........T._//g >q.scr
sed s/.........C._//g q.scr >>q.def
del q.scr
rem *
rem --- Create the export file to build the DLL ---
g++ -s -nostartfiles -Wl,--dll -e _dll_entry@12 -o q.dll -Wl,--base-file=q.base *.o
dlltool --def=q.def --output-exp=q.exp --dllname=q.dll --output-lib=q.a --base-file=q.base
rem --- Now actually create the DLL ---
g++ -s -nostartfiles -Wl,--dll -e _dll_entry@12  -o q.dll *.o q.exp
rem *
rem --- Cleanup the temporary stuff
del fixup.cc
del entry.cc
del *.o
del q.exp
del q.def
del q.base
echo *** mkdll done.
