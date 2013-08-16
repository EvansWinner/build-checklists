@echo off
REM build-checklists.bat --- make schedule templates from individual steps

REM See README.txt for more information
REM AUTHOR: Evans Winner
REM DATE: 2012.3.20

REM Main procedure
echo.
echo PROCESS STARTING.
pushd skel
for %%f in (*) do call :build %%f
popd
echo PROCESS COMPLETE.
pause
goto :eof

REM build subr
:build
echo.
echo.
if exist ..\%1 del ..\%1
echo [template: %1 last build %date%] >> ..\%1
echo. >> ..\%1
echo. >> ..\%1
echo. >> ..\%1
echo ... BUILDING %1 ...
for /F %%s in (%1) do (
    echo ... ... %%s
    type ..\steps\%%s >> ..\%1
    echo. >> ..\%1
    echo \_______ [Source: %%s] >> ..\%1
    echo. >> ..\%1
    echo. >> ..\%1
    echo. >> ..\%1
)
echo.
echo ... DONE WITH %1.
echo.
goto :eof
