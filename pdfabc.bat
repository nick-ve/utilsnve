@echo off
rem ***********************************************************
rem *
rem * Script to produce pdf output of an ABC music file.
rem *
rem * Usage examples (see ABC2MTEX manual for details) :
rem * --------------------------------------------------
rem * pdfabc test
rem * pdfabc test:1
rem * pdfabc test:1-3,5,9
rem * pdfabc test:1-3,5,9-
rem * pdfabc test:1 -t:1:-3
rem * pdfabc test:1 -t:_4
rem *
rem * This will produce a file "score.pdf" from the file "test.abc"
rem * In case transpositions are made, a file "transpose.abc" is
rem * produced as well.
rem *
rem * --- Nick van Eijndhoven 16-dec-2008 NCFS
rem ***********************************************************

if "%1" == "" goto help

echo .
echo ***
echo *** Conversion into LaTeX : abc2mtex -x %2 %1
echo ***
rem ---
rem *** 1st step : abc2mtex processing ***
abc2mtex -x -o zzzmusic.tex %2 %1
rem ---
rem *** 2nd step : pdflatex processing ***
pdflatex zzzmusic
rem ---
rem *** 3rd step : musixflx processing ***
musixflx zzzmusic
rem ---
rem *** 4th step : pdflatex processing ***
pdflatex zzzmusic
rem ---
move zzzmusic.pdf score.pdf
del zzzmusic.*
del abc2mtex.log
rem ---
echo .
echo ***
echo *** Finished : abc2mtex -x %2 %1
echo *** and subsequent MusiXteX processing via pdflatex.
echo ***
echo *** Final product in file : score.pdf
echo ***
goto end

rem --- Display of the help info --- 
:help
echo ***********************************************************
echo *
echo * Script to produce pdf output of an ABC music file.
echo *
echo * Usage examples (see ABC2MTEX manual for details) :
echo * --------------------------------------------------
echo * pdfabc test
echo * pdfabc test:1
echo * pdfabc test:1-3,5,9
echo * pdfabc test:1-3,5,9-
echo * pdfabc test:1 -t:1:-3
echo * pdfabc test:1 -t:_4
echo *
echo * This will produce a file "score.pdf" from the file "test.abc"
echo * In case transpositions are made, a file "transpose.abc" is
echo * produced as well.
echo *
echo * --- Nick van Eijndhoven 16-dec-2008 NCFS
echo ***********************************************************

:end
echo .
rem --- End of script ---