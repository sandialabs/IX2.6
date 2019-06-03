echo OFF
if "%1"=="" goto :nogood
set doedir=c:\doe22\
set doever=%1\
if not exist %doedir%%doever%doebdl.exe goto :nofile
if not exist %doedir%%doever%doesim.exe goto :nofile
if not exist %doedir%%doever%bdlkey.bin goto :nofile
if not exist %doedir%%doever%bdllib.dat goto :nofile
if not exist %doedir%%doever%bdldft.dat goto :nofile
if not exist %doedir%%doever%hdrfil.bin goto :nofile
if not exist %doedir%%doever%tdvctz.bin goto :nofile
shift
goto :checkinp
:nofile
echo *ERROR the directory %doedir%%doever% does not have all the required 
echo *      files needed to run the program.  Select the correct version or
echo *      load all the required files into the directory for the version
echo *      you have selected.  Required files are:
echo *
echo *           BDLKEY.BIN  - the BDL command/keyword library
echo *           BDLLIB.DAT  - the BDL CONSTRUCTION and MATERIAL library
echo *           BDLDFT.DAT  - the BDL SET-DEFAULT library
echo *           DOEBDL.EXE  - the BDL processor
echo *           DOESIM.EXE  - the SIMULATION processor
echo *           HDRFIL.BIN  - the report library
echo *           TDVCTZ.BIN  - the TDV database
pause
:nogood
echo *ERROR: First parameter MUST specify an available version to run 
:nogood1
echo *
echo *      Correct useage of command as follows:
echo *       
echo *      DOE2.2 version input weather SAVE-FILES tfiles
echo *       
echo *      where   version - DOE-2.2 version you want to run as follows:
echo *                    exe  - the standard release
echo *                    dev or ccig - development versions (when available)
echo *       
echo *              input -  the BDL input file WITHOUT its .inp extension
echo *       
echo *              weather - packed weather file WITHOUT its .bin extension;
echo *                    these files must be in %doedir%weather
echo *
echo *              SAVE-FILES - save or use intermediate results & report files
echo *       
echo *              tfiles - base file name to be used for the intermediate
echo *                    results files.  Some files are used when doing a 
echo *                    SAVE-FILES run: LOADS results are on tfiles.ldo,
echo *                    SYSTEMS on tfiles.syo, PLANT on tfiles.plo, all use
echo *                    the design file (including ECONOMICS) on tmpfiles.dsn 
echo *                    Default is the input file name.
goto :end
:checkinp
if exist %1.inp goto :checkwth
echo *ERROR: Input file (%1.inp) does not exist.
echo *       Input files to use include (leave off .inp extension):
dir /w *.inp
pause
goto :nogood1
:checkwth
if exist %doedir%weather\%2.bin goto :start
echo *ERROR: Weather file (%doedir%weather\%2) not in library.
echo *       Weather files to use include (leave off .bin extension):
dir /w %doedir%weather\*.bin
pause
goto :nogood1
:start
echo ===== doe22: input file : %1 ,  weather : %2
echo ===== DOE-2 version: %doedir%%doever% =====
REM setup the DOE-2 environment for runtime file substitutions
call %doedir%doe22env SETUP %1 %2 %4
if "%3"=="NO-LIBRARY" set BDLLIB.DAT=
if "%3"=="no-library" set BDLLIB.DAT=
%doedir%%doever%doebdl
if not errorlevel 1 %doedir%%doever%doesim
REM clear all the file subtitutions in the environment
REM THE NEXT LINE HAS BEEN INSERTED BY DANIEL VILLA ON 3-20-2013
if exist *.DAT copy *.DAT %1.DAT >nul
call %doedir%doe22env RESET
copy     DOEBDL.LOG + DOESIM.LOG %1.log >nul
del DOE???.log
if "%3"=="SAVE-FILES" goto :end
if "%3"=="save-files" goto :end
REM   LOADS, SYSTEMS, and PLANT summary and verification reports intermediates
if exist %1.lrp del %1.lrp
if exist %1.srp del %1.srp
if exist %1.prp del %1.prp
REM   hourly report intermediate
if exist %1.hrp del %1.hrp
REM   hourly reports OPTION=BINARY-FILE
if exist %1.lin del %1.lin
if exist %1.sin del %1.sin
if exist %1.pin del %1.pin
REM   LOADS, SYSTEMS, and PLANT intermediate results
if exist %1.ldo del %1.ldo
if exist %1.syo del %1.syo
if exist %1.plo del %1.plo
REM   the design file
if exist %1.dsn del %1.dsn
REM   the control and standard files
if exist %1.ctr del %1.ctr
if exist %1.std del %1.std
REM   the user library (USRLIB) 
if exist USRLIB.DAT del USRLIB.DAT
REM   empty BDLLIB.DAT
if exist BDLLIB.DAT del BDLLIB.DAT
if exist BDLDFT.DAT del BDLDFT.DAT
REM   the BDL macro output files
if exist %1.022 del %1.022
if exist %1.080 del %1.080
:end
echo ===== doe22 %1.inp %2.bin completed =====
echo ON
