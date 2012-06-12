rem /* Windows 32-bit (LIB) - Borland C++ 5.5
rem  * a very simple make driver
rem  * Copyright (C) 1996-2002 Markus F.X.J. Oberhumer
rem  */

@if "%UCL_ECHO%"=="n" echo off

set CC=bcc32
set CFLAGS=-Iinclude -O2 -d -w -w-aus -w-par
set MYLIB=ucl.lib

echo Compiling, please be patient...
%CC% %CFLAGS% -Isrc -c src\*.c
@if errorlevel 1 goto error
if exist %MYLIB% del %MYLIB%
tlib %MYLIB% @b\win32\bc55.rsp
@if errorlevel 1 goto error

%CC% %CFLAGS% -Iexamples examples\simple.c %MYLIB%
@if errorlevel 1 goto error
%CC% %CFLAGS% -Iexamples examples\uclpack.c %MYLIB%
@if errorlevel 1 goto error

@echo Done.
@goto end
:error
echo error!
:end
@call b\unset.bat
