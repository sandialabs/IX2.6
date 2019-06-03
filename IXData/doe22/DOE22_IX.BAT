echo OFF
REM Bare bones simple script written by Daniel Villa 11-18-2013
set doedir=%~f3%
set doever=exent\
echo ----------B
echo %doeever%
echo ----------Z

call "%doedir%doe22env_ix" SETUP %1 %2

"%doedir%%doever%doebdl.exe"

echo POINT1      %doever%                 POINT1
if not errorlevel 1 "%doedir%%doever%doesim.exe"

echo ON