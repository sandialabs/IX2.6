REM   EDITED BY DANIEL VILLA 11-18-2013
echo off
REM   DO NOT CHANGE THIS FILE UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING
REM                  JJHirsch  7/97
REM Calls:
REM   CONFIG- called at boot/doe-2 setup to test and initialize the environment
REM   SETUP - called from the doe22 run procedure to setup file names
REM   RESET - called after run or at boot time to set file names to defaults
REM   CLEAR - called when you wish to remove all doe2 environment variables
REM
if "%1"=="CONFIG"  goto :clear2
if "%1"=="config"  goto :clear2
if "%1"=="SETUP"  goto :setup
if "%1"=="setup"  goto :setup
if "%1"=="RESET"  goto :reset
if "%1"=="reset"  goto :reset
if "%1"=="CLEAR"  goto :clear
if "%1"=="clear"  goto :clear
echo * ERROR - legal calls are CONFIG, SETUP, RESET, and CLEAR
goto :end
:testenv
set testa=12345678901234567890123456789012345678901234567890
set testb=12345678901234567890123456789012345678901234567890
set testc=12345678901234567890123456789012345678901234567890
set testd=12345678901234567890123456789012345678901234567890
set teste=12345678901234567890123456789012345678901234567890
set testf=12345678901234567890123456789012345678901234567890
set testg=12345678901234567890123456789012345678901234567890
set testh=12345678901234567890123456789012345678901234567890
set testi=12345678901234567890123456789012345678901234567890
set testj=12345678901234567890123456789012345678901234567890
set testk=12345678901234567890123456789012345678901234567890
set testl=12345678901234567890123456789012345678901234567890
set testm=12345678901234567890123456789012345678901234567890
set testn=12345678901234567890123456789012345678901234567890
set testo=12345678901234567890123456789012345678901234567890
set testp=12345678901234567890123456789012345678901234567890
set testq=12345678901234567890123456789012345678901234567890
set testr=12345678901234567890123456789012345678901234567890
set tests=12345678901234567890123456789012345678901234567890
set testt=12345678901234567890123456789012345678901234567890
set testu=12345678901234567890123456789012345678901234567890
set testv=12345678901234567890123456789012345678901234567890
set testw=12345678901234567890123456789012345678901234567890
set testx=12345678901234567890123456789012345678901234567890
set testy=12345678901234567890123456789012345678901234567890
set testz=12345678901234567890123456789012345678901234567890
set test0=12345678901234567890123456789012345678901234567890
if not "%testa%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testb%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testc%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testd%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%teste%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testf%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testg%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testh%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testi%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testj%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testk%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testl%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testm%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testn%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testo%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testp%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testq%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testr%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%tests%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testt%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testu%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testv%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testw%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testx%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testy%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%testz%"=="12345678901234567890123456789012345678901234567890" goto :bade
if not "%test0%"=="12345678901234567890123456789012345678901234567890" goto :bade
set testa=
set testb=
set testc=
set testd=
set teste=
set testf=
set testg=
set testh=
set testi=
set testj=
set testk=
set testl=
set testm=
set testn=
set testo=
set testp=
set testq=
set testr=
set tests=
set testt=
set testu=
set testv=
set testw=
set testx=
set testy=
set testz=
set test0=
if "%1"=="SETUP"  goto :setup
if "%1"=="setup"  goto :setup
if "%1"=="RESET"  goto :reset
if "%1"=="reset"  goto :reset
if "%1"=="CONFIG"  goto :reset
if "%1"=="config"  goto :reset
:bade
echo * ERROR - insufficient environment space.  You must increase the /e:
echo *         on the SHELL command value in your config.sys then try again.
echo *         The DOE-2.2 environment requires at least 1360 bytes; to tell
echo *         how much additional space you need do type set (enter); the
echo *         variables testa-testz and test0 need to all be set to a string
echo *         of 0123456789 repeated 5 times.  To missing definitions will tell
echo *         you how much additional environment space is needed.
echo * ABORT THIS NOW (press ctrl c) TO PREVENT ANY PROBLEMS
:p
pause
goto :p
:setup
echo ---------------------
echo BEGINNING OF ENV Setup
echo ---------------------
shift
REM Setup the environment variables used to do runtime file substitutions
REM If a filename is not set equal to a path/filename here (XXXXXX.XXX=)
REM then the program will create a local file by the name of the environment
REM variable listed below.  This will cause a runtime error of bad file
REM status for those files that are required to be pre-existing such as:
REM   BDLKEY.BIN, BDLLIB.DAT, BDLDFT.DAT, INPUT2.TMP, HDRFIL.BIN, WEATHER.BIN
REM
REM     Setup the required files
REM
REM     BDL input file


set INPUT2.TMP=%~f1.inp          
               
REM     The various library files
set BDLKEY.BIN=%doedir%%doever%bdlkey.bin
set BDLLIB.DAT=%doedir%%doever%bdllib.dat
set BDLDFT.DAT=%doedir%%doever%bdldft.dat
set HDRFIL.BIN=%doedir%%doever%hdrfil.bin
set TDVCTZ.BIN=%doedir%%doever%tdvctz.bin
REM     The weather file

set WEATHER.BIN=%~f2

REM
REM     Setup the output and intermediate files
REM
REM     BDL and SIMULATION output files
set DOEBDL.OUT=%~f1.bdl
set DOESIM.OUT=%~f1.sim

REM     BDL and SIMULATION outputs (allow to default and copy onto one later)
set DOEBDL.LOG=
set DOESIM.LOG=
REM     BDL user library for project

if exist %~f1.lib set USRLIB.DAT=%~f1.lib

echo BIGBIGBIG
echo %doedir%%doever%usrlib.dat
REM - THIS LINE IS DELETED : if not exist %~f1.lib echo IT DOES NOT EXIST
set USRLIB.DAT=%doedir%%doever%usrlib.dat
echo BIGBIGBIG

REM     BDL macro output files
set for022=%~f1.022
set for080=%~f1.080
REM     LOADS, SYSTEMS, and PLANT results intermediate & design files

echo "%3"
if "%3"=="" set LDSOUT.TMP=%~f1.ldo
if "%3"=="" set SYSOUT.TMP=%~f1.syo
if "%3"=="" set PLTOUT.TMP=%~f1.plo
if "%3"=="" set DSNFIL.TMP=%~f1.dsn
if not "%~f3"=="" set LDSOUT.TMP=%~f3.ldo
if not "%~f3"=="" set SYSOUT.TMP=%~f3.syo
if not "%~f3"=="" set PLTOUT.TMP=%~f3.plo
if not "%~f3"=="" set DSNFIL.TMP=%~f3.dsn
REM     BDL control and standard files for the simulation programs
set CTRL.TMP=%~f1.ctr
set STDFIL.TMP=%~f1.std
REM     The hourly report intermediate file for printed reports
set HRREP.TMP=%~f1.hrp
REM     The hourly report OPTION=BINARY-FILE names
set DOEHRREP.BIN=%~f1.lin
set DOEHRREP.BIN=%~f1.sin
REM     The LOADS, SYSTEMS, and PLANT summary & verification intermediates
set DOEREP.TMP=%~f1.lrp
set DOEREP.TMP=%~f1.srp
set DOEREP.TMP=%~f1.erp
goto :end
:reset
REM reset DOE-2 environment variables to the default file names
if "%1"=="CONFIG"  echo doe2env: DOE-2.2 environment is being initialized
if "%1"=="config"  echo doe2env: DOE-2.2 environment is being initialized
shift
set doedir=%~f4     
set doever=exent\          
set BDLKEY.BIN="%doedir%%doever%bdlkey.bin                    
set BDLLIB.DAT=%doedir%%doever%bdllib.dat                    
set BDLDFT.DAT=%doedir%%doever%bdldft.dat                    
set DOEBDL.OUT=doebdl.out                    
set DOEBDL.LOG=doebdl.log                    
set INPUT2.TMP=input2.tmp                    
set USRLIB.DAT=%doedir%%doever%usrlib.dat                    
set for022=for022                    
set for080=for080                    
set HDRFIL.BIN=%doedir%%doever%hdrfil.bin                    
set TDVCTZ.BIN=%doedir%%doever%tdvctz.bin                    
set WEATHER.BIN=%doedir%weather\chicagil.bin                    
set DOESIM.OUT=doesim.out                    
set DOESIM.LOG=doesim.log                    
set LDSOUT.TMP=ldsout.tmp                    
set SYSOUT.TMP=sysout.tmp                    
set PLTOUT.TMP=pltout.tmp                    
set DSNFIL.TMP=dsnfil.tmp                    
set CTRL.TMP=ctrl.tmp                    
set STDFIL.TMP=stdfil.tmp                    
set HRREP.TMP=hrrep.tmp                    
set HRPLDS01.BIN=hrplds01.bin                    
set HRPSYS01.BIN=hrpsys01.bin                    
set HRPPLT01.BIN=hrpplt01.bin                    
set REPLDS01.TMP=replds01.tmp                    
set REPSYS01.TMP=repsys01.tmp                    
set REPPLT01.TMP=repplt01.tmp                    
goto :end
:clear
shift
REM eliminate all the DOE-2 variables from the environment
set doedir=
set doever=
:clear2
set BDLKEY.BIN=
set BDLLIB.DAT=
set BDLDFT.DAT=
set DOEBDL.OUT=
set DOEBDL.LOG=
set INPUT2.TMP=
set USRLIB.DAT=
set for022=
set for080=
set HDRFIL.BIN=
set TDVCTZ.BIN=
set WEATHER.BIN=
set DOESIM.OUT=
set DOESIM.LOG=
set LDSOUT.TMP=
set SYSOUT.TMP=
set PLTOUT.TMP=
set DSNFIL.TMP=
set CTRL.TMP=
set STDFIL.TMP=
set HRREP.TMP=
set HRPLDS01.BIN=
set HRPSYS01.BIN=
set HRPPLT01.BIN=
set REPLDS01.TMP=
set REPSYS01.TMP=
set REPPLT01.TMP=
if "%1"=="SETUP"  goto :testenv
if "%1"=="setup"  goto :testenv
if "%1"=="RESET"  goto :testenv
if "%1"=="reset"  goto :testenv
if "%1"=="CONFIG"  goto :testenv
if "%1"=="config"  goto :testenv
:end
echo on
