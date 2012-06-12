Simple make drivers for DOS, Windows, OS/2 and other systems
============================================================

This directory contains a bunch of simple make drivers - I've tried
to make them as foolproof as possible.

To build UCL for your system type `b\OS\COMPILER' in the base directory,
e.g. `b\win32\mc120.bat' will build the Win32 Microsoft C v12.0 (aka
Visual C++ 6) version.

Please send me your additional/improved build scripts.


Overview:
---------

b\dos32\dj2.bat         djgpp v2 + gcc
b\dos32\dmc.bat         Digital Mars C/C++ Compiler
b\dos32\wc105.bat       Watcom C 10.5

b\win32\bc55.bat        Borland C++ 5.5
b\win32\cygwin.bat      Cygnus Win32 + gcc
b\win32\dmc.bat         Digital Mars C/C++ Compiler
b\win32\mc120.bat       Microsoft C/C++ 12.0 [aka Visual C++ 6.0]
b\win32\mingw.bat       Mingw32 + gcc
b\win32\wc105.bat       Watcom C 10.5



Useful tools
============

GNU make, GNU fileutils for Windows NT
   http://www.cygwin.com

GNU make, GNU fileutils for 32-bit DOS
   ftp://ftp.simtel.net/pub/simtelnet/gnu/djgpp/v2gnu/

GNU make, GNU fileutils for OS2
   ftp://hobbes.nmsu.edu/pub/os2/

NASM assembler
   http://www.web-sites.co.uk/nasm/
   ftp://ftp.simtel.net/pub/simtelnet/asmutl/
   ftp://metalab.unc.edu/pub/Linux/devel/lang/assemblers/

