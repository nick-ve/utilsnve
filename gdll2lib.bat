@echo off
rem *** Script to create a GCC linkable library from a DLL ***
rem --- Usage : dll2lib name
rem --- This will use the file name.dll to create the library name.a
rem --- Create the .def file
impdef %1.dll >%1.def
rem --- Create the GCC linkable library file ---
dlltool --dllname=%1.dll --def=%1.def --output-lib=%1.a -k
rem del %1.def
echo *** dll2lib done.
