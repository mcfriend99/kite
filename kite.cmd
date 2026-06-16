@ECHO OFF
SETLOCAL

@REM Find Zuri executable
for %%i in (zuri.exe) do SET "ZURI_EXE=%%~$PATH:i"

if defined ZURI_EXE (
  GOTO :RUN
) else (
  GOTO :ERROR
)

:ERROR
SET msgboxTitle=${name}
SET msgboxBody=Zuri is not installed or not in path.
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
EXIT /B 1

:RUN

"%ZURI_EXE%" "run" "${cli_path}" %*
EXIT /B 0