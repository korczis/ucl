rem /* Windows 32-bit (LIB) - Watcom C 10.5
rem  * a very simple make driver
rem  * Copyright (C) 1996-2002 Markus F.X.J. Oberhumer
rem  */

@if "%UCL_ECHO%"=="n" echo off

set _CC=wcl386 -zq -mf -5r -bt#nt
set CFLAGS=-Iinclude -wx -oneatx
set MYLIB=ucl.lib

echo Compiling, please be patient...
set CC=%_CC%
%CC% %CFLAGS% -zc -c src\*.c
@if errorlevel 1 goto error
if exist %MYLIB% del %MYLIB%
wlib -q -b -n -t %MYLIB% @b\win32\wc105.rsp
@if errorlevel 1 goto error

set CC=%_CC% -zc -l#nt
%CC% %CFLAGS% examples\simple.c %MYLIB%
@if errorlevel 1 goto error
%CC% %CFLAGS% examples\uclpack.c %MYLIB%
@if errorlevel 1 goto error

@echo Done.
@goto end
:error
echo error!
:end
@call b\unset.bat
