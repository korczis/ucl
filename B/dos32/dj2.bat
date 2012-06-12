rem /* DOS 32-bit - djgpp2 + gcc
rem  * a very simple make driver
rem  * Copyright (C) 1996-2002 Markus F.X.J. Oberhumer
rem  */

@if "%UCL_ECHO%"=="n" echo off

set EXTRA_CFLAGS=

set CC=gcc
set CFLAGS=@b/gcc.opt @b/dos32/dj2.opt @b/gcc_ucl.opt %EXTRA_CFLAGS%
set ASFLAGS=-x assembler-with-cpp -Wall
set MYLIB=libucl.a

echo Compiling, please be patient...
%CC% %CFLAGS% -c src/*.c
@if errorlevel 1 goto error
if exist %MYLIB% del %MYLIB%
ar rcs %MYLIB% @b/dos32/dj2.rsp
@if errorlevel 1 goto error

set CFLAGS=@b/gcc.opt @b/dos32/dj2.opt %EXTRA_CFLAGS%
%CC% -s %CFLAGS% examples/simple.c %MYLIB% -o simple.exe
@if errorlevel 1 goto error
%CC% -s %CFLAGS% examples/uclpack.c %MYLIB% -o uclpack.exe
@if errorlevel 1 goto error

@echo Done.
@goto end
:error
echo error!
:end
@call b\unset.bat
