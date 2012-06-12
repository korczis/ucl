rem /* Windows 32-bit (LIB) - Mingw32 GNU-Win32
rem  * a very simple make driver
rem  * Copyright (C) 1996-2002 Markus F.X.J. Oberhumer
rem  */

@if "%UCL_ECHO%"=="n" echo off

REM set CC=gcc
set CC=gcc -mno-cygwin
set CFLAGS=-Iinclude -O2 -fomit-frame-pointer -Wall -W
set ASFLAGS=-x assembler-with-cpp -Wall
set MYLIB=libucl.a

del *.o > nul
echo Compiling, please be patient...
%CC% -x c %CFLAGS% -c src/*.c
@if errorlevel 1 goto error
if exist %MYLIB% del %MYLIB%
ar rcs %MYLIB% *.o
@if errorlevel 1 goto error

%CC% %CFLAGS% -o simple.exe examples/simple.c %MYLIB%
@if errorlevel 1 goto error
%CC% %CFLAGS% -o uclpack.exe examples/uclpack.c %MYLIB%
@if errorlevel 1 goto error

@echo Done.
@goto end
:error
echo error!
:end
@call b\unset.bat
