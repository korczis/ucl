rem /* DOS 16-bit - Microsoft C 7.0
rem  * a very simple make driver
rem  * Copyright (C) 1996-2002 Markus F.X.J. Oberhumer
rem  */

@if "%UCL_ECHO%"=="n" echo off

set _CC=cl -nologo -f- -AL
set CFLAGS=-Iinclude -O -G2 -W3
set MYLIB=ucl.lib

echo Compiling, please be patient...
set CC=%_CC%
%CC% %CFLAGS% -c src\*.c
@if errorlevel 1 goto error
if exist %MYLIB% del %MYLIB%
lib /nologo %MYLIB% @b\dos16\mc70.rsp;
@if errorlevel 1 goto error

set CC=%_CC%
%CC% %CFLAGS% examples\simple.c %MYLIB% setargv.obj
@if errorlevel 1 goto error
%CC% %CFLAGS% examples\uclpack.c %MYLIB% setargv.obj
@if errorlevel 1 goto error

@echo Done.
@goto end
:error
echo error!
:end
@call b\unset.bat
