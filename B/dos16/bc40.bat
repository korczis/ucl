rem /* DOS 16-bit - Borland C 4.0
rem  * a very simple make driver
rem  * Copyright (C) 1996-2002 Markus F.X.J. Oberhumer
rem  */

@if "%UCL_ECHO%"=="n" echo off

set CC=bcc -ml
set CFLAGS=-Iinclude -h- -d -O -w -4
REM set CFLAGS=%CFLAGS% -Ff -D__UCL_STRICT_16BIT
set MYLIB=ucl.lib

echo Compiling, please be patient...
%CC% %CFLAGS% -Isrc -c src\*.c
@if errorlevel 1 goto error
if exist %MYLIB% del %MYLIB%
tlib %MYLIB% @b\dos16\bc40.rsp
@if errorlevel 1 goto error

%CC% %CFLAGS% -Iexamples examples\simple.c %MYLIB%
@if errorlevel 1 goto error
%CC% %CFLAGS% -Iexamples examples\uclpack.c %MYLIB%
@if errorlevel 1 goto error

@echo Done.
@goto end
:error
@echo error!
:end
@call b\unset.bat
